package cn.mju.wjh.common.core.entity.pojo.article;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serial;
import java.io.Serializable;
import java.sql.Timestamp;

/**
 * ClassName: CivilArticle
 * Package: cn.mju.wjh.common.core.entity.pojo.article
 * Description: 文章表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/7--14:42
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("civil_article")
@Schema(name = "CivilArticle", description = "文章表")
public class CivilArticle implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "article_id", type = IdType.AUTO)
    @Schema(name = "articleId", description = "文章ID")
    private Long articleId;

    @TableField(value = "article_title")
    @Schema(name = "articleTitle", description = "文章标题")
    private String articleTitle;

    @TableField(value = "article_content")
    @Schema(name = "articleContent", description = "文章内容")
    private String articleContent;

    @TableField(value = "category_id")
    @Schema(name = "categoryId", description = "分类ID")
    private Long categoryId;

    @TableField(value = "category_name")
    @Schema(name = "categoryName", description = "文章分类")
    private String categoryName;

    @TableField(value = "article_type")
    @Schema(name = "articleType", description = "文章类型(解题技巧、笔记分享)")
    private String articleType;

    @TableField(value = "article_image")
    @Schema(name = "articleImage", description = "文章封面")
    private String articleImage;

    @TableField(value = "user_id")
    @Schema(name = "userId", description = "发布者ID")
    private Long userId;

    @TableField(value = "creator_name")
    @Schema(name = "creatorName", description = "发布者名称")
    private String creatorName;

    @TableField(value = "creator_avatar")
    @Schema(name = "creatorAvatar", description = "发布者头像")
    private String creatorAvatar;

    @TableField(value = "is_curation")
    @Schema(name = "isCuration", description = "是否精选(0:不精选、1:精选)")
    private Byte isCuration;

    @TableField(value = "like_number")
    @Schema(name = "likeNumber", description = "点赞数")
    private Long likeNumber;

    @TableField(value = "browse_number")
    @Schema(name = "browseNumber", description = "浏览数")
    private Long browseNumber;

    @TableField(value = "collection_number")
    @Schema(name = "collectionNumber", description = "收藏数")
    private Long collectionNumber;

    @TableField(value = "create_time")
    @Schema(name = "createTime", description = "发布时间")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT-8")
    private Timestamp createTime;

    @TableField(value = "audit_failure_reason")
    @Schema(name = "auditFailureReason", description = "审核失败原因")
    private String auditFailureReason;

    @TableField(value = "status")
    @Schema(name = "status", description = "状态(0:待审核、1:审核成功、2:审核失败)")
    private Byte status;

}
