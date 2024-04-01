package cn.mju.wjh.common.core.entity.vo.course;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.sql.Timestamp;

/**
 * ClassName: CourseInfoVo
 * Package: cn.mju.wjh.common.core.entity.vo.course
 * Description: 课程信息回显
 *
 * @Author:wjh
 * @Create:2024-01-2024/1/23--14:58
 */
@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "CourseInfoVo",description = "课程信息回显")
public class CourseInfoVo {

    @Schema(name = "userId",description = "用户ID")
    private Long userId;

    @Schema(name = "courseId", description = "课程ID")
    private Long courseId;

    @Schema(name = "courseImage", description = "课程封面")
    private String courseImage;

    @Schema(name = "courseName", description = "课程名称")
    private String courseName;

    @Schema(name = "courseDescription", description = "课程描述")
    private String courseDescription;

    @Schema(name = "likeNumber", description = "点赞数")
    private Long likeNumber;

    @Schema(name = "browseNumber", description = "浏览数")
    private Long browseNumber;

    @Schema(name = "isLike", description = "是否点赞")
    private Byte isLike;

    @Schema(name = "isCollection", description = "是否收藏")
    private Byte isCollection;

    @Schema(name = "collectionNumber", description = "收藏数")
    private Long collectionNumber;

    @Schema(name = "creatorName", description = "发布者姓名")
    private String creatorName;

    @Schema(name = "creatorAvatar", description = "发布者头像")
    private String creatorAvatar;

    @Schema(name = "teacherIntroduction", description = "发布者个人简介")
    private String teacherIntroduction;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "payMoney", description = "购买金额")
    private Double payMoney;

    @Schema(name = "createTime", description = "发布时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "GMT-8")
    private Timestamp createTime;
}
