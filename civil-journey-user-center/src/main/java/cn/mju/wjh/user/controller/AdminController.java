package cn.mju.wjh.user.controller;

import cn.dev33.satoken.annotation.SaCheckRole;
import cn.dev33.satoken.annotation.SaIgnore;
import cn.dev33.satoken.annotation.SaMode;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.param.UploadParams;
import cn.mju.wjh.common.core.entity.param.user.DisagreeApplyParams;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.admin.AdminQueryParams;
import cn.mju.wjh.common.core.entity.param.admin.AdminUpdateParams;
import cn.mju.wjh.common.core.entity.param.user.UserQueryParams;
import cn.mju.wjh.common.core.entity.pojo.user.CivilAdmin;
import cn.mju.wjh.common.core.entity.pojo.user.CivilRole;
import cn.mju.wjh.common.core.entity.pojo.user.CivilUser;
import cn.mju.wjh.common.core.entity.pojo.user.MedalAuthority;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.user.service.AdminService;
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

import java.util.List;

/**
 * ClassName: AdminController
 * Package: cn.mju.wjh.user.controller
 * Description: 管理员控制类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/6--14:54
 */
@Slf4j
@RestController
@Tag(name = "管理员服务")
@RequestMapping("/backend/admin/")
public class AdminController {

    @Setter(onMethod_ = @Autowired)
    private AdminService adminService;

    @GetMapping("adminInfo")
    @Operation(summary = "管理员--查询自身信息")
    public Result adminInfo() {
         return adminService.adminInfo();
    }

    @PutMapping("updateAdminInfo")
    @Operation(summary = "管理员--修改自身信息")
    public Result updateAdminInfo(@RequestBody @Validated AdminUpdateParams adminUpdateParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return adminService.updateAdminInfo(adminUpdateParams);
    }

    @PutMapping("updateAdminPassword")
    @Operation(summary = "管理员--修改自身密码")
    public Result updateAdminPassword(@RequestParam("password") @Schema(name = "password", description = "登录密码") String password) {
        return adminService.updateAdminPassword(password);
    }

    @SaIgnore
    @PostMapping("updateAdminAvatar")
    @Operation(summary = "管理员--修改自身头像")
    public Result updateAdminAvatar(@RequestParam("file") MultipartFile file, UploadParams params) {
        return adminService.updateAdminAvatar(file, params.getUsername());
    }

    @PutMapping("updateAdminPasswordOfAdmin")
    @Operation(summary = "管理员--重置管理员密码")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result updateAdminPasswordOfAdmin(
            @RequestBody @Schema(name = "adminIds", description = "管理员ID列表") List<Long> adminIds
    ) {
        return adminService.updateAdminPasswordOfAdmin(adminIds);
    }

    @PutMapping("updateAdminInfoOfSuperAdmin")
    @Operation(summary = "管理员--修改指定管理员")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result updateAdminInfoOfSuperAdmin(@RequestBody @Validated CivilAdmin civilAdmin, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return adminService.updateAdminInfoOfSuperAdmin(civilAdmin);
    }

    @DeleteMapping("forBiddenAdminOfSuperAdmin/{adminId}/{isDelete}")
    @Operation(summary = "管理员--启用/禁用指定管理员")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result forBiddenAdminOfSuperAdmin(
            @PathVariable("adminId") @Schema(name = "adminId", description = "管理员ID") Long adminId,
            @PathVariable("isDelete") @Schema(name = "isDelete", description = "启用/禁用") Byte isDelete) {
        return adminService.forBiddenAdminOfSuperAdmin(adminId, isDelete);
    }

    @DeleteMapping("deleteAdminOfSuperAdmin")
    @Operation(summary = "管理员--删除指定管理员(可多删除)")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result deleteAdminsOfSuperAdmin(
            @RequestBody @Schema(name = "adminIds", description = "管理员ID列表") List<Long> adminIds
    ) {
        return adminService.deleteAdminOfSuperAdmin(adminIds);
    }

    @PostMapping("adminInfoByRole")
    @Operation(summary = "管理员--查询信息(角色)")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result adminInfoByRole(@RequestBody @Validated AdminQueryParams adminQueryParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return adminService.adminInfoByRole(adminQueryParams);
    }

    @PostMapping("adminInfoByNicknameOrEmail")
    @Operation(summary = "管理员--查询信息(昵称、邮箱、所有)")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result adminInfoByNicknameOrEmail(@RequestBody @Validated AdminQueryParams adminQueryParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return adminService.adminInfoByNicknameOrEmail(adminQueryParams);
    }

