package cn.mju.wjh.common.core.entity.pojo.user;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serial;
import java.io.Serializable;

/**
 * ClassName: TeacherAudit
 * Package: cn.mju.wjh.common.core.entity.pojo
 * Description: 讲师申请表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/6--20:14
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("teacher_audit")
@Schema(name = "TeacherAudit", description = "讲师申请表")
public class TeacherAudit implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "teacher_audit_id", type = IdType.AUTO)
    @Schema(name = "teacherAuditId", description = "讲师申请ID")
    private Long teacherAuditId;

    @TableField(value = "user_id")
    @Schema(name = "userId", description = "用户ID")
    private Long userId;

    @NotBlank
    @TableField(value = "certificate_photo")
    @Schema(name = "certificatePhoto", description = "教资证书照片")
    private String certificatePhoto;

    @NotBlank
    @TableField(value = "certificate_number")
    @Schema(name = "certificateNumber", description = "教资证书编号")
    private String certificateNumber;

    @NotBlank
    @TableField(value = "teacher_introduction")
    @Schema(name = "teacherIntroduction", description = "讲师个人简介")
    private String teacherIntroduction;

    @TableField(value = "audit_failure_reason")
    @Schema(name = "auditFailureReason", description = "审核失败原因")
    private String auditFailureReason;

    @TableField(value = "status")
    @Schema(name = "status", description = "审核状态(0:待审核、1:审核成功、2:审核失败)")
    private Byte status;
}
