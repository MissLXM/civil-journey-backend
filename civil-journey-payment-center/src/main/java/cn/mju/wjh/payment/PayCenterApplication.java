package cn.mju.wjh.payment;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

/**
 * ClassName: PayCenterApplication
 * Package: cn.mju.wjh.payment.centres
 * Description: 支付中心启动类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/5--19:45
 */
@SpringBootApplication
@EnableFeignClients(basePackages = "cn.mju.wjh.common.api")
@MapperScan(value = {"cn.mju.wjh.common.security.mapper", "cn.mju.wjh.payment.mapper"})
@ComponentScan(value = {"cn.mju.wjh.payment", "cn.mju.wjh.common.core" ,"cn.mju.wjh.common.security" ,"cn.mju.wjh.common.minio", "cn.mju.wjh.common.api"})
public class PayCenterApplication {
    public static void main(String[] args) {
        SpringApplication.run(PayCenterApplication.class, args);
    }
}
