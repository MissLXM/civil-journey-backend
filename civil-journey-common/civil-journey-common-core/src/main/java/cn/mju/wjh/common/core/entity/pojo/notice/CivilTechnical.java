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
 * ClassName: CivilTechnical
 * Package: cn.mju.wjh.common.core.entity.pojo.notice
 * Description: 资讯表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/7--14:55
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("civil_technical")
@Schema(name = "CivilTechnical", description = "资讯表")
public class CivilTechnical implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "technical_id", type = IdType.AUTO)
    @Schema(name = "technicalId", description = "资讯ID")
    private Long technicalId;

    @TableField(value = "technical_title")
    @Schema(name = "technicalTitle", description = "资讯标题")
    private String technicalTitle;

    @TableField(value = "technical_content")
    @Schema(name = "technicalContent", description = "资讯内容")
    private String technicalContent;

    @TableField(value = "technical_cover")
    @Schema(name = "technicalCover", description = "资讯封面")
    private String technicalCover;

    @TableField(value = "category_id")
    @Schema(name = "categoryId", description = "分类ID")
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

    @TableField(value = "create_time")
    @Schema(name = "createTime", description = "发布时间")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT-8")
    private Timestamp createTime;

}
