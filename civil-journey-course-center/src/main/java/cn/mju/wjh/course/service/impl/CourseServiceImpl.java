package cn.mju.wjh.course.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.mju.wjh.common.api.client.CategoryClient;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.course.CourseParams;
import cn.mju.wjh.common.core.entity.param.course.InsertCourseParams;
import cn.mju.wjh.common.core.entity.pojo.category.CivilCategory;
import cn.mju.wjh.common.core.entity.pojo.course.CivilCourse;
import cn.mju.wjh.common.core.entity.pojo.course.CourseCollection;
import cn.mju.wjh.common.core.entity.pojo.course.CourseLike;
import cn.mju.wjh.common.core.entity.pojo.user.CivilUser;
import cn.mju.wjh.common.core.entity.pojo.user.TeacherAudit;
import cn.mju.wjh.common.core.entity.pojo.video.CivilVideo;
import cn.mju.wjh.common.core.entity.vo.course.CourseInfoVo;
import cn.mju.wjh.common.core.enums.HttpStatus;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.minio.utils.MinioUtil;
import cn.mju.wjh.common.security.mapper.TeacherAuditMapper;
import cn.mju.wjh.common.security.utils.LoginUserUtils;
import cn.mju.wjh.common.security.utils.StpUserUtils;
import cn.mju.wjh.course.mapper.CivilCourseMapper;
import cn.mju.wjh.course.mapper.CivilVideoMapper;
import cn.mju.wjh.course.mapper.CourseCollectionMapper;
import cn.mju.wjh.course.mapper.CourseLikeMapper;
import cn.mju.wjh.course.service.CourseService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import jakarta.validation.constraints.NotNull;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ClassName: CourseServiceImpl
 * Package: cn.mju.wjh.course.service.impl
 * Description: 课程服务实现(前台)
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/27--16:52
 */
@Slf4j
@Service
public class CourseServiceImpl implements CourseService {

    @Setter(onMethod_ = @Autowired)
    private MinioUtil minioUtil;

    @Setter(onMethod_ = @Autowired)
    private LoginUserUtils userUtils;

    @Setter(onMethod_ = @Autowired)
    private CivilVideoMapper videoMapper;

    @Setter(onMethod_ = @Autowired)
    private CategoryClient categoryClient;

    @Setter(onMethod_ = @Autowired)
    private CivilCourseMapper courseMapper;

    @Setter(onMethod_ = @Autowired)
    private TeacherAuditMapper teacherMapper;

    @Setter(onMethod_ = @Autowired)
    private CourseLikeMapper courseLikeMapper;

    @Setter(onMethod_ = @Autowired)
    private CourseCollectionMapper courseCollectionMapper;

    /**
     * 封装课程信息
     * @param coursePage 课程分页信息
     * @return 课程信息
     */
    @NotNull
    private List<CourseInfoVo> getCourseInfoVos(IPage<CivilCourse> coursePage) {
        // 封装数据
        return coursePage.getRecords().stream()
                .map(course -> {
                    CourseInfoVo courseInfoVo = BeanUtil.toBean(course, CourseInfoVo.class);
                    CivilUser user = userUtils.getUserInfo(String.valueOf(course.getUserId()));
                    String jsonString = JSON.toJSONString(categoryClient.getCategoryById(course.getCategoryId()).getData());
                    CivilCategory category = JSONObject.parseObject(jsonString, CivilCategory.class);
                    if (user != null) {
                        // 更新课程发布者信息
                        courseMapper.updateById(
                                new CivilCourse()
                                        .setCourseId(course.getCourseId())
                                        .setCreatorName(user.getNickname())
                                        .setCreatorAvatar(user.getHeadPortrait())
                        );
                        courseInfoVo.setCreatorName(user.getNickname());
                    }
                    if (category != null) {
                        // 更新课程类别信息
                        courseMapper.updateById(
                                new CivilCourse()
                                        .setCourseId(course.getCourseId())
                                        .setCategoryName(category.getCategoryName())
                        );
                    }
                    courseInfoVo.setCourseImage(minioUtil.preview(courseInfoVo.getCourseImage()));
                    if (courseInfoVo.getPayMoney() <= 0) {
                        courseInfoVo.setPayMoney(null);
                    }
                    return courseInfoVo;
                }).toList();
    }

