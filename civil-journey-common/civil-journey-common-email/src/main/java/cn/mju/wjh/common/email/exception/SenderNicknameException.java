package cn.mju.wjh.common.email.exception;

/**
 * ClassName: SenderNicknameException
 * Package: cn.mju.wjh.email.exception
 * Description: 发送者名称异常
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/11--13:14
 */
public class SenderNicknameException extends RuntimeException {

    public SenderNicknameException(String message) {
        super(message);
    }
}
