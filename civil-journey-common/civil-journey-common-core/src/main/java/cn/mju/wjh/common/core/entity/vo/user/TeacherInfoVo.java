package cn.mju.wjh.common.core.entity.vo.user;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * ClassName: TeacherInfoVo
 * Package: cn.mju.wjh.common.core.entity.vo.user
 * Description: 讲师基本信息回显
 *
 * @Author:wjh
 * @Create:2024-01-2024/1/22--15:58
 */
@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "TeacherInfoVo",description = "讲师基本信息回显")
public class TeacherInfoVo {

    @Schema(name = "teacherId",description = "讲师ID")
    private Long teacherId;

    @Schema(name = "headPortrait",description = "用户头像")
    private String headPortrait;

    @Schema(name = "nickname",description = "用户昵称")
    private String nickname;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "teacherIntroduction", description = "讲师个人简介")
    private String teacherIntroduction;
}
