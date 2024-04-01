package cn.mju.wjh.common.core.entity.pojo.notice;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serial;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

/**
 * ClassName: NoticeUser
 * Package: cn.mju.wjh.common.core.entity.pojo.notice
 * Description: 用户通知表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/7--14:50
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("notice_user")
@Schema(name = "NoticeUser", description = "用户通知表")
public class NoticeUser implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "notice_user_id", type = IdType.AUTO)
    @Schema(name = "noticeUserId", description = "用户通知ID")
    private Long noticeUserId;

    @TableField(value = "notice_title")
    @Schema(name = "noticeTitle", description = "通知标题")
    private String noticeTitle;

    @TableField(value = "notice_type")
    @Schema(name = "noticeType", description = "通知类型(系统通知、邮箱通知)")
    private String noticeType;

    @TableField(value = "notice_content")
    @Schema(name = "noticeContent", description = "通知内容")
    private String noticeContent;

    @TableField(value = "sender_id")
    @Schema(name = "senderId", description = "通知者ID")
    private Long senderId;

    @TableField(value = "sender_name")
    @Schema(name = "senderName", description = "通知者姓名")
    private String senderName;

    @TableField(value = "sender_avatar")
    @Schema(name = "senderAvatar", description = "通知者头像")
    private String senderAvatar;

    @TableField(exist = false)
    @Schema(name = "senderIds", description = "接收者ID集合")
    private List<Long> accepter;

    @TableField(value = "accept_id")
    @Schema(name = "acceptId", description = "接收者ID")
    private Long acceptId;

    @TableField(exist = false)
    @Schema(name = "acceptName", description = "接收者姓名")
    private String acceptName;

    @TableField(exist = false)
    @Schema(name = "acceptEmail", description = "接收者邮箱")
    private String acceptEmail;

    @TableField(exist = false)
    @Schema(name = "acceptAvatar", description = "接收者头像")
    private String acceptAvatar;

    @TableField(value = "create_time")
    @Schema(name = "createTime", description = "发送时间")
    @JsonFormat(pattern = "yyyy年MM月dd日 HH:mm",timezone = "GMT-8")
    private Timestamp createTime;

    @TableField(value = "state")
    @Schema(name = "state", description = "状态(0:未读、1:已读)")
    private Byte state;

}
