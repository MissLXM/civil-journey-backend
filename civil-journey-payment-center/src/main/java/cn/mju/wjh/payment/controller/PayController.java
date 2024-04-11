package cn.mju.wjh.payment.controller;

import cn.dev33.satoken.annotation.SaCheckRole;
import cn.dev33.satoken.annotation.SaMode;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.param.pay.OrderQueryParams;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.security.annotation.SaUserCheckLogin;
import cn.mju.wjh.payment.service.PayService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * ClassName: PayController
 * Package: cn.mju.wjh.payment.controller
 * Description: 支付服务
 *
 * @Author:wjh
 * @Create:2024-02-2024/2/20--16:31
 */
@RestController
@Tag(name = "支付服务")
public class PayController {

    @Setter(onMethod_ = @Autowired)
    private PayService payService;

    @SaUserCheckLogin
    @GetMapping("/pay/queryPayOrderInfo")
    @Operation(summary = "支付--获取所有订单", description = "登录用户的所有订单")
    public Result queryPayOrderInfo() {
        return payService.queryPayOrderInfo();
    }

    @PostMapping("/pay/queryAllOrder")
    @Operation(summary = "管理员--查看所有订单")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result queryAllOrder(@RequestBody @Validated OrderQueryParams orderQueryParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return payService.queryAllOrder(orderQueryParams);
    }

    @SaUserCheckLogin
    @GetMapping("/pay/isPayCourse/{courseId}")
    @Operation(summary = "支付--是否已购买课程")
    public Result isPayCourse(@PathVariable("courseId") Long courseId) {
        return payService.isPayCourse(courseId);
    }

    @SaUserCheckLogin
    @DeleteMapping("/pay/deleteOrder/{orderId}")
    @Operation(summary = "支付--删除指定订单")
    public Result deleteOrder(@PathVariable("orderId") Long orderId) {
        return payService.deleteOrder(orderId);
    }
}
