package cn.mju.wjh.message.config;

import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * ClassName: AppConfiguration
 * Package: cn.mju.wjh.message.config
 * Description: 上下文配置
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/18--17:43
 */
@Configuration
@ConditionalOnWebApplication
public class AppConfiguration {

    @Bean
    public CustomSpringConfigurator customSpringConfigurator() {
        return new CustomSpringConfigurator();
    }

}
