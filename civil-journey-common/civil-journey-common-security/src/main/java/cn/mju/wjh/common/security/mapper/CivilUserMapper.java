package cn.mju.wjh.common.security.mapper;

import cn.mju.wjh.common.core.entity.pojo.user.CivilUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * ClassName: CivilUserMapper
 * Package: cn.mju.wjh.auth.mapper
 * Description: 用户表映射层
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/9--13:52
 */
@Mapper
public interface CivilUserMapper extends BaseMapper<CivilUser> {

}
