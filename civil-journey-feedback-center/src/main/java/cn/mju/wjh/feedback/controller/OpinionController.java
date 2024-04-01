package cn.mju.wjh.feedback.controller;

import cn.dev33.satoken.annotation.SaCheckRole;
import cn.dev33.satoken.annotation.SaMode;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.security.annotation.SaUserCheckLogin;
import cn.mju.wjh.feedback.service.OpinionService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * ClassName: OpinionController
 * Package: cn.mju.wjh.feedback.controller
 * Description: 意见反馈服务
 *
 * @Author:wjh
 * @Create:2024-02-2024/2/2--18:52
 */
@RestController
@Tag(name = "意见反馈服务")
public class OpinionController {

    @Setter(onMethod_ = @Autowired)
    private OpinionService opinionService;

    @SaUserCheckLogin
    @PostMapping("/front/opinion/submitOpinion/{username}/{message}")
    @Operation(summary = "反馈--提交意见信息")
    public Result submitOpinion(@PathVariable("username") String username, @PathVariable("message") String message) {
        return opinionService.submitOpinion(username, message);
    }

    @PostMapping("/backend/opinion/getAllOpinion")
    @Operation(summary = "反馈--获取所有反馈信息")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result getAllOpinion(@RequestBody @Validated PageParams pageParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return opinionService.getAllOpinion(pageParams);
    }

    @DeleteMapping("/backend/opinion/deleteOpinion")
    @Operation(summary = "反馈--删除反馈信息")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result deleteOpinion(@RequestBody List<Long> opinionIds) {
        return opinionService.deleteOpinion(opinionIds);
    }

    @GetMapping("/backend/opinion/acceptOpinion/{opinionId}/{creator}")
    @Operation(summary = "反馈--采纳反馈信息")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result acceptOpinion(@PathVariable("opinionId") Long opinionId, @PathVariable("creator") String creator) {
        return opinionService.acceptOpinion(opinionId, creator);
    }

}
