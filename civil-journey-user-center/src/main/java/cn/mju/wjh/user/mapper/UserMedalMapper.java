package cn.mju.wjh.user.mapper;

import cn.mju.wjh.common.core.entity.pojo.user.UserMedal;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * ClassName: UserMedalMapper
 * Package: cn.mju.wjh.user.mapper
 * Description: 用户勋章映射层
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/13--16:31
 */
@Mapper
public interface UserMedalMapper extends BaseMapper<UserMedal> {

    @Select("SELECT medal_id FROM user_medal WHERE user_id = #{userId}")
    List<Long> selectUserMedalListByUserId(Long userId);

}
