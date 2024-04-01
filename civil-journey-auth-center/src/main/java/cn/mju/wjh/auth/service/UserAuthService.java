package cn.mju.wjh.auth.service;

import cn.mju.wjh.common.core.entity.param.user.LoginEmailParams;
import cn.mju.wjh.common.core.entity.param.user.LoginUsernameParams;
import cn.mju.wjh.common.core.entity.param.user.UserRegisterParams;
import cn.mju.wjh.common.core.utils.Result;
import jakarta.servlet.http.HttpServletRequest;

/**
 * ClassName: UserAuthService
 * Package: cn.mju.wjh.auth.service
 * Description: 用户认证服务接口
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/9--21:13
 */
public interface UserAuthService {

    /**
     * 获取邮箱验证码
     * @param email 邮箱
     * @return 是否发送成功
     */
    Result<String> getEmailCode(String email);

    /**
     * 用户注册
     * @param registerParams 注册参数
     * @return 是否注册成功
     */
    Result userRegister(UserRegisterParams registerParams);

    /**
     * 用户登录(登录名称)
     * @param request 请求体
     * @param loginUsernameParams 登录参数
     * @return 是否登录成功
     */
    Result<String> userLoginByUsername(HttpServletRequest request, LoginUsernameParams loginUsernameParams);

    /**
     * 用户登录(邮箱)
     * @param request 请求体
     * @param loginEmailParams 登录参数
     * @return 是否登录成功
     */
    Result<String> userLoginByEmail(HttpServletRequest request, LoginEmailParams loginEmailParams);
}
