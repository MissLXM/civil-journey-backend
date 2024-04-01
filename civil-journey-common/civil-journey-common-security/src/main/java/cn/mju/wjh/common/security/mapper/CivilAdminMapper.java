package cn.mju.wjh.common.security.mapper;

import cn.mju.wjh.common.core.entity.pojo.user.CivilAdmin;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * ClassName: CivilAdminMapper
 * Package: cn.mju.wjh.auth.mapper
 * Description: 管理员映射层
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/9--13:56
 */
@Mapper
public interface CivilAdminMapper extends BaseMapper<CivilAdmin> {

}