    @PostMapping("insertUserOfAdmin")
    @Operation(summary = "用户--新增新用户")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result insertUserOfSuperAdmin(@RequestBody @Validated CivilUser user, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return adminService.insertUserOfSuperAdmin(user);
    }

    @PutMapping("updateUserPasswordOfAdmin")
    @Operation(summary = "用户--重置用户密码")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result updateUserPasswordOfAdmin(
            @RequestBody @Schema(name = "userIds", description = "用户ID列表") List<Long> userIds
    ) {
        return adminService.updateUserPasswordOfAdmin(userIds);
    }

    @PutMapping("updateUserInfoOfAdmin")
    @Operation(summary = "用户--修改用户信息")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result updateUserInfoOfAdmin(@RequestBody @Validated CivilUser user, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return adminService.updateUserInfoOfAdmin(user);
    }

    @DeleteMapping("deleteUserInfoOfAdmin/{userId}/{isDelete}")
    @Operation(summary = "用户--启用/禁用指定用户")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result deleteUserInfoOfAdmin(
            @PathVariable("userId") @Schema(name = "userId", description = "用户ID") Long userId,
            @PathVariable("isDelete") @Schema(name = "isDelete", description = "启用/禁用") Byte isDelete) {
        return adminService.deleteUserInfoOfAdmin(userId, isDelete);
    }

    @DeleteMapping("deleteUserOfAdmin")
    @Operation(summary = "用户--删除指定用户(可多删除)")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result deleteUserOfAdmin(
            @RequestBody @Schema(name = "userIds", description = "用户ID列表") List<Long> userIds) {
        return adminService.deleteUserOfAdmin(userIds);
    }

    @PostMapping("userInfoByUserRole")
    @Operation(summary = "用户 -- 查询(角色:用户、讲师)")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result userInfoByUserRole(@RequestBody @Validated UserQueryParams userQueryParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return adminService.userInfoByUserRole(userQueryParams);
    }

    @PostMapping("userInfoByUsernameOrEmailOrNickname")
    @Operation(summary = "用户--查询(邮箱查询、登录名称查询、昵称查询、所有查询)")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result userInfoByUsernameOrEmailOrNickname(@RequestBody @Validated UserQueryParams userQueryParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return adminService.userInfoByUsernameOrEmailOrNickname(userQueryParams);
    }

    @GetMapping("userMedalInfo/{userId}")
    @Operation(summary = "用户--查询(拥有的勋章信息)")
    public Result userMedalInfo(
            @PathVariable("userId") @Schema(name = "userId", description = "用户ID") Long userId
    ) {
        return adminService.userMedalInfo(userId);
    }

    @PostMapping("queryLoginLog")
    @Operation(summary = "日志--查询登录日志(登录名称、所有)")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result queryLoginLog(@RequestBody @Validated UserQueryParams userQueryParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return adminService.queryLoginLog(userQueryParams);
    }

    @DeleteMapping("deleteLoginLog")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    @Operation(summary = "日志--删除登录日志(单选、多选)")
    public Result deleteLoginLog(@RequestBody List<Long> loginLogIds) {
        return adminService.deleteLoginLog(loginLogIds);
    }

    @DeleteMapping("clearAllLoginLog")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    @Operation(summary = "日志--删除所有登录日志")
    public Result clearAllLoginLog() {
        return adminService.clearAllLoginLog();
    }


    @PostMapping("getAllRole")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    @Operation(summary = "角色--获取所有角色信息")
    public Result getAllRole(@RequestBody @Validated PageParams pageParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return adminService.getAllRole(pageParams);
    }

    @PostMapping("getAllMedal")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    @Operation(summary = "勋章--获取所有勋章信息")
    public Result getAllMedal(@RequestBody @Validated PageParams pageParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return adminService.getAllMedal(pageParams);
    }

    @GetMapping("adminUpgradeSuperAdmin/{adminId}")
    @Operation(summary = "授权--管理员升级超级管理员")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result adminUpgradeSuperAdmin(
            @PathVariable("adminId") @Schema(name = "adminId", description = "管理员ID") Long adminId
    ) {
        return adminService.adminUpgradeSuperAdmin(adminId);
    }

    @PostMapping("teacherApplyInfo")
    @Operation(summary = "讲师--查询待审核的讲师申请")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result teacherApplyInfo(@RequestBody @Validated UserQueryParams userQueryParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return adminService.teacherApplyInfo(userQueryParams);
    }

