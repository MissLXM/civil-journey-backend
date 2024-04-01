package cn.mju.wjh.article.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.mju.wjh.article.mapper.ArticleCollectionMapper;
import cn.mju.wjh.article.mapper.ArticleCommentsMapper;
import cn.mju.wjh.article.mapper.ArticleLikeMapper;
import cn.mju.wjh.article.mapper.CivilArticleMapper;
import cn.mju.wjh.article.service.ArticleManageService;
import cn.mju.wjh.common.api.client.UserClient;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.param.article.ArticleAuditParams;
import cn.mju.wjh.common.core.entity.param.article.ArticleQueryParams;
import cn.mju.wjh.common.core.entity.pojo.article.ArticleCollection;
import cn.mju.wjh.common.core.entity.pojo.article.ArticleLike;
import cn.mju.wjh.common.core.entity.pojo.article.CivilArticle;
import cn.mju.wjh.common.core.enums.HttpStatus;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.minio.utils.MinioUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * ClassName: ArticleManageServiceImpl
 * Package: cn.mju.wjh.article.service.impl
 * Description: 文章管理实现
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/25--14:06
 */
@Service
public class ArticleManageServiceImpl implements ArticleManageService {

    @Setter(onMethod_ = @Autowired)
    private MinioUtil minioUtil;

    @Setter(onMethod_ = @Autowired)
    private UserClient userClient;

    @Setter(onMethod_ = @Autowired)
    private StringRedisTemplate redisTemplate;

    @Setter(onMethod_ = @Autowired)
    private CivilArticleMapper articleMapper;

    @Setter(onMethod_ = @Autowired)
    private ArticleLikeMapper articleLikeMapper;

    @Setter(onMethod_ = @Autowired)
    private ArticleCommentsMapper articleCommentsMapper;

    @Setter(onMethod_ = @Autowired)
    private ArticleCollectionMapper articleCollectionMapper;

    /**
     * 统计数量
     * @param categoryIdList 分类ID集合
     * @param numberList 统计数量集合
     * @param articleIdList 文章ID集合
     */
    private void statisticsNumber(List<Long> categoryIdList, List<Long> numberList, List<Long> articleIdList) {
        List<CivilArticle> articleList = articleIdList.stream().map(
                articleId -> articleMapper.selectById(articleId)
        ).toList();

        // 统计次数
        for (Long aLong : categoryIdList) {
            Long count = 0L;
            for (CivilArticle civilArticle : articleList) {
                if (aLong.equals(civilArticle.getCategoryId())) {
                    count++;
                }
            }
            numberList.add(count);
        }
    }

    /**
     * 封装数据
     * @param articleIpage 数据
     * @return 是否为空
     */
    private boolean encapsulation(IPage<CivilArticle> articleIpage) {
        // 判空
        if (articleIpage.getRecords().size() == 0) {
            return true;
        }

        // 封装数据
        articleIpage.setRecords(articleIpage.getRecords().stream().peek(
                article -> {
                    article.setArticleImage(minioUtil.preview(article.getArticleImage()));
                    article.setCreatorAvatar(minioUtil.preview(article.getCreatorAvatar()));
                }).toList()
        );
        return false;
    }

    /**
     * 设置条件
     * @param articleQueryParams 参数
     * @param queryWrapper 条件构造器
     */
    private static void setQueryCondition(ArticleQueryParams articleQueryParams, LambdaQueryWrapper<CivilArticle> queryWrapper) {
        // 设置查询条件
        if (ObjectUtil.isNotEmpty(articleQueryParams.getArticleTitle())) {
            queryWrapper.like(CivilArticle::getArticleTitle, articleQueryParams.getArticleTitle());
        }

        if (ObjectUtil.isNotEmpty(articleQueryParams.getZoneId())) {
            if (articleQueryParams.getZoneId() == 1) {
                queryWrapper.eq(CivilArticle::getArticleType, "解题技巧");
            }

            if (articleQueryParams.getZoneId() == 2) {
                queryWrapper.eq(CivilArticle::getArticleType, "学习笔记");
            }
        }

        if (ObjectUtil.isNotEmpty(articleQueryParams.getCreatorName())) {
            queryWrapper.like(CivilArticle::getCreatorName, articleQueryParams.getCreatorName());
        }

        if (ObjectUtil.isNotEmpty(articleQueryParams.getCategoryId())) {
            queryWrapper.eq(CivilArticle::getCategoryId, articleQueryParams.getCategoryId());
        }

        queryWrapper.orderByDesc(CivilArticle::getCreateTime);
    }



