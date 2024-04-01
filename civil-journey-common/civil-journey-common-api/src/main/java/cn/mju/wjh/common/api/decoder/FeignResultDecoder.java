package cn.mju.wjh.common.api.decoder;

import cn.mju.wjh.common.core.utils.Result;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import feign.FeignException;
import feign.Response;
import feign.Util;
import feign.codec.DecodeException;
import feign.codec.Decoder;
import io.micrometer.common.util.StringUtils;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.lang.reflect.Type;

/**
 * ClassName: FeignResultDecoder
 * Package: cn.mju.wjh.common.api.decoder
 * Description: 处理JSON格式数据
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/24--20:56
 */
@Component
public class FeignResultDecoder implements Decoder {

    @Override
    public Object decode(Response response, Type type) throws IOException, FeignException {
        if (response.body() == null) {
            throw new DecodeException(response.status(), "没有返回有效的数据", response.request());
        }
        String bodyStr = Util.toString(response.body().asReader(Util.UTF_8));
        if(StringUtils.isNotEmpty(bodyStr)){
            //对结果进行转换
            return FeignResultDecoder.<Result>json2obj(bodyStr, type);
        }
        return null;
    }

    public static <T> T json2obj(String jsonStr, Type targetType) {
        try {
            JavaType javaType = TypeFactory.defaultInstance().constructType(targetType);
            return new ObjectMapper().readValue(jsonStr, javaType);
        } catch (IOException e) {
            throw new IllegalArgumentException("将JSON转换为对象时发生错误:" + jsonStr, e);
        }
    }

}