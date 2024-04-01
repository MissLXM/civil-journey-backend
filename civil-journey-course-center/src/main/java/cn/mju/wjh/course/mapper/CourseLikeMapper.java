package cn.mju.wjh.course.mapper;

import cn.mju.wjh.common.core.entity.pojo.course.CourseLike;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * ClassName: CourseLikeMapper
 * Package: cn.mju.wjh.course.mapper
 * Description: 点赞课程映射层
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/4--19:10
 */
@Mapper
public interface CourseLikeMapper extends BaseMapper<CourseLike> {

}
