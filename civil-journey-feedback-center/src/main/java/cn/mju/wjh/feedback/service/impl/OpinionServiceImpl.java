package cn.mju.wjh.feedback.service.impl;

import cn.mju.wjh.common.api.client.UserClient;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.pojo.notice.CivilOpinion;
import cn.mju.wjh.common.core.entity.pojo.user.CivilUser;
import cn.mju.wjh.common.core.enums.HttpStatus;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.security.utils.LoginUserUtils;
import cn.mju.wjh.feedback.mapper.CivilOpinionMapper;
import cn.mju.wjh.feedback.service.OpinionService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.houbb.sensitive.word.core.SensitiveWordHelper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

/**
 * ClassName: OpinionServiceImpl
 * Package: cn.mju.wjh.feedback.service.impl
 * Description: 意见反馈实现
 *
 * @Author:wjh
 * @Create:2024-02-2024/2/2--18:57
 */
@Service
public class OpinionServiceImpl implements OpinionService {

    @Setter(onMethod_ = @Autowired)
    private UserClient userClient;

    @Setter(onMethod_ = @Autowired)
    private LoginUserUtils userUtils;

    @Setter(onMethod_ = @Autowired)
    private CivilOpinionMapper opinionMapper;

    @Setter(onMethod_ = @Autowired)
    private StringRedisTemplate redisTemplate;

    /**
     * 提交意见反馈
     * @param username 当前用户登录名称
     * @param message 意见信息
     * @return 是否操作成功
     */
    @Override
    public Result submitOpinion(String username, String message) {

        // 插入数据
        int rows = opinionMapper.insert(
                new CivilOpinion()
                        .setCreator(username)
                        // 判断是否存在敏感词汇(替换成为*)
                        .setOpinionContent(SensitiveWordHelper.replace(message))
        );

        // 判断
        if (rows == 0) {
            return Result.fail().message("操作失败");
        }

        return Result.ok().message("操作成功");
    }

    /**
     * 获取所有反馈信息
     * @param pageParams 分页参数
     * @return 所有反馈信息
     */
    @Override
    public Result getAllOpinion(PageParams pageParams) {
        // 查询
        IPage<CivilOpinion> opinionIpage = opinionMapper.selectPage(
                new Page<>(pageParams.getCurrentPage(), pageParams.getPageSize()),
                new LambdaQueryWrapper<CivilOpinion>()
                        .orderByDesc(CivilOpinion::getCreateTime)
        );

        // 判空
        if (opinionIpage.getRecords().size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        return Result.ok(opinionIpage).message("操作成功");
    }

    /**
     * 删除反馈信息
     * @param opinionIds 反馈ID
     * @return 是否操作成功
     */
    @Override
    public Result deleteOpinion(List<Long> opinionIds) {
        if (opinionMapper.deleteBatchIds(opinionIds) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作失败");
    }

    /**
     * 采纳用户反馈
     * @param opinionId 反馈ID
     * @param creator 反馈提出者
     * @return 是否操作成功
     */
    @Override
    public Result acceptOpinion(Long opinionId, String creator) {
        // 采纳KEY
        String key = creator + UseConstant.ACCEPT_CONSTANT + UseConstant.COLON_CONSTANT;

        int curationNumber = 0;
        if (redisTemplate.opsForValue().get(key) != null) {
            curationNumber = Integer.parseInt(Objects.requireNonNull(redisTemplate.opsForValue().get(key)));
        }

        redisTemplate.opsForValue().set(key, String.valueOf(curationNumber + 1));
        curationNumber = Integer.parseInt(Objects.requireNonNull(redisTemplate.opsForValue().get(key)));

        CivilUser user = userUtils.getUserInfoByUsername(creator);
        if (curationNumber >= 6) {
            userClient.setUserMedal(user.getUserId(), 6L);
        } else {
            userClient.deleteUserMedal(user.getUserId(), 6L);
        }

        if (opinionMapper.deleteById(opinionId) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作失败");
    }
}
