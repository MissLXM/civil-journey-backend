package cn.mju.wjh.auth;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * ClassName: AuthCenterApplication
 * Package: cn.mju.wjh.auth
 * Description: 认证中心启动类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/8--14:56
 */
@SpringBootApplication
@MapperScan(value = {"cn.mju.wjh.common.security.mapper"})
@ComponentScan(value = {"cn.mju.wjh.auth", "cn.mju.wjh.common.core", "cn.mju.wjh.common.security", "cn.mju.wjh.common.email", "cn.mju.wjh.common.minio"})
public class AuthCenterApplication {

    public static void main(String[] args) {
        SpringApplication.run(AuthCenterApplication.class, args);
    }
}
