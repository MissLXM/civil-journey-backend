package cn.mju.wjh.course.service;

import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.course.CourseParams;
import cn.mju.wjh.common.core.entity.param.course.InsertCourseParams;
import cn.mju.wjh.common.core.utils.Result;
import org.springframework.web.multipart.MultipartFile;

/**
 * ClassName: CourseService
 * Package: cn.mju.wjh.course.service
 * Description: 课程服务接口(前台)
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/27--16:51
 */
public interface CourseService {

    /**
     * 首页-展示课程(带搜索、分页)
     * @param courseName 课程名称
     * @param pageParams 分页参数
     * @return 课程信息
     */
    Result homeShowCourse(String courseName, PageParams pageParams);

    /**
     * 课程-展示课程(带分类、专区、排序、搜索、分页)
     * @param courseParams 课程查询参数
     * @return 课程信息
     */
    Result showCourseInCourseView(CourseParams courseParams);

    /**
     * 课程--查询收藏课程
     * @param pageParams 分页参数
     * @return 收藏课程信息
     */
    Result queryCollectionCourse(PageParams pageParams);

    /**
     * 课程--查询讲师已发布课程
     * @param pageParams 分页参数
     * @return 已发布课程
     */
    Result queryTeacherReleaseCourse(PageParams pageParams);

    /**
     * 课程--发布课程
     * @param courseParams 课程参数
     * @return 发布结果
     */
    Result insertCourseInfo(InsertCourseParams courseParams);

    /**
     * 课程--上传课程封面
     * @param file 文件
     * @param username 登录名称
     * @return 上传结果
     */
    Result uploadCourseImage(MultipartFile file, String username);

    /**
     * 课程--删除课程
     * @param courseId 课程ID
     * @return 删除结果
     */
    Result deleteCourseInfo(Long courseId);

    /**
     * 课程--点赞/取消点赞
     * @param courseId 课程ID
     * @return 是否操作成功
     */
    Result courseLikeOrNoLike(Long courseId);

    /**
     * 课程--收藏/取消收藏
     * @param courseId 课程ID
     * @return 是否操作成功
     */
    Result courseCollectionOrNoCollection(Long courseId);

    /**
     * 课程--课程详细信息
     * @param courseId 课程ID
     * @return 课程信息
     */
    Result queryCourseInfo(Long courseId);


    /**
     * 课程--课程详细信息(远程调用)
     * @param courseId 课程ID
     * @return 课程信息
     */
    Result queryCourseInfoByClient(Long courseId);
}
