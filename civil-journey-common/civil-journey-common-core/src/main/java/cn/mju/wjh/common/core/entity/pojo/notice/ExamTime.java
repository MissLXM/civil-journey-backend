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

/**
 * ClassName: ExamTime
 * Package: cn.mju.wjh.common.core.entity.pojo.notice
 * Description: 考试时间表实体类
 *
 * @Author:wjh
 * @Create:2024-01-2024/1/14--16:17
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("exam_time")
@Schema(name = "ExamTime", description = "考试时间表")
public class ExamTime implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;


    @TableId(value = "exam_time_id", type = IdType.AUTO)
    @Schema(name = "examTimeId", description = "考试时间ID")
    private Long examTimeId;

    @TableField(value = "exam_year")
    @Schema(name = "examYear", description = "考试年份")
    private String examYear;

    @TableField(value = "exam_province")
    @Schema(name = "examProvince", description = "考试省份")
    private String examProvince;

    @TableField(value = "exam_type")
    @Schema(name = "examType", description = "考试类型(国考、省考)")
    private String examType;

    @TableField(value = "apply_time")
    @Schema(name = "applyTime", description = "报名时间")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT-8")
    private Timestamp applyTime;

    @TableField(value = "exam_time")
    @Schema(name = "examTime", description = "考试时间")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT-8")
    private Timestamp examTime;
}