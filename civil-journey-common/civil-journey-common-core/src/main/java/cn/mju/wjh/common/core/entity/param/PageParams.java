package cn.mju.wjh.common.core.entity.param;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * ClassName: PageParams
 * Package: cn.mju.wjh.common.core.entity.param
 * Description: 分页参数
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/17--13:39
 */
@Data
@Schema(name = "PageParams", description = "分页参数")
public class PageParams {

    @NotNull
    @Schema(name = "currentPage", description = "当前页码")
    private Integer currentPage;

    @NotNull
    @Schema(name = "pageSize", description = "每页显示数量")
    private Integer pageSize;

}
