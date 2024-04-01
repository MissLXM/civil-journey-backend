package cn.mju.wjh.course.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.mju.wjh.common.core.entity.param.course.CourseAuditParams;
import cn.mju.wjh.common.core.entity.param.course.CourseQueryParams;
import cn.mju.wjh.common.core.entity.pojo.course.CivilCourse;
import cn.mju.wjh.common.core.entity.pojo.course.CourseCollection;
import cn.mju.wjh.common.core.entity.pojo.course.CourseLike;
import cn.mju.wjh.common.core.entity.pojo.user.TeacherAudit;
import cn.mju.wjh.common.core.entity.pojo.video.CivilVideo;
import cn.mju.wjh.common.core.enums.HttpStatus;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.minio.utils.MinioUtil;
import cn.mju.wjh.common.security.mapper.TeacherAuditMapper;
import cn.mju.wjh.course.mapper.*;
import cn.mju.wjh.course.service.CourseManageService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ClassName: CourseManageServiceImpl
 * Package: cn.mju.wjh.course.service.impl
 * Description: 课程服务实现(后台)
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/27--16:53
 */
@Service
public class CourseManageServiceImpl implements CourseManageService {

    @Setter(onMethod_ = @Autowired)
    private CivilCourseMapper courseMapper;

    @Setter(onMethod_ = @Autowired)
    private CivilVideoMapper videoMapper;

    @Setter(onMethod_ = @Autowired)
    private MinioUtil minioUtil;

    @Setter(onMethod_ = @Autowired)
    private CourseLikeMapper courseLikeMapper;

    @Setter(onMethod_ = @Autowired)
    private TeacherAuditMapper teacherAuditMapper;

    @Setter(onMethod_ = @Autowired)
    private VideoCommentsMapper videoCommentsMapper;

    @Setter(onMethod_ = @Autowired)
    private CourseCollectionMapper courseCollectionMapper;

    /**
     * 统计数量
     * @param categoryIdList 分类ID集合
     * @param numberList 统计数量集合
     * @param courseIdList 课程ID集合
     */
    private void statisticsNumber(List<Long> categoryIdList, List<Long> numberList, List<Long> courseIdList) {
        List<CivilCourse> courseList = courseIdList.stream().map(courseMapper::selectById).toList();

        // 统计次数
        for (Long aLong : categoryIdList) {
            Long count = 0L;
            for (CivilCourse civilCourse : courseList) {
                if (aLong.equals(civilCourse.getCategoryId())) {
                    count++;
                }
            }
            numberList.add(count);
        }
    }

    /**
     * 所有课程的数量(API调用)
     * @return 课程数量
     */
    @Override
    public Result courseAllNumber() {
        Long count = courseMapper.selectCount(null);
        return Result.ok(count).message("操作成功");
    }

    /**
     * 每个分类的课程总数量(API调用)
     * @param categoryIdList 分类ID集合
     * @return 每个分类的课程总数量
     */
    @Override
    public Result courseCategoryNumber(List<Long> categoryIdList) {
        List<Long> courseCategoryNumberList = new ArrayList<>();

        // 根据分类ID统计课程数
        categoryIdList.forEach(
                categoryId -> {
                    Long count = courseMapper.selectCount(
                            new LambdaQueryWrapper<CivilCourse>()
                                    .eq(CivilCourse::getCategoryId, categoryId)
                    );

                    if (count > 0) {
                        courseCategoryNumberList.add(count);
                    }
                }
        );

        return Result.ok(courseCategoryNumberList).message("操作成功");
    }

    /**
     * 课程评论数量(API调用)
     * @return 课程评论数量
     */
    @Override
    public Result courseCommentsNumber() {
        Long count = videoCommentsMapper.selectCount(null);
        return Result.ok(count).message("操作成功");
    }

    /**
     * 每个分类的课程点赞数量(API调用)
     * @param categoryIdList 分类ID集合
     * @return 每个分类的课程点赞数量
     */
    @Override
    public Result courseCategoryLikeNumber(List<Long> categoryIdList) {
        // 点赞数
        List<Long> courseCategoryLikeNumberList = new ArrayList<>();
        // 获取点赞的课程ID
        List<CourseLike> courseLikes = courseLikeMapper.selectList(null);
        List<Long> likeCourseIdList = courseLikes.stream().map(CourseLike::getCourseId).toList();

        // 统计数量
        statisticsNumber(categoryIdList, courseCategoryLikeNumberList, likeCourseIdList);

        return Result.ok(courseCategoryLikeNumberList).message("操作成功");
    }

