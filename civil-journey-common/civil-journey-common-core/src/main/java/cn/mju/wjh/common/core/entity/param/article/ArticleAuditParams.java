package cn.mju.wjh.common.core.entity.param.article;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * ClassName: ArticleAuditParams
 * Package: cn.mju.wjh.common.core.entity.param.article
 * Description: 文章审核参数
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/25--15:38
 */
@Data
@Schema(name = "ArticleAuditParams", description = "文章审核参数")
public class ArticleAuditParams {

    @NotNull
    @Schema(name = "articleId", description = "文章ID")
    private Long articleId;

    @Schema(name = "auditFailureReason", description = "审核失败原因")
    private String auditFailureReason;
}
