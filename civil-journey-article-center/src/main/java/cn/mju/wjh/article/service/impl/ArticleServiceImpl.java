package cn.mju.wjh.article.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.mju.wjh.article.mapper.*;
import cn.mju.wjh.article.service.ArticleService;
import cn.mju.wjh.common.api.client.CategoryClient;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.UploadParams;
import cn.mju.wjh.common.core.entity.param.article.ArticleCommentsParams;
import cn.mju.wjh.common.core.entity.param.article.ArticleInsertParams;
import cn.mju.wjh.common.core.entity.param.article.ArticleQueryParams;
import cn.mju.wjh.common.core.entity.pojo.article.*;
import cn.mju.wjh.common.core.entity.pojo.category.CivilCategory;
import cn.mju.wjh.common.core.entity.pojo.user.CivilUser;
import cn.mju.wjh.common.core.entity.vo.article.ArticleCommentsVo;
import cn.mju.wjh.common.core.entity.vo.article.ArticleInfoVo;
import cn.mju.wjh.common.core.enums.HttpStatus;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.core.utils.StringUtils;
import cn.mju.wjh.common.minio.utils.MinioUtil;
import cn.mju.wjh.common.security.utils.LoginUserUtils;
import cn.mju.wjh.common.security.utils.StpUserUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.*;

/**
 * ClassName: ArticleServiceImpl
 * Package: cn.mju.wjh.article.service.impl
 * Description: 文章服务实现(前台)
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/19--18:42
 */
@Slf4j
@Service
public class ArticleServiceImpl implements ArticleService {

    @Setter(onMethod_ = @Autowired)
    private CivilArticleMapper articleMapper;

    @Setter(onMethod_ = @Autowired)
    private ArticleLikeMapper articleLikeMapper;

    @Setter(onMethod_ = @Autowired)
    private ArticleCollectionMapper articleCollectionMapper;

    @Setter(onMethod_ = @Autowired)
    private ArticleCommentsMapper articleCommentsMapper;

    @Setter(onMethod_ = @Autowired)
    private ArticleHistoryMapper articleHistoryMapper;

    @Setter(onMethod_ = @Autowired)
    private LoginUserUtils loginUserUtils;

    @Setter(onMethod_ = @Autowired)
    private CategoryClient categoryClient;

    @Setter(onMethod_ = @Autowired)
    private MinioUtil minioUtil;

    /**
     * 封装评论信息
     * @param item 评论信息
     * @return 封装结果
     */
    private ArticleCommentsVo getArticleCommentsVo(ArticleComments item) {
        CivilUser user = loginUserUtils.getUserInfo(item.getUserId().toString());
        if (Objects.isNull(user)) {
            return BeanUtil.toBean(item, ArticleCommentsVo.class);
        }
        item.setCommenterName(user.getNickname());
        item.setCommenterAvatar(user.getHeadPortrait());
        articleCommentsMapper.updateById(item);
        return BeanUtil.toBean(item, ArticleCommentsVo.class);
    }

    /**
     * 查询热门文章(解题技巧、学习笔记)
     * @param articleType 解题技巧、学习笔记
     * @return 是否查询成功
     */
    private Result getHotArticle(String articleType) {
        List<CivilArticle> articles = articleMapper.selectList(
                new LambdaQueryWrapper<CivilArticle>()
                        .eq(CivilArticle::getStatus, (byte) 1)
                        .eq(CivilArticle::getArticleType, articleType)
                        .orderByDesc(CivilArticle::getLikeNumber,CivilArticle::getBrowseNumber)
                        .last("limit 10")
        );

        if (articles.size() == 0) {
            return Result.fail().code(HttpStatus.NOT_FOUND.getCode()).message("未查询到符合条件的文章");
        }

        List<Map<String, Object>> articleVos = articles.stream().map(
                article -> {
                    Map<String, Object> articleVo = new HashMap<>();
                    articleVo.put("articleId", article.getArticleId());
                    articleVo.put("articleTitle", article.getArticleTitle());
                    articleVo.put("browseNumber", article.getBrowseNumber());
                    return articleVo;
                }
        ).toList();
        return Result.ok(articleVos).message("查询解题技巧文章成功");
    }

