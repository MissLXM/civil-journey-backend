package cn.mju.wjh.common.core.entity.pojo.payment;

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

/**
 * ClassName: CivilOrder
 * Package: cn.mju.wjh.common.core.entity.pojo.payment
 * Description: 订单表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/7--14:47
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("civil_order")
@Schema(name = "CivilOrder", description = "订单表")
public class CivilOrder implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "order_id", type = IdType.AUTO)
    @Schema(name = "orderId", description = "订单ID")
    private String orderId;

    @TableField(exist = false)
    @Schema(name = "subject", description = "订单名称")
    private String subject;

    @TableField(value = "user_id")
    @Schema(name = "userId", description = "用户ID")
    private Long userId;

    @TableField(value = "course_id")
    @Schema(name = "courseId", description = "课程ID")
    private Long courseId;

    @TableField(value = "phone")
    @Schema(name = "phone", description = "联系方式")
    private String phone;

    @TableField(value = "consignee")
    @Schema(name = "consignee", description = "收货人姓名")
    private String consignee;

    @TableField(value = "trade_amount")
    @Schema(name = "tradeAmount", description = "交易金额")
    private Double tradeAmount;

    @TableField(value = "trade_voucher")
    @Schema(name = "tradeVoucher", description = "交易凭证")
    private String tradeVoucher;

    @TableField(value = "course_name")
    @Schema(name = "courseName", description = "课程名称")
    private String courseName;

    @TableField(value = "course_image")
    @Schema(name = "courseImage", description = "课程封面")
    private String courseImage;

    @TableField(value = "use_free_number")
    @Schema(name = "useFreeNumber", description = "所使用的免费次数")
    private Integer useFreeNumber;

    @TableField(value = "course_description")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "courseDescription", description = "课程简介")
    private String courseDescription;

    @TableField(value = "trade_time")
    @Schema(name = "tradeTime", description = "交易时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT-8")
    private Timestamp tradeTime;

    @TableField(value = "status")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "status", description = "状态(0:待支付、1:已支付)")
    private Byte status;

}
