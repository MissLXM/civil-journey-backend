package cn.mju.wjh.message.controller;

import cn.dev33.satoken.annotation.SaCheckRole;
import cn.dev33.satoken.annotation.SaIgnore;
import cn.dev33.satoken.annotation.SaMode;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.UploadParams;
import cn.mju.wjh.common.core.entity.param.technical.TechnicalQueryParams;
import cn.mju.wjh.common.core.entity.pojo.notice.CivilTechnical;
import cn.mju.wjh.common.core.entity.pojo.notice.ExamTime;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.security.annotation.SaUserCheckLogin;
import cn.mju.wjh.message.service.MessageService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * ClassName: MessageController
 * Package: cn.mju.wjh.message.controller
 * Description: 资讯服务
 *
 * @Author:wjh
 * @Create:2024-01-2024/1/31--15:26
 */
@RestController
@Tag(name = "资讯服务")
public class MessageController {

    @Setter(onMethod_ = @Autowired)
    private MessageService messageService;

    @SaUserCheckLogin
    @GetMapping("/front/message/getExamTimeMessage")
    @Operation(summary = "资讯--考试时间资讯", description = "默认展示8条")
    public Result getExamTimeMessage() {
        return messageService.getExamTimeMessage();
    }

    @SaUserCheckLogin
    @GetMapping("/front/message/getExamMessage")
    @Operation(summary = "资讯--招考信息")
    public Result getExamMessage() {
        return messageService.getExamMessage();
    }

    @SaUserCheckLogin
    @GetMapping("/front/message/getMessageInfoById/{technicalId}")
    @Operation(summary = "资讯--详细信息")
    public Result getMessageInfoById(@PathVariable("technicalId") Long technicalId) {
        return messageService.getMessageInfoById(technicalId);
    }

    @PostMapping("/backend/message/getAllMessage")
    @Operation(summary = "资讯--获取所有资讯信息")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result getAllMessage(@RequestBody @Validated TechnicalQueryParams technicalQueryParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return messageService.getAllMessage(technicalQueryParams);
    }

    @PostMapping("/backend/message/getExamTime")
    @Operation(summary = "资讯--获取所有考试信息")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result getAllExamTime(@RequestBody @Validated PageParams pageParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return messageService.getAllExamTime(pageParams);
    }

    @PostMapping("/backend/message/addExam")
    @Operation(summary = "资讯--添加考试信息")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result addExam(@RequestBody @Validated ExamTime examTime, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return messageService.addExam(examTime);
    }

    @PutMapping("/backend/message/updateExam")
    @Operation(summary = "资讯--修改考试信息")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result updateExam(@RequestBody @Validated ExamTime examTime, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return messageService.updateExam(examTime);
    }

    @DeleteMapping("/backend/message/deleteExam")
    @Operation(summary = "资讯--删除考试信息")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result deleteExam(@RequestBody List<Long> examTimeIds) {
        return messageService.deleteExam(examTimeIds);
    }

    @PostMapping("/backend/message/addMessage")
    @Operation(summary = "资讯--发布资讯")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result addMessage(@RequestBody @Validated CivilTechnical technical, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return messageService.addMessage(technical);
    }

    @PutMapping("/backend/message/updateMessage")
    @Operation(summary = "资讯--修改资讯")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result updateMessage(@RequestBody @Validated CivilTechnical technical, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return messageService.updateMessage(technical);
    }

    @DeleteMapping("/backend/message/deleteMessage")
    @Operation(summary = "资讯--删除资讯")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result deleteMessage(@RequestBody List<Long> technicalIds) {
        return messageService.deleteMessage(technicalIds);
    }

    @SaIgnore
    @PostMapping("/backend/message/submitTechnicalImage")
    @Operation(summary = "资讯--上传资讯图片")
    public Result submitTechnicalImage(@RequestParam("file") MultipartFile file, UploadParams params) {
        return messageService.submitTechnicalImage(file, params.getUsername());
    }

}
