package cn.mju.wjh.common.api.interceptor;

import cn.dev33.satoken.same.SaSameUtil;
import cn.mju.wjh.common.api.decoder.FeignResultDecoder;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

/**
 * ClassName: FeignInterceptor
 * Package: cn.mju.wjh.common.api.interceptor
 * Description: Feign拦截器
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/24--18:58
 */
@Component
public class FeignInterceptor implements RequestInterceptor {

    @Override
    public void apply(RequestTemplate requestTemplate) {
        requestTemplate.header(SaSameUtil.SAME_TOKEN, SaSameUtil.getToken());
    }

    @Bean
    public FeignResultDecoder resultDecoder() {
        return new FeignResultDecoder();
    }
}
