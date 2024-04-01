package cn.mju.wjh.common.core.entity.pojo.user;

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
import java.sql.Timestamp;

/**
 * ClassName: UserMedal
 * Package: cn.mju.wjh.common.core.entity.pojo
 * Description: 用户勋章关联表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/7--13:57
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("user_medal")
@Schema(name = "UserMedal", description = "用户勋章关联表")
public class UserMedal implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "user_medal_id", type = IdType.AUTO)
    @Schema(name = "userMedalId", description = "用户勋章ID")
    private Long userMedalId;

    @TableField(value = "user_id")
    @Schema(name = "userId", description = "用户ID")
    private Long userId;

    @TableField(value = "medal_id")
    @Schema(name = "medalId", description = "勋章ID")
    private Long medalId;

    @TableField(value = "refresh_time")
    @Schema(name = "refreshTime", description = "刷新时间(首次即为获取勋章的时间,刷新时的时间,每24小时重新刷新)")
    private Timestamp refreshTime;


}