    /**
     * 是否点赞或收藏
     * @param articleId 文章ID
     * @param articleInfoVo 文章信息回显
     */
    private void isLikeOrCollection(Long articleId, ArticleInfoVo articleInfoVo) {
        // 是否收藏
        if (articleLikeMapper.selectCount(
                new LambdaQueryWrapper<ArticleLike>()
                        .eq(ArticleLike::getUserId, Long.parseLong(StpUserUtils.getLoginId().toString()))
                        .eq(ArticleLike::getArticleId, articleId)
        ) > 0) {
            articleInfoVo.setIsLike((byte) 1);
        }

        // 是否点赞
        if (articleCollectionMapper.selectCount(
                new LambdaQueryWrapper<ArticleCollection>()
                        .eq(ArticleCollection::getUserId, Long.parseLong(StpUserUtils.getLoginId().toString()))
                        .eq(ArticleCollection::getArticleId, articleId)
        ) > 0) {
            articleInfoVo.setIsCollection((byte) 1);
        }
    }

    /**
     * 设置文章条件(综合、热门、最新)
     * @param articleQueryParams 查询参数
     * @param queryWrapper 条件构造器
     * @return 设置条件
     */
    private void articleZoneOrder(ArticleQueryParams articleQueryParams, LambdaQueryWrapper<CivilArticle> queryWrapper) {
        if (articleQueryParams.getSortId() == 0) {
            // 综合
            queryWrapper
                    .orderByDesc(
                            CivilArticle::getLikeNumber,
                            CivilArticle::getCollectionNumber,
                            CivilArticle::getBrowseNumber,
                            CivilArticle::getCreatorName
                    );
        } else if (articleQueryParams.getSortId() == 1) {
            // 最新
            queryWrapper
                    .orderByDesc(CivilArticle::getCreateTime);
        } else if (articleQueryParams.getSortId() == 2) {
            // 热门
            queryWrapper
                    .orderByDesc(CivilArticle::getLikeNumber, CivilArticle::getBrowseNumber);
        }
    }

    /**
     * 设置查询条件
     * @param articleQueryParams 查询参数
     * @param queryWrapper 查询构造器
     */
    protected void  settingCondition(ArticleQueryParams articleQueryParams, LambdaQueryWrapper<CivilArticle> queryWrapper) {
        // 设置文章条件(综合、热门、最新)
        if (!StringUtils.isNull(articleQueryParams.getSortId())) {
            articleZoneOrder(articleQueryParams, queryWrapper);
        }

        // 设置文章条件(分区)
        if (!StringUtils.isNull(articleQueryParams.getCategoryId()) && articleQueryParams.getCategoryId() != 0) {
            queryWrapper
                    .eq(CivilArticle::getCategoryId, articleQueryParams.getCategoryId());
        }

        // 设置文章条件(解题技巧、笔记分享)
        if (!StringUtils.isNull(articleQueryParams.getZoneId()) && articleQueryParams.getZoneId() != 0) {
            if (articleQueryParams.getZoneId() == 1) {
                queryWrapper
                        .eq(CivilArticle::getArticleType, "解题技巧");
            } else if (articleQueryParams.getZoneId() == 2) {
                queryWrapper
                        .eq(CivilArticle::getArticleType, "学习笔记");
            }

        }

        // 模糊查询文章标题
        if (!StringUtils.isNull(articleQueryParams.getArticleTitle())) {
            queryWrapper
                    .like(CivilArticle::getArticleTitle, articleQueryParams.getArticleTitle());
        }
    }

