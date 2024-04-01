package cn.mju.wjh.auth.service;

import cn.mju.wjh.common.core.entity.param.admin.AdminLoginParams;
import cn.mju.wjh.common.core.entity.param.admin.AdminRegisterParams;
import cn.mju.wjh.common.core.utils.Result;
import jakarta.servlet.http.HttpServletRequest;

/**
 * ClassName: AdminAuthService
 * Package: cn.mju.wjh.auth.service
 * Description: 管理员认证服务接口
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/11--16:06
 */
public interface AdminAuthService {

    /**
     * 管理员注册
     * @param adminRegisterParams 管理员注册参数
     * @return 是否注册成功
     */
    Result adminRegister(AdminRegisterParams adminRegisterParams);

    /**
     * 管理员登录
     * @param request 请求体
     * @param loginParams 登录参数
     * @return 是否登录成功
     */
    Result<String> adminLogin(HttpServletRequest request, AdminLoginParams loginParams);

}
