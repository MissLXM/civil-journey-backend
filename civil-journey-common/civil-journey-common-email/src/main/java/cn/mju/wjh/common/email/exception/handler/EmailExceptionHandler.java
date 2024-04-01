package cn.mju.wjh.common.email.exception.handler;

import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.email.exception.SendEmailException;
import cn.mju.wjh.common.email.exception.SenderNicknameException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * ClassName: EmailExceptionHandler
 * Package: cn.mju.wjh.email.handler
 * Description: 邮件自定义异常处理类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/11--12:49
 */
@RestControllerAdvice
public class EmailExceptionHandler {

    @ExceptionHandler(value = SendEmailException.class)
    public Result messagingExceptionHandler(SendEmailException exception) {
        return Result.fail().message(exception.getMessage());
    }

    @ExceptionHandler(value = SenderNicknameException.class)
    public Result mailExceptionHandler(SenderNicknameException exception) {
        return Result.fail().message(exception.getMessage());
    }
}
