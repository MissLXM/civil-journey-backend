package cn.mju.wjh.message.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.mju.wjh.common.api.client.CategoryClient;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.technical.TechnicalQueryParams;
import cn.mju.wjh.common.core.entity.pojo.category.CivilCategory;
import cn.mju.wjh.common.core.entity.pojo.notice.CivilTechnical;
import cn.mju.wjh.common.core.entity.pojo.notice.ExamTime;
import cn.mju.wjh.common.core.entity.pojo.user.CivilAdmin;
import cn.mju.wjh.common.core.entity.pojo.user.CivilUser;
import cn.mju.wjh.common.core.enums.HttpStatus;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.minio.utils.MinioUtil;
import cn.mju.wjh.common.security.utils.LoginUserUtils;
import cn.mju.wjh.message.mapper.CivilTechnicalMapper;
import cn.mju.wjh.message.mapper.ExamTimeMapper;
import cn.mju.wjh.message.service.MessageService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
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
 * ClassName: MessageServiceImpl
 * Package: cn.mju.wjh.message.service.impl
 * Description: 资讯服务实现
 *
 * @Author:wjh
 * @Create:2024-01-2024/1/31--15:28
 */
@Service
public class MessageServiceImpl implements MessageService {

    @Setter(onMethod_ = @Autowired)
    private MinioUtil minioUtil;

    @Setter(onMethod_ = @Autowired)
    private LoginUserUtils userUtils;

    @Setter(onMethod_ = @Autowired)
    private CategoryClient categoryClient;

    @Setter(onMethod_ = @Autowired)
    private ExamTimeMapper examTimeMapper;

    @Setter(onMethod_ = @Autowired)
    private CivilTechnicalMapper technicalMapper;

    /**
     * 获取考试时间资讯
     * @return 考试时间资讯
     */
    @Override
    public Result getExamTimeMessage() {
        List<ExamTime> examTimeList = examTimeMapper.selectList(
                new LambdaQueryWrapper<ExamTime>()
                        .orderByDesc(ExamTime::getExamTimeId)
                        .last("limit 8")
        );

        if (examTimeList.size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }
        return Result.ok(examTimeList).message("操作成功");
    }

