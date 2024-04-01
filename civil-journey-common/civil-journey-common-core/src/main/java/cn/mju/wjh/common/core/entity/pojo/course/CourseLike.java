package cn.mju.wjh.common.core.entity.pojo.course;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serial;
import java.io.Serializable;

/**
 * ClassName: CourseLike
 * Package: cn.mju.wjh.common.core.entity.pojo
 * Description: 课程点赞表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/7--14:14
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("course_like")
@Schema(name = "CourseLike", description = "课程点赞表")
public class CourseLike implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "course_like_id", type = IdType.AUTO)
    @Schema(name = "courseLikeId", description = "课程点赞ID")
    private Long courseLikeId;

    @TableField(value = "user_id")
    @Schema(name = "userId", description = "用户ID")
    private Long userId;

    @TableField(value = "course_id")
    @Schema(name = "courseId", description = "课程ID")
    private Long courseId;
}
