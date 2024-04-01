package cn.mju.wjh.common.core.entity.param.article;

import cn.mju.wjh.common.core.entity.param.PageParams;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * ClassName: ArticleQueryParams
 * Package: cn.mju.wjh.common.core.entity.param.article
 * Description: 文章查询参数
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/25--14:10
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Schema(name = "ArticleQueryParams", description = "文章查询参数")
public class ArticleQueryParams extends PageParams {

    @Schema(name = "articleTitle", description = "文章标题")
    private String articleTitle;

    @Schema(name = "sortId", description = "1:综合、2:热门、3:最新")
    private Long  sortId;

    @Schema(name = "categoryId", description = "分类")
    private Long categoryId;

    @Schema(name = "zoneId", description = "1:解题技巧、2:学习笔记")
    private Long zoneId;

    @Schema(name = "creatorName", description = "发布者")
    private  String creatorName;

}
