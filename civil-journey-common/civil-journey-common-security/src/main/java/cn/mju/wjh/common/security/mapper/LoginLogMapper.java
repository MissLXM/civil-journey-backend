package cn.mju.wjh.common.security.mapper;

import cn.mju.wjh.common.core.entity.pojo.user.LoginLog;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * ClassName: LoginLogMapper
 * Package: cn.mju.wjh.security.mapper
 * Description: 登录日志映射层
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/13--11:18
 */
@Mapper
public interface LoginLogMapper extends BaseMapper<LoginLog> {

}
