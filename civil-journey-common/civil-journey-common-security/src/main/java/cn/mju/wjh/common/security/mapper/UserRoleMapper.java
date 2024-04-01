package cn.mju.wjh.common.security.mapper;

import cn.mju.wjh.common.core.entity.pojo.user.UserRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * ClassName: UserRoleMapper
 * Package: cn.mju.wjh.auth.mapper
 * Description: 用户角色映射层
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/13--9:46
 */
@Mapper
public interface UserRoleMapper extends BaseMapper<UserRole> {

}
