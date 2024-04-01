package cn.mju.wjh.common.core.entity.pojo.user;

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

/**
 * ClassName: LoginLog
 * Package: cn.mju.wjh.common.core.entity.pojo
 * Description: 登录日志表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/6--20:05
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("login_log")
@Schema(name = "LoginLog", description = "登录日志表")
public class LoginLog implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "login_log_id", type = IdType.AUTO)
    @Schema(name = "loginLogId", description = "登录日志ID")
    private Long loginLogId;

    @TableField(value = "username")
    @Schema(name = "username", description = "登录名称")
    private String username;

    @TableField(value = "ip_address")
    @Schema(name = "ipAddress", description = "登录IP地址")
    private String ipAddress;

    @TableField(value = "ip_location")
    @Schema(name = "ipLocation", description = "登录的地区")
    private String ipLocation;

    @TableField(value = "login_type")
    @Schema(name = "loginType", description = "登录者(user、admin)")
    private String loginType;

    @TableField(value = "create_time")
    @Schema(name = "createTime", description = "登录的时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "UTF-8")
    private Timestamp createTime;
}
