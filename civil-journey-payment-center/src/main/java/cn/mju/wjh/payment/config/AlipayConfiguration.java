package cn.mju.wjh.payment.config;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * ClassName: AlipayConfiguration
 * Package: cn.mju.wjh.payment.config
 * Description: 支付宝配置类
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/19--10:23
 */
@Data
@Configuration
public class AlipayConfiguration {

    @Value("${alipay.appId}")
    @Schema(name = "appId", description = "应用唯一ID")
    private String appId;

    @Value("${alipay.appPrivateKey}")
    @Schema(name = "appPrivateKey", description = "应用私钥")
    private String appPrivateKey;

    @Value("${alipay.alipayPublicKey}")
    @Schema(name = "alipayPublicKey", description = "支付宝公钥")
    private String alipayPublicKey;

    @Value("${alipay.protocol}")
    @Schema(name = "protocol", description = "协议")
    private String protocol;

    @Value("${alipay.signType}")
    @Schema(name = "signType", description = "标记类型")
    private String signType;

    @Value("${alipay.forMat}")
    @Schema(name = "forMat", description = "数据类型")
    private String forMat;

    @Value("${alipay.charSet}")
    @Schema(name = "charSet", description = "编码")
    private String charSet;

    @Value("${alipay.gatewayUrl}")
    @Schema(name = "gatewayUrl", description = "支付宝网关")
    private String gatewayUrl;

    @Value("${alipay.notifyUrl}")
    @Schema(name = "notifyUrl", description = "支付宝异步通知路径(支付完处理)")
    private String notifyUrl;

    @Value("${alipay.returnUrl}")
    @Schema(name = "returnUrl", description = "支付宝同步通知路径(支付完跳转)")
    private String returnUrl;

}
