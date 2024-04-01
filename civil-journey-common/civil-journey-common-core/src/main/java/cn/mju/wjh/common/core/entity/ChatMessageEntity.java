package cn.mju.wjh.common.core.entity;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

/**
 * ClassName: ChatMessageEntity
 * Package: cn.mju.wjh.message.entity
 * Description: 聊天消息实体类
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/15--11:20
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatMessageEntity {

    @Schema(name = "senderId", description = "发送者ID")
    private String senderId;

    @Schema(name = "senderRole", description = "发送者角色")
    private String senderRole;

    @Schema(name = "acceptId", description = "接收者ID")
    private String acceptId;

    @Schema(name = "acceptRole", description = "接收者角色")
    private String acceptRole;

    @Schema(name = "message", description = "消息内容")
    private String message;

    @Schema(name = "time", description = "发送时间")
    private Date time;
}
