package cn.mju.wjh.message.server;

import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.redis.util.RedisUtil;
import cn.mju.wjh.common.core.entity.ChatMessageEntity;
import cn.mju.wjh.message.config.CustomSpringConfigurator;
import com.alibaba.fastjson.JSONObject;
import jakarta.websocket.*;
import jakarta.websocket.server.PathParam;
import jakarta.websocket.server.ServerEndpoint;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * ClassName: WebSocketServer
 * Package: cn.mju.wjh.message.server
 * Description: WebSocket服务器配置
 * ws://127.0.0.1:8000/chat-center-service/websocket/admin/1
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/15--11:40
 */
@Slf4j
@Component
@ServerEndpoint(
        value = "/websocket/{role}/{userId}",
        configurator = CustomSpringConfigurator.class
)
public class WebSocketServer {

    // 会话
    private Session session;

    // redis操作
    @Setter(onMethod_ = @Autowired)
    private RedisUtil redisUtil;

    // 存储所有的用户连接
    private static final Map<String, Session> WEBSOCKET_MAP = new ConcurrentHashMap<>();


    @OnOpen
    public void onOpen(@PathParam("role") String role, @PathParam("userId") Long userId, Session session) {
        this.session = session;

        String id = null;
        // 根据角色查询不同表
        if ("user".equals(role)) {
            id = UseConstant.USER_CONSTANT + UseConstant.COLON_CONSTANT + userId;
        }

        if ("admin".equals(role)) {
            id = UseConstant.ADMIN_REAL_CONSTANT + UseConstant.COLON_CONSTANT + userId;
        }

        if (id != null) {
            // "admin: id" or "user: id"
            WEBSOCKET_MAP.put(id, session);
        }
    }

    @OnMessage
    public void onMessage(String message) throws IOException {

        log.info("收到消息：" + message);
        // 将消息转为实体
        ChatMessageEntity chatMessageEntity = JSONObject.parseObject(message, ChatMessageEntity.class);
        log.info("收到消息：" + chatMessageEntity);

        String key = null;
        if ("admin".equals(chatMessageEntity.getSenderRole())) {
            key = Stream.of(
                            chatMessageEntity.getSenderRole() + UseConstant.COLON_CONSTANT + chatMessageEntity.getSenderId(),
                            chatMessageEntity.getAcceptRole() + UseConstant.COLON_CONSTANT + chatMessageEntity.getAcceptId()
                    )
                    .sorted()
                    .collect(Collectors.joining(UseConstant.ROD_CONSTANT));
        } else if ("user".equals(chatMessageEntity.getSenderRole())) {
            key = Stream.of(
                            chatMessageEntity.getAcceptRole() + UseConstant.COLON_CONSTANT + chatMessageEntity.getAcceptId(),
                            chatMessageEntity.getSenderRole() + UseConstant.COLON_CONSTANT + chatMessageEntity.getSenderId()
                    )
                    .sorted()
                    .collect(Collectors.joining(UseConstant.ROD_CONSTANT));
        }

        log.info("key: " + key);
        // 将信息存储到 redis 中
        redisUtil.set(key, chatMessageEntity);
        // 如果用户在线就将信息发送给指定用户
        if (WEBSOCKET_MAP.get(chatMessageEntity.getAcceptRole() + UseConstant.COLON_CONSTANT + chatMessageEntity.getAcceptId()) != null) {
            WEBSOCKET_MAP.get(chatMessageEntity.getAcceptRole() + UseConstant.COLON_CONSTANT + chatMessageEntity.getAcceptId())
                    .getBasicRemote().sendText(String.valueOf(message));
        }
    }

    @OnClose
    public void onClose() {
        // 用户退出时，从 map 中删除信息
        for (Map.Entry<String, Session> entry : WEBSOCKET_MAP.entrySet()) {
            if (this.session.getId().equals(entry.getValue().getId())) {
                WEBSOCKET_MAP.remove(entry.getKey());
                return;
            }
        }
    }

    @OnError
    public void onError(Throwable error) {
        error.printStackTrace();
    }

}

