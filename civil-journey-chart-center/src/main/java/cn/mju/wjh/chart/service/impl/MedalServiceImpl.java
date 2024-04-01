package cn.mju.wjh.chart.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.mju.wjh.chart.service.MedalService;
import cn.mju.wjh.common.core.entity.pojo.user.MedalAuthority;
import cn.mju.wjh.common.core.entity.vo.user.MedalInfoVo;
import cn.mju.wjh.common.core.enums.HttpStatus;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.minio.utils.MinioUtil;
import cn.mju.wjh.common.security.mapper.MedalAuthorityMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * ClassName: MedalServiceImpl
 * Package: cn.mju.wjh.chart.service.impl
 * Description: 勋章服务实现
 *
 * @Author:wjh
 * @Create:2024-02-2024/2/16--15:26
 */
@Service
public class MedalServiceImpl implements MedalService {

    @Setter(onMethod_ = @Autowired)
    private MinioUtil minioUtil;

    @Setter(onMethod_ = @Autowired)
    private MedalAuthorityMapper medalAuthorityMapper;

    /**
     * 获取所有勋章信息
     * @return 所有勋章信息
     */
    @Override
    public Result getAllMedal() {
        // 获取所有勋章信息
        List<MedalAuthority> medalAuthorities = medalAuthorityMapper.selectList(
                new LambdaQueryWrapper<MedalAuthority>()
                        .orderByAsc(MedalAuthority::getMedalLevel)
        );

        // 封装
        List<MedalInfoVo> medalInfoVoList = new ArrayList<>();
        medalAuthorities.forEach(medalAuthority -> {
            medalAuthority.setMedalIcon(minioUtil.preview(medalAuthority.getMedalIcon()));
            medalInfoVoList.add(BeanUtil.toBean(medalAuthority, MedalInfoVo.class));
        });

        // 判空
        if (medalInfoVoList.size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }
        return Result.ok(medalInfoVoList).message("操作成功");
    }
}