    /**
     * 封装文章信息
     * @param articlePage 文章分页信息
     * @return 封装好的文章信息
     */
    protected IPage<ArticleInfoVo> getArticleInfoVoPage(IPage<CivilArticle> articlePage) {
        IPage<ArticleInfoVo> articleInfoVoIpage = new Page<>();
        BeanUtil.copyProperties(articlePage, articleInfoVoIpage);

        List<ArticleInfoVo> articleInfoVos = articlePage.getRecords().stream()
                .map(article -> {
                    ArticleInfoVo articleInfoVo = BeanUtil.toBean(article, ArticleInfoVo.class);
                    isLikeOrCollection(article.getArticleId(), articleInfoVo);
                    articleInfoVo.setArticleImage(minioUtil.preview(articleInfoVo.getArticleImage()));
                    return articleInfoVo;
                })
                .toList();
        articleInfoVoIpage.setRecords(articleInfoVos);
        return articleInfoVoIpage;
    }

    /**
     * 用户--发布文章
     * @param articleParams 文章参数
     * @return 是否发布成功
     */
    @Override
    public Result articleRelease(ArticleInsertParams articleParams) {
        // 获取当前用户信息
        CivilUser user = loginUserUtils.getUserInfo(StpUserUtils.getLoginId().toString());

        // 设置文章参数
        CivilArticle article = new CivilArticle()
                .setArticleTitle(articleParams.getArticleTitle())
                .setArticleContent(articleParams.getArticleContent())
                .setCategoryId(articleParams.getCategoryId())
                .setCategoryName(articleParams.getCategoryName())
                .setArticleType(articleParams.getArticleType())
                .setArticleImage(articleParams.getArticleImage())
                .setUserId(user.getUserId())
                .setCreatorName(user.getNickname())
                .setCreatorAvatar(user.getHeadPortrait());

        if (articleMapper.insert(article) > 0) {
            return Result.ok().message("发布成功");
        }
        return Result.fail().message("发布失败");
    }

    /**
     * 用户--上传文章封面
     * @param file 文件
     * @param params 上传参数
     * @return 文章封面地址
     */
    @Override
    public Result uploadArticleImage(MultipartFile file, UploadParams params) {
        // 上传
        String path = minioUtil.upload(file, "article", "articleType: " + params.getTagName(), "username: " + params.getUsername());

        // 判空
        if (path == null) {
            return Result.fail().message("操作失败");
        }

        // 封装
        Map<String, String> articlePath = new HashMap<>();
        articlePath.put("oldPath", path);
        articlePath.put("newPath", minioUtil.preview(path));

        return Result.ok(articlePath).message("操作成功");
    }

    /**
     * 用户--文章点赞/取消点赞
     * @param articleId 文章ID
     * @return 是否操作成功
     */
    @Override
    public Result articleLike(Long articleId) {
        // 获取当前登录用户
        Long userId = Long.parseLong(StpUserUtils.getLoginId().toString());
        // 判断是否有点赞过
        if (articleLikeMapper.selectCount(
                new LambdaQueryWrapper<ArticleLike>()
                        .eq(ArticleLike::getUserId, userId)
                        .eq(ArticleLike::getArticleId, articleId)
        ) > 0) {
            // 删除
            if (articleLikeMapper.delete(
                    new LambdaQueryWrapper<ArticleLike>()
                            .eq(ArticleLike::getUserId, userId)
                            .eq(ArticleLike::getArticleId, articleId)
            ) > 0) {
                // 文章点赞数 - 1
                CivilArticle article = articleMapper.selectById(articleId);
                article.setLikeNumber(article.getLikeNumber() - 1);
                if (articleMapper.updateById(article) > 0) {
                    log.info("用户取消点赞成功");
                } else {
                    log.info("用户取消点赞失败");
                }
                return Result.ok().message("操作成功");
            } else {
                return Result.fail().message("操作失败");
            }
        } else {
            // 新增
            if (articleLikeMapper.insert(
                    new ArticleLike()
                            .setUserId(userId)
                            .setArticleId(articleId)
            ) > 0) {
                // 文章点赞数 + 1
                CivilArticle article = articleMapper.selectById(articleId);
                article.setLikeNumber(article.getLikeNumber() + 1);
                if (articleMapper.updateById(article) > 0) {
                    log.info("用户点赞成功");
                } else {
                    log.info("用户点赞失败");
                }
                return Result.ok().message("操作成功");
            } else {
                return Result.fail().message("操作失败");
            }
        }
    }

