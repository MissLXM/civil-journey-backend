package cn.mju.wjh.common.minio.config;

import io.minio.MinioClient;
import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * ClassName: MinioConfig
 * Package: cn.mju.wjh.minio.config
 * Description: MinIO配置类
 * 直接访问的地址 - http://ip:9000/civil-journey-project/文件路径
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/12--15:12
 */
@Data
@Configuration
public class MinioConfig {

    @Value("${minio.endpoint}")
    private String endpoint;

    @Value("${minio.bucketName}")
    private String bucketName;

    @Value("${minio.accessKey}")
    private String accessKey;

    @Value("${minio.secretKey}")
    private String secretKey;

    @Bean
    public MinioClient minioClient() {
        return MinioClient.builder()
                // 服务地址
                .endpoint(endpoint)
                // 用户账号密码
                .credentials(accessKey, secretKey)
                .build();
    }
}