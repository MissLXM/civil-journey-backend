package cn.mju.wjh.course.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.course.CourseParams;
import cn.mju.wjh.common.core.entity.param.course.VideoCommentsParams;
import cn.mju.wjh.common.core.entity.param.course.VideoScheduleParams;
import cn.mju.wjh.common.core.entity.pojo.course.CivilCourse;
import cn.mju.wjh.common.core.entity.pojo.user.CivilUser;
import cn.mju.wjh.common.core.entity.pojo.video.CivilVideo;
import cn.mju.wjh.common.core.entity.pojo.video.VideoComments;
import cn.mju.wjh.common.core.entity.pojo.video.VideoLike;
import cn.mju.wjh.common.core.entity.pojo.video.VideoSchedule;
import cn.mju.wjh.common.core.entity.vo.course.HomeVideoVo;
import cn.mju.wjh.common.core.entity.vo.course.VideoInfoVO;
import cn.mju.wjh.common.core.enums.HttpStatus;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.minio.utils.MinioUtil;
import cn.mju.wjh.common.security.utils.LoginUserUtils;
import cn.mju.wjh.common.security.utils.StpUserUtils;
import cn.mju.wjh.course.mapper.*;
import cn.mju.wjh.course.service.VideoService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.bytedeco.javacv.FFmpegFrameGrabber;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ClassName: VideoServiceImpl
 * Package: cn.mju.wjh.course.service.impl
 * Description: 视频服务实现(前台)
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/27--17:01
 */
@Slf4j
@Service
public class VideoServiceImpl implements VideoService {

    @Setter(onMethod_ = @Autowired)
    private MinioUtil minioUtil;

    @Setter(onMethod_ = @Autowired)
    private LoginUserUtils userUtils;

    @Setter(onMethod_ = @Autowired)
    private CivilVideoMapper videoMapper;

    @Setter(onMethod_ = @Autowired)
    private VideoLikeMapper videoLikeMapper;

    @Setter(onMethod_ = @Autowired)
    private CivilCourseMapper courseMapper;

    @Setter(onMethod_ = @Autowired)
    private VideoCommentsMapper videoCommentsMapper;

    @Setter(onMethod_ = @Autowired)
    private VideoScheduleMapper videoScheduleMapper;

    /**
     * 首页--展示视频
     * @return 视频信息
     */
    @Override
    public Result homeShowVideo() {
        // 观看次数降序
        List<CivilVideo> videos = videoMapper.selectList(
                new LambdaQueryWrapper<CivilVideo>()
                        .orderByDesc(CivilVideo::getBrowseNumber)
                        .last("limit 8")
        );

        // 封装返回结果(视频预览、视频封面、视频描述、发布者、发布日期)
        List<HomeVideoVo> videoVoList = videos.stream().map(
                video -> {
                    HomeVideoVo videoVo = BeanUtil.toBean(video, HomeVideoVo.class);
                    // 根据课程ID查询发布者
                    CivilCourse course = courseMapper.selectById(video.getCourseId());
                    CivilUser user = userUtils.getUserInfo(String.valueOf(course.getUserId()));
                    if (user != null) {
                        // 更新发布者信息
                        courseMapper.updateById(
                                new CivilCourse()
                                        .setCourseId(video.getCourseId())
                                        .setCreatorName(user.getNickname())
                                        .setCreatorAvatar(user.getHeadPortrait())
                        );

                        // 设置视频回显信息
                        videoVo.setCreatorName(user.getNickname());
                    } else {
                        videoVo.setCreatorName(course.getCreatorName());
                    }
                    videoVo.setPayMoney(course.getPayMoney());
                    videoVo.setVideoImage(minioUtil.preview(video.getVideoImage()));
                    videoVo.setVideoPreview(minioUtil.preview(video.getVideoPreview()));
                    return videoVo;
                }
        ).toList();

        if (videoVoList.size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }
        return Result.ok(videoVoList).message("操作成功");
    }

