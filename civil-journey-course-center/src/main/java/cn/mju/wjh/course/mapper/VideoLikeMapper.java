package cn.mju.wjh.course.mapper;

import cn.mju.wjh.common.core.entity.pojo.video.VideoLike;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * ClassName: VideoLikeMapper
 * Package: cn.mju.wjh.course.mapper
 * Description: 点赞视频映射层
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/4--20:50
 */
@Mapper
public interface VideoLikeMapper extends BaseMapper<VideoLike> {

}
