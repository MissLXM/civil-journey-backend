package cn.mju.wjh.common.security.annotation;

import cn.dev33.satoken.annotation.SaCheckLogin;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * ClassName: SaUserCheckLogin
 * Package: cn.mju.wjh.security.annotation
 * Description: 登录认证(User版)
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/12--11:11
 */
@SaCheckLogin(type = "user")
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD, ElementType.TYPE})
public @interface SaUserCheckLogin {
}
