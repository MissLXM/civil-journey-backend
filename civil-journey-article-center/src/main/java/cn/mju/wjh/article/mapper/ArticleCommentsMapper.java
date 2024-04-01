package cn.mju.wjh.article.mapper;

import cn.mju.wjh.common.core.entity.pojo.article.ArticleComments;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * ClassName: ArticleCommentsMapper
 * Package: cn.mju.wjh.article.mapper
 * Description: 文章评论映射层
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/24--10:30
 */
@Mapper
public interface ArticleCommentsMapper extends BaseMapper<ArticleComments> {

}