    /**
     * 每个分类的课程收藏数量(API调用)
     * @param categoryIdList 分类ID集合
     * @return 每个分类的课程点赞数量
     */
    @Override
    public Result courseCategoryCollectionNumber(List<Long> categoryIdList) {
        // 收藏数
        List<Long> courseCategoryCollectionNumberList = new ArrayList<>();
        // 获取收藏的课程ID
        List<CourseCollection> courseCollections = courseCollectionMapper.selectList(null);
        List<Long> collectionCourseIdList = courseCollections.stream().map(CourseCollection::getCourseId).toList();

        // 统计数量
        statisticsNumber(categoryIdList, courseCategoryCollectionNumberList, collectionCourseIdList);

        return Result.ok(courseCategoryCollectionNumberList).message("操作成功");
    }

    /**
     * 课程--查看课程数量(API调用)
     * @param userId 用户ID
     * @return 课程数量
     */
    @Override
    public Result queryCourseNumberByUserId(Long userId) {
        Long count = courseMapper.selectCount(
                new LambdaQueryWrapper<CivilCourse>()
                        .eq(CivilCourse::getUserId, userId)
        );
        String teacherIntroduction = teacherAuditMapper.selectOne(
                new LambdaQueryWrapper<TeacherAudit>()
                        .eq(TeacherAudit::getUserId, userId)
        ).getTeacherIntroduction();

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("count", count);
        resultMap.put("teacherIntroduction", teacherIntroduction);

        return Result.ok(resultMap).message("操作成功");
    }

    /**
     * 课程--查询所有课程信息(需要包含视频信息, 带分页、课程名称、发布者、分类)
     * @param courseQueryParams 课程查询参数
     * @return 所有课程信息
     */
    @Override
    public Result queryAllCourse(CourseQueryParams courseQueryParams) {
        LambdaQueryWrapper<CivilCourse> wrapper = new LambdaQueryWrapper<>();

        // 判断
        if (ObjectUtil.isNotEmpty(courseQueryParams.getCourseName())) {
            wrapper.like(CivilCourse::getCourseName, courseQueryParams.getCourseName());
        }

        if (ObjectUtil.isNotEmpty(courseQueryParams.getCategoryId()) ) {
            if (courseQueryParams.getCategoryId() != 0) {
                wrapper.eq(CivilCourse::getCategoryId, courseQueryParams.getCategoryId());
            }
        }

        if (ObjectUtil.isNotEmpty(courseQueryParams.getCreatorName())) {
            wrapper.like(CivilCourse::getCreatorName, courseQueryParams.getCreatorName());
        }

        if (ObjectUtil.isNotEmpty(courseQueryParams.getStatus())) {
            wrapper.eq(CivilCourse::getStatus, courseQueryParams.getStatus());
        } else {
            wrapper.eq(CivilCourse::getStatus, 1);
        }


        wrapper.orderByDesc(CivilCourse::getCreateTime);

        // 获取数据
        IPage<CivilCourse> courseIpage = courseMapper.selectPage(
                new Page<>(courseQueryParams.getCurrentPage(), courseQueryParams.getPageSize()),
                wrapper
        );

        // 判空
        if (courseIpage.getRecords().size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        // 封装数据
        courseIpage.setRecords(
                courseIpage.getRecords().stream().peek(
                        course -> {
                            // 预览
                            course.setCourseImage(minioUtil.preview(course.getCourseImage()));
                            course.setCreatorAvatar(minioUtil.preview(course.getCreatorAvatar()));

                            List<CivilVideo> videos = videoMapper.selectList(
                                    new LambdaQueryWrapper<CivilVideo>()
                                            .eq(CivilVideo::getCourseId, course.getCourseId())
                            );

                            if (videos.size() > 0) {
                                videos = videos.stream().peek(
                                        video -> {
                                            video.setVideoLink(minioUtil.preview(video.getVideoLink()));
                                            video.setVideoImage(minioUtil.preview(video.getVideoImage()));
                                            video.setVideoPreview(minioUtil.preview(video.getVideoPreview()));
                                        }
                                ).toList();
                                course.setVideoList(videos);
                            }

                        }
                ).toList()
        );

        return Result.ok(courseIpage).message("操作成功");
    }

    /**
     * 课程--同意发布
     * @param courseId 课程ID
     * @return 是否操作成功
     */
    @Override
    public Result agreeReleaseCourse(Long courseId) {
        int rows = courseMapper.updateById(
                new CivilCourse()
                        .setCourseId(courseId)
                        .setStatus((byte) 1)
        );

        if (rows == 0) {
            return Result.fail().message("操作失败");
        }
        return Result.ok().message("操作成功");
    }

    /**
     * 课程--不同意发布
     * @param courseAuditParams 课程审核参数
     * @return 是否操作成功
     */
    @Override
    public Result unAgreeReleaseCourse(CourseAuditParams courseAuditParams) {
        int rows = courseMapper.updateById(
                new CivilCourse()
                        .setCourseId(courseAuditParams.getCourseId())
                        .setAuditFailureReason(courseAuditParams.getAuditFailureReason())
                        .setStatus((byte) 2)
        );

        if (rows == 0) {
            return Result.fail().message("操作失败");
        }
        return Result.ok().message("操作成功");
    }
}
