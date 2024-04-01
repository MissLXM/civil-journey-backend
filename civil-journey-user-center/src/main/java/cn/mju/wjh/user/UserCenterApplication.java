package cn.mju.wjh.user;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

/**
 * ClassName: UserCenterApplication
 * Package: cn.mju.wjh.user
 * Description: 用户中心启动类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/5--19:50
 */
@SpringBootApplication
@EnableFeignClients(basePackages = "cn.mju.wjh.common.api")
@MapperScan(value = {"cn.mju.wjh.common.security.mapper", "cn.mju.wjh.user.mapper"})
@ComponentScan(value = {"cn.mju.wjh.user", "cn.mju.wjh.common.core" ,"cn.mju.wjh.common.security" ,"cn.mju.wjh.common.minio", "cn.mju.wjh.common.email", "cn.mju.wjh.common.api", "cn.mju.wjh.common.redis"})
public class UserCenterApplication {
    public static void main(String[] args) {
        SpringApplication.run(UserCenterApplication.class, args);
    }
}
