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
 * ClassName: ArticleComments
 * Package: cn.mju.wjh.common.core.entity.pojo.article
 * Description: 文章评论表
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/7--15:02
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("article_comments")
@Schema(name = "ArticleComments", description = "文章评论表")
public class ArticleComments implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "article_comments_id", type = IdType.AUTO)
    @Schema(name = "articleCommentsId", description = "文章评论ID")
    private Long articleCommentsId;

    @TableField(value = "article_id")
    @Schema(name = "articleId", description = "文章ID")
    private Long articleId;

    @TableField(value = "user_id")
    @Schema(name = "userId", description = "评论者ID")
    private Long userId;

    @TableField(value = "commenter_name")
    @Schema(name = "commenterName", description = "评论者姓名")
    private String commenterName;

    @TableField(value = "comment_content")
    @Schema(name = "commentContent", description = "评论的内容")
    private String commentContent;

    @TableField(value = "commenter_avatar")
    @Schema(name = "commenterAvatar", description = "评论者头像")
    private String commenterAvatar;

    @TableField(value = "comment_time")
    @Schema(name = "commentTime", description = "评论日期")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT-8")
    private Timestamp commentTime;

}
