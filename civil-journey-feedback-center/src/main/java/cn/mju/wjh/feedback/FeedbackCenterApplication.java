package cn.mju.wjh.feedback;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
/**
 * ClassName: FeedbackCenterApplication
 * Package: cn.mju.wjh.feedback
 * Description: 反馈中心启动类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/5--19:58
 */
@SpringBootApplication
@EnableFeignClients(basePackages = "cn.mju.wjh.common.api")
@MapperScan(value = {"cn.mju.wjh.feedback.mapper", "cn.mju.wjh.common.security.mapper"})
@ComponentScan(value = {"cn.mju.wjh.feedback", "cn.mju.wjh.common.core", "cn.mju.wjh.common.security", "cn.mju.wjh.common.api", "cn.mju.wjh.common.email", "cn.mju.wjh.common.minio"})
public class FeedbackCenterApplication {
    public static void main(String[] args) {
        SpringApplication.run(FeedbackCenterApplication.class, args);
    }
}
