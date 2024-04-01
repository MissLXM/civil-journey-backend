package cn.mju.wjh.common.core.exception;

/**
 * ClassName: GlobalException
 * Package: cn.mju.wjh.common.core.exception
 * Description: 全局异常
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/24--18:21
 */
public class GlobalException extends RuntimeException{

    public GlobalException(String message) {
        super(message);
    }
}
