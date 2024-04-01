package cn.mju.wjh.common.core.entity.pojo.article;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serial;
import java.io.Serializable;

/**
 * ClassName: ArticleHistory
 * Package: cn.mju.wjh.common.core.entity.pojo.article
 * Description: 文章历史表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/7--15:06
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("article_history")
@Schema(name = "ArticleHistory", description = "文章历史表")
public class ArticleHistory implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "article_history_id", type = IdType.AUTO)
    @Schema(name = "articleHistoryId", description = "文章历史ID")
    private Long articleHistoryId;

    @TableField(value = "user_id")
    @Schema(name = "userId", description = "用户ID")
    private Long userId;

    @TableField(value = "article_id")
    @Schema(name = "articleId", description = "文章ID")
    private Long articleId;

    @TableField(value = "article_title")
    @Schema(name = "articleTitle", description = "文章标题")
    private String articleTitle;

    @TableField(value = "article_image")
    @Schema(name = "articleImage", description = "文章封面")
    private String articleImage;

    @TableField(value = "creator_name")
    @Schema(name = "creatorName", description = "发布者名称")
    private String creatorName;

}
