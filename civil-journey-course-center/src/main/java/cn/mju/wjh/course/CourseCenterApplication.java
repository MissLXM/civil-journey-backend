package cn.mju.wjh.course;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

/**
 * ClassName: CourseCenterApplication
 * Package: cn.mju.wjh.course
 * Description: 课程中心启动类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/5--19:53
 */
@SpringBootApplication
@EnableFeignClients(basePackages = "cn.mju.wjh.common.api")
@MapperScan(value = {"cn.mju.wjh.course.mapper", "cn.mju.wjh.common.security.mapper"})
@ComponentScan(value = {"cn.mju.wjh.course", "cn.mju.wjh.common.core", "cn.mju.wjh.common.security", "cn.mju.wjh.common.minio", "cn.mju.wjh.common.api"})
public class CourseCenterApplication {
    public static void main(String[] args) {
        SpringApplication.run(CourseCenterApplication.class, args);
    }
}
