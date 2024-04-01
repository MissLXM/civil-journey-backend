package cn.mju.wjh.payment.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.mju.wjh.common.api.client.CourseClient;
import cn.mju.wjh.common.core.entity.param.pay.OrderQueryParams;
import cn.mju.wjh.common.core.entity.pojo.course.CivilCourse;
import cn.mju.wjh.common.core.entity.pojo.payment.CivilOrder;
import cn.mju.wjh.common.core.enums.HttpStatus;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.minio.utils.MinioUtil;
import cn.mju.wjh.common.security.utils.StpUserUtils;
import cn.mju.wjh.payment.mapper.CivilOrderMapper;
import cn.mju.wjh.payment.service.PayService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClassName: PayServiceImpl
 * Package: cn.mju.wjh.payment.service.impl
 * Description: 支付服务实现
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/1--15:40
 */
@Service
public class PayServiceImpl implements PayService {

    @Setter(onMethod_ = @Autowired)
    private MinioUtil minioUtil;

    @Setter(onMethod_ = @Autowired)
    private CourseClient courseClient;

    @Setter(onMethod_ = @Autowired)
    private CivilOrderMapper orderMapper;


    /**
     * 支付--获取所有订单
     * @return 所有订单
     */
    @Override
    public Result queryPayOrderInfo() {
        // 根据当前登录用户查询订单信息
        List<CivilOrder> ordersList = orderMapper.selectList(
                new LambdaQueryWrapper<CivilOrder>()
                        .eq(CivilOrder::getUserId, Long.valueOf(StpUserUtils.getLoginId().toString()))
                        .orderByDesc(CivilOrder::getTradeTime)
        );

        // 判空
        if (ordersList.size() == 0) {
            return Result.fail().message("未查询到相关信息").code(HttpStatus.NOT_FOUND.getCode());
        }

        // 将图片封装
        ordersList = ordersList.stream().peek(
                order -> {
                    order.setUseFreeNumber(null);
                    order.setCourseImage(minioUtil.preview(order.getCourseImage()));
                }
        ).toList();

        return Result.ok(ordersList).message("操作成功");
    }

    /**
     * 支付--是否已经存在订单
     * @param courseId 课程ID
     * @return 是否存在
     */
    @Override
    public Result isPayCourse(Long courseId) {
        if (orderMapper.selectCount(
                new LambdaQueryWrapper<CivilOrder>()
                        .eq(CivilOrder::getStatus, (byte) 1)
                        .eq(CivilOrder::getCourseId, courseId)
                        .eq(CivilOrder::getUserId, Long.valueOf(StpUserUtils.getLoginId().toString()))
        ) > 0) {
            return Result.ok().message("已购买课程");
        }

        // 获取课程发布者信息
        String jsonString = JSON.toJSONString(courseClient.queryCourseInfoByClient(courseId).getData());
        CivilCourse course = JSONObject.parseObject(jsonString, CivilCourse.class);

        boolean isSelf = course.getUserId().equals(Long.valueOf(StpUserUtils.getLoginId().toString()));

        return Result.fail(isSelf).message("未购买课程").code(HttpStatus.NOT_FOUND.getCode());
    }

    /**
     * 管理员--查看所有订单
     * @param orderQueryParams 订单查询参数
     * @return 所有订单
     */
    @Override
    public Result queryAllOrder(OrderQueryParams orderQueryParams) {
        LambdaQueryWrapper<CivilOrder> wrapper = new LambdaQueryWrapper<>();

        // 设置条件
        if (ObjectUtil.isNotEmpty(orderQueryParams.getOrderId())) {
            wrapper.like(CivilOrder::getOrderId, orderQueryParams.getOrderId());
        }

        if (ObjectUtil.isNotEmpty(orderQueryParams.getConsignee())) {
            wrapper.like(CivilOrder::getConsignee, orderQueryParams.getConsignee());
        }

        wrapper.orderByDesc(CivilOrder::getTradeTime);

        // 查询
        IPage<CivilOrder> orderIpage = orderMapper.selectPage(
                new Page<>(orderQueryParams.getCurrentPage(), orderQueryParams.getPageSize()),
                wrapper
        );

        // 判空
        if (orderIpage.getSize() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        // 封装
        orderIpage.setRecords(
                orderIpage.getRecords().stream().peek(
                        order -> order.setCourseImage(minioUtil.preview(order.getCourseImage()))
                ).toList()
        );

        return Result.ok(orderIpage).message("操作失败");
    }

}