    /**
     * 查询--视频历史记录
     * @param pageParams 分页参数
     * @return 视频信息
     */
    @Override
    public Result queryVideoHistory(PageParams pageParams) {
        // 分页查询
        IPage<VideoSchedule> videoSchedulePage = videoScheduleMapper.selectPage(
                new Page<>(pageParams.getCurrentPage(), pageParams.getPageSize()),
                new LambdaQueryWrapper<VideoSchedule>()
                        .eq(VideoSchedule::getUserId, StpUserUtils.getLoginId())
        );

        // 判空
        if (videoSchedulePage.getRecords().size() == 0) {
            return Result.fail().message("未查询到相关信息").code(HttpStatus.NOT_FOUND.getCode());
        }

        videoSchedulePage.setRecords(videoSchedulePage.getRecords().stream().peek(
                videoSchedule -> {
                    CivilCourse course = courseMapper.selectById(videoSchedule.getCourseId());
                    videoSchedule.setPayMoney(course.getPayMoney());
                    videoSchedule.setVideoImage(minioUtil.preview(videoSchedule.getVideoImage()));
                }
        ).toList());

        return Result.ok(videoSchedulePage).message("操作成功");
    }

    /**
     * 视频--上传视频
     * @param file 文件
     * @param username 登录名称
     * @return 视频地址
     */
    @Override
    public Result uploadVideo(MultipartFile file, String username) {
        // 上传
        String path = minioUtil.upload(file, "video", "link", "username: " + username);

        // 判空
        if (path == null) {
            return Result.fail().message("操作失败");
        }

        // 封装
        Map<String, String> videoLink = new HashMap<>();
        videoLink.put("oldPath", path);
        videoLink.put("newPath", minioUtil.preview(path));

        Long videoDuration;
        // 视频时长
        try {
            FFmpegFrameGrabber grabber = new FFmpegFrameGrabber(file.getInputStream());
            grabber.start();
            // 微秒为单位 / 1000000
            videoDuration = grabber.getLengthInTime() / 1000000;
            grabber.stop();
        } catch (IOException e) {
            throw new RuntimeException("获取视频时长失败");
        }

        videoLink.put("videoDuration", String.valueOf(videoDuration));
        return Result.ok(videoLink).message("操作成功");
    }

    /**
     * 视频--上传视频封面
     * @param file 文件
     * @param username 登录名称
     * @return 视频封面地址
     */
    @Override
    public Result uploadVideoCover(MultipartFile file, String username) {
        // 上传
        String path = minioUtil.upload(file, "video", "image", "username: " + username);

        // 判空
        if (path == null) {
            return Result.fail().message("操作失败");
        }

        Map<String, String> videoCover = new HashMap<>();
        videoCover.put("oldPath", path);
        videoCover.put("newPath", minioUtil.preview(path));

        return Result.ok(videoCover).message("操作成功");
    }

    /**
     * 视频--上传预览视频
     * @param file 文件
     * @param username 登录名称
     * @return 预览视频地址
     */
    @Override
    public Result uploadPreviewVideo(MultipartFile file, String username) {
        // 上传
        String path = minioUtil.upload(file, "video", "preview", "username: " + username);

        // 判空
        if (path == null) {
            return Result.fail().message("操作失败");
        }

        Map<String, String> previewVideo = new HashMap<>();
        previewVideo.put("oldPath", path);
        previewVideo.put("newPath", minioUtil.preview(path));

        return Result.ok(previewVideo).message("操作成功");
    }

    /**
     * 视频--获取视频集合信息
     * @param courseParams 课程参数
     * @return 视频详细信息
     */
    @Override
    public Result queryVideoCollection(CourseParams courseParams) {
        // 按照排序获取所有该课程的视频
        IPage<CivilVideo> videoIpage = videoMapper.selectPage(
                new Page<>(courseParams.getCurrentPage(), courseParams.getPageSize()),
                new LambdaQueryWrapper<CivilVideo>()
                        .eq(CivilVideo::getCourseId, courseParams.getCourseId())
                        .orderByAsc(CivilVideo::getVideoSort)
        );

        // 判断是否有视频存在
        if (videoIpage.getRecords().size() == 0) {
            return Result.fail().message("未查询到相关视频信息").code(HttpStatus.NOT_FOUND.getCode());
        }

        // 需要回显的数据(videoId、videoImage、videoName)
        IPage<VideoInfoVO> videoInfoVoIpage = new Page<>();
        BeanUtil.copyProperties(videoIpage, videoInfoVoIpage);


        // 封装数据
        List<VideoInfoVO> videoInfoVoList = videoIpage.getRecords().stream().map(
                video -> {
                    VideoInfoVO videoInfoVO = new VideoInfoVO();
                    videoInfoVO.setVideoId(video.getVideoId());
                    videoInfoVO.setVideoName(video.getVideoName());
                    videoInfoVO.setVideoImage(minioUtil.preview(video.getVideoImage()));

                    return videoInfoVO;
                }
        ).toList();
        videoInfoVoIpage.setRecords(videoInfoVoList);

        return Result.ok(videoInfoVoIpage).message("操作成功");
    }

