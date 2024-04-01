package cn.mju.wjh.common.core.entity.param.course;

import cn.mju.wjh.common.core.entity.param.PageParams;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * ClassName: CourseQueryParams
 * Package: cn.mju.wjh.common.core.entity.param.course
 * Description: 课程查询参数
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/13--18:07
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Schema(name = "CourseQueryParams", description = "课程查询参数")
public class CourseQueryParams extends PageParams {

    @Schema(name = "categoryId", description = "分类ID")
    private Long categoryId;

    @Schema(name = "courseName", description = "课程名称")
    private String courseName;

    @Schema(name = "creatorName", description = "发布者")
    private String creatorName;

    @Schema(name = "status", description = "状态")
    private Byte status;

}
