package cn.mju.wjh.common.api.client;

import cn.mju.wjh.common.api.interceptor.FeignInterceptor;
import cn.mju.wjh.common.core.utils.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * ClassName: UserClient
 * Package: cn.mju.wjh.common.api.client
 * Description: 用户服务调用
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/24--13:14
 */
@FeignClient(
        name = "user-center-service",
        configuration = FeignInterceptor.class
)
public interface UserClient {

    @RequestMapping(method = RequestMethod.GET, value = "backend/admin/userMedalInfo/{userId}")
    Result userMedalInfo(@PathVariable("userId") Long userId);

    @RequestMapping(method = RequestMethod.GET, value = "backend/admin/getUserNumber")
    Result getUserNumber();

    @RequestMapping(method = RequestMethod.GET, value = "backend/admin/getTeacherNumber")
    Result getTeacherNumber();

    @RequestMapping(method = RequestMethod.GET, value = "backend/admin/getLoginLogNumber")
    Result getLoginLogNumber();

    @RequestMapping(method = RequestMethod.GET, value = "backend/admin/setUserMedal/{userId}/{medalId}")
    Result setUserMedal(@PathVariable("userId") Long userId, @PathVariable("medalId") Long medalId);

    @RequestMapping(method = RequestMethod.DELETE, value = "backend/admin/deleteUserMedal/{userId}/{medalId}")
    Result deleteUserMedal(@PathVariable("userId") Long userId, @PathVariable("medalId") Long medalId);
}
