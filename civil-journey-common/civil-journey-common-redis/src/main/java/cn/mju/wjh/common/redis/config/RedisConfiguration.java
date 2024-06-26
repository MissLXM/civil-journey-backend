package cn.mju.wjh.common.redis.config;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsontype.impl.LaissezFaireSubTypeValidator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

/**
 * ClassName: RedisConfiguration
 * Package: cn.mju.wjh.common.redis.config
 * Description: Redis配置类
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/18--10:15
 */
@Configuration
public class RedisConfiguration {

    @Bean
    @Primary
    public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory factory) {
        RedisTemplate<String, Object> template = new RedisTemplate<>();
        template.setConnectionFactory(factory);
        // 配置键的字符串序列化解析器
        template.setKeySerializer(new StringRedisSerializer());
        // 配置值的对象序列化解析器
        template.setValueSerializer(valueSerializer());
        template.afterPropertiesSet();
        return template;
    }

    private RedisSerializer<Object> valueSerializer() {
        // 对值的对象解析器的一些具体配置
        Jackson2JsonRedisSerializer<Object> serializer = new Jackson2JsonRedisSerializer<>(Object.class);
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        objectMapper.activateDefaultTyping(
                LaissezFaireSubTypeValidator.instance, ObjectMapper.DefaultTyping.NON_FINAL);
        serializer.setObjectMapper(objectMapper);
        return serializer;
    }

}
