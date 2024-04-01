package cn.mju.wjh.common.core.entity.param.technical;

import cn.mju.wjh.common.core.entity.param.PageParams;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * ClassName: TechnicalQueryParams
 * Package: cn.mju.wjh.common.core.entity.param.technical
 * Description: 资讯查询参数
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/14--13:53
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Schema(name = "TechnicalQueryParams", description = "资讯查询参数")
public class TechnicalQueryParams extends PageParams {

    @Schema(name = "technicalTitle", description = "资讯标题")
    private String technicalTitle;

    @Schema(name = "categoryId", description = "资讯分类")
    private Long categoryId;

    @Schema(name = "creatorName", description = "发布者")
    private String creatorName;

}
