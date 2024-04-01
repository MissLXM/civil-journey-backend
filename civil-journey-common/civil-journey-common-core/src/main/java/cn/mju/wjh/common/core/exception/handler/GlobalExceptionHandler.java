package cn.mju.wjh.common.core.exception.handler;

import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.core.exception.AddressException;
import cn.mju.wjh.common.core.exception.GlobalException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * ClassName: GlobalExceptionHandler
 * Package: cn.mju.wjh.common.core.exception.handler
 * Description: 全局异常处理
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/24--18:20
 */
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(GlobalException.class)
    public Result globalExceptionHandler() {
        return Result.fail().message("服务器异常");
    }

    @ExceptionHandler(AddressException.class)
    public Result addressExceptionHandler() {
        return Result.fail().message("获取地址异常");
    }
}