    /**
     * 用户--文章收藏/取消收藏
     * @param articleId 文章ID
     * @return 是否操作成功
     */
    @Override
    public Result articleCollection(Long articleId) {
        // 获取当前登录用户
        Long userId = Long.parseLong(StpUserUtils.getLoginId().toString());
        // 判断是否有点赞过
        if (articleCollectionMapper.selectCount(
                new LambdaQueryWrapper<ArticleCollection>()
                        .eq(ArticleCollection::getUserId, userId)
                        .eq(ArticleCollection::getArticleId, articleId)
        ) > 0) {
            // 删除
            if (articleCollectionMapper.delete(
                    new LambdaQueryWrapper<ArticleCollection>()
                            .eq(ArticleCollection::getUserId, userId)
                            .eq(ArticleCollection::getArticleId, articleId)
            ) > 0) {
                // 文章收藏数 - 1
                CivilArticle article = articleMapper.selectById(articleId);
                article.setCollectionNumber(article.getCollectionNumber() - 1);
                if (articleMapper.updateById(article) > 0) {
                    log.info("用户取消收藏成功");
                } else {
                    log.info("用户取消收藏失败");
                }
                return Result.ok().message("操作成功");
            } else {
                return Result.fail().message("操作失败");
            }
        } else {
            // 新增
            if (articleCollectionMapper.insert(
                    new ArticleCollection()
                            .setUserId(userId)
                            .setArticleId(articleId)
            ) > 0) {
                // 文章收藏数 + 1
                CivilArticle article = articleMapper.selectById(articleId);
                article.setCollectionNumber(article.getCollectionNumber() + 1);
                if (articleMapper.updateById(article) > 0) {
                    log.info("用户收藏成功");
                } else {
                    log.info("用户收藏失败");
                }
                return Result.ok().message("操作成功");
            } else {
                return Result.fail().message("操作失败");
            }
        }
    }

    /**
     * 用户--收藏的文章展示
     * @return 展示收藏的文章信息
     */
    @Override
    public Result queryCollectionArticle(PageParams pageParams) {
        // 获取当前登录用户的收藏文章
        IPage<ArticleCollection> articleCollectionIpage = articleCollectionMapper.selectPage(
                new Page<>(pageParams.getCurrentPage(), pageParams.getPageSize()),
                new LambdaQueryWrapper<ArticleCollection>()
                        .eq(ArticleCollection::getUserId, StpUserUtils.getLoginId())
        );

        // 获取所有文章ID
        List<Long> articleIds = new ArrayList<>();
        if (articleCollectionIpage.getRecords().size() != 0) {
            articleIds = articleCollectionIpage.getRecords().stream()
                    .map(ArticleCollection::getArticleId)
                    .toList();
        }

        // 获取所有文章信息
        List<CivilArticle> articleList = articleIds.stream()
                .map(articleId -> articleMapper.selectById(articleId)).toList();

        // 封装文章回显
        List<ArticleInfoVo> articleInfoVoList = articleList.stream()
                .map(article -> {
                        article.setArticleImage(minioUtil.preview(article.getArticleImage()));
                        article.setCreatorAvatar(minioUtil.preview(article.getCreatorAvatar()));
                        return BeanUtil.toBean(article, ArticleInfoVo.class);
                    }
                ).toList();

        // 判断是否收藏/点赞
        articleInfoVoList = articleInfoVoList.stream()
            .peek(articleInfoVo -> articleInfoVo.setIsCollection((byte) 1)).toList();

        // 判空
        if (articleInfoVoList.size() != 0) {
            IPage<ArticleInfoVo> articleCollectionVoIpage = new Page<>();
            BeanUtil.copyProperties(articleCollectionIpage, articleCollectionVoIpage);
            articleCollectionVoIpage.setRecords(articleInfoVoList);
            return Result.ok(articleCollectionVoIpage).message("展示文章成功");
        }
        return Result.fail().code(HttpStatus.NOT_FOUND.getCode()).message("展示文章失败");
    }

