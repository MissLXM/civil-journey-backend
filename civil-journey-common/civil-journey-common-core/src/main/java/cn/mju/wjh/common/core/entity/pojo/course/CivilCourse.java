package cn.mju.wjh.common.core.entity.pojo.course;

import cn.mju.wjh.common.core.entity.pojo.video.CivilVideo;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serial;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

/**
 * ClassName: CivilCourse
 * Package: cn.mju.wjh.common.core.entity.pojo
 * Description: 课程表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/7--14:09
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("civil_course")
@Schema(name = "CivilCourse", description = "课程表")
public class CivilCourse implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "course_id", type = IdType.AUTO)
    @Schema(name = "courseId", description = "课程ID")
    private Long courseId;

    @TableField(value = "course_name")
    @Schema(name = "courseName", description = "课程名称")
    private String courseName;

    @TableField(value = "course_image")
    @Schema(name = "courseImage", description = "课程封面")
    private String courseImage;

    @TableField(value = "course_description")
    @Schema(name = "courseDescription", description = "课程描述")
    private String courseDescription;

    @TableField(value = "category_id")
    @Schema(name = "categoryId", description = "课程类别")
    private Long categoryId;

    @TableField(value = "category_name")
    @Schema(name = "categoryName", description = "分类名称")
    private String categoryName;

    @TableField(value = "user_id")
    @Schema(name = "userId", description = "发布者ID")
    private Long userId;

    @TableField(value = "creator_name")
    @Schema(name = "creatorName", description = "发布者姓名")
    private String creatorName;

    @TableField(value = "creator_avatar")
    @Schema(name = "creatorAvatar", description = "发布者头像")
    private String creatorAvatar;

    @TableField(value = "pay_money")
    @Schema(name = "payMoney", description = "购买金额")
    private Double payMoney;

    @TableField(value = "is_curation")
    @Schema(name = "isCuration", description = "是否精选(0:不精选、1:精选)")
    private Byte isCuration;

    @TableField(value = "like_number")
    @Schema(name = "likeNumber", description = "点赞数")
    private Long likeNumber;

    @TableField(value = "browse_number")
    @Schema(name = "browseNumber", description = "浏览数")
    private Long browseNumber;

    @TableField(value = "collection_number")
    @Schema(name = "collectionNumber", description = "收藏数")
    private Long collectionNumber;

    @TableField(value = "create_time")
    @Schema(name = "createTime", description = "发布时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT-8")
    private Timestamp createTime;

    @TableField(value = "audit_failure_reason")
    @Schema(name = "auditFailureReason", description = "审核失败原因")
    private String auditFailureReason;

    @TableField(value = "status")
    @Schema(name = "status", description = "状态(0:待审核、1:审核成功、2:审核失败)")
    private Byte status;

    @TableField(exist = false)
    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "videoList", description = "视频合集")
    private List<CivilVideo> videoList;
}
