package cn.mju.wjh.common.core.entity.vo.user;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.sql.Timestamp;

/**
 * ClassName: TeacherHistoryCourseVo
 * Package: cn.mju.wjh.common.core.entity.vo.user
 * Description: 讲师历史课程回显
 *
 * @Author:wjh
 * @Create:2024-01-2024/1/22--16:42
 */
@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "TeacherHistoryCourseVo",description = "讲师历史课程回显")
public class TeacherHistoryCourseVo {

    @Schema(name = "createTime", description = "发布时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT-8")
    private Timestamp createTime;

    @Schema(name = "courseName", description = "课程名称")
    private String courseName;

    @Schema(name = "browseNumber", description = "浏览数")
    private Long browseNumber;
}