    @GetMapping("deleteTeacher/{userId}")
    @Operation(summary = "讲师--取消讲师资格")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result deleteTeacher(
            @PathVariable("userId") @Schema(name = "userId", description = "用户ID") Long userId
    ) {
        return adminService.deleteTeacher(userId);
    }

    @GetMapping("agreeTeacherApply/{userId}")
    @Operation(summary = "讲师--同意讲师申请")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result agreeTeacherApply(
            @PathVariable("userId") @Schema(name = "userId", description = "用户ID") Long userId
    ) {
        return adminService.agreeTeacherApply(userId);
    }

    @PostMapping("disagreeTeacherApply")
    @Operation(summary = "讲师--不同意讲师申请")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result disagreeTeacherApply(@RequestBody @Validated DisagreeApplyParams disagreeApplyParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return adminService.disagreeTeacherApply(disagreeApplyParams);
    }

    @SaIgnore
    @GetMapping("getUserNumber")
    @Operation(summary = "获取用户数量(API调用)")
    public Result getUserNumber() {
        return adminService.getUserNumber();
    }

    @SaIgnore
    @GetMapping("getTeacherNumber")
    @Operation(summary = "获取讲师数量(API调用)")
    public Result getTeacherNumber() {
        return adminService.getTeacherNumber();
    }

    @SaIgnore
    @GetMapping("getLoginLogNumber")
    @Operation(summary = "获取登录次数(API调用)")
    public Result getLoginLogNumber() {
        return adminService.getLoginLogNumber();
    }

    @SaIgnore
    @GetMapping("setUserMedal/{userId}/{medalId}")
    @Operation(summary = "赋予用户勋章(API调用)")
    public Result setUserMedal(@PathVariable("userId") Long userId, @PathVariable("medalId") Long medalId) {
        return adminService.setUserMedal(userId, medalId);
    }

    @SaIgnore
    @DeleteMapping("deleteUserMedal/{userId}/{medalId}")
    @Operation(summary = "删除用户勋章(API调用)")
    public Result deleteUserMedal(@PathVariable("userId") Long userId, @PathVariable("medalId") Long medalId) {
        return adminService.deleteUserMedal(userId, medalId);
    }

    @GetMapping("getAllOnlineUser")
    @Operation(summary = "管理员--获取所有在线用户")
    public Result getAllOnlineUser() {
        return adminService.getAllOnlineUser();
    }

    @GetMapping("getAllChatRecords/{adminId}/{userId}")
    @Operation(summary = "管理员--获取所有聊天记录")
    public Result getAllChatRecords(@PathVariable("adminId") Long adminId, @PathVariable("userId") Long userId) {
        return adminService.getAllChatRecords(adminId, userId);
    }

    @PostMapping("addRole")
    @Operation(summary = "角色--添加新角色")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result addRole(@RequestBody @Validated CivilRole role, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return adminService.addRole(role);
    }

    @PutMapping("updateRole")
    @Operation(summary = "角色--修改角色")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result updateRole(@RequestBody @Validated CivilRole role, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return adminService.updateRole(role);
    }

    @DeleteMapping("deleteRole")
    @Operation(summary = "角色--删除角色")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result deleteRole(@RequestBody List<Long> roleIds) {
        return adminService.deleteRole(roleIds);
    }

    @PostMapping("addMedal")
    @Operation(summary = "勋章--添加勋章")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result addMedal(@RequestBody @Validated MedalAuthority medalAuthority, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return adminService.addMedal(medalAuthority);
    }

    @PutMapping("updateMedal")
    @Operation(summary = "勋章--修改勋章")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result updateMedal(@RequestBody @Validated MedalAuthority medalAuthority, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return adminService.updateMedal(medalAuthority);
    }

    @DeleteMapping("deleteMedal")
    @Operation(summary = "勋章--删除勋章")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result deleteMedal(@RequestBody List<Long> medalIds) {
        return adminService.deleteMedal(medalIds);
    }

    @SaIgnore
    @PostMapping("submitMedalIcon")
    @Operation(summary = "勋章--上传勋章图片")
    public Result submitMedalIcon(@RequestParam("file") MultipartFile file, UploadParams params) {
        return adminService.submitMedalIcon(file, params.getUsername());
    }

    @GetMapping("getUserIdAndNickname")
    @Operation(summary = "用户--获取用户ID和昵称")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result getUserIdAndNickname() {
        return adminService.getUserIdAndNickname();
    }
}
