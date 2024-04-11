package cn.mju.wjh.article.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import cn.mju.wjh.article.service.ArticleService;
import cn.mju.wjh.common.api.client.UserClient;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.UploadParams;
import cn.mju.wjh.common.core.entity.param.article.ArticleCommentsParams;
import cn.mju.wjh.common.core.entity.param.article.ArticleInsertParams;
import cn.mju.wjh.common.core.entity.param.article.ArticleQueryParams;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.security.annotation.SaUserCheckLogin;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * ClassName: ArticleController
 * Package: cn.mju.wjh.article.controller
 * Description: 文章控制层
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/19--15:29
 */
@RestController
@SaUserCheckLogin
@Tag(name = "文章服务(前台)")
@RequestMapping("/front/article/")
public class ArticleController {

    @Setter(onMethod_ = @Autowired)
    private UserClient userClient;

    @Setter(onMethod_ = @Autowired)
    private ArticleService articleService;

    @GetMapping("queryUserMedal/{userId}")
    @Operation(summary = "用户--拥有勋章展示")
    public Result queryUserMedal(@PathVariable("userId") Long userId) {
        return userClient.userMedalInfo(userId);
    }

    @PostMapping("articleRelease")
    @Operation(summary = "用户--发布文章")
    public Result articleRelease(@RequestBody @Validated ArticleInsertParams articleParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return articleService.articleRelease(articleParams);
    }

    @SaIgnore
    @PostMapping("uploadArticleImage")
    @Operation(summary = "用户--上传文章封面")
    public Result uploadArticleImage(@RequestParam("file") MultipartFile file, UploadParams params) {
        return articleService.uploadArticleImage(file, params);
    }

    @GetMapping("articleLike/{articleId}")
    @Operation(summary = "用户--文章点赞/取消点赞")
    public Result articleLike(
            @PathVariable("articleId") @Schema(name = "articleId", description = "文章ID") Long articleId
    ) {
        return articleService.articleLike(articleId);
    }

    @GetMapping("articleCollection/{articleId}")
    @Operation(summary = "用户--文章收藏/取消收藏")
    public Result articleCollection(
            @PathVariable("articleId") @Schema(name = "articleId", description = "文章ID") Long articleId
    ) {
        return articleService.articleCollection(articleId);
    }


    @PostMapping("queryCollectionArticle")
    @Operation(summary = "用户--收藏的文章展示")
    public Result queryCollectionArticle(@RequestBody @Validated PageParams pageParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return articleService.queryCollectionArticle(pageParams);
    }

    @PostMapping("queryArticleRelease")
    @Operation(summary = "用户--所有已发布文章(自身)")
    public Result queryArticleRelease(@RequestBody @Validated PageParams pageParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return articleService.queryArticleRelease(pageParams);
    }

    @PostMapping("articleComments")
    @Operation(summary = "用户--文章评论")
    public Result articleComments(@RequestBody @Validated ArticleCommentsParams commentsParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return articleService.articleComments(commentsParams);
    }

    @GetMapping("queryArticleAllComments/{articleId}")
    @Operation(summary = "用户--查看某文章的所有评论")
    public Result queryArticleAllComments(
            @PathVariable("articleId") @Schema(name = "articleId", description = "文章ID") Long articleId
    ) {
        return articleService.queryArticleAllComments(articleId);
    }

    @DeleteMapping("deleteComment/{commentId}")
    @Operation(summary = "用户--删除评论")
    public Result deleteComment(@PathVariable("commentId") Long commentId) {
        return articleService.deleteComment(commentId);
    }

    @GetMapping("queryArticleDetail/{articleId}")
    @Operation(summary = "用户--文章详情展示")
    public Result queryArticleDetail(
            @PathVariable("articleId") @Schema(name = "articleId", description = "文章ID") Long articleId
    ) {
        return articleService.queryArticleDetail(articleId);
    }

    @PostMapping("queryArticleHistory")
    @Operation(summary = "用户--文章浏览记录")
    public Result queryArticleHistory(@RequestBody @Validated PageParams pageParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return articleService.queryArticleHistory(pageParams);
    }

    @PostMapping("queryCurationArticle")
    @Operation(summary = "文章--精选文章展示")
    public Result queryCurationArticle(@RequestBody @Validated PageParams pageParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return articleService.queryCurationArticle(pageParams);
    }

    @GetMapping("queryHotSkillArticle")
    @Operation(summary = "文章--热门解题技巧展示(默认10条)")
    public Result queryHotSkillArticle() {
        return articleService.queryHotSkillArticle();
    }

    @GetMapping("queryHotNoteArticle")
    @Operation(summary = "文章--热门学习笔记展示(默认10条)")
    public Result queryHotNoteArticle() {
        return articleService.queryHotNoteArticle();
    }

    @PostMapping("queryAllArticle")
    @Operation(summary = "文章--所有文章展示")
    public Result queryAllArticle(
            @RequestBody @Validated ArticleQueryParams articleQueryParams,
            BindingResult result
    ) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return articleService.queryAllArticle(articleQueryParams);
    }

    @DeleteMapping("deleteArticle/{articleId}")
    @Operation(summary = "文章--删除文章")
    public Result deleteArticle(@PathVariable("articleId") Long articleId) {
        return articleService.deleteArticle(articleId);
    }
}
