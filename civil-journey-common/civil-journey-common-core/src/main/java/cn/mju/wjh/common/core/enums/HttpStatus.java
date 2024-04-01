package cn.mju.wjh.common.core.enums;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

/**
 * ClassName: HttpStatus
 * Package: cn.mju.wjh.common.core.enums
 * Description: HTTP状态码枚举类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/6--15:24
 */
@NoArgsConstructor
@AllArgsConstructor
public enum HttpStatus {
    CONTINUE(100, "继续"),

    PROCESSING(102,"处理中"),

    OK(200,"成功"),

    CREATED(201,"已创建"),

    ACCEPTED(202,"已接受"),

    NON_AUTHORITATIVE_INFORMATION(203,"非权威信息"),

    NO_CONTENT(204,"无内容"),

    RESET_CONTENT(205,"重置内容"),

    PARTIAL_CONTENT(206,"部分内容"),

    MOVED_PERMANENTLY(301,"永久移动"),

    FOUND(302,"已找到"),

    SEE_OTHER(303,"参见"),

    NOT_MODIFIED(304,"未修改"),

    USE_PROXY(305,"使用代理"),

    TEMPORARY(307,"临时重定向"),

    PERMANENT(308,"永久重定向"),

    BAD_REQUEST(400,"请求错误"),

    UNAUTHORIZED(401,"未授权"),

    PAYMENT_REQUIRED(402,"需支付"),

    FORBIDDEN(403,"被禁止"),

    NOT_FOUND(404,"未找到"),

    METHOD_NOT_ALLOWED(405,"方法不允许"),

    NOT_ACCEPTABLE(406,"不可接受"),

    REQUEST_TIME_OUT(408,"请求超时"),


    UNSUPPORTED_MEDIA_TYPE(415,"不支持的媒体类型"),

    REQUESTED_RANGE_NOT_SATISFIABLE(416,"请求范围不满足"),

    EXPECTATION_FAILED(417,"期望失败"),

    SERVER_ERROR(500,"服务器内部错误"),

    NOT_IMPLEMENTED(501,"未实施"),

    BAD_GATEWAY(502,"网关故障"),

    SERVICE_UNAVAILABLE(503,"服务不可用"),

    GATEWAY_TIME_out(504,"网关超时");

    private int code;
    private String message;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
