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
 * ClassName: CivilOpinion
 * Package: cn.mju.wjh.common.core.entity.pojo.notice
 * Description: 意见反馈表实体类
 *
 * @Author:wjh
 * @Create:2024-02-2024/2/1--16:17
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("civil_opinion")
@Schema(name = "CivilOpinion", description = "意见反馈表")
public class CivilOpinion implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "opinion_id", type = IdType.AUTO)
    @Schema(name = "opinionId", description = "意见ID")
    private Long opinionId;

    @TableField(value = "opinion_content")
    @Schema(name = "opinionContent", description = "意见内容")
    private String opinionContent;

    @TableField(value = "creator")
    @Schema(name = "creator", description = "提出者")
    private String creator;

    @TableField(value = "create_time")
    @Schema(name = "createTime", description = "发布时间")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT-8")
    private Timestamp createTime;
}
