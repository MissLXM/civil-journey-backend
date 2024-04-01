package cn.mju.wjh.chart;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

/**
 * ClassName: ChartCenterApplication
 * Package: cn.mju.wjh.chart
 * Description: 图表中心启动类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/5--20:25
 */
@SpringBootApplication
@EnableFeignClients(basePackages = "cn.mju.wjh.common.api")
@MapperScan(value = {"cn.mju.wjh.common.security.mapper", "cn.mju.wjh.chart.mapper"})
@ComponentScan(value = {"cn.mju.wjh.chart", "cn.mju.wjh.common.core" ,"cn.mju.wjh.common.security" ,"cn.mju.wjh.common.minio", "cn.mju.wjh.common.api"})
public class ChartCenterApplication {
    public static void main(String[] args) {
        SpringApplication.run(ChartCenterApplication.class, args);
    }
}
