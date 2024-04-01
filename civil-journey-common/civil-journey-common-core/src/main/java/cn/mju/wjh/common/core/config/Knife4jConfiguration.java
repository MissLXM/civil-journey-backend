package cn.mju.wjh.common.core.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * ClassName: Knife4jConfiguration
 * Package: cn.mju.wjh.common.core.config
 * Description: Knife4j配置类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/9--11:03
 */
@Configuration
public class Knife4jConfiguration {

    @Bean
    public OpenAPI customOpenApi() {
        return new OpenAPI()
                .info(new Info()
                        .title("公途平台接口文档")
                        .contact(new Contact()
                                .name("lenzy-wjh")
                                .email("2026661261@qq.com")
                                .url("http://localhost:8000/doc.html")
                        )
                        .description("公途平台--提供一个面向考公人士学习和交流互动的平台")
                        .termsOfService("http://localhost:8000/doc.html")
                        .license(new License()
                                .name("lenzy-wjh")
                                .url("http://localhost:8000/doc.html")
                        )
                        .version("1.0.0")
                );
    }

}
