package cn.mju.wjh.article.mapper;

import cn.mju.wjh.common.core.entity.pojo.article.ArticleLike;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * ClassName: ArticleLikeMapper
 * Package: cn.mju.wjh.article.mapper
 * Description: 文章点赞映射层
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/19--18:53
 */
@Mapper
public interface ArticleLikeMapper extends BaseMapper<ArticleLike> {

}