    /**
     * 获取招考信息
     * @return 招考信息
     */
    @Override
    public Result getExamMessage() {
        // 类别ID为 1的招聘信息
        List<CivilTechnical> technicalOne = technicalMapper.selectList(
                new LambdaQueryWrapper<CivilTechnical>()
                        .eq(CivilTechnical::getCategoryId, 1)
                        .last("limit 8")
        );

        if (technicalOne.size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        technicalOne = technicalOne.stream().peek(
                technical -> technical.setTechnicalCover(minioUtil.preview(technical.getTechnicalCover()))
        ).toList();

        // 类别ID为 2的招聘信息
        List<CivilTechnical> technicalTwo = technicalMapper.selectList(
                new LambdaQueryWrapper<CivilTechnical>()
                        .eq(CivilTechnical::getCategoryId, 2)
                        .last("limit 8")
        );

        if (technicalTwo.size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        technicalTwo = technicalTwo.stream().peek(
                technical -> technical.setTechnicalCover(minioUtil.preview(technical.getTechnicalCover()))
        ).toList();

        // 类别ID为 3的招聘信息
        List<CivilTechnical> technicalThree = technicalMapper.selectList(
                new LambdaQueryWrapper<CivilTechnical>()
                        .eq(CivilTechnical::getCategoryId, 3)
                        .last("limit 8")
        );

        if (technicalThree.size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        technicalThree = technicalThree.stream().peek(
                technical -> technical.setTechnicalCover(minioUtil.preview(technical.getTechnicalCover()))
        ).toList();

        Map<String, List<CivilTechnical>> technicalMap = new HashMap<>();
        technicalMap.put("technicalOne", technicalOne);
        technicalMap.put("technicalTwo", technicalTwo);
        technicalMap.put("technicalThree", technicalThree);
        return Result.ok(technicalMap).message("操作成功");
    }

    /**
     * 获取资讯详细信息
     * @param technicalId 资讯ID
     * @return 资讯详细信息
     */
    @Override
    public Result getMessageInfoById(Long technicalId) {
        // 查询
        CivilTechnical technical = technicalMapper.selectById(technicalId);

        // 判空
        if (technical == null) {
            return Result.fail().message("未查询到相关信息").code(HttpStatus.NOT_FOUND.getCode());
        }

        // 更新 发布者信息
        CivilUser user = userUtils.getUserInfo(technical.getUserId().toString());

        if (user != null) {
            technical.setCreatorName(user.getUsername());
            technical.setCreatorAvatar(user.getHeadPortrait());

            // 更新
            technicalMapper.updateById(technical);
        }

        // 封装
        technical.setCreatorAvatar(minioUtil.preview(technical.getCreatorAvatar()));
        return Result.ok(technical).message("操作成功");
    }

    /**
     * 获取所有资讯
     * @param technicalQueryParams 资讯查询参数
     * @return 所有资讯
     */
    @Override
    public Result getAllMessage(TechnicalQueryParams technicalQueryParams) {
        LambdaQueryWrapper<CivilTechnical> wrapper = new LambdaQueryWrapper<>();

        //设置条件
        if (ObjectUtil.isNotEmpty(technicalQueryParams.getTechnicalTitle())) {
            wrapper.like(CivilTechnical::getTechnicalTitle, technicalQueryParams.getTechnicalTitle());
        }

        if (ObjectUtil.isNotEmpty(technicalQueryParams.getCategoryId())) {
            wrapper.eq(CivilTechnical::getCategoryId, technicalQueryParams.getCategoryId());
        }

        if (ObjectUtil.isNotEmpty(technicalQueryParams.getCreatorName())) {
            wrapper.like(CivilTechnical::getCreatorName, technicalQueryParams.getCreatorName());
        }

        wrapper.orderByDesc(CivilTechnical::getCreateTime);

        // 查询
        IPage<CivilTechnical> technicalIpage = technicalMapper.selectPage(
                new Page<>(technicalQueryParams.getCurrentPage(), technicalQueryParams.getPageSize()),
                wrapper
        );

        // 判空
        if (technicalIpage.getRecords().size() == 0) {
            return Result.fail().message("操作成功").code(HttpStatus.NOT_FOUND.getCode());
        }

        // 封装
        technicalIpage.setRecords(
                technicalIpage.getRecords().stream().peek(
                        technical -> {
                            technical.setCreatorAvatar(minioUtil.preview(technical.getCreatorAvatar()));
                            technical.setTechnicalCover(minioUtil.preview(technical.getTechnicalCover()));
                        }
                ).toList()
        );

        return Result.ok(technicalIpage).message("操作成功");
    }

    /**
     * 获取所有考试时间
     * @param pageParams 分页参数
     * @return 所有考试时间
     */
    @Override
    public Result getAllExamTime(PageParams pageParams) {
        // 查询
        IPage<ExamTime> examTimeIpage = examTimeMapper.selectPage(
                new Page<>(pageParams.getCurrentPage(), pageParams.getPageSize()),
                new LambdaQueryWrapper<ExamTime>()
                        .orderByDesc(ExamTime::getApplyTime)
        );

        // 判空
        if (examTimeIpage.getRecords().size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        return Result.ok(examTimeIpage).message("操作成功");
    }

    /**
     * 添加考试信息
     * @param examTime 考试信息
     * @return 是否操作成功
     */
    @Override
    public Result addExam(ExamTime examTime) {
        if (examTimeMapper.insert(examTime) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作成功");
    }

    /**
     * 更新考试信息
     * @param examTime 考试信息
     * @return 是否操作成功
     */
    @Override
    public Result updateExam(ExamTime examTime) {
        if (examTimeMapper.updateById(examTime) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作成功");
    }

    /**
     * 删除考试信息
     * @param examTimeIds 考试信息ID
     * @return 是否操作成功
     */
    @Override
    public Result deleteExam(List<Long> examTimeIds) {
        if (examTimeMapper.deleteBatchIds(examTimeIds) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作成功");
    }

    /**
     * 发布者资讯
     * @param technical 资讯信息
     * @return 是否操作成功
     */
    @Override
    public Result addMessage(CivilTechnical technical) {
        // 获取管理员信息
        CivilAdmin admin = userUtils.getAdminInfoById(StpUtil.getLoginId().toString());

        technical.setUserId(admin.getAdminId());
        technical.setCreatorName(admin.getNickname());
        technical.setCreatorAvatar(admin.getHeadPortrait());

        // 查找类别名称
        String jsonString = JSON.toJSONString(categoryClient.getCategoryById(technical.getCategoryId()).getData());
        CivilCategory category = JSONObject.parseObject(jsonString, CivilCategory.class);
        technical.setCategoryName(category.getCategoryName());

        if (technicalMapper.insert(technical) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作失败");
    }

    /**
     * 更新资讯
     * @param technical 资讯信息
     * @return 是否操作成功
     */
    @Override
    public Result updateMessage(CivilTechnical technical) {
        // 查找类别名称
        String jsonString = JSON.toJSONString(categoryClient.getCategoryById(technical.getCategoryId()).getData());
        CivilCategory category = JSONObject.parseObject(jsonString, CivilCategory.class);
        technical.setCategoryName(category.getCategoryName());

        if (technical.getTechnicalCover().matches("^http?://.*$")) {
            // 图片没修改
            technical.setTechnicalCover(null);
        }

        if (technicalMapper.updateById(technical) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作失败");
    }

    /**
     * 删除资讯
     * @param technicalIds 资讯ID
     * @return 是否操作成功
     */
    @Override
    public Result deleteMessage(List<Long> technicalIds) {
        if (technicalMapper.deleteBatchIds(technicalIds) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作失败");
    }

    /**
     * 上传资讯图片
     * @param file 文件
     * @param username 登录名称
     * @return 地址
     */
    @Override
    public Result submitTechnicalImage(MultipartFile file, String username) {
        // 上传
        String technicalImage = minioUtil.upload(
                file,
                null,
                UseConstant.ADMIN_REAL_CONSTANT,
                "username: " + username
        );

        // 判空
        if (technicalImage == null) {
            return Result.fail().message("资讯图片上传失败");
        }

        // 封装
        Map<String, String> map = new HashMap<>();
        map.put("oldPath", technicalImage);
        map.put("newPath", minioUtil.preview(technicalImage));

        return Result.ok(map).message("勋章图标上传成功");
    }

}
