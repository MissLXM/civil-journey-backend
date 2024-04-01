package cn.mju.wjh.course.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaIgnore;
import cn.mju.wjh.common.core.entity.param.course.CourseAuditParams;
import cn.mju.wjh.common.core.entity.param.course.CourseQueryParams;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.course.service.CourseManageService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * ClassName: CourseManageController
 * Package: cn.mju.wjh.course.controller
 * Description: 课程服务(后台)
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/27--16:51
 */
@SaCheckLogin
@RestController
@Tag(name = "课程服务(后台)")
@RequestMapping("/backend/course/")
public class CourseManageController {

    @Setter(onMethod_ = @Autowired)
    private CourseManageService courseManageService;

    @SaIgnore
    @GetMapping("courseAllNumber")
    @Operation(summary = "所有课程的数量(API调用)")
    public Result courseAllNumber() {
        return courseManageService.courseAllNumber();
    }

    @SaIgnore
    @PostMapping("courseCategoryNumber")
    @Operation(summary = "每个分类的课程总数量(API调用)")
    public Result courseCategoryNumber(@RequestBody List<Long> categoryIdList) {
        return courseManageService.courseCategoryNumber(categoryIdList);
    }

    @SaIgnore
    @GetMapping("courseCommentsNumber")
    @Operation(summary = "课程评论数量(API调用)")
    public Result courseCommentsNumber() {
        return courseManageService.courseCommentsNumber();
    }

    @SaIgnore
    @PostMapping("courseCategoryLikeNumber")
    @Operation(summary = "每个分类的课程点赞数量(API调用)")
    public Result courseCategoryLikeNumber(@RequestBody List<Long> categoryIdList) {
        return courseManageService.courseCategoryLikeNumber(categoryIdList);
    }

    @SaIgnore
    @PostMapping("courseCategoryCollectionNumber")
    @Operation(summary = "每个分类的课程收藏数量(API调用)")
    public Result courseCategoryCollectionNumber(@RequestBody List<Long> categoryIdList) {
        return courseManageService.courseCategoryCollectionNumber(categoryIdList);
    }

    @SaIgnore
    @GetMapping("queryCourseNumberByUserId/{userId}")
    @Operation(summary = "课程--查看课程数量(API调用)", description = "根据用户ID")
    public Result queryCourseNumberByUserId(@PathVariable("userId") Long userId) {
        return courseManageService.queryCourseNumberByUserId(userId);
    }

    @PostMapping("queryAllCourse")
    @Operation(summary = "课程--查询所有课程信息", description = "需要包含视频信息, 带分页、课程名称、发布者、分类、待审核")
    public Result queryAllCourse(@RequestBody @Validated CourseQueryParams courseQueryParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return courseManageService.queryAllCourse(courseQueryParams);
    }

    @GetMapping("agreeReleaseCourse/{courseId}")
    @Operation(summary = "课程--同意发布课程")
    public Result agreeReleaseCourse(@PathVariable("courseId") Long courseId) {
        return courseManageService.agreeReleaseCourse(courseId);
    }

    @PostMapping("unAgreeReleaseCourse")
    @Operation(summary = "课程--不同意发布课程")
    public Result unAgreeReleaseCourse(@RequestBody @Validated CourseAuditParams courseAuditParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return courseManageService.unAgreeReleaseCourse(courseAuditParams);
    }
}
