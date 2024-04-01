package cn.mju.wjh.common.api.client;

import cn.mju.wjh.common.api.interceptor.FeignInterceptor;
import cn.mju.wjh.common.core.utils.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * ClassName: CategoryClient
 * Package: cn.mju.wjh.common.api.client
 * Description: 类别服务调用
 *
 * @Author:wjh
 * @Create:2024-01-2024/1/27--14:19
 */
@FeignClient(
        name = "chart-center-service",
        configuration = FeignInterceptor.class
)
public interface CategoryClient {

    @RequestMapping(method = RequestMethod.GET, value = "/front/category/getCategoryById/{categoryId}")
    Result getCategoryById(@PathVariable("categoryId") Long categoryId);
}
