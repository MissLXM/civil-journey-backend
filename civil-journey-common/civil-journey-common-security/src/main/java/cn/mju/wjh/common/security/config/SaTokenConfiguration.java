package cn.mju.wjh.common.security.config;

import cn.dev33.satoken.filter.SaServletFilter;
import cn.dev33.satoken.interceptor.SaInterceptor;
import cn.dev33.satoken.same.SaSameUtil;
import cn.dev33.satoken.strategy.SaStrategy;
import cn.dev33.satoken.util.SaResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.AnnotatedElementUtils;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * ClassName: SaTokenConfiguration
 * Package: cn.mju.wjh.security.config
 * Description: SaToken配置类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/9--10:50
 */
@Configuration
public class SaTokenConfiguration implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 注册 Sa-Token拦截器, 打开注解式鉴权功能
        registry.addInterceptor(new SaInterceptor()).addPathPatterns("/**");
    }

    @Bean
    public SaServletFilter getSaServletFilter() {
        return new SaServletFilter()
                .addInclude("/**")
                // websocket需要开发接口(需要跟@ServerEndpoint注解的Value值相同)
                .addExclude("/websocket/**")
                .setAuth(auth -> {
                    // 认证
                    SaSameUtil.checkCurrentRequestToken();
                })
                .setError(error -> SaResult.error(error.getMessage()));
    }

    @Autowired
    public void rewriteSaStrategy() {
        // 重写Sa-Token的注解处理器,增加注解合并功能
        SaStrategy.instance.getAnnotation = AnnotatedElementUtils::getMergedAnnotation;
    }

}
