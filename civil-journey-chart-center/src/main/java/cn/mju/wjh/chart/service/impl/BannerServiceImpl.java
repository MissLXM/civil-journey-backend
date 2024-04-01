package cn.mju.wjh.chart.service.impl;

import cn.mju.wjh.chart.mapper.CivilBannerMapper;
import cn.mju.wjh.chart.service.BannerService;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.pojo.banner.CivilBanner;
import cn.mju.wjh.common.core.enums.HttpStatus;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.minio.utils.MinioUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ClassName: BannerServiceImpl
 * Package: cn.mju.wjh.chart.service.impl
 * Description: 轮播图服务实现
 *
 * @Author:wjh
 * @Create:2024-01-2024/1/22--14:11
 */
@Service
public class BannerServiceImpl implements BannerService {

    @Setter(onMethod_ = @Autowired)
    private MinioUtil minioUtil;

    @Setter(onMethod_ = @Autowired)
    private CivilBannerMapper bannerMapper;

    /**
     * 默认显示的轮播图(6条,优先级排序)
     * @return 默认显示的轮播图(6条, 优先级排序)
     */
    @Override
    public Result showBanner() {
        List<CivilBanner> bannerList = bannerMapper.selectList(
                new LambdaQueryWrapper<CivilBanner>()
                        .eq(CivilBanner::getIsDelete, 0)
                        .orderByAsc(CivilBanner::getBannerSort)
                        .last("limit 6")
        );

        if (bannerList.size() != 0) {
            // 封装图片路径
            bannerList.forEach(banner -> {
                banner.setBannerUrl(minioUtil.preview(banner.getBannerUrl()));
            });
            return Result.ok(bannerList).message("操作成功");
        }
        return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
    }

    /**
     * 所有轮播图
     * @param pageParams 分页参数
     * @return 所有轮播图
     */
    @Override
    public Result getAllBanner(PageParams pageParams) {
        // 查询
        IPage<CivilBanner> bannerIpage = bannerMapper.selectPage(
                new Page<>(pageParams.getCurrentPage(), pageParams.getPageSize()),
                new LambdaQueryWrapper<CivilBanner>()
                        .orderByAsc(CivilBanner::getBannerSort)
        );

        if (bannerIpage.getRecords().size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        // 封装图片路径
        bannerIpage.setRecords(
                bannerIpage.getRecords().stream().peek(
                        banner -> banner.setBannerUrl(minioUtil.preview(banner.getBannerUrl()))
                ).toList()
        );

        return Result.ok(bannerIpage).message("操作成功");
    }

    /**
     * 上传轮播图
     * @param file 文件
     * @param username 用户名
     * @return 是否上传成功
     */
    @Override
    public Result submitBanner(MultipartFile file, String username) {
        // 上传
        String bannerImage = minioUtil.upload(
                file,
                null,
                UseConstant.ADMIN_REAL_CONSTANT,
                "username: " + username
        );

        // 判空
        if (bannerImage == null) {
            return Result.fail().message("轮播图上传失败");
        }

        // 封装
        Map<String, String> map = new HashMap<>();
        map.put("oldPath", bannerImage);
        map.put("newPath", minioUtil.preview(bannerImage));

        return Result.ok(map).message("轮播图上传成功");
    }

    /**
     * 添加轮播图
     * @param banner 轮播图
     * @return 是否操作成功
     */
    @Override
    public Result addBanner(CivilBanner banner) {
        if (bannerMapper.insert(banner) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作失败");
    }

    /**
     * 更新轮播图
     * @param banner 轮播图
     * @return 是否操作成功
     */
    @Override
    public Result updateBanner(CivilBanner banner) {
        if (bannerMapper.updateById(banner) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作失败");
    }

    /**
     * 删除轮播图
     * @param bannerIds 轮播图ID
     * @return 是否操作成功
     */
    @Override
    public Result deleteBanner(List<Long> bannerIds) {
        if (bannerMapper.deleteBatchIds(bannerIds) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作失败");
    }

    /**
     * 上移优先级
     * @param bannerId 轮播图ID
     * @return 是否操作成功
     */
    @Override
    public Result moveUpBanner(Long bannerId) {
        CivilBanner banner = bannerMapper.selectById(bannerId);
        Integer oldSort = banner.getBannerSort();

        List<CivilBanner> bannerList = bannerMapper.selectList(
                new LambdaQueryWrapper<CivilBanner>()
                        .orderByAsc(CivilBanner::getBannerSort)
        );

        for (int i = 0; i < bannerList.size(); i++) {
            if (bannerList.get(i).getBannerId().equals(bannerId)) {
                // 交换
                CivilBanner upBanner = bannerMapper.selectById(bannerList.get(i - 1).getBannerId());
                Integer newSort = upBanner.getBannerSort();

                banner.setBannerSort(newSort);
                upBanner.setBannerSort(oldSort);

                bannerMapper.updateById(banner);
                bannerMapper.updateById(upBanner);

                return Result.ok().message("操作成功");
            }
        }
        return Result.fail().message("操作失败");
    }

    /**
     * 下移优先级
     * @param bannerId 轮播图ID
     * @return 是否操作成功
     */
    @Override
    public Result moveDownBanner(Long bannerId) {
        CivilBanner banner = bannerMapper.selectById(bannerId);
        Integer oldSort = banner.getBannerSort();

        List<CivilBanner> bannerList = bannerMapper.selectList(
                new LambdaQueryWrapper<CivilBanner>()
                        .orderByAsc(CivilBanner::getBannerSort)
        );

        for (int i = 0; i < bannerList.size(); i++) {
            if (bannerList.get(i).getBannerId().equals(bannerId)) {
                // 交换
                CivilBanner upBanner = bannerMapper.selectById(bannerList.get(i + 1).getBannerId());
                Integer newSort = upBanner.getBannerSort();

                banner.setBannerSort(newSort);
                upBanner.setBannerSort(oldSort);

                bannerMapper.updateById(banner);
                bannerMapper.updateById(upBanner);

                return Result.ok().message("操作成功");
            }
        }
        return Result.fail().message("操作失败");
    }
}
