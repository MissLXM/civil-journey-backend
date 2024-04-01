package cn.mju.wjh.article;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

/**
 * ClassName: ArticleCenterApplication
 * Package: cn.mju.wjh.article
 * Description: 文章中心模块
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/5--19:55
 */
@SpringBootApplication
@EnableFeignClients(basePackages = "cn.mju.wjh.common.api")
@MapperScan(value = {"cn.mju.wjh.common.security.mapper", "cn.mju.wjh.article.mapper"})
@ComponentScan(value = {"cn.mju.wjh.article", "cn.mju.wjh.common.core", "cn.mju.wjh.common.security", "cn.mju.wjh.common.api" ,"cn.mju.wjh.common.minio"})
public class ArticleCenterApplication {
    public static void main(String[] args) {
        SpringApplication.run(ArticleCenterApplication.class, args);
    }
}
