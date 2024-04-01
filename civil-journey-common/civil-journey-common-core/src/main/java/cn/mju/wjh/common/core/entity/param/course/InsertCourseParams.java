package cn.mju.wjh.common.core.entity.param.course;

import cn.mju.wjh.common.core.entity.pojo.video.CivilVideo;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.List;

/**
 * ClassName: InsertCourseParams
 * Package: cn.mju.wjh.common.core.entity.param.course
 * Description: 创建课程参数
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/2--22:06
 */
@Data
@Schema(name = "InsertCourseParams", description = "创建课程参数")
public class InsertCourseParams {

    @NotBlank
    @Schema(name = "courseName", description = "课程名称")
    private String courseName;

    @NotBlank
    @Schema(name = "courseImage", description = "课程封面")
    private String courseImage;

    @NotBlank
    @Schema(name = "courseDescription", description = "课程描述")
    private String courseDescription;

    @NotNull
    @Schema(name = "categoryId", description = "课程类别")
    private Long categoryId;

    @NotBlank
    @Schema(name = "categoryName", description = "分类名称")
    private String categoryName;

    @Schema(name = "payMoney", description = "购买金额")
    private Double payMoney;

    @NotNull
    @Schema(name = "videoList", description = "视频信息集合")
    private List<CivilVideo> videoList;
}
