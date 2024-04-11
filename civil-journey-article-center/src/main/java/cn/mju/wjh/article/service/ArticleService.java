package cn.mju.wjh.article.service;

import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.UploadParams;
import cn.mju.wjh.common.core.entity.param.article.ArticleCommentsParams;
import cn.mju.wjh.common.core.entity.param.article.ArticleInsertParams;
import cn.mju.wjh.common.core.entity.param.article.ArticleQueryParams;
import cn.mju.wjh.common.core.utils.Result;
import org.springframework.web.multipart.MultipartFile;

/**
 * ClassName: ArticleService
 * Package: cn.mju.wjh.article.service
 * Description: 文章服务接口(前台)
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/19--18:42
 */
public interface ArticleService {

    /**
     * 用户--发布文章
     * @param articleParams 文章参数
     * @return 是否发布成功
     */
    Result articleRelease(ArticleInsertParams articleParams);

    /**
     * 用户--上传文章封面
     * @param file 文件
     * @param params 上传参数
     * @return 文章封面地址
     */
    Result uploadArticleImage(MultipartFile file, UploadParams params);

    /**
     * 用户--文章点赞/取消点赞
     * @param articleId 文章ID
     * @return 是否操作成功
     */
    Result articleLike(Long articleId);

    /**
     * 用户--文章收藏/取消收藏
     * @param articleId 文章ID
     * @return 是否操作成功
     */
    Result articleCollection(Long articleId);

    /**
     * 用户--收藏的文章展示
     * @param pageParams 分页参数
     * @return 展示收藏的文章信息
     */
    Result queryCollectionArticle(PageParams pageParams);

    /**
     * 用户--所有已发布文章(自身)
     * @param pageParams 分页参数
     * @return 所有已发布文章(自身)
     */
    Result queryArticleRelease(PageParams pageParams);

    /**
     * 用户--文章评论
     * @param commentsParams 文章评论参数
     * @return 是否操作成功
     */
    Result articleComments(ArticleCommentsParams commentsParams);

    /**
     * 用户--查看某文章的所有评论
     * @param articleId 文章ID
     * @return 文章所有评论
     */
    Result queryArticleAllComments(Long articleId);

    /**
     * 删除评论
     * @param commentId 评论ID
     * @return 是否操作成功
     */
    Result deleteComment(Long commentId);

    /**
     * 用户--文章详情展示
     * @param articleId 文章ID
     * @return 文章信息
     */
    Result queryArticleDetail(Long articleId);

    /**
     * 用户--文章浏览记录
     * @param pageParams 分页参数
     * @return 展示浏览记录(某用户)
     */
    Result queryArticleHistory(PageParams pageParams);

    /**
     * 文章--精选文章展示
     * @param pageParams 分页参数
     * @return 精选文章信息
     */
    Result queryCurationArticle(PageParams pageParams);

    /**
     * 文章--热门解题技巧展示(默认10条)
     * @return 热门解题技巧展示
     */
    Result queryHotSkillArticle();

    /**
     * 文章--热门学习笔记展示(默认10条)
     * @return 热门学习笔记展示
     */
    Result queryHotNoteArticle();

    /**
     * 文章--所有文章展示((综合、热门、最新)、分区、(解题技巧、笔记分享))
     * @param articleQueryParams 文章查询参数
     * @return 展示文章信息
     */
    Result queryAllArticle(ArticleQueryParams articleQueryParams);

    /**
     * 文章--删除文章
     * @param articleId 文章ID
     * @return 是否操作成功
     */
    Result deleteArticle(Long articleId);

}
