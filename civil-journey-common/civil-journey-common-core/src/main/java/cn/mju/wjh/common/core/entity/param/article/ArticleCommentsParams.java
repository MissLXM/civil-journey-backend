package cn.mju.wjh.common.core.entity.param.article;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * ClassName: ArticleCommentsParams
 * Package: cn.mju.wjh.common.core.entity.param
 * Description: 文章评论参数
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/24--9:57
 */
@Data
@Schema(name = "ArticleCommentsParams", description = "文章评论参数")
public class ArticleCommentsParams {

    @NotNull
    @Schema(name = "articleId", description = "文章ID")
    private Long articleId;

    @NotBlank
    @Schema(name = "commentContent", description = "评论内容")
    private String commentContent;
}
