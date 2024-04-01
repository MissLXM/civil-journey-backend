package cn.mju.wjh.common.core.utils;

import lombok.extern.slf4j.Slf4j;

import java.io.*;
import java.net.*;

/**
 * ClassName: HttpUtils
 * Package: cn.mju.wjh.common.core.utils
 * Description: 通用Http发送方法类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/13--13:31
 */
@Slf4j
public class HttpUtils {

    /**
     * 向指定 URL 发送GET方法的请求
     * @param url 发送请求的 URL
     * @param param 请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @param contentType 编码类型
     * @return 所代表远程资源的响应结果
     */
    public static String sendGet(String url, String param, String contentType) {
        StringBuilder result = new StringBuilder();
        BufferedReader in = null;
        try {
            // 拼接请求地址
            String urlNameString = StringUtils.isNotBlank(param) ? url + "?" + param : url;
            log.info("请求的地址 -> {}", urlNameString);

            // 发送请求
            URL realUrl = new URL(urlNameString);
            HttpURLConnection connection = (HttpURLConnection) realUrl.openConnection();
            connection.setRequestMethod("GET");
            connection.connect();

            // 获取请求结果
            in = new BufferedReader(new InputStreamReader(connection.getInputStream(), contentType));
            String line;
            while ((line = in.readLine()) != null) {
                result.append(line);
            }

            // 断掉连接
            in.close();
            connection.disconnect();
            log.info("结果 -> {}", result);
        }
        catch (ConnectException e) {
            log.error("调用HttpUtils.sendGet ConnectException, url=" + url + ",param=" + param, e);
        }
        catch (SocketTimeoutException e) {
            log.error("调用HttpUtils.sendGet SocketTimeoutException, url=" + url + ",param=" + param, e);
        }
        catch (IOException e) {
            log.error("调用HttpUtils.sendGet IOException, url=" + url + ",param=" + param, e);
        }
        catch (Exception e) {
            log.error("调用HttpsUtil.sendGet Exception, url=" + url + ",param=" + param, e);
        }
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            }
            catch (Exception ex) {
                log.error("调用in.close Exception, url=" + url + ",param=" + param, ex);
            }
        }
        return result.toString();
    }


}
