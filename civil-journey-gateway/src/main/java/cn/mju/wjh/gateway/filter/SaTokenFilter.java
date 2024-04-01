package cn.mju.wjh.gateway.filter;

import cn.dev33.satoken.context.SaHolder;
import cn.dev33.satoken.reactor.filter.SaReactorFilter;
import cn.dev33.satoken.same.SaSameUtil;
import cn.dev33.satoken.util.SaResult;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

/**
 * ClassName: SaTokenFilter
 * Package: cn.mju.wjh.gateway.config
 * Description: Sa-Token全局过滤器
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/8--15:19
 */
@Component
public class SaTokenFilter implements GlobalFilter {

    // 注册全局过滤器
    @Bean
    public SaReactorFilter getSaReactorFilter() {
        return new SaReactorFilter()
                // 指定拦截路由
                .addInclude("/**")
                .setError(error -> {
                    // 异常返回信息
                    return SaResult.error(error.getMessage());
                })
                .setBeforeAuth(beforeAuth -> {
                    // 设置跨域响应头
                    SaHolder
                            .getResponse()
                            // 允许指定域访问跨域资源
                            .setHeader("Access-Control-Allow-Origin", "*")
                            // 允许的请求方式
                            .setHeader("Access-Control-Allow-Methods", "POST, GET, PUT, DELETE")
                            // 有效时间
                            .setHeader("Access-Control-Max-Age", "3600")
                            // 允许 Header 携带的参数
                            .setHeader("Access-Control-Allow-Headers", "*");
                });
    }

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        ServerHttpRequest newRequest = exchange
                .getRequest()
                .mutate()
                // 为请求追加 Same-Token 参数
                .header(SaSameUtil.SAME_TOKEN, SaSameUtil.getToken())
                .build();
        ServerWebExchange newExchange = exchange.mutate().request(newRequest).build();
        return chain.filter(newExchange);
    }
}