    /**
     * 视频--获取视频详细信息
     * @param videoId 视频ID
     * @return 视频详细信息
     */
    @Override
    public Result queryVideoInfo(Long videoId) {
        // 获取视频信息
        CivilVideo video = videoMapper.selectById(videoId);

        // 判空
        if (video == null) {
            return Result.fail().message("未查询到相关视频信息").code(HttpStatus.NOT_FOUND.getCode());
        }

        // 封装
        VideoInfoVO videoInfoVO = BeanUtil.toBean(video, VideoInfoVO.class);
        videoInfoVO.setVideoLink(minioUtil.preview(videoInfoVO.getVideoLink()));
        videoInfoVO.setVideoImage(minioUtil.preview(videoInfoVO.getVideoImage()));
        videoInfoVO.setVideoPreview(minioUtil.preview(videoInfoVO.getVideoPreview()));

        // 是否点赞
        if (videoLikeMapper.selectCount(
                new LambdaQueryWrapper<VideoLike>()
                        .eq(VideoLike::getUserId, Long.valueOf(StpUserUtils.getLoginId().toString()))
                        .eq(VideoLike::getVideoId, videoId)
        ) > 0) {
            videoInfoVO.setIsLike((byte) 1);
        }

        // 浏览次数 + 1
        if (videoMapper.updateById(video.setBrowseNumber(video.getBrowseNumber() + 1)) > 0) {
            videoInfoVO.setBrowseNumber(videoInfoVO.getBrowseNumber() + 1);
            log.info("视频观看 + 1");
        } else {
            log.info("视频观看 + 1 失败");
        }



        if (videoScheduleMapper.selectCount(
                new LambdaQueryWrapper<VideoSchedule>()
                        .eq(VideoSchedule::getUserId, StpUserUtils.getLoginId())
                        .eq(VideoSchedule::getVideoId, video.getVideoId())
        ) > 0) {
            // 获取进度
            VideoSchedule videoSchedule = videoScheduleMapper.selectOne(
                    new LambdaQueryWrapper<VideoSchedule>()
                            .eq(VideoSchedule::getUserId, StpUserUtils.getLoginId())
                            .eq(VideoSchedule::getVideoId, video.getVideoId())
            );
            videoInfoVO.setVideoDuration(videoSchedule.getWatchDuration());
        }


        return Result.ok(videoInfoVO).message("操作成功");
    }

    /**
     * 视频--获取视频评论信息
     * @param videoId 视频ID
     * @return 视频评论信息
     */
    @Override
    public Result queryCommentInfo(Long videoId) {
        // 查询
        List<VideoComments> videoCommentsList = videoCommentsMapper.selectList(
                new LambdaQueryWrapper<VideoComments>()
                        .eq(VideoComments::getVideoId, videoId)
                        .orderByDesc(VideoComments::getCommentTime)
        );

        // 更新发布者信息
        videoCommentsList = videoCommentsList.stream().peek(
                videoComments -> {
                    // 获取用户信息
                    CivilUser user = userUtils.getUserInfo(videoComments.getUserId().toString());

                    // 更新
                    videoComments.setCommenterName(user.getNickname());
                    videoComments.setCommenterAvatar(user.getHeadPortrait());
                    videoCommentsMapper.updateById(videoComments);
                    videoComments.setCommenterAvatar(minioUtil.preview(user.getHeadPortrait()));

                    videoComments.setUserId(null);
                    videoComments.setVideoId(null);
                    videoComments.setVideoCommentId(null);
                }
        ).toList();


        return Result.ok(videoCommentsList).message("操作成功");
    }

