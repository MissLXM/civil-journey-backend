package cn.mju.wjh.article.controller;

import cn.dev33.satoken.annotation.SaCheckRole;
import cn.dev33.satoken.annotation.SaIgnore;
import cn.mju.wjh.article.service.ArticleManageService;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.param.article.ArticleAuditParams;
import cn.mju.wjh.common.core.entity.param.article.ArticleQueryParams;
import cn.mju.wjh.common.core.utils.Result;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * ClassName: ArticleManageController
 * Package: cn.mju.wjh.article.controller
 * Description: 文章管理控制层
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/19--15:28
 */
@RestController
@Tag(name = "文章服务(后台)")
@RequestMapping("/backend/article")
@SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
public class ArticleManageController {

    @Setter(onMethod_ = @Autowired)
    private ArticleManageService articleManageService;

    @GetMapping("setOrCancelCurationArticle/{articleId}")
    @Operation(summary = "设置/取消精选文章")
    public Result setOrCancelCurationArticle(@PathVariable("articleId") Long articleId) {
        return articleManageService.setOrCancelCurationArticle(articleId);
    }

    @GetMapping("articleAuditSuccess/{articleId}")
    @Operation(summary = "文章审核通过")
    public Result articleAuditSuccess(@PathVariable("articleId") Long articleId) {
        return articleManageService.articleAuditSuccess(articleId);
    }

    @PostMapping("articleAuditFail")
    @Operation(summary = "文章审核不通过")
    public Result articleAuditFail(@RequestBody @Validated ArticleAuditParams articleAuditParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return articleManageService.articleAuditFail(articleAuditParams);
    }

    @PostMapping("articleAuditShow")
    @Operation(summary = "文章审核展示")
    public Result articleAuditShow(@RequestBody ArticleQueryParams articleQueryParams) {
        return articleManageService.articleAuditShow(articleQueryParams);
    }

    @PostMapping("queryAllArticle")
    @Operation(summary = "所有文章展示")
    public Result queryAllArticle(@RequestBody ArticleQueryParams articleQueryParams) {
        return articleManageService.queryAllArticle(articleQueryParams);
    }

    @SaIgnore
    @GetMapping("articleAllNumber")
    @Operation(summary = "所有文章数量(API调用)")
    public Result articleAllNumber() {
        return articleManageService.articleAllNumber();
    }

    @SaIgnore
    @PostMapping("articleCategoryNumber")
    @Operation(summary = "每个分类的文章总数量(API调用)")
    public Result articleCategoryNumber(@RequestBody List<Long> categoryIdList) {
        return articleManageService.articleCategoryNumber(categoryIdList);
    }

    @SaIgnore
    @GetMapping("articleCommentsNumber")
    @Operation(summary = "文章评论数量(API调用)")
    public Result articleCommentsNumber() {
        return articleManageService.articleCommentsNumber();
    }

    @SaIgnore
    @PostMapping("articleCategoryLikeNumber")
    @Operation(summary = "每个分类的文章点赞数量(API调用)")
    public Result articleCategoryLikeNumber(@RequestBody List<Long> categoryIdList) {
        return articleManageService.articleCategoryLikeNumber(categoryIdList);
    }

    @SaIgnore
    @PostMapping("articleCategoryCollectionNumber")
    @Operation(summary = "每个分类的文章收藏数量(API调用)")
    public Result articleCategoryCollectionNumber(@RequestBody List<Long> categoryIdList) {
        return articleManageService.articleCategoryCollectionNumber(categoryIdList);
    }

}
