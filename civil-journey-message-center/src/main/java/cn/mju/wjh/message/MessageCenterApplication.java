package cn.mju.wjh.message;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

/**
 * ClassName: MessageCenterApplication
 * Package: cn.mju.wjh.message
 * Description: 消息中心启动类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/5--20:33
 */
@SpringBootApplication
@EnableFeignClients(basePackages = "cn.mju.wjh.common.api")
@MapperScan(value = {"cn.mju.wjh.message.mapper", "cn.mju.wjh.common.security.mapper"})
@ComponentScan(value = {"cn.mju.wjh.message", "cn.mju.wjh.common.core", "cn.mju.wjh.common.security","cn.mju.wjh.common.minio", "cn.mju.wjh.common.api", "cn.mju.wjh.common.redis"})
public class MessageCenterApplication {
    public static void main(String[] args) {
        SpringApplication.run(MessageCenterApplication.class, args);
    }
}
