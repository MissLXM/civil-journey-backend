package cn.mju.wjh.feedback.controller;

import cn.dev33.satoken.annotation.SaCheckRole;
import cn.dev33.satoken.annotation.SaMode;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.notice.NoticeQueryParams;
import cn.mju.wjh.common.core.entity.pojo.notice.NoticeUser;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.security.annotation.SaUserCheckLogin;
import cn.mju.wjh.feedback.service.NoticeService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * ClassName: NoticeController
 * Package: cn.mju.wjh.feedback.controller
 * Description: 通知服务
 *
 * @Author:wjh
 * @Create:2024-02-2024/2/1--13:42
 */
@RestController
@Tag(name = "通知服务")
public class NoticeController {

    @Setter(onMethod_ = @Autowired)
    private NoticeService noticeService;

    @SaUserCheckLogin
    @PostMapping("/front/notice/getUserNotice")
    @Operation(summary = "反馈--获取用户通知信息")
    public Result getUserNotice(@RequestBody @Validated PageParams pageParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return noticeService.getUserNotice(pageParams);
    }

    @SaUserCheckLogin
    @GetMapping("/front/notice/getUserNoticeNumber")
    @Operation(summary = "反馈--获取当前用户未读取的通知数量")
    public Result getUserNoticeNumber() {
        return noticeService.getUserNoticeNumber();
    }

    @SaUserCheckLogin
    @GetMapping("/front/notice/updateUserNoticeStatus/{noticeUserId}")
    @Operation(summary = "反馈--修改用户通知的状态")
    public Result updateUserNoticeStatus(@PathVariable("noticeUserId") Long noticeUserId) {
        return noticeService.updateUserNoticeStatus(noticeUserId);
    }

    @PostMapping("/backend/notice/getAllNotice")
    @Operation(summary = "通知--获取所有通知信息")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result getAllNotice(@RequestBody @Validated NoticeQueryParams noticeQueryParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return noticeService.getAllNotice(noticeQueryParams);
    }

    @PostMapping("/backend/notice/releaseNotice")
    @Operation(summary = "通知--发布通知")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result releaseNotice(@RequestBody @Validated NoticeUser noticeUser, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return noticeService.releaseNotice(noticeUser);
    }

    @DeleteMapping("/backend/notice/deleteNotice")
    @Operation(summary = "通知--删除通知")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result deleteNotice(@RequestBody List<Long> noticeUserIds) {
        return noticeService.deleteNotice(noticeUserIds);
    }
}
