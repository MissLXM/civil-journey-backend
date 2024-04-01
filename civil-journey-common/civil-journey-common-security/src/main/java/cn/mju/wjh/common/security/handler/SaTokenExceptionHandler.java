package cn.mju.wjh.common.security.handler;

import cn.dev33.satoken.exception.*;
import cn.mju.wjh.common.core.enums.HttpStatus;
import cn.mju.wjh.common.core.utils.Result;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;


/**
 * ClassName: SaTokenExceptionHandler
 * Package: cn.mju.wjh.security.exception.handler
 * Description: SaToken全局异常处理
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/9--14:36
 */
@RestControllerAdvice
public class SaTokenExceptionHandler {

    /**
     * 未登录异常处理
     * @param notLoginException 未登录异常
     * @return 统一异常结果集
     */
    @ExceptionHandler(NotLoginException.class)
    public Result notLoginExceptionHandler(NotLoginException notLoginException) {
        // 根据不同异常返回不同的信息
        String message;

        if (notLoginException.getType().equals(NotLoginException.NOT_TOKEN)) {
            message = "未提供Token";
        } else if (notLoginException.getType().equals(NotLoginException.INVALID_TOKEN)) {
            message = "未提供有效的Token";
        } else if (notLoginException.getType().equals(NotLoginException.TOKEN_TIMEOUT)) {
            message = "登录信息已过期，请重新登录";
        } else if (notLoginException.getType().equals(NotLoginException.BE_REPLACED)) {
            message = "您的账户已在另一台设备上登录，如非本人操作，请立即修改密码";
        } else if (notLoginException.getType().equals(NotLoginException.KICK_OUT)) {
            message = "已被系统强制下线";
        } else {
            message = "当前会话未登录";
        }

        // 返回给前端
        return Result.build(null, HttpStatus.UNAUTHORIZED.getCode(), message);
    }

    /**
     * 无此角色异常处理
     * @param notRoleException 无此角色异常
     * @return 统一异常结果集
     */
    @ExceptionHandler(NotRoleException.class)
    public Result notRoleExceptionHandler(NotRoleException notRoleException) {
        return Result.build(null, HttpStatus.FORBIDDEN.getCode(), "无此角色:" + notRoleException.getRole());
    }

    /**
     * 无此权限异常处理
     * @param notPermissionException 无此权限异常
     * @return 统一异常结果集
     */
    @ExceptionHandler(NotPermissionException.class)
    public Result notPermissionExceptionHandler(NotPermissionException notPermissionException) {
        return Result.build(null, HttpStatus.FORBIDDEN.getCode(), "无此权限:" + notPermissionException.getPermission());
    }

    /**
     * 账号封禁异常处理
     * @param disableServiceException 账号封禁异常
     * @return 统一异常结果集
     */
    @ExceptionHandler(DisableServiceException.class)
    public Result disableServiceExceptionHandler(DisableServiceException disableServiceException) {
        return Result.build(null, HttpStatus.UNAUTHORIZED.getCode(), "账号封禁时长(秒):" + disableServiceException.getDisableTime());
    }

    /**
     * 二级认证异常处理
     * @param notSafeException 二级认证异常
     * @return 统一异常结果集
     */
    @ExceptionHandler(NotSafeException.class)
    public Result notPermissionExceptionHandler(NotSafeException notSafeException) {
        return Result.build(null, HttpStatus.UNAUTHORIZED.getCode(), "二级认证异常:" + notSafeException.getMessage());
    }
}
