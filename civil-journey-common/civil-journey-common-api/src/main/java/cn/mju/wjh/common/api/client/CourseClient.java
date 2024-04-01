package cn.mju.wjh.common.api.client;

import cn.mju.wjh.common.api.interceptor.FeignInterceptor;
import cn.mju.wjh.common.core.utils.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * ClassName: CourseClient
 * Package: cn.mju.wjh.common.api.client
 * Description: 课程服务调用
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/6--19:58
 */
@FeignClient(
        name = "course-center-service",
        configuration = FeignInterceptor.class
)
public interface CourseClient {

    @RequestMapping(method = RequestMethod.GET, value = "/front/course/queryCourseInfoByClient/{courseId}")
    Result queryCourseInfoByClient(@PathVariable("courseId") Long courseId);

    @RequestMapping(method = RequestMethod.GET, value = "/backend/course/courseAllNumber")
    Result courseNumber();

    @RequestMapping(method = RequestMethod.POST, value = "/backend/course/courseCategoryNumber")
    Result courseCategoryNumber(@RequestBody List<Long> categoryIdList);

    @RequestMapping(method = RequestMethod.GET, value = "/backend/course/courseCommentsNumber")
    Result courseCommentsNumber();

    @RequestMapping(method = RequestMethod.POST, value = "/backend/course/courseCategoryLikeNumber")
    Result courseCategoryLikeNumber(@RequestBody List<Long> categoryIdList);

    @RequestMapping(method = RequestMethod.POST, value = "/backend/course/courseCategoryCollectionNumber")
    Result courseCategoryCollectionNumber(@RequestBody List<Long> categoryIdList);

    @RequestMapping(method = RequestMethod.GET, value = "/backend/course/queryCourseNumberByUserId/{userId}")
    Result queryCourseNumberByUserId(@PathVariable("userId") Long userId);

}