    /**
     * 设置或取消精选文章
     * @param articleId 文章ID
     * @return 是否操作成功
     */
    @Override
    public Result setOrCancelCurationArticle(Long articleId) {
        CivilArticle article = articleMapper.selectById(articleId);

        // 获取该用户的文章被精选次数
        String key = article.getCreatorName() + UseConstant.CURATION_CONSTANT + UseConstant.COLON_CONSTANT;
        int curationNumber = 0;
        if (redisTemplate.opsForValue().get(key) != null) {
            curationNumber = Integer.parseInt(Objects.requireNonNull(redisTemplate.opsForValue().get(key)));
        }

        if (article.getIsCuration() == 1) {
            article.setIsCuration((byte) 0);
            if (curationNumber - 1 < 0) {
                redisTemplate.opsForValue().set(key, String.valueOf(0));
            } else {
                redisTemplate.opsForValue().set(key, String.valueOf(curationNumber - 1));
            }
        } else {
            article.setIsCuration((byte) 1);
            redisTemplate.opsForValue().set(key, String.valueOf(curationNumber + 1));
        }

        int rows = articleMapper.updateById(article);

        if (rows == 0) {
            return Result.fail().message("操作失败");
        }

        // 重新获取
        curationNumber = Integer.parseInt(Objects.requireNonNull(redisTemplate.opsForValue().get(key)));

        // 赋予/删除勋章
        if (curationNumber < 3) {
            userClient.deleteUserMedal(article.getUserId(), 4L);
        } else if (curationNumber < 6) {
            userClient.setUserMedal(article.getUserId(), 4L);
            userClient.deleteUserMedal(article.getUserId(), 5L);
        } else {
            userClient.setUserMedal(article.getUserId(), 5L);
        }

        return Result.ok().message("操作成功");
    }

    /**
     * 文章审核通过
     * @param articleId 文章ID
     * @return 操作是否成功
     */
    @Override
    public Result articleAuditSuccess(Long articleId) {
        // 根据文章ID设置文章状态为审核成功
        if (articleMapper.updateById(
                new CivilArticle()
                        .setArticleId(articleId)
                        .setStatus((byte) 1)
        ) <= 0) { return Result.fail().message("操作失败"); }

        CivilArticle article = articleMapper.selectById(articleId);

        // 获取该用户的文章发布次数
        String key = article.getCreatorName() + UseConstant.RELEASE_CONSTANT + UseConstant.COLON_CONSTANT;
        int curationNumber = 0;
        if (redisTemplate.opsForValue().get(key) != null) {
            curationNumber = Integer.parseInt(Objects.requireNonNull(redisTemplate.opsForValue().get(key)));
        }

        redisTemplate.opsForValue().set(key, String.valueOf(curationNumber + 1));
        curationNumber = Integer.parseInt(Objects.requireNonNull(redisTemplate.opsForValue().get(key)));

        if (curationNumber == 1) {
            userClient.setUserMedal(article.getUserId(), 1L);
        }

        if (curationNumber < 10) {
            userClient.deleteUserMedal(article.getUserId(), 2L);
        } else if (curationNumber < 20) {
            userClient.setUserMedal(article.getUserId(), 2L);
            userClient.deleteUserMedal(article.getUserId(), 3L);
        } else {
            userClient.setUserMedal(article.getUserId(), 3L);
        }

        return Result.ok().message("操作成功");
    }

