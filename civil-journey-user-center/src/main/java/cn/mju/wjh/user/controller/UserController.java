package cn.mju.wjh.user.controller;

import cn.dev33.satoken.annotation.SaCheckRole;
import cn.dev33.satoken.annotation.SaIgnore;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.UploadParams;
import cn.mju.wjh.common.core.entity.pojo.user.TeacherAudit;
import cn.mju.wjh.common.core.entity.pojo.user.CivilUser;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.security.annotation.SaUserCheckLogin;
import cn.mju.wjh.user.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * ClassName: UserController
 * Package: cn.mju.wjh.user.controller
 * Description: 用户控制类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/6--14:54
 */
@Slf4j
@RestController
@SaUserCheckLogin
@Tag(name = "用户服务")
@RequestMapping("/front/user/")
public class UserController {

    @Setter(onMethod_ = @Autowired)
    private UserService userService;

    @GetMapping("userInfo")
    @Operation(summary = "用户--查询用户信息")
    public Result queryUserInfo() {
        return userService.queryUserInfo();
    }

    @PutMapping("updateUserInfo")
    @Operation(summary = "用户--修改用户信息")
    public Result updateUserInfo(@RequestBody @Validated CivilUser user, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return userService.updateUserInfo(user);
    }

    @PutMapping("updateUserPassword")
    @Operation(summary = "用户--修改用户密码")
    public Result updateUserPassword(@RequestParam("password") @Schema(name = "password", description = "登录密码") String password) {
        return userService.updateUserPassword(password);
    }

    @SaIgnore
    @PostMapping("updateUserAvatar")
    @Operation(summary = "用户--修改用户头像")
    public Result updateUserAvatar(@RequestParam("file") MultipartFile file, UploadParams params) {
        return userService.updateUserAvatar(file, params.getUsername());
    }

    @PostMapping("applyTeacherRole")
    @Operation(summary = "用户--申请讲师角色")
    public Result applyTeacherRole(@RequestBody @Validated TeacherAudit teacher, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return userService.applyTeacherRole(teacher);
    }

    @SaIgnore
    @PostMapping("submitTeacherCertificatePhoto")
    @Operation(summary = "用户--上传教师资格证书")
    public Result submitTeacherCertificatePhoto(@RequestParam("file") MultipartFile file, UploadParams params) {
        return userService.submitTeacherCertificatePhoto(file, params.getUsername());
    }

    @GetMapping("teacherApplyReason")
    @Operation(summary = "用户--查看讲师申请进度")
    public Result teacherApplyReason() {
        return userService.teacherApplyReason();
    }

    @DeleteMapping("deleteTeacherApply")
    @Operation(summary = "用户--删除讲师申请")
    public Result deleteTeacherApply() {
        return userService.deleteTeacherApply();
    }

    @GetMapping("updateTeacherIntroduction")
    @SaCheckRole(type = UseConstant.ROLE_USER, value = UseConstant.ROLE_TEACHER)
    @Operation(summary = "讲师--修改讲师简介")
    public Result updateTeacherIntroduction(@RequestParam("teacherIntroduction") String teacherIntroduction) {
        System.out.println(teacherIntroduction);
        return userService.updateTeacherIntroduction(teacherIntroduction);
    }

    @SaIgnore
    @GetMapping("getTeacher")
    @Operation(summary = "首页--展示前6条讲师", description = "默认展示")
    public Result getTeacher() {
        return userService.getTeacher();
    }

    @SaIgnore
    @GetMapping("getTeacherInfoById/{teacherId}")
    @Operation(summary = "首页--获取讲师基本信息", description = "根据讲师ID")
    public Result getTeacherInfoById(
            @PathVariable("teacherId")
            @Schema(name = "teacherId", description = "讲师ID") Long teacherId
    ) {
        return userService.getTeacherInfoById(teacherId);
    }

    @SaIgnore
    @PostMapping("getTeacherHistoryCourseInfo/{teacherId}")
    @Operation(summary = "首页--获取讲师历史课程信息", description = "根据讲师ID(带分页)")
    public Result getTeacherHistoryCourseInfo(
            @PathVariable("teacherId")
            @Schema(name = "teacherId", description = "讲师ID") Long teacherId,
            @RequestBody @Validated PageParams pageParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return userService.getTeacherHistoryCourseInfo(teacherId, pageParams);
    }

    @GetMapping("getAllOnlineCustom")
    @Operation(summary = "用户--获取所有在线客服")
    public Result getAllOnlineCustom() {
        return userService.getAllOnlineCustom();
    }

    @GetMapping("getAllChatRecords/{userId}/{adminId}")
    @Operation(summary = "用户--获取所有聊天记录")
    public Result getAllChatRecords(@PathVariable("userId") Long userId, @PathVariable("adminId") Long adminId) {
        return userService.getAllChatRecords(userId, adminId);
    }
}
