package cn.mju.wjh.auth.controller;

import cn.mju.wjh.auth.service.UserAuthService;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.param.user.LoginEmailParams;
import cn.mju.wjh.common.core.entity.param.user.LoginUsernameParams;
import cn.mju.wjh.common.core.entity.param.user.UserRegisterParams;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.security.utils.StpUserUtils;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.regex.Pattern;


/**
 * ClassName: UserAuthController
 * Package: cn.mju.wjh.auth.controller
 * Description: 用户认证控制类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/8--19:06
 */
@Slf4j
@RestController
@Tag(name = "用户认证服务")
@RequestMapping(value = "/auth/user/")
public class UserAuthController {

    @Setter(onMethod_ = @Autowired)
    private UserAuthService userAuthService;

    @GetMapping("getEmailCode")
    @Operation(summary = "用户--获取邮箱验证码")
    public Result<String> getEmailCode(@RequestParam("email") String email) {
        if (!Pattern.matches(UseConstant.EMAIL_PATTERN, email)) {
            return Result.fail().message("邮箱格式不符合");
        }
        return userAuthService.getEmailCode(email);
    }

    @PostMapping("register")
    @Operation(summary = "用户--注册")
    public Result userRegister(@RequestBody @Validated UserRegisterParams registerParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return userAuthService.userRegister(registerParams);
    }


    @PostMapping("loginByUsername")
    @Operation(summary = "用户--登录(登录名称)")
    public Result<String> userLoginByUsername(HttpServletRequest request, @RequestBody @Validated LoginUsernameParams loginUsernameParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return userAuthService.userLoginByUsername(request, loginUsernameParams);
    }

    @PostMapping("loginEmail")
    @Operation(summary = "用户--登录(用户邮箱)")
    public Result<String> userLoginByEmail(HttpServletRequest request, @RequestBody @Validated LoginEmailParams loginEmailParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return userAuthService.userLoginByEmail(request, loginEmailParams);
    }

    @GetMapping("logout")
    @Operation(summary = "用户--登出")
    public Result userLogout() {
        System.out.println("进入登出接口");
        StpUserUtils.logout(StpUserUtils.getLoginId());
        return Result.ok().message("登出成功");
    }


}
