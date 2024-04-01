package cn.mju.wjh.message.config;

import jakarta.validation.constraints.NotNull;
import jakarta.websocket.server.ServerEndpointConfig;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * ClassName: CustomSpringConfigurator
 * Package: cn.mju.wjh.message.config
 * Description: 上下文配置
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/18--17:43
 */
public class CustomSpringConfigurator extends ServerEndpointConfig.Configurator implements ApplicationContextAware {

    private static volatile BeanFactory context;

    @Override
    public <T> T getEndpointInstance(Class<T> clazz) {
        return context.getBean(clazz);
    }

    @Override
    public void setApplicationContext(@NotNull ApplicationContext applicationContext) throws BeansException {
        CustomSpringConfigurator.context = applicationContext;
    }

}

