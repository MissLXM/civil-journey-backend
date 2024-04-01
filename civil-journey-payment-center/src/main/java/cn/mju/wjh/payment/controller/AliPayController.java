package cn.mju.wjh.payment.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.json.JSONObject;
import cn.mju.wjh.common.api.client.CourseClient;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.pojo.course.CivilCourse;
import cn.mju.wjh.common.core.entity.pojo.payment.CivilOrder;
import cn.mju.wjh.common.core.entity.pojo.user.CivilUser;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.security.utils.LoginUserUtils;
import cn.mju.wjh.payment.config.AlipayConfiguration;
import cn.mju.wjh.payment.mapper.CivilOrderMapper;
import com.alibaba.fastjson.JSON;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * ClassName: AliPayController
 * Package: cn.mju.wjh.payment.controller
 * Description: 支付宝支付服务
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/19--10:28
 */
@RestController
@Tag(name = "支付宝支付服务")
@RequestMapping("/alipay")
public class AliPayController {

    @Setter(onMethod_ = @Autowired)
    private CourseClient courseClient;

    @Setter(onMethod_ = @Autowired)
    private CivilOrderMapper orderMapper;

    @Setter(onMethod_ = @Autowired)
    private LoginUserUtils userUtils;

    @Setter(onMethod_ = @Autowired)
    private AlipayConfiguration alipayConfiguration;


    /**
     * 打印参数
     * @param paramsMap 参数
     */
    private static void printParams(Map<String, String> paramsMap) {
        System.out.println("交易名称: " + paramsMap.get("subject"));
        System.out.println("交易状态: " + paramsMap.get("trade_status"));
        System.out.println("支付宝交易凭证号: " + paramsMap.get("trade_no"));
        System.out.println("商户订单号: " + paramsMap.get("out_trade_no"));
        System.out.println("交易金额: " + paramsMap.get("total_amount"));
        System.out.println("买家在支付宝唯一id: " + paramsMap.get("buyer_id"));
        System.out.println("买家付款时间: " + paramsMap.get("gmt_payment"));
        System.out.println("买家付款金额: " + paramsMap.get("buyer_pay_amount"));
    }

    @SaIgnore
    @GetMapping("/pay")
    @Operation(summary = "支付--支付宝支付", description = "支付宝支付功能")
    public void alipayPay(CivilOrder alipay, HttpServletResponse response) {

        // 初始化API调用实体
        AlipayClient alipayClient = new DefaultAlipayClient(
                alipayConfiguration.getGatewayUrl(),
                alipayConfiguration.getAppId(),
                alipayConfiguration.getAppPrivateKey(),
                alipayConfiguration.getForMat(),
                alipayConfiguration.getCharSet(),
                alipayConfiguration.getAlipayPublicKey(),
                alipayConfiguration.getSignType()
        );

        // 设置请求参数(异步请求和同步请求)
        AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();
        request.setNotifyUrl(alipayConfiguration.getNotifyUrl());
        request.setReturnUrl(alipayConfiguration.getReturnUrl());

        // 随即生成订单编号
        String outTraceNo;
        if (alipay.getOrderId() != null) {
            outTraceNo = alipay.getOrderId();
        } else {
            outTraceNo = String.valueOf((IdUtil.getSnowflake(1, 20).nextId()));
        }

        // JSON对象封装
        JSONObject bizContent = new JSONObject();
        bizContent.set("out_trade_no", outTraceNo);
        bizContent.set("subject", alipay.getSubject());
        bizContent.set("total_amount", alipay.getTradeAmount());
        bizContent.set("product_code", "FAST_INSTANT_TRADE_PAY");

        // 设置
        request.setBizContent(bizContent.toString());

        // 获取响应结果表单
        String from;
        try {
            from = alipayClient.pageExecute(request).getBody();
        } catch (AlipayApiException e) {
            throw new RuntimeException("获取表单异常");
        }

        // 封装数据插入数据库
        if (alipay.getOrderId() == null) {
            // 设置订单号
            alipay.setOrderId(outTraceNo);

            // 获取课程信息
            String jsonString = JSON.toJSONString(courseClient.queryCourseInfoByClient(alipay.getCourseId()).getData());
            CivilCourse course = com.alibaba.fastjson.JSONObject.parseObject(jsonString, CivilCourse.class);

            Long userId = alipay.getUserId();
            BeanUtil.copyProperties(course, alipay);
            alipay.setUserId(userId);
            alipay.setStatus((byte) 0);
            orderMapper.insert(alipay);

            // 删除用户次数
            CivilUser user = userUtils.getUserInfo(userId.toString());
            user.setFreeViewNumber(user.getFreeViewNumber() - alipay.getUseFreeNumber());
            userUtils.updateUserInfo(user);

        }



        // 利用流输出表单到页面
        response.setContentType(UseConstant.CONTENT_TYPE);
        try {
            response.getWriter().write(from);
            response.getWriter().flush();
            response.getWriter().close();
        } catch (IOException e) {
            throw new RuntimeException("表单输出异常");
        }
    }

    @SaIgnore
    @PostMapping("/notify")
    @Operation(summary = "支付--支付宝回调", description = "支付宝支付功能")
    public Result alipayNotify(HttpServletRequest request) throws AlipayApiException {
        // 支付失败返回
        if (!("TRADE_SUCCESS".equals(request.getParameter("trade_status")))) {
            return Result.fail().message("操作失败");
        }

        // 所需的参数
        Map<String, String> paramsMap = new HashMap<>();
        // 获取请求参数
        Map<String, String[]> requestParameterMap = request.getParameterMap();
        for (String key : requestParameterMap.keySet()) {
            paramsMap.put(key, request.getParameter(key));
        }

        String sign = paramsMap.get("sign");
        String content = AlipaySignature.getSignCheckContentV1(paramsMap);
        // 验证签名
        boolean checkSignature = AlipaySignature.rsa256CheckContent(content, sign,
                alipayConfiguration.getAlipayPublicKey(),
                alipayConfiguration.getCharSet()
            );

        if (!checkSignature) {
            return Result.fail().message("签名验证失败");
        }

        // 验签通过
        printParams(paramsMap);

        // 数据库操作
        CivilOrder order = orderMapper.selectById(paramsMap.get("out_trade_no"));
        order.setStatus((byte) 1);
        order.setTradeVoucher(paramsMap.get("trade_no"));
        orderMapper.updateById(order);

        return Result.ok().message("操作成功");
    }
}
