package cn.mju.wjh.auth.controller;

import cn.dev33.satoken.annotation.SaCheckRole;
import cn.dev33.satoken.stp.StpUtil;
import cn.mju.wjh.auth.service.AdminAuthService;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.param.admin.AdminLoginParams;
import cn.mju.wjh.common.core.entity.param.admin.AdminRegisterParams;
import cn.mju.wjh.common.core.utils.Result;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * ClassName: AdminAuthController
 * Package: cn.mju.wjh.auth.controller
 * Description: 管理员认证控制类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/8--19:06
 */
@Slf4j
@RestController
@Tag(name = "管理员认证服务")
@RequestMapping(value = "/auth/admin/")
public class AdminAuthController {

    @Setter(onMethod_ = @Autowired)
    private AdminAuthService adminAuthService;

    @PostMapping("register")
    @Operation(summary = "管理员注册")
    @SaCheckRole(value = UseConstant.ROLE_SUPER_ADMIN)
    public Result adminRegister(@RequestBody @Validated AdminRegisterParams adminRegisterParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return adminAuthService.adminRegister(adminRegisterParams);
    }


    @PostMapping("login")
    @Operation(summary = "管理员登录")
    public Result<String> adminLogin(HttpServletRequest request, @RequestBody @Validated AdminLoginParams loginParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return adminAuthService.adminLogin(request, loginParams);
    }

    @GetMapping("logout")
    @Operation(summary = "管理员登出")
    public Result adminLogout() {
        StpUtil.logout(StpUtil.getLoginId());
        return Result.ok().message("登出成功");
    }


}
