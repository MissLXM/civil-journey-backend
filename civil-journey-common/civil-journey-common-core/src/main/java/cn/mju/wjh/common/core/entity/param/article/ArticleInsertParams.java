package cn.mju.wjh.common.core.entity.param.article;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * ClassName: ArticleInsertParams
 * Package: cn.mju.wjh.common.core.entity.param
 * Description: 文章参数
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/24--9:48
 */
@Data
@Schema(name = "ArticleInsertParams", description = "文章参数")
public class ArticleInsertParams {

    @NotBlank
    @Schema(name = "articleTitle", description = "文章标题")
    private String articleTitle;

    @NotBlank
    @Schema(name = "articleContent", description = "文章内容")
    private String articleContent;

    @NotNull
    @Schema(name = "categoryId", description = "分类ID")
    private Long categoryId;

    @NotBlank
    @Schema(name = "categoryName", description = "文章分类")
    private String categoryName;

    @NotBlank
    @Schema(name = "articleType", description = "文章类型(解题技巧、学习笔记)")
    private String articleType;

    @NotBlank
    @Schema(name = "articleImage", description = "文章封面")
    private String articleImage;

}
