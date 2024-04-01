package cn.mju.wjh.article.mapper;

import cn.mju.wjh.common.core.entity.pojo.article.ArticleHistory;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * ClassName: ArticleHistoryMapper
 * Package: cn.mju.wjh.article.mapper
 * Description: 文章浏览历史映射层
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/25--9:57
 */
@Mapper
public interface ArticleHistoryMapper extends BaseMapper<ArticleHistory> {

}
