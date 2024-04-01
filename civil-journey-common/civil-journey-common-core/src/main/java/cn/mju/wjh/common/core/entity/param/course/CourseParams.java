package cn.mju.wjh.common.core.entity.param.course;

import cn.mju.wjh.common.core.entity.param.PageParams;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * ClassName: CourseParams
 * Package: cn.mju.wjh.common.core.entity.param.course
 * Description: 课程查询参数
 *
 * @Author:wjh
 * @Create:2024-01-2024/1/28--14:09
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Schema(name = "CourseParams", description = "课程查询参数")
public class CourseParams extends PageParams {

    @Schema(name = "zoneId",description = "专区ID")
    private Long zoneId;

    @Schema(name = "sortId",description = "排序ID")
    private Long sortId;

    @Schema(name = "categoryId",description = "分类ID")
    private Long categoryId;

    @Schema(name = "courseId",description = "课程ID")
    private Long courseId;

    @Schema(name = "courseName",description = "课程名称")
    private String courseName;
}
