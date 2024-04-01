package cn.mju.wjh.common.security.mapper;

import cn.mju.wjh.common.core.entity.pojo.user.AdminRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * ClassName: AdminRoleMapper
 * Package: cn.mju.wjh.auth.mapper
 * Description: 管理员角色映射层
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/13--10:19
 */
@Mapper
public interface AdminRoleMapper extends BaseMapper<AdminRole> {

}
