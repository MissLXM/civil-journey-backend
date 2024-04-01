package cn.mju.wjh.common.core.entity.param.pay;

import cn.mju.wjh.common.core.entity.param.PageParams;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * ClassName: OrderQueryParams
 * Package: cn.mju.wjh.common.core.entity.param.pay
 * Description: 订单查询参数
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/13--23:05
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Schema(name = "OrderQueryParams", description = "订单查询参数")
public class OrderQueryParams extends PageParams {

    @Schema(name = "orderId", description = "订单编号")
    private Long orderId;

    @Schema(name = "consignee", description = "收货人")
    private String consignee;
}