    /**
     * 用户--所有已发布文章(自身)
     * @param pageParams 分页参数
     * @return 所有已发布文章(自身)
     */
    @Override
    public Result queryArticleRelease(PageParams pageParams) {
        // 分页查询
        IPage<CivilArticle> articleIpage = articleMapper.selectPage(
                new Page<>(pageParams.getCurrentPage(), pageParams.getPageSize()),
                new LambdaQueryWrapper<CivilArticle>()
                        .eq(CivilArticle::getUserId, Long.parseLong(StpUserUtils.getLoginId().toString()))
                        .orderByDesc(CivilArticle::getCreateTime)
        );

        // 判空
        if (articleIpage.getRecords().size() == 0) {
            return Result.fail().message("未查询到相关数据").code(HttpStatus.NOT_FOUND.getCode());
        }

        // 数据封装
        List<ArticleInfoVo> articleInfoVoList = articleIpage.getRecords().stream()
                .map(article -> {
                        article.setArticleImage(minioUtil.preview(article.getArticleImage()));
                        article.setCreatorAvatar(minioUtil.preview(article.getCreatorAvatar()));
                        return BeanUtil.toBean(article, ArticleInfoVo.class);
                    }
                ).toList();

        // 拷贝
        IPage<ArticleInfoVo> articleInfoVoIpage = new Page<>();
        BeanUtil.copyProperties(articleIpage, articleInfoVoIpage);

        // 赋值
        articleInfoVoIpage.setRecords(articleInfoVoList);

        return Result.ok(articleInfoVoIpage).message("操作成功");
    }

    /**
     * 用户--文章评论
     * @param commentsParams 文章评论参数
     * @return 是否操作成功
     */
    @Override
    public Result articleComments(ArticleCommentsParams commentsParams) {
        // 获取当前用户信息
        CivilUser user = loginUserUtils.getUserInfo(StpUserUtils.getLoginId().toString());

        // 设置评论参数
        ArticleComments articleComments = new ArticleComments()
                .setArticleId(commentsParams.getArticleId())
                .setUserId(user.getUserId())
                .setCommenterName(user.getNickname())
                .setCommenterAvatar(user.getHeadPortrait())
                .setCommentContent(commentsParams.getCommentContent());

        if (articleCommentsMapper.insert(articleComments) > 0) {
            return Result.ok().message("评论成功");
        }
        return Result.fail().message("评论失败");
    }

    /**
     * 用户--查看某文章的所有评论
     * @param articleId 文章ID
     * @return 文章所有评论
     */
    @Override
    public Result queryArticleAllComments(Long articleId) {
        // 根据文章ID拿到所有评论信息
        List<ArticleComments> articleComments = articleCommentsMapper.selectList(
                new LambdaQueryWrapper<ArticleComments>()
                        .eq(ArticleComments::getArticleId, articleId)
                        .orderByDesc(ArticleComments::getCommentTime)
        );

        // 查询为空
        if (articleComments.size() == 0) {
            return Result.fail().code(HttpStatus.NOT_FOUND.getCode()).message("未查询到评论信息");
        }

        // 封装评论信息
        List<ArticleCommentsVo> articleCommentsVos = articleComments.stream()
                .map(this::getArticleCommentsVo)
                .toList();

        articleCommentsVos = articleCommentsVos.stream().peek(
                articleCommentsVo -> articleCommentsVo.setCommenterAvatar(minioUtil.preview(articleCommentsVo.getCommenterAvatar()))
        ).toList();


        if (articleCommentsVos.size() != 0) {
            return Result.ok(articleCommentsVos).message("查询评论成功");
        }
        return Result.fail().code(HttpStatus.NOT_FOUND.getCode()).message("查询评论失败");
    }