    /**
     * 结果判空处理
     * @param coursePage 课程分页信息
     * @param courseInfoVoList 课程封装信息
     * @return 是否操作成功
     */
    private static Result getResult(IPage<CivilCourse> coursePage, List<CourseInfoVo> courseInfoVoList) {
        // 判空
        if (courseInfoVoList.size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        IPage<CourseInfoVo> courseInfoVoIpage = new Page<>();
        BeanUtil.copyProperties(coursePage, courseInfoVoIpage);
        courseInfoVoIpage.setRecords(courseInfoVoList);
        return Result.ok(courseInfoVoIpage).message("操作成功");
    }

    /**
     * 是否点赞/收藏
     * @param courseId 课程ID
     * @param courseInfoVo 课程信息
     */
    private void isLikeOrCollection(Long courseId, CourseInfoVo courseInfoVo) {
        // 是否收藏
        if (courseLikeMapper.selectCount(
                new LambdaQueryWrapper<CourseLike>()
                        .eq(CourseLike::getUserId, Long.parseLong(StpUserUtils.getLoginId().toString()))
                        .eq(CourseLike::getCourseId, courseId)
        ) > 0) {
            courseInfoVo.setIsLike((byte) 1);
        }

        // 是否点赞
        if (courseCollectionMapper.selectCount(
                new LambdaQueryWrapper<CourseCollection>()
                        .eq(CourseCollection::getUserId, Long.parseLong(StpUserUtils.getLoginId().toString()))
                        .eq(CourseCollection::getCourseId, courseId)
        ) > 0) {
            courseInfoVo.setIsCollection((byte) 1);
        }
    }

    /**
     * 首页-展示课程(带搜索、分页)
     * @param courseName 课程名称
     * @param pageParams 分页参数
     * @return 课程信息
     */
    @Override
    public Result homeShowCourse(String courseName, PageParams pageParams) {
        // 条件构造器
        LambdaQueryWrapper<CivilCourse> wrapper = new LambdaQueryWrapper<>();

        // 判断是否存在搜索
        if (ObjectUtil.isNotEmpty(courseName)) {
            wrapper.like(CivilCourse::getCourseName, courseName);
        }

        // 降序排序
        wrapper.orderByDesc(CivilCourse::getBrowseNumber);

        // 查询到数据
        IPage<CivilCourse> coursePage = courseMapper.selectPage(
                new Page<>(pageParams.getCurrentPage(), pageParams.getPageSize()),
                wrapper
        );

        // 判空
        if (coursePage.getRecords().size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        // 封装
        List<CourseInfoVo> courseInfoVoList = getCourseInfoVos(coursePage);

        // 返回结果
        return getResult(coursePage, courseInfoVoList);
    }

    /**
     * 课程-展示课程(带分类、专区、排序、搜索、分页)
     * @param courseParams 课程查询参数
     * @return 课程信息
     */
    @Override
    public Result showCourseInCourseView(CourseParams courseParams) {
        // 条件构造器
        LambdaQueryWrapper<CivilCourse> wrapper = new LambdaQueryWrapper<>();

        // 判断是否存在分类参数
        if (ObjectUtil.isNotEmpty(courseParams.getCategoryId()) && courseParams.getCategoryId() != 0) {
            wrapper.eq(CivilCourse::getCategoryId, courseParams.getCategoryId());
        }

        // 判断是否存在专区参数
        if (ObjectUtil.isNotEmpty(courseParams.getZoneId()) && courseParams.getZoneId() != 0) {
            if (courseParams.getZoneId() == 1) {
                // 免费
                wrapper.eq(CivilCourse::getPayMoney, 0);
            } else if (courseParams.getZoneId() == 2) {
                // 付费
                wrapper.gt(CivilCourse::getPayMoney, 0);
            }
        }

        // 判断是否存在排序参数
        if (ObjectUtil.isNotEmpty(courseParams.getSortId())) {
            if (courseParams.getSortId() == 0) {
                // 综合
                wrapper.orderByDesc(CivilCourse::getLikeNumber);
                wrapper.orderByDesc(CivilCourse::getBrowseNumber);
                wrapper.orderByDesc(CivilCourse::getCollectionNumber);
            } else if (courseParams.getSortId() == 1) {
                // 最新
                wrapper.orderByDesc(CivilCourse::getCreateTime);
            } else if (courseParams.getSortId() == 2) {
                // 热门
                wrapper.orderByDesc(CivilCourse::getBrowseNumber);
            }
        }

        // 判断是否存在搜素参数
        if (ObjectUtil.isNotEmpty(courseParams.getCourseName())) {
            wrapper.like(CivilCourse::getCourseName, courseParams.getCourseName());
        }

        wrapper.eq(CivilCourse::getStatus, (byte) 1);

        IPage<CivilCourse> courseIpage = courseMapper.selectPage(
                new Page<>(courseParams.getCurrentPage(), courseParams.getPageSize()),
                wrapper
        );

        // 判空
        if (courseIpage.getRecords().size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        // 封装数据
        List<CourseInfoVo> courseInfoVoList = getCourseInfoVos(courseIpage);

        // 返回结果
        return getResult(courseIpage, courseInfoVoList);
    }

    /**
     * 课程--查询收藏课程
     * @param pageParams 分页参数
     * @return 收藏课程信息
     */
    @Override
    public Result queryCollectionCourse(PageParams pageParams) {
        // 分页查询
        IPage<CourseCollection> courseCollectionIpage = courseCollectionMapper.selectPage(
                new Page<>(pageParams.getCurrentPage(), pageParams.getPageSize()),
                new LambdaQueryWrapper<CourseCollection>()
                        .eq(CourseCollection::getUserId, StpUserUtils.getLoginId())
        );

        // 判断
        if (courseCollectionIpage.getRecords().size() == 0) {
            return Result.fail().message("未查询到相关课程").code(HttpStatus.NOT_FOUND.getCode());
        }

        // 封装
        List<CourseInfoVo> courseInfoVoList = courseCollectionIpage.getRecords().stream()
                .map(courseCollection -> {
                    // 查询课程信息
                    CivilCourse course = courseMapper.selectById(courseCollection.getCourseId());

                    // 初始化
                    CourseInfoVo courseInfoVo = new CourseInfoVo();

                    // 判空
                    if (course != null) {
                        BeanUtil.copyProperties(course, courseInfoVo);
                    }

                    courseInfoVo.setCourseImage(minioUtil.preview(courseInfoVo.getCourseImage()));
                    return courseInfoVo;
                }).toList();

        // 拷贝
        IPage<CourseInfoVo> courseInfoVoIpage = new Page<>();
        BeanUtil.copyProperties(courseCollectionIpage, courseInfoVoIpage);

        // 赋值
        courseInfoVoIpage.setRecords(courseInfoVoList);

        return Result.ok(courseInfoVoIpage).message("操作成功");
    }

    /**
     * 课程--查询讲师已发布课程
     *
     * @param pageParams 分页参数
     * @return 已发布课程
     */
    @Override
    public Result queryTeacherReleaseCourse(PageParams pageParams) {
        // 分页查询数据
        IPage<CivilCourse> courseIpage = courseMapper.selectPage(
                new Page<>(pageParams.getCurrentPage(), pageParams.getPageSize()),
                new LambdaQueryWrapper<CivilCourse>()
                        .eq(CivilCourse::getUserId, Long.valueOf(StpUserUtils.getLoginId().toString()))
                        .orderByDesc(CivilCourse::getCreateTime)
        );

        // 判空
        if (courseIpage.getRecords().size() == 0) {
            return Result.fail().message("未查询到相关信息").code(HttpStatus.NOT_FOUND.getCode());
        }

        // 图片封装
        courseIpage.setRecords(
                courseIpage.getRecords().stream().peek(
                        course -> course.setCourseImage(minioUtil.preview(course.getCourseImage()))
                ).toList()
        );
        return Result.ok(courseIpage).message("操作成功");
    }

    /**
     * 课程--发布课程
     * @param courseParams 课程参数
     * @return 发布结果
     */
    @Override
    public Result insertCourseInfo(InsertCourseParams courseParams) {

        // 初始化课程信息
        CivilCourse course = BeanUtil.toBean(courseParams, CivilCourse.class);

        // 设置发布者信息
        CivilUser user = userUtils.getUserInfo(StpUserUtils.getLoginId().toString());
        course.setUserId(user.getUserId());
        course.setCreatorName(user.getNickname());
        course.setCreatorAvatar(user.getHeadPortrait());

        // 生成课程
        int rows = courseMapper.insert(course);

        // 判断
        if (rows == 0) {
            return Result.fail().message("课程生成失败");
        }

        // 循环生成视频信息
        for (int i = 0; i < courseParams.getVideoList().size(); i++) {
            // 设置视频信息
            courseParams.getVideoList().get(i).setCourseId(course.getCourseId());
            courseParams.getVideoList().get(i).setVideoSort(i + 1);

            // 生成视频
            videoMapper.insert(courseParams.getVideoList().get(i));
        }

        return Result.ok().message("成功");
    }

    /**
     * 课程--上传课程封面
     * @param file 文件
     * @param username 登录名称
     * @return 上传结果
     */
    @Override
    public Result uploadCourseImage(MultipartFile file, String username) {
        // 上传
        String path = minioUtil.upload(file, "course", null, "username: " + username);

        // 判空
        if (path == null) {
            return Result.fail().message("操作失败");
        }

        // 封装
        Map<String, String> coursePath = new HashMap<>();
        coursePath.put("oldPath", path);
        coursePath.put("newPath", minioUtil.preview(path));

        return Result.ok(coursePath).message("操作成功");
    }

    /**
     * 课程--删除课程
     * @param courseId 课程ID
     * @return 删除结果
     */
    @Override
    public Result deleteCourseInfo(Long courseId) {
        // 删除课程
        int rows = courseMapper.deleteById(courseId);

        // 判断
        if (rows == 0) {
            return Result.fail().message("课程删除失败");
        }

        // 删除视频
        List<CivilVideo> videos = videoMapper.selectList(new LambdaQueryWrapper<CivilVideo>()
                .eq(CivilVideo::getCourseId, courseId)
        );
        videos.forEach(
                video -> videoMapper.deleteById(video.getVideoId())
        );

        return Result.ok().message("操作成功");
    }

    /**
     * 课程--点赞/取消点赞
     * @param courseId 课程ID
     * @return 是否操作成功
     */
    @Override
    public Result courseLikeOrNoLike(Long courseId) {
        // 获取当前登录用户
        Long userId = Long.parseLong(StpUserUtils.getLoginId().toString());
        // 判断是否有点赞过
        if (courseLikeMapper.selectCount(
                new LambdaQueryWrapper<CourseLike>()
                        .eq(CourseLike::getUserId, userId)
                        .eq(CourseLike::getCourseId, courseId)
        ) > 0) {
            // 删除
            if (courseLikeMapper.delete(
                    new LambdaQueryWrapper<CourseLike>()
                            .eq(CourseLike::getUserId, userId)
                            .eq(CourseLike::getCourseId, courseId)
            ) > 0) {
                // 课程点赞数 - 1
                CivilCourse course = courseMapper.selectById(courseId);
                course.setLikeNumber(course.getLikeNumber() - 1);
                if (courseMapper.updateById(course) > 0) {
                    log.info("用户取消点赞成功");
                } else {
                    log.info("用户取消点赞失败");
                }
                return Result.ok().message("操作成功");
            } else {
                return Result.fail().message("操作失败");
            }
        } else {
            // 新增
            if (courseLikeMapper.insert(
                    new CourseLike()
                            .setUserId(userId)
                            .setCourseId(courseId)
            ) > 0) {
                // 课程点赞数 + 1
                CivilCourse course = courseMapper.selectById(courseId);
                course.setLikeNumber(course.getLikeNumber() + 1);
                if (courseMapper.updateById(course) > 0) {
                    log.info("用户点赞成功");
                } else {
                    log.info("用户点赞失败");
                }
                return Result.ok().message("操作成功");
            } else {
                return Result.fail().message("操作失败");
            }
        }
    }

    /**
     * 课程--收藏/取消收藏
     * @param courseId 课程ID
     * @return 是否操作成功
     */
    @Override
    public Result courseCollectionOrNoCollection(Long courseId) {
        // 获取当前登录用户
        Long userId = Long.parseLong(StpUserUtils.getLoginId().toString());
        // 判断是否有点赞过
        if (courseCollectionMapper.selectCount(
                new LambdaQueryWrapper<CourseCollection>()
                        .eq(CourseCollection::getUserId, userId)
                        .eq(CourseCollection::getCourseId, courseId)
        ) > 0) {
            // 删除
            if (courseCollectionMapper.delete(
                    new LambdaQueryWrapper<CourseCollection>()
                            .eq(CourseCollection::getUserId, userId)
                            .eq(CourseCollection::getCourseId, courseId)
            ) > 0) {
                // 课程收藏数 - 1
                CivilCourse course = courseMapper.selectById(courseId);
                course.setCollectionNumber(course.getCollectionNumber() - 1);
                if (courseMapper.updateById(course) > 0) {
                    log.info("用户取消收藏成功");
                } else {
                    log.info("用户取消收藏失败");
                }
                return Result.ok().message("操作成功");
            } else {
                return Result.fail().message("操作失败");
            }
        } else {
            // 新增
            if (courseCollectionMapper.insert(
                    new CourseCollection()
                            .setUserId(userId)
                            .setCourseId(courseId)
            ) > 0) {
                // 课程收藏数 + 1
                CivilCourse course = courseMapper.selectById(courseId);
                course.setCollectionNumber(course.getCollectionNumber() + 1);
                if (courseMapper.updateById(course) > 0) {
                    log.info("用户收藏成功");
                } else {
                    log.info("用户收藏失败");
                }
                return Result.ok().message("操作成功");
            } else {
                return Result.fail().message("操作失败");
            }
        }
    }

    /**
     * 课程--课程详细信息
     * @param courseId 课程ID
     * @return 课程信息
     */
    @Override
    public Result queryCourseInfo(Long courseId) {
        // 查询课程信息
        CivilCourse course = courseMapper.selectById(courseId);

        // 判空
        if (course == null) {
            return Result.fail().message("未查询到该课程");
        }

        // 更新用户信息
        CivilUser user = userUtils.getUserInfo(course.getUserId().toString());
        if (user != null) {
            course.setCreatorName(user.getNickname());
            course.setCreatorAvatar(user.getHeadPortrait());
            if (courseMapper.updateById(course) > 0) {
                log.info("课程更新用户信息成功");
            } else {
                log.info("课程更新用户信息失败");
            }
        }

        // 更新类别信息
        String jsonString = JSON.toJSONString(categoryClient.getCategoryById(course.getCategoryId()).getData());
        CivilCategory category = JSONObject.parseObject(jsonString, CivilCategory.class);
        if (category != null) {
            course.setCategoryName(category.getCategoryName());
            if (courseMapper.updateById(course) > 0) {
                log.info("课程更新类别信息成功");
            } else {
                log.info("课程更新类别信息失败");
            }
        }

        CourseInfoVo courseInfoVo = BeanUtil.toBean(course, CourseInfoVo.class);

        if (courseInfoVo == null) {
            return Result.fail().message("未查询到相关课程").code(HttpStatus.NOT_FOUND.getCode());
        }

        // 是否点赞/收藏
        isLikeOrCollection(courseId, courseInfoVo);

        // 观看数 + 1
        if (courseMapper.updateById(course.setBrowseNumber(course.getBrowseNumber() + 1)) > 0) {
            courseInfoVo.setBrowseNumber(courseInfoVo.getBrowseNumber() + 1);
            log.info("课程观看 + 1");
        } else {
            log.info("课程观看 + 1 失败");
        }

        // 根据讲师ID查询讲师简介
        String teacherIntroduction = teacherMapper.selectOne(
                new LambdaQueryWrapper<TeacherAudit>()
                        .eq(TeacherAudit::getUserId, course.getUserId())
        ).getTeacherIntroduction();
        courseInfoVo.setTeacherIntroduction(teacherIntroduction);
        courseInfoVo.setCourseImage(minioUtil.preview(courseInfoVo.getCourseImage()));
        courseInfoVo.setCreatorAvatar(minioUtil.preview(courseInfoVo.getCreatorAvatar()));

        return Result.ok(courseInfoVo).message("操作成功");
    }

    /**
     * 课程--课程详细信息(远程调用)
     * @param courseId 课程ID
     * @return 课程信息
     */
    @Override
    public Result queryCourseInfoByClient(Long courseId) {
        // 查询课程信息
        CivilCourse course = courseMapper.selectById(courseId);

        if (course == null) {
            return Result.fail().message("操作失败");
        }
        return Result.ok(course).message("操作成功");
    }




}
