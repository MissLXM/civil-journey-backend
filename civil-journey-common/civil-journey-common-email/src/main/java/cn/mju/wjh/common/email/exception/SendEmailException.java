package cn.mju.wjh.common.email.exception;

/**
 * ClassName: SendEmailException
 * Package: cn.mju.wjh.email.exception
 * Description: 发送邮箱异常
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/11--13:08
 */
public class SendEmailException extends RuntimeException {

    public SendEmailException(String message) {
        super(message);
    }

}
