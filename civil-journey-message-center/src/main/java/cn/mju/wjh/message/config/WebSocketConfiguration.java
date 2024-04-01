package cn.mju.wjh.message.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

/**
 * ClassName: WebSocketConfiguration
 * Package: cn.mju.wjh.message.config
 * Description: WebSocket配置类
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/18--10:26
 */
@Configuration
public class WebSocketConfiguration {

    @Bean
    public ServerEndpointExporter serverEndpointExporter(){
        return new ServerEndpointExporter();
    }

}
