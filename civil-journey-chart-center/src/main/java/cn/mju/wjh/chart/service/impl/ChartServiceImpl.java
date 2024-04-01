package cn.mju.wjh.chart.service.impl;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.CircleCaptcha;
import cn.hutool.core.lang.ObjectId;
import cn.hutool.core.util.ObjectUtil;
import cn.mju.wjh.chart.service.ChartService;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.utils.Result;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * ClassName: ChartServiceImpl
 * Package: cn.mju.wjh.chart.service.impl
 * Description: 图表服务实现
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/9--23:44
 */
@Service
public class ChartServiceImpl implements ChartService {

    @Setter(onMethod_ = @Autowired)
    private StringRedisTemplate redisTemplate;

    /**
     * 获取验证码
     * @return 验证码
     */
    @Override
    public Result getVerCode() {
        // 生成验证码
        CircleCaptcha captcha = CaptchaUtil.createCircleCaptcha(105, 40, 6, 20);
        System.out.println(captcha.getCode());

        // 生成验证码凭证
        String captchaVoucher = ObjectId.next();

        // 将验证码存入redis中(2分钟过期)
        redisTemplate.opsForValue().set(UseConstant.LOGIN_CODE + captchaVoucher, captcha.getCode(), 2, TimeUnit.MINUTES);

        if (ObjectUtil.isEmpty(captcha)) {
            return Result.fail().message("操作失败");
        }

        // 将封装验证码图和验证码凭证
        Map<String, String> codeMap = new HashMap<>();
        codeMap.put("captchaVoucher", captchaVoucher);
        codeMap.put("captchaImage", captcha.getImageBase64());

        // 返回
        return Result.ok(codeMap).message("操作成功");
    }
}