    /**
     * 视频--点赞/取消点赞
     * @param videoId 视频ID
     * @return 是否操作成功
     */
    @Override
    public Result videoLikeOrNoLike(Long videoId) {
        // 获取当前登录用户
        Long userId = Long.parseLong(StpUserUtils.getLoginId().toString());
        // 判断是否有点赞过
        if (videoLikeMapper.selectCount(
                new LambdaQueryWrapper<VideoLike>()
                        .eq(VideoLike::getUserId, userId)
                        .eq(VideoLike::getVideoId, videoId)
        ) > 0) {
            // 删除
            if (videoLikeMapper.delete(
                    new LambdaQueryWrapper<VideoLike>()
                            .eq(VideoLike::getUserId, userId)
                            .eq(VideoLike::getVideoId, videoId)
            ) > 0) {
                // 视频点赞数 - 1
                CivilVideo video = videoMapper.selectById(videoId);
                video.setLikeNumber(video.getLikeNumber() - 1);
                if (videoMapper.updateById(video) > 0) {
                    log.info("用户取消点赞成功");
                } else {
                    log.info("用户取消点赞失败");
                }
                return Result.ok().message("操作成功");
            } else {
                return Result.fail().message("操作失败");
            }
        } else {
            // 新增
            if (videoLikeMapper.insert(
                    new VideoLike()
                            .setUserId(userId)
                            .setVideoId(videoId)
            ) > 0) {
                // 视频点赞数 + 1
                CivilVideo video = videoMapper.selectById(videoId);
                video.setLikeNumber(video.getLikeNumber() + 1);
                if (videoMapper.updateById(video) > 0) {
                    log.info("用户点赞成功");
                } else {
                    log.info("用户点赞失败");
                }
                return Result.ok().message("操作成功");
            } else {
                return Result.fail().message("操作失败");
            }
        }
    }

    /**
     * 视频--视频评论
     * @param commentsParams 评论参数
     * @return 是否操作成功
     */
    @Override
    public Result videoComments(VideoCommentsParams commentsParams) {
        // 获取当前用户信息
        CivilUser user = userUtils.getUserInfo(StpUserUtils.getLoginId().toString());

        // 设置评论参数
        VideoComments videoComments = new VideoComments()
                .setVideoId(commentsParams.getVideoId())
                .setUserId(user.getUserId())
                .setCommenterName(user.getNickname())
                .setCommenterAvatar(user.getHeadPortrait())
                .setCommentContent(commentsParams.getCommentContent());

        if (videoCommentsMapper.insert(videoComments) > 0) {
            return Result.ok().message("评论成功");
        }
        return Result.fail().message("评论失败");
    }

    /**
     * 视频--记录视频播放时长
     * @param scheduleParams 视频播放时长参数
     * @return 是否记录成功
     */
    @Override
    public Result insertVideoSchedule(VideoScheduleParams scheduleParams) {
        // 获取视频总时长
        CivilVideo video = videoMapper.selectById(scheduleParams.getVideoId());
        // 判断是否第一次观看
        if (videoScheduleMapper.selectCount(
                new LambdaQueryWrapper<VideoSchedule>()
                        .eq(VideoSchedule::getUserId, StpUserUtils.getLoginId())
                        .eq(VideoSchedule::getVideoId, scheduleParams.getVideoId())
        ) > 0) {
            // 判断是否超过总时长
            if (scheduleParams.getVideoDuration() >= video.getVideoDuration()) {
                scheduleParams.setVideoDuration(0L);
            }
            // 更新
            if (videoScheduleMapper.update(
                    new VideoSchedule()
                            .setWatchDuration(scheduleParams.getVideoDuration()),
                    new LambdaQueryWrapper<VideoSchedule>()
                            .eq(VideoSchedule::getUserId, StpUserUtils.getLoginId())
                            .eq(VideoSchedule::getVideoId, scheduleParams.getVideoId())
            ) > 0) {
                return Result.ok().message("更新成功");
            } else {
                return Result.fail().message("更新失败");
            }
        } else {
            if (videoScheduleMapper.insert(
                    new VideoSchedule()
                            .setCourseId(video.getCourseId())
                            .setVideoName(video.getVideoName())
                            .setVideoImage(video.getVideoImage())
                            .setVideoId(scheduleParams.getVideoId())
                            .setWatchDuration(scheduleParams.getVideoDuration())
                            .setUserId(Long.valueOf(StpUserUtils.getLoginId().toString()))
            ) > 0) {
                return Result.ok().message("新增成功");
            } else {
                return Result.fail().message("新增失败");
            }
        }
    }

}
