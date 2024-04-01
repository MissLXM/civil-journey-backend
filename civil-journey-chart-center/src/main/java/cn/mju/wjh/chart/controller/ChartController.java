package cn.mju.wjh.chart.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaIgnore;
import cn.mju.wjh.chart.mapper.CivilCategoryMapper;
import cn.mju.wjh.chart.service.ChartService;
import cn.mju.wjh.common.api.client.ArticleClient;
import cn.mju.wjh.common.api.client.CourseClient;
import cn.mju.wjh.common.api.client.UserClient;
import cn.mju.wjh.common.core.entity.pojo.category.CivilCategory;
import cn.mju.wjh.common.core.utils.Result;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.constraints.NotNull;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ClassName: ChartController
 * Package: cn.mju.wjh.chart.controller
 * Description: 图表控制类
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/9--22:56
 */
@SaCheckLogin
@RestController
@Tag(name = "图表服务")
@RequestMapping(value = "/admin/chart")
public class ChartController {

    @Setter(onMethod_ = @Autowired)
    private UserClient userClient;

    @Setter(onMethod_ = @Autowired)
    private ChartService chartService;

    @Setter(onMethod_ = @Autowired)
    private CourseClient courseClient;

    @Setter(onMethod_ = @Autowired)
    private ArticleClient articleClient;

    @Setter(onMethod_ = @Autowired)
    private CivilCategoryMapper categoryMapper;

    /**
     * 封装数据
     * @return 封装数据
     */
    @NotNull
    private List<Long> getCategortIdList() {
        // 获取所有分类ID
        List<CivilCategory> categoryList = categoryMapper.selectList(null);
        return categoryList.stream().map(CivilCategory::getCategoryId).toList();
    }

    /**
     * 封装数据
     * @param categoryIdList 分类ID
     * @param categoryNumber 课程/文章分类数量
     * @return 封装数据
     */
    @NotNull
    private List<Map<String, Object>> getObjectMap(List<Long> categoryIdList, List<Long> categoryNumber) {
        int i = 0;
        List<Map<String, Object>> resultList = new ArrayList<>();

        for (Long categoryId : categoryIdList) {
            Map<String, Object> resultMap = new HashMap<>();
            String categoryName = categoryMapper.selectById(categoryId).getCategoryName();
            resultMap.put("name", categoryName);
            resultMap.put("value", categoryNumber.get(i));
            resultList.add(resultMap);
            i++;
        }
        return resultList;
    }

    @SaIgnore
    @GetMapping("getVerCode")
    @Operation(summary = "获取验证码")
    public Result getVerCode() {
        return chartService.getVerCode();
    }

    @GetMapping("statisticsArticleAllNumber")
    @Operation(summary = "统计所有文章的数量")
    public Result statisticsArticleAllNumber() {
        Long articleNumber;
        String jsonString = JSON.toJSONString(articleClient.articleAllNumber().getData());
        articleNumber = JSONObject.parseObject(jsonString, Long.class);

        if (articleNumber == 0) {
            return Result.fail().message("操作失败");
        }
        return Result.ok(articleNumber).message("操作成功");
    }

    @GetMapping("statisticsCourseAllNumber")
    @Operation(summary = "统计所有课程的数量")
    public Result statisticsCourseAllNumber() {
        Long courseNumber;
        String jsonString = JSON.toJSONString(courseClient.courseNumber().getData());
        courseNumber = JSONObject.parseObject(jsonString, Long.class);

        if (courseNumber == 0) {
            return Result.fail().message("操作失败");
        }
        return Result.ok(courseNumber).message("操作成功");
    }


    @GetMapping("statisticsUserTeacherNumber")
    @Operation(summary = "统计用户和讲师的数量")
    public Result statisticsUserTeacherNumber() {

        // 获取用户数量
        String jsonString = JSON.toJSONString(userClient.getUserNumber().getData());
        Long userNumber =  JSONObject.parseObject(jsonString, Long.class);

        // 获取讲师数量
        jsonString = JSON.toJSONString(userClient.getTeacherNumber().getData());
        Long teacherNumber =  JSONObject.parseObject(jsonString, Long.class);

        // 封装
        Map<String, Long> numberMap = new HashMap<>();
        numberMap.put("userNumber", userNumber);
        numberMap.put("teacherNumber", teacherNumber);

        return Result.ok(numberMap).message("操作成功");
    }

    @GetMapping("statisticsUserLoginNumber")
    @Operation(summary = "统计用户的所有登录次数")
    public Result statisticsUserLoginNumber() {
        String jsonString = JSON.toJSONString(userClient.getLoginLogNumber().getData());
        Long loginNumber =  JSONObject.parseObject(jsonString, Long.class);

        return Result.ok(loginNumber).message("操作成功");
    }

