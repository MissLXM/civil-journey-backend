package cn.mju.wjh.common.api.client;

import cn.mju.wjh.common.api.interceptor.FeignInterceptor;
import cn.mju.wjh.common.core.utils.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * ClassName: ArticleClient
 * Package: cn.mju.wjh.common.api.client
 * Description: 文章服务调用
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/11--18:07
 */
@FeignClient(
        name = "article-center-service",
        configuration = FeignInterceptor.class
)
public interface ArticleClient {

    @RequestMapping(method = RequestMethod.GET, value = "/backend/article/articleAllNumber")
    Result articleAllNumber();

    @RequestMapping(method = RequestMethod.POST, value = "/backend/article/articleCategoryNumber")
    Result articleCategoryNumber(@RequestBody List<Long> categoryIdList);

    @RequestMapping(method = RequestMethod.GET, value = "/backend/article/articleCommentsNumber")
    Result articleCommentsNumber();

    @RequestMapping(method = RequestMethod.POST, value = "/backend/article/articleCategoryLikeNumber")
    Result articleCategoryLikeNumber(@RequestBody List<Long> categoryIdList);

    @RequestMapping(method = RequestMethod.POST, value = "/backend/article/articleCategoryCollectionNumber")
    Result articleCategoryCollectionNumber(@RequestBody List<Long> categoryIdList);
}