    /**
     * 删除评论
     * @param commentId 评论ID
     * @return 是否操作成功
     */
    @Override
    public Result deleteComment(Long commentId) {
        if (articleCommentsMapper.deleteById(commentId) == 0) {
            return Result.fail().message("操作失败");
        }
        return Result.ok().message("操作成功");
    }

    /**
     * 用户--文章详情展示
     * @param articleId 文章ID
     * @return 文章信息
     */
    @Override
    public Result queryArticleDetail(Long articleId) {
        // 查询文章信息
        CivilArticle article = articleMapper.selectById(articleId);

        // 判空
        if (article == null) {
            return Result.fail().code(HttpStatus.NOT_FOUND.getCode()).message("未存在该文章");
        }

        // 更新用户信息
        CivilUser user = loginUserUtils.getUserInfo(article.getUserId().toString());
        if (user != null) {
            article.setCreatorName(user.getNickname());
            article.setCreatorAvatar(user.getHeadPortrait());
            if (articleMapper.updateById(article) > 0) {
                log.info("文章更新用户信息成功");
            } else {
                log.info("文章更新用户信息失败");
            }
        }

        // 更新类别信息
        String jsonString = JSON.toJSONString(categoryClient.getCategoryById(article.getCategoryId()).getData());
        CivilCategory category = JSONObject.parseObject(jsonString, CivilCategory.class);
        if (category != null) {
            article.setCategoryName(category.getCategoryName());
            if (articleMapper.updateById(article) > 0) {
                log.info("文章更新类别信息成功");
            } else {
                log.info("文章更新类别信息失败");
            }
        }

        ArticleInfoVo articleInfoVo = BeanUtil.toBean(article, ArticleInfoVo.class);
        // 是否点赞或收藏
        isLikeOrCollection(articleId, articleInfoVo);

        if (articleInfoVo != null) {
            // 浏览记录
            if (articleHistoryMapper.insert(
                    new ArticleHistory()
                            .setArticleId(article.getArticleId())
                            .setUserId(article.getUserId())
                            .setCreatorName(article.getCreatorName())
                            .setArticleTitle(article.getArticleTitle())
                            .setArticleImage(article.getArticleImage())
            ) > 0) {
                log.info("文章浏览记录成功");
            } else {
                log.info("文章浏览记录失败");
            }

            if (articleMapper.updateById(
                    article.setBrowseNumber(article.getBrowseNumber() + 1)) > 0
            ) {
                log.info("浏览记录 + 1");
            } else {
                log.info("浏览记录 + 1 失败");
            }

            // 封装
            articleInfoVo.setArticleImage(minioUtil.preview(articleInfoVo.getArticleImage()));
            articleInfoVo.setCreatorAvatar(minioUtil.preview(articleInfoVo.getCreatorAvatar()));

            return Result.ok(articleInfoVo).message("文章详情展示成功");
        }
        return Result.fail().message("文章详情展示失败");
    }

