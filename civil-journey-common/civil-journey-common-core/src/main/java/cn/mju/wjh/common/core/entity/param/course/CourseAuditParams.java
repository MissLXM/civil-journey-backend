package cn.mju.wjh.common.core.entity.param.course;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * ClassName: CourseAuditParams
 * Package: cn.mju.wjh.common.core.entity.param.course
 * Description: 课程审核参数
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/24--19:46
 */
@Data
@Schema(name = "CourseAuditParams", description = "课程审核参数")
public class CourseAuditParams {

    @NotNull
    @Schema(name = "courseId", description = "课程ID")
    private Long courseId;

    @Schema(name = "auditFailureReason", description = "审核失败原因")
    private String auditFailureReason;
}
