package cn.mju.wjh.common.core.utils;


import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.exception.AddressException;
import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * ClassName: AddressUtils
 * Package: cn.mju.wjh.common.core.utils
 * Description: 真实地址工具类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/13--13:20
 */
@Slf4j
public class AddressUtils {

    // IP地址查询
    public static final String IP_URL = "http://whois.pconline.com.cn/ipJson.jsp";

    // 未知地址
    public static final String UNKNOWN = "XX XX";

    /**
     * 获取IP真实地址
     * @param ip 本地ip地址
     * @return 真实地址
     */
    public static String getRealAddressByIp(String ip) {
        try {
            // 发送请求获取真实地址
            String ipAddress = HttpUtils.sendGet(IP_URL, "ip=" + ip + "&json=true", UseConstant.GBK);
            if (StringUtils.isEmpty(ipAddress)) {
                log.error("获取地理位置异常 {}", ip);
                return UNKNOWN;
            }

            // 拼接真实地址(省、市)
            JSONObject obj = JSONObject.parseObject(ipAddress);
            String region = obj.getString("pro");
            String city = obj.getString("city");
            return String.format("%s %s", region, city);
        }
        catch (Exception e) {
            log.error("获取地理位置异常 {}", e.getMessage());
        }
        return UNKNOWN;
    }

    /**
     * 获取IP地址
     * @param ip 本地ip地址
     * @return ip地址
     */
    public static String getRealIp(String ip) {
        try {
            // 发送请求获取真实地址
            String ipAddress = HttpUtils.sendGet(IP_URL, "ip=" + ip + "&json=true", UseConstant.GBK);
            if (StringUtils.isEmpty(ipAddress)) {
                log.error("获取IP异常 {}", ip);
                return UNKNOWN;
            }

            // 拼接真实地址(省、市)
            return JSONObject.parseObject(ipAddress).getString("ip");
        }
        catch (Exception e) {
            log.error("获取IP异常 {}", e.getMessage());
        }
        return UNKNOWN;
    }

    public static Map<String, String> getIp(String ip) {
        Map<String, String> map = new HashMap<>();
        try {
            // 发送请求获取真实地址
            String ipAddress = HttpUtils.sendGet(IP_URL, "ip=" + ip + "&json=true", UseConstant.GBK);
            if (StringUtils.isEmpty(ipAddress)) {
                log.error("获取IP异常 {}", ip);
                throw new AddressException("获取地址异常");
            }

            map.put("ipAddress", JSONObject.parseObject(ipAddress).getString("ip"));

            JSONObject obj = JSONObject.parseObject(ipAddress);
            String region = obj.getString("pro");
            String city = obj.getString("city");
            map.put("realArea", String.format("%s %s", region, city));

            return map;
        }
        catch (Exception e) {
            log.error("获取IP异常 {}", e.getMessage());
            throw new AddressException("获取地址异常");
        }
    }
}
