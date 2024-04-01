package cn.mju.wjh.common.redis.util;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * ClassName: RedisUtil
 * Package: cn.mju.wjh.common.redis
 * Description: Redis工具类
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/18--10:04
 */
@Component
public class RedisUtil {

    @Setter(onMethod_ = @Autowired)
    private RedisTemplate<String, Object> redisTemplate;

    public List<Object> get(String key) {
        // 获取信箱中所有的信息
        return redisTemplate.opsForList().range(key, 0, -1);
    }

    public void set(String key, Object value) {
        // 向正在发送信息的任意两人的信箱中中添加信息
        redisTemplate.opsForList().rightPush(key, value);
    }

}

