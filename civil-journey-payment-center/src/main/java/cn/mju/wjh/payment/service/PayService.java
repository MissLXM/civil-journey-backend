package cn.mju.wjh.payment.service;

import cn.mju.wjh.common.core.entity.param.pay.OrderQueryParams;
import cn.mju.wjh.common.core.utils.Result;

/**
 * ClassName: PayService
 * Package: cn.mju.wjh.payment.service
 * Description: 支付服务接口
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/1--15:40
 */
public interface PayService {

    /**
     * 支付--获取所有订单
     * @return 所有订单
     */
    Result queryPayOrderInfo();

    /**
     * 支付--是否已经存在订单
     * @param courseId 课程ID
     * @return 是否存在
     */
    Result isPayCourse(Long courseId);

    /**
     * 管理员--查看所有订单
     * @param orderQueryParams 订单查询参数
     * @return 所有订单
     */
    Result queryAllOrder(OrderQueryParams orderQueryParams);

    /**
     * 支付--删除指定订单
     * @param orderId 订单编号
     * @return 是否操作成功
     */
    Result deleteOrder(Long orderId);
}