    @GetMapping("statisticsArticleCategoryNumber")
    @Operation(summary = "统计每个分类的文章总数量")
    public Result statisticsArticleCategoryNumber() {
        List<Long> categoryIdList = getCategortIdList();

        // 获取数据
        String jsonString = JSON.toJSONString(articleClient.articleCategoryNumber(categoryIdList).getData());
        List<Long> articleCategoryNumber = JSONObject.parseObject(jsonString, List.class);

        if (articleCategoryNumber.size() == 0) {
            return Result.fail().message("操作失败");
        }

        List<Map<String, Object>> resultList = getObjectMap(categoryIdList, articleCategoryNumber);

        return Result.ok(resultList).message("操作成功");
    }

    @GetMapping("statisticsCourseCategoryNumber")
    @Operation(summary = "统计每个分类的课程总数量")
    public Result statisticsCourseCategoryNumber() {
        List<Long> categoryIdList = getCategortIdList();

        // 获取数据
        String jsonString = JSON.toJSONString(courseClient.courseCategoryNumber(categoryIdList).getData());
        List<Long> courseCategoryNumber = JSONObject.parseObject(jsonString, List.class);

        if (courseCategoryNumber.size() == 0) {
            return Result.fail().message("操作失败");
        }

        List<Map<String, Object>> resultList = getObjectMap(categoryIdList, courseCategoryNumber);
        return Result.ok(resultList).message("操作成功");
    }

    @GetMapping("statisticsArticleCommentsNumber")
    @Operation(summary = "统计文章评论数量")
    public Result statisticsArticleCommentsNumber() {
        Long articleCommentsNumber;
        String jsonString = JSON.toJSONString(articleClient.articleCommentsNumber().getData());
        articleCommentsNumber = JSONObject.parseObject(jsonString, Long.class);

        if (articleCommentsNumber == 0) {
            return Result.fail().message("操作失败");
        }
        return Result.ok(articleCommentsNumber).message("操作成功");
    }
    
    @GetMapping("statisticsCourseCommentsNumber")
    @Operation(summary = "统计课程评论数量")
    public Result statisticsCourseCommentsNumber() {
        Long courseCommentsNumber;
        String jsonString = JSON.toJSONString(courseClient.courseCommentsNumber().getData());
        courseCommentsNumber = JSONObject.parseObject(jsonString, Long.class);

        if (courseCommentsNumber == 0) {
            return Result.fail().message("操作失败");
        }
        return Result.ok(courseCommentsNumber).message("操作成功");
    }

    @GetMapping("statisticsArticleCategoryLikeAndCollectionNumber")
    @Operation(summary = "统计每个分类的文章点赞和收藏数量")
    public Result statisticsArticleCategoryLikeAndCollectionNumber() {
        List<Long> categoryIdList = getCategortIdList();

        // 获取课程分类点赞数据
        String jsonString = JSON.toJSONString(articleClient.articleCategoryLikeNumber(categoryIdList).getData());
        List<Long> articleCategoryLikeNumberList = JSONObject.parseObject(jsonString, List.class);
        System.out.println("分类课程点赞数: " + articleCategoryLikeNumberList);

        // 获取课程分类收藏数据
        jsonString = JSON.toJSONString(articleClient.articleCategoryCollectionNumber(categoryIdList).getData());
        List<Long> articleCategoryCollectionNumberList = JSONObject.parseObject(jsonString, List.class);
        System.out.println("分类课程收藏数: " + articleCategoryCollectionNumberList);

        // 封装结果
        Map<String, List<Long>> resultMap = new HashMap<>();
        resultMap.put("likeNumber", articleCategoryLikeNumberList);
        resultMap.put("collectionNumber", articleCategoryCollectionNumberList);

        return Result.ok(resultMap).message("操作成功");
    }

    @GetMapping("statisticsCourseCategoryLikeAndCollectionNumber")
    @Operation(summary = "统计每个分类的课程点赞和收藏数量")
    public Result statisticsCourseCategoryLikeAndCollectionNumber() {
        List<Long> categoryIdList = getCategortIdList();

        // 获取课程分类点赞数据
        String jsonString = JSON.toJSONString(courseClient.courseCategoryLikeNumber(categoryIdList).getData());
        List<Long> courseCategoryLikeNumberList = JSONObject.parseObject(jsonString, List.class);
        System.out.println("分类课程点赞数: " + courseCategoryLikeNumberList);

        // 获取课程分类收藏数据
        jsonString = JSON.toJSONString(courseClient.courseCategoryCollectionNumber(categoryIdList).getData());
        List<Long> courseCategoryCollectionNumberList = JSONObject.parseObject(jsonString, List.class);
        System.out.println("分类课程收藏数: " + courseCategoryCollectionNumberList);

        // 封装结果
        Map<String, List<Long>> resultMap = new HashMap<>();
        resultMap.put("likeNumber", courseCategoryLikeNumberList);
        resultMap.put("collectionNumber", courseCategoryCollectionNumberList);

        return Result.ok(resultMap).message("操作成功");
    }
}
