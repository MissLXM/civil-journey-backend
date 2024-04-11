package cn.mju.wjh.feedback.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.notice.NoticeQueryParams;
import cn.mju.wjh.common.core.entity.pojo.notice.NoticeUser;
import cn.mju.wjh.common.core.entity.pojo.user.CivilAdmin;
import cn.mju.wjh.common.core.entity.pojo.user.CivilUser;
import cn.mju.wjh.common.core.enums.HttpStatus;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.email.utils.EmailUtils;
import cn.mju.wjh.common.minio.utils.MinioUtil;
import cn.mju.wjh.common.security.utils.LoginUserUtils;
import cn.mju.wjh.common.security.utils.StpUserUtils;
import cn.mju.wjh.feedback.mapper.NoticeUserMapper;
import cn.mju.wjh.feedback.service.NoticeService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import jakarta.mail.MessagingException;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClassName: NoticeServiceImpl
 * Package: cn.mju.wjh.feedback.service.impl
 * Description: 通知服务实现
 *
 * @Author:wjh
 * @Create:2024-02-2024/2/1--13:45
 */
@Service
public class NoticeServiceImpl implements NoticeService {

    @Setter(onMethod_ = @Autowired)
    private MinioUtil minioUtil;

    @Setter(onMethod_ = @Autowired)
    private EmailUtils emailUtils;

    @Setter(onMethod_ = @Autowired)
    private LoginUserUtils userUtils;

    @Setter(onMethod_ = @Autowired)
    private NoticeUserMapper noticeUserMapper;


    /**
     * 获取用户通知信息
     * @return 通知信息
     */
    @Override
    public Result getUserNotice(PageParams pageParams) {
        // 获取用户通知信息
        IPage<NoticeUser> noticeUserIpage = noticeUserMapper.selectPage(
                new Page<>(pageParams.getCurrentPage(), pageParams.getPageSize()),
                new LambdaQueryWrapper<NoticeUser>()
                        .eq(NoticeUser::getAcceptId, StpUserUtils.getLoginId())
                        .orderByDesc(NoticeUser::getCreateTime)
        );

        // 判空
        if (noticeUserIpage.getRecords().size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        noticeUserIpage.setRecords(noticeUserIpage.getRecords().stream().peek(
                noticeUser -> noticeUser.setSenderAvatar(minioUtil.preview(noticeUser.getSenderAvatar()))
        ).toList());

        return Result.ok(noticeUserIpage).message("操作成功");
    }

    /**
     * 获取用户通知信息条数
     * @return 通知信息条数
     */
    @Override
    public Result getUserNoticeNumber() {
        // 根据用户id获取通知信息条数
        Long count = noticeUserMapper.selectCount(
                new LambdaQueryWrapper<NoticeUser>()
                        .eq(NoticeUser::getAcceptId, StpUserUtils.getLoginId())
        );

        return Result.ok(count).message("操作成功");
    }

    /**
     * 修改用户通知的状态
     * @return 是否修改成功
     */
    @Override
    public Result updateUserNoticeStatus(Long noticeUserId) {
        int rows = noticeUserMapper.updateById(new NoticeUser().setNoticeUserId(noticeUserId).setState((byte) 1));

        if (rows == 0) {
            return Result.fail().message("操作失败");
        }
        return Result.ok().message("操作成功");
    }

    /**
     * 清空已读通知
     * @param userId 用户ID
     * @return 是否操作成功
     */
    @Override
    public Result deleteReadNotice(Long userId) {
        List<NoticeUser> noticeUsers = noticeUserMapper.selectList(
                new LambdaQueryWrapper<NoticeUser>()
                        .eq(NoticeUser::getAcceptId, userId)
                        .eq(NoticeUser::getState, (byte) 1)
        );

        if (noticeUsers.size() == 0) {
            return Result.fail().message("未存在已读的通知").code(HttpStatus.NOT_FOUND.getCode());
        }

        for (NoticeUser noticeUser : noticeUsers) {
            noticeUserMapper.deleteById(noticeUser.getNoticeUserId());
        }


        return Result.ok().message("操作成功");
    }

    /**
     * 获取所有通知信息
     * @param noticeQueryParams 通知查询参数
     * @return 通知信息
     */
    @Override
    public Result getAllNotice(NoticeQueryParams noticeQueryParams) {
        LambdaQueryWrapper<NoticeUser> wrapper = new LambdaQueryWrapper<>();

        // 封装条件
        if (ObjectUtil.isNotEmpty(noticeQueryParams.getNoticeTitle())) {
            wrapper.like(NoticeUser::getNoticeTitle, noticeQueryParams.getNoticeTitle());
        }

        if (ObjectUtil.isNotEmpty(noticeQueryParams.getTypeId())) {
            if (noticeQueryParams.getTypeId() == 1) {
                wrapper.eq(NoticeUser::getNoticeType, "系统通知");
            }

            if (noticeQueryParams.getTypeId() == 2) {
                wrapper.eq(NoticeUser::getNoticeType, "邮箱通知");
            }
        }

        if (ObjectUtil.isNotEmpty(noticeQueryParams.getSenderName())) {
            wrapper.like(NoticeUser::getSenderName, noticeQueryParams.getSenderName());
        }

        wrapper.orderByDesc(NoticeUser::getCreateTime);

        // 查询
        IPage<NoticeUser> noticeUserIpage = noticeUserMapper.selectPage(
                new Page<>(noticeQueryParams.getCurrentPage(), noticeQueryParams.getPageSize()),
                wrapper
        );

        // 判空
        if (noticeUserIpage.getRecords().size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        // 封装
        noticeUserIpage.setRecords(
                noticeUserIpage.getRecords().stream().peek(
                        noticeUser -> {
                            CivilUser user = userUtils.getUserInfo(noticeUser.getAcceptId().toString());
                            noticeUser.setAcceptName(user.getNickname());
                            noticeUser.setAcceptEmail(user.getUserEmail());
                            noticeUser.setAcceptAvatar(minioUtil.preview(user.getHeadPortrait()));
                            noticeUser.setSenderAvatar(minioUtil.preview(noticeUser.getSenderAvatar()));
                        }
                ).toList()
        );

        return Result.ok(noticeUserIpage).message("操作成功");
    }

    /**
     * 发布通知
     * @param noticeUser 通知信息
     * @return 是否发布成功
     */
    @Override
    public Result releaseNotice(NoticeUser noticeUser) {
        // 查询当前管理员的头像
        CivilAdmin adminInfo = userUtils.getAdminInfo(noticeUser.getSenderName());
        noticeUser.setSenderId(adminInfo.getAdminId());
        noticeUser.setSenderAvatar(adminInfo.getHeadPortrait());

        // 获取需要发送的用户
        List<Long> accepter = noticeUser.getAccepter();
        for (Long userId : accepter) {
            noticeUser.setAcceptId(userId);
            noticeUserMapper.insert(noticeUser);

            if ("邮箱通知".equals(noticeUser.getNoticeType())) {
                // 获取用户邮箱
                String email = userUtils.getUserEmail(userId.toString());
                // 发送邮箱
                try {
                    emailUtils.sendEmail(email, noticeUser.getNoticeContent());
                } catch (MessagingException e) {
                    throw new RuntimeException("发送邮箱失败");
                }
            }
        }

        return Result.ok().message("操作成功");
    }

    /**
     * 删除通知
     * @param noticeUserIds 通知ID
     * @return 是否操作成功
     */
    @Override
    public Result deleteNotice(List<Long> noticeUserIds) {
        if (noticeUserMapper.deleteBatchIds(noticeUserIds) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作失败");
    }
}
