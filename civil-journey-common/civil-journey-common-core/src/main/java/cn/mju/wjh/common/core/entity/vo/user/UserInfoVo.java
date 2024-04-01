package cn.mju.wjh.common.core.entity.vo.user;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.sql.Timestamp;
import java.util.List;

/**
 * ClassName: UserInfoVo
 * Package: cn.mju.wjh.common.core.entity.vo
 * Description: 用户信息回显类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/12--19:12
 */
@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "UserInfoVo",description = "用户信息回显")
public class UserInfoVo {

    @Schema(name = "userId", description = "用户ID")
    private Long userId;

    @Schema(name = "userEmail",description = "用户邮箱")
    private String userEmail;

    @Schema(name = "username",description = "登录名称")
    private String username;

    @Schema(name = "nickname",description = "用户昵称")
    private String nickname;

    @Schema(name = "signature",description = "个性签名")
    private String signature;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "teacherIntroduction",description = "讲师个性签名")
    private String teacherIntroduction;

    @Schema(name = "gender",description = "用户性别")
    private String gender;

    @Schema(name = "headPortrait",description = "用户头像")
    private String headPortrait;

    @Schema(name = "userRole", description = "用户角色")
    private String userRole;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "medalInfoVos", description = "用户勋章")
    private List<MedalInfoVo> medalInfoVos;

    @Schema(name = "viewVideoNumber", description = "视频免费观看次数")
    private Integer viewVideoNumber;

    @Schema(name = "createTime",description = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT-8")
    private Timestamp createTime;

    @Schema(name = "courseNumber",description = "发布的课程数量")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Long courseNumber;

    @Schema(name = "isDelete",description = "是否删除(0:正常、1:禁用、2:删除)")
    private Byte isDelete;

}
