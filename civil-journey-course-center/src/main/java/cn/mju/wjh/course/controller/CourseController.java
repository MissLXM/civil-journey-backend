package cn.mju.wjh.course.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.UploadParams;
import cn.mju.wjh.common.core.entity.param.course.CourseParams;
import cn.mju.wjh.common.core.entity.param.course.InsertCourseParams;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.security.annotation.SaUserCheckLogin;
import cn.mju.wjh.course.service.CourseService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * ClassName: CourseController
 * Package: cn.mju.wjh.course.controller
 * Description: 课程服务(前台)
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/27--16:50
 */
@RestController
@SaUserCheckLogin
@Tag(name = "课程服务(前台)")
@RequestMapping("/front/course/")
public class CourseController {

    @Setter(onMethod_ = @Autowired)
    private CourseService courseService;

    @SaIgnore
    @PostMapping("homeShowCourse")
    @Operation(summary = "首页-展示课程")
    public Result homeShowCourse(
            @RequestParam(name = "courseName", required = false) String courseName,
            @RequestBody @Validated PageParams pageParams,
            BindingResult result
    ) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return courseService.homeShowCourse(courseName, pageParams);
    }

    @PostMapping("showCourseInCourseView")
    @Operation(summary = "课程-展示课程")
    public Result showCourseInCourseView(@RequestBody @Validated CourseParams courseParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return courseService.showCourseInCourseView(courseParams);
    }

    @PostMapping("queryCollectionCourse")
    @Operation(summary = "课程--查询收藏课程")
    public Result queryCollectionCourse(@RequestBody @Validated PageParams pageParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return courseService.queryCollectionCourse(pageParams);
    }

    @PostMapping("queryTeacherReleaseCourse")
    @Operation(summary = "课程--查询讲师已发布课程")
    public Result queryTeacherReleaseCourse(@RequestBody @Validated PageParams pageParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return courseService.queryTeacherReleaseCourse(pageParams);
    }

    @PostMapping("insertCourseInfo")
    @Operation(summary = "课程--发布课程")
    public Result insertCourseInfo(@RequestBody @Validated InsertCourseParams courseParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return courseService.insertCourseInfo(courseParams);
    }

    @SaIgnore
    @PostMapping("uploadCourseImage")
    @Operation(summary = "课程--上传课程封面")
    public Result uploadCourseImage(@RequestParam("file") MultipartFile file, UploadParams params) {
        return courseService.uploadCourseImage(file, params.getUsername());
    }

    @DeleteMapping("deleteCourseInfo/{courseId}")
    @Operation(summary = "课程--删除课程")
    public Result deleteCourseInfo(@PathVariable("courseId") Long courseId) {
        return courseService.deleteCourseInfo(courseId);
    }

    @GetMapping("courseLikeOrNoLike/{courseId}")
    @Operation(summary = "课程--点赞/取消点赞")
    public Result courseLikeOrNoLike(@PathVariable("courseId") Long courseId) {
        return courseService.courseLikeOrNoLike(courseId);
    }

    @GetMapping("courseCollectionOrNoCollection/{courseId}")
    @Operation(summary = "课程--收藏/取消收藏")
    public Result courseCollectionOrNoCollection(@PathVariable("courseId") Long courseId) {
        return courseService.courseCollectionOrNoCollection(courseId);
    }

    @GetMapping("queryCourseInfo/{courseId}")
    @Operation(summary = "课程--详细信息", description = "根据课程ID")
    public Result queryCourseInfo(@PathVariable("courseId") Long courseId) {
        return courseService.queryCourseInfo(courseId);
    }

    @SaIgnore
    @GetMapping("queryCourseInfoByClient/{courseId}")
    @Operation(summary = "课程--详细信息(API调用)", description = "根据课程ID")
    public Result queryCourseInfoByClient(@PathVariable("courseId") Long courseId) {
        return courseService.queryCourseInfoByClient(courseId);
    }

}