    /**
     * 文章审核不通过
     * @return 操作是否成功
     */
    @Override
    public Result articleAuditFail(ArticleAuditParams articleAuditParams) {
        // 根据文章ID设置文章状态为审核失败
        if (articleMapper.updateById(
                new CivilArticle()
                        .setArticleId(articleAuditParams.getArticleId())
                        .setAuditFailureReason(articleAuditParams.getAuditFailureReason())
                        .setStatus((byte) 2)
        ) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作失败");
    }

    /**
     * 文章审核展示
     * @param articleQueryParams 文章查询参数
     * @return 文章审核信息
     */
    @Override
    public Result articleAuditShow(ArticleQueryParams articleQueryParams) {
        LambdaQueryWrapper<CivilArticle> queryWrapper = new LambdaQueryWrapper<>();

        // 设置条件
        setQueryCondition(articleQueryParams, queryWrapper);

        // 查询为审核状态的文章
        queryWrapper.eq(CivilArticle::getStatus, (byte) 0);

        // 进行查询操作
        IPage<CivilArticle> articleIpage = articleMapper.selectPage(
                new Page<>(articleQueryParams.getCurrentPage(), articleQueryParams.getPageSize()),
                queryWrapper
        );

        // 封装
        if (encapsulation(articleIpage)) {
            return Result.fail().code(HttpStatus.NOT_FOUND.getCode()).message("未查询到符合条件的文章");
        }

        return Result.ok(articleIpage).message("查询成功");
    }

    /**
     * 查询所有文章
     * @param articleQueryParams 文章查询参数
     * @return 所有文章信息
     */
    @Override
    public Result queryAllArticle(ArticleQueryParams articleQueryParams) {
        LambdaQueryWrapper<CivilArticle> queryWrapper = new LambdaQueryWrapper<>();

        // 设置查询条件
        setQueryCondition(articleQueryParams, queryWrapper);
        // 查询为发布成功的文章
        queryWrapper.eq(CivilArticle::getStatus, (byte) 1);

        // 分页查询
        IPage<CivilArticle> articlePage = articleMapper.selectPage(
                new Page<>(articleQueryParams.getCurrentPage(), articleQueryParams.getPageSize()),
                queryWrapper
        );

        // 封装
        if (encapsulation(articlePage)) {
            return Result.fail().code(HttpStatus.NOT_FOUND.getCode()).message("未查询到符合条件的文章");
        }

        return Result.ok(articlePage).message("查询成功");
    }

    /**
     * 统计所有文章数量
     * @return 所有文章数量
     */
    @Override
    public Result articleAllNumber() {
        Long count = articleMapper.selectCount(null);
        return Result.ok(count).message("操作成功");
    }

    /**
     * 每个分类的文章总数量
     * @param categoryIdList 分类ID
     * @return 每个分类的文章总数量
     */
    @Override
    public Result articleCategoryNumber(List<Long> categoryIdList) {
        List<Long> articleCategoryNumberList = new ArrayList<>();

        // 根据分类ID统计文章数
        categoryIdList.forEach(
                categoryId -> {

                    Long count = articleMapper.selectCount(
                            new LambdaQueryWrapper<CivilArticle>()
                                    .eq(CivilArticle::getCategoryId, categoryId)
                    );

                    if (count > 0) {
                        articleCategoryNumberList.add(count);
                    }
                }
        );

        return Result.ok(articleCategoryNumberList).message("操作成功");
    }

    /**
     * 文章评论数量
     * @return 文章评论数量
     */
    @Override
    public Result articleCommentsNumber() {
        Long count = articleCommentsMapper.selectCount(null);
        return Result.ok(count).message("操作成功");
    }

    /**
     * 每个分类的文章点赞数量
     * @param categoryIdList 分类ID
     * @return 每个分类的文章点赞数量
     */
    @Override
    public Result articleCategoryLikeNumber(List<Long> categoryIdList) {
        // 点赞数
        List<Long> articleCategoryLikeNumberList = new ArrayList<>();
        // 获取点赞的文章ID
        List<ArticleLike> articleLikes = articleLikeMapper.selectList(null);
        List<Long> likeArticleIdList = articleLikes.stream().map(ArticleLike::getArticleId).toList();

        // 统计数量
        statisticsNumber(categoryIdList, articleCategoryLikeNumberList, likeArticleIdList);

        return Result.ok(articleCategoryLikeNumberList).message("操作成功");
    }

    /**
     * 每个分类的文章收藏数量
     * @param categoryIdList 分类ID
     * @return 每个分类的文章收藏数量
     */
    @Override
    public Result articleCategoryCollectionNumber(List<Long> categoryIdList) {
        // 点赞数
        List<Long> articleCategoryCollectionNumberList = new ArrayList<>();
        // 获取点赞的文章ID
        List<ArticleCollection> articleLikes = articleCollectionMapper.selectList(null);
        List<Long> collectionArticleIdList = articleLikes.stream().map(ArticleCollection::getArticleId).toList();

        // 统计数量
        statisticsNumber(categoryIdList, articleCategoryCollectionNumberList, collectionArticleIdList);

        return Result.ok(articleCategoryCollectionNumberList).message("操作成功");
    }



}
