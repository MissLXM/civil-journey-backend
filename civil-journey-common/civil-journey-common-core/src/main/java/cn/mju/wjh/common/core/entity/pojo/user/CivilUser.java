package cn.mju.wjh.common.core.entity.pojo.user;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serial;
import java.io.Serializable;
import java.sql.Timestamp;

/**
 * ClassName: CivilUser
 * Package: cn.mju.wjh.common.core.entity.pojo
 * Description: 用户表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/6--20:01
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("civil_user")
@Schema(name = "CivilUser",description = "用户表")
public class CivilUser implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "user_id", type = IdType.AUTO)
    @Schema(name = "userId",description = "用户ID")
    private Long userId;

    @TableField(value = "username")
    @Schema(name = "username",description = "登录名称")
    private String username;

    @TableField(value = "password")
    // 格式化(当属性为null,不返回json数据)
    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "password",description = "登录密码")
    private String password;

    @TableField(value = "user_email")
    @Schema(name = "userEmail",description = "用户邮箱")
    private String userEmail;

    @TableField(value = "nickname")
    @Schema(name = "nickname",description = "用户昵称")
    private String nickname;

    @Size(min = 1, max = 80)
    @TableField(value = "signature")
    @Schema(name = "signature",description = "个性签名")
    private String signature;


    @TableField(value = "gender")
    @Schema(name = "gender",description = "用户性别")
    private String gender;

    @TableField(value = "head_portrait")
    @Schema(name = "headPortrait",description = "用户头像")
    private String headPortrait;

    @TableField(value = "free_view_number")
    @Schema(name = "freeViewNumber",description = "免费次数")
    private Integer freeViewNumber;

    @TableField(value = "create_time")
    @Schema(name = "createTime",description = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT-8")
    private Timestamp createTime;

    @TableField(value = "is_delete")
    @Schema(name = "isDelete",description = "是否删除(0:正常、1:禁用、2:删除)")
    private Byte isDelete;
}