package cn.mju.wjh.chart.service;

import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.pojo.banner.CivilBanner;
import cn.mju.wjh.common.core.utils.Result;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * ClassName: BannerService
 * Package: cn.mju.wjh.chart.service
 * Description: 轮播图服务接口
 *
 * @Author:wjh
 * @Create:2024-01-2024/1/22--14:10
 */
public interface BannerService {

    /**
     * 默认显示的轮播图(6条,优先级排序)
     * @return 默认显示的轮播图(6条,优先级排序)
     */
    Result showBanner();

    /**
     * 所有轮播图
     * @param pageParams 分页参数
     * @return 所有轮播图
     */
    Result getAllBanner(PageParams pageParams);

    /**
     * 上传轮播图
     * @param file 文件
     * @param username 用户名
     * @return 是否上传成功
     */
    Result submitBanner(MultipartFile file, String username);

    /**
     * 添加轮播图
     * @param banner 轮播图
     * @return 是否操作成功
     */
    Result addBanner(CivilBanner banner);

    /**
     * 更新轮播图
     * @param banner 轮播图
     * @return 是否操作成功
     */
    Result updateBanner(CivilBanner banner);

    /**
     * 删除轮播图
     * @param bannerIds 轮播图ID
     * @return 是否操作成功
     */
    Result deleteBanner(List<Long> bannerIds);

    /**
     * 上移优先级
     * @param bannerId 轮播图ID
     * @return 是否操作成功
     */
    Result moveUpBanner(Long bannerId);

    /**
     * 下移优先级
     * @param bannerId 轮播图ID
     * @return 是否操作成功
     */
    Result moveDownBanner(Long bannerId);
}