    /**
     * 用户--文章浏览记录
     * @return 展示浏览记录(某用户)
     */
    @Override
    public Result queryArticleHistory(PageParams pageParams) {
        // 获取当前用户浏览记录
        IPage<ArticleHistory> articleHistoryIpage = articleHistoryMapper.selectPage(
                new Page<>(pageParams.getCurrentPage(), pageParams.getPageSize()),
                new LambdaQueryWrapper<ArticleHistory>()
                        .eq(ArticleHistory::getUserId, StpUserUtils.getLoginId())
        );

        // 判空
        if (articleHistoryIpage.getRecords().size() == 0) {
            return Result.fail().code(HttpStatus.NOT_FOUND.getCode()).message("未存在浏览记录");
        }

        // 封装
        List<ArticleInfoVo> articleInfoVos = articleHistoryIpage.getRecords().stream()
                .map(articleHistory -> {
                    ArticleInfoVo articleInfoVo = BeanUtil.toBean(articleHistory, ArticleInfoVo.class);
                    CivilArticle article = articleMapper.selectById(articleHistory.getArticleId());
                    if (article != null) {
                        articleInfoVo.setLikeNumber(article.getLikeNumber());
                        articleInfoVo.setBrowseNumber(article.getBrowseNumber());
                        articleInfoVo.setCollectionNumber(article.getCollectionNumber());
                        articleInfoVo.setCreatorAvatar(minioUtil.preview(article.getCreatorAvatar()));
                        articleInfoVo.setArticleImage(minioUtil.preview(articleInfoVo.getArticleImage()));
                    }
                    return articleInfoVo;
                }).toList();

        IPage<ArticleInfoVo> articleInfoVoIPage = new Page<>();
        BeanUtil.copyProperties(articleHistoryIpage, articleInfoVoIPage);
        articleInfoVoIPage.setRecords(articleInfoVos);

        return Result.ok(articleInfoVoIPage).message("浏览记录查询成功");
    }

    /**
     * 文章--精选文章展示
     * @param pageParams 分页参数
     * @return 精选文章信息
     */
    @Override
    public Result queryCurationArticle(PageParams pageParams) {
        // 查询文章
        IPage<CivilArticle> articleIpage = articleMapper.selectPage(
                new Page(pageParams.getCurrentPage(), pageParams.getPageSize()),
                new LambdaQueryWrapper<CivilArticle>()
                        .eq(CivilArticle::getStatus, (byte) 1)
                        .eq(CivilArticle::getIsCuration, (byte) 1)
                        .orderByDesc(CivilArticle::getLikeNumber)
        );

        // 判空
        if (articleIpage.getRecords().size() == 0) {
            return Result.fail().code(HttpStatus.NOT_FOUND.getCode()).message("未有满足条件的文章信息");
        }

        // 封装返回
        return Result.ok(getArticleInfoVoPage(articleIpage)).message("精选文章信息查询成功");
    }

    /**
     * 文章--热门解题技巧展示(默认10条)
     * @return 热门解题技巧展示
     */
    @Override
    public Result queryHotSkillArticle() {
        return getHotArticle("解题技巧");
    }

    /**
     * 文章--热门学习笔记展示(默认10条)
     * @return 热门学习笔记展示
     */
    @Override
    public Result queryHotNoteArticle() {
        return getHotArticle("学习笔记");
    }

    /**
     * 文章--所有文章展示((综合、热门、最新)、分区、(解题技巧、笔记分享))
     * @param articleQueryParams 文章查询参数
     * @return 展示文章信息
     */
    @Override
    public Result queryAllArticle(ArticleQueryParams articleQueryParams) {
        LambdaQueryWrapper<CivilArticle> queryWrapper = new LambdaQueryWrapper<>();

        // 审核通过
        queryWrapper.eq(CivilArticle::getStatus, (byte) 1);

        // 设置条件
        settingCondition(articleQueryParams, queryWrapper);

        // 查询文章
        IPage<CivilArticle> articleIpage = articleMapper.selectPage(
                new Page<>(articleQueryParams.getCurrentPage(), articleQueryParams.getPageSize()),
                queryWrapper
        );

        // 判空
        if (articleIpage.getRecords().size() == 0) {
            return Result.fail().code(HttpStatus.NOT_FOUND.getCode()).message("未查询到符合条件的文章");
        }

        // 封装文章信息
        IPage<ArticleInfoVo> articleInfoVoPage = getArticleInfoVoPage(articleIpage);

        return Result.ok(articleInfoVoPage).message("查询成功");
    }

    /**
     * 文章--删除文章
     * @param articleId 文章ID
     * @return 是否操作成功
     */
    @Override
    public Result deleteArticle(Long articleId) {
        if (articleMapper.deleteById(articleId) > 0) {
            return Result.ok().message("删除文章成功");
        }
        return Result.fail().message("操作失败");
    }


}
