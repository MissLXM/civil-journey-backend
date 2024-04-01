package cn.mju.wjh.common.security.mapper;

import cn.mju.wjh.common.core.entity.pojo.user.MedalAuthority;
import cn.mju.wjh.common.core.entity.vo.user.MedalInfoVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;


/**
 * ClassName: MedalAuthorityMapper
 * Package: cn.mju.wjh.common.security.mapper
 * Description: 勋章权限映射层
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/13--16:40
 */
@Mapper
public interface MedalAuthorityMapper extends BaseMapper<MedalAuthority> {

    @Select("SELECT medal_name, medal_icon, medal_level FROM medal_authority WHERE medal_id = #{medalId}")
    MedalInfoVo medalInfoVoByMedalId(Long medalId);
}
