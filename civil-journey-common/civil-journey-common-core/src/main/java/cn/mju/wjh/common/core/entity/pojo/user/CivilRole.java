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
 * ClassName: CivilRole
 * Package: cn.mju.wjh.common.core.domain.pojo
 * Description: 角色表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/6--19:34
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("civil_role")
@Schema(name = "CivilRole", description = "角色表")
public class CivilRole implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "role_id", type = IdType.AUTO)
    @Schema(name = "roleId",description = "角色ID")
    private Long roleId;

    @TableField(value = "role_name")
    @Schema(name = "roleName",description = "角色名称")
    private String roleName;

    @TableField(value = "role_code")
    @Schema(name = "roleCode",description = "角色编码")
    private String roleCode;

    @TableField(value = "role_describe")
    @Schema(name = "roleDescribe",description = "角色描述")
    private String roleDescribe;

    @TableField(value = "creator")
    @Schema(name = "creator",description = "创建者")
    private String creator;

    @TableField(value = "updater")
    @Schema(name = "updater",description = "更新者")
    private String updater;

    @TableField(value = "create_time")
    @Schema(name = "createTime",description = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT-8")
    private Timestamp createTime;

    @TableField(value = "update_time")
    @Schema(name = "updateTime",description = "更新时间")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT-8")
    private Timestamp updateTime;

}
