package cn.mju.wjh.common.core.entity.vo.user;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * ClassName: AdminInfoVo
 * Package: cn.mju.wjh.common.core.entity.vo
 * Description: 管理员信息回显
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/14--14:23
 */
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = true)
public class AdminInfoVo extends AllAdminInfoVo{

    @Schema(name = "signature", description = "个性签名")
    private String signature;

}
