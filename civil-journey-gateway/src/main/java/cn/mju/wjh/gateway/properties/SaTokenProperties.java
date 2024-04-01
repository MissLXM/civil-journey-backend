package cn.mju.wjh.gateway.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.util.List;

/**
 * ClassName: SaTokenProperties
 * Package: cn.mju.wjh.gateway.properties
 * Description: SoToken配置信息类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/7--19:34
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "sa-token")
public class SaTokenProperties {

    /**
     * 路径白名单
     */
    private List<String> ignoreWhite;

}
