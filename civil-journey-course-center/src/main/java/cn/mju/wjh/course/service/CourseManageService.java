package cn.mju.wjh.course.service;

import cn.mju.wjh.common.core.entity.param.course.CourseAuditParams;
import cn.mju.wjh.common.core.entity.param.course.CourseQueryParams;
import cn.mju.wjh.common.core.utils.Result;

import java.util.List;

/**
 * ClassName: CourseManageService
 * Package: cn.mju.wjh.course.service
 * Description: 课程服务接口(后台)
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/27--16:52
 */
public interface CourseManageService {

    /**
     * 所有课程的数量(API调用)
     * @return 课程数量
     */
    Result courseAllNumber();

    /**
     * 每个分类的课程总数量(API调用)
     * @param categoryIdList 分类ID集合
     * @return 每个分类的课程总数量
     */
    Result courseCategoryNumber(List<Long> categoryIdList);

    /**
     * 课程评论数量(API调用)
     * @return 课程评论数量
     */
    Result courseCommentsNumber();

    /**
     * 每个分类的课程点赞数量(API调用)
     * @param categoryIdList 分类ID集合
     * @return 每个分类的课程点赞数量
     */
    Result courseCategoryLikeNumber(List<Long> categoryIdList);

    /**
     * 每个分类的课程收藏数量(API调用)
     * @param categoryIdList 分类ID集合
     * @return 每个分类的课程点赞数量
     */
    Result courseCategoryCollectionNumber(List<Long> categoryIdList);

    /**
     * 课程--查看课程数量(API调用)
     * @param userId 用户ID
     * @return 课程数量
     */
    Result queryCourseNumberByUserId(Long userId);

    /**
     * 课程--查询所有课程信息(需要包含视频信息, 带分页、课程名称、发布者、分类)
     * @param courseQueryParams 课程查询参数
     * @return 所有课程信息
     */
    Result queryAllCourse(CourseQueryParams courseQueryParams);

    /**
     * 课程--同意发布
     * @param courseId 课程ID
     * @return 是否操作成功
     */
    Result agreeReleaseCourse(Long courseId);

    /**
     * 课程--不同意发布
     * @param courseAuditParams 课程审核参数
     * @return 是否操作成功
     */
    Result unAgreeReleaseCourse(CourseAuditParams courseAuditParams);
}
