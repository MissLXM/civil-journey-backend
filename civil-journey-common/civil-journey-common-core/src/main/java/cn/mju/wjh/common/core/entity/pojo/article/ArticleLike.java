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
 * ClassName: ArticleLike
 * Package: cn.mju.wjh.common.core.entity.pojo.article
 * Description: 文章点赞表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/7--15:08
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("article_like")
@Schema(name = "ArticleLike", description = "文章点赞表")
public class ArticleLike implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "article_like_id", type = IdType.AUTO)
    @Schema(name = "articleLikeId", description = "文章点赞ID")
    private Long articleLikeId;

    @TableField(value = "user_id")
    @Schema(name = "userId", description = "用户ID")
    private Long userId;

    @TableField(value = "article_id")
    @Schema(name = "articleId", description = "文章ID")
    private Long articleId;
}
