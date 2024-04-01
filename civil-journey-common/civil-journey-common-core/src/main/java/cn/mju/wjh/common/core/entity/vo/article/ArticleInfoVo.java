package cn.mju.wjh.common.core.entity.vo.article;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.sql.Timestamp;

/**
 * ClassName: ArticleInfoVo
 * Package: cn.mju.wjh.common.core.entity.vo
 * Description: 文章信息回显
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/25--9:28
 */
@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "ArticleInfoVo",description = "文章信息回显")
public class ArticleInfoVo {

    @Schema(name = "articleId", description = "文章ID")
    private Long articleId;

    @Schema(name = "articleTitle", description = "文章标题")
    private String articleTitle;

    @Schema(name = "articleContent", description = "文章内容")
    private String articleContent;

    @Schema(name = "categoryName", description = "文章分类")
    private String categoryName;

    @Schema(name = "articleType", description = "文章类型(解题技巧、笔记分享)")
    private String articleType;

    @Schema(name = "articleImage", description = "文章封面")
    private String articleImage;

    @Schema(name = "userId", description = "发布者ID")
    private Long userId;

    @Schema(name = "creatorName", description = "发布者名称")
    private String creatorName;

    @Schema(name = "creatorAvatar", description = "发布者头像")
    private String creatorAvatar;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "isCuration", description = "是否精选(0:不精选、1:精选)")
    private Byte isCuration;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "likeNumber", description = "点赞数")
    private Long likeNumber;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "isLike", description = "是否点赞")
    private Byte isLike;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "browseNumber", description = "浏览数")
    private Long browseNumber;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "collectionNumber", description = "收藏数")
    private Long collectionNumber;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "isCollection", description = "是否收藏(0:收藏、1:不收藏)")
    private Byte isCollection;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "createTime", description = "发布时间")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT-8")
    private Timestamp createTime;

    @Schema(name = "auditFailureReason", description = "审核失败原因")
    private String auditFailureReason;

    @Schema(name = "status", description = "状态(0:待审核、1:审核成功、2:审核失败)")
    private Byte status;
}
