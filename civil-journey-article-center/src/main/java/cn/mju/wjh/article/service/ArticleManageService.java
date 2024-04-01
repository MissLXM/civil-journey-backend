package cn.mju.wjh.article.service;

import cn.mju.wjh.common.core.entity.param.article.ArticleAuditParams;
import cn.mju.wjh.common.core.entity.param.article.ArticleQueryParams;
import cn.mju.wjh.common.core.utils.Result;

import java.util.List;

/**
 * ClassName: ArticleManageService
 * Package: cn.mju.wjh.article.service
 * Description: 文章管理接口
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/25--14:06
 */
public interface ArticleManageService {

    /**
     * 设置或取消精选文章
     * @param articleId 文章ID
     * @return 是否操作成功
     */
    Result setOrCancelCurationArticle(Long articleId);

    /**
     * 文章审核通过
     * @param articleId 文章ID
     * @return 操作是否成功
     */
    Result articleAuditSuccess(Long articleId);

    /**
     * 文章审核不通过
     * @return 操作是否成功
     */
    Result articleAuditFail(ArticleAuditParams articleAuditParams);

    /**
     * 文章审核展示
     * @param articleQueryParams 文章查询参数
     * @return 文章审核信息
     */
    Result articleAuditShow(ArticleQueryParams articleQueryParams);

    /**
     * 查询所有文章
     * @param articleQueryParams 文章查询参数
     * @return 所有文章信息
     */
    Result queryAllArticle(ArticleQueryParams articleQueryParams);

    /**
     * 统计所有文章数量
     * @return 所有文章数量
     */
    Result articleAllNumber();

    /**
     * 每个分类的文章总数量
     * @param categoryIdList 分类ID
     * @return 每个分类的文章总数量
     */
    Result articleCategoryNumber(List<Long> categoryIdList);

    /**
     * 文章评论数量
     * @return 文章评论数量
     */
    Result articleCommentsNumber();

    /**
     * 每个分类的文章点赞数量
     * @param categoryIdList 分类ID
     * @return 每个分类的文章点赞数量
     */
    Result articleCategoryLikeNumber(List<Long> categoryIdList);

    /**
     * 每个分类的文章收藏数量
     * @param categoryIdList 分类ID
     * @return 每个分类的文章收藏数量
     */
    Result articleCategoryCollectionNumber(List<Long> categoryIdList);
}
