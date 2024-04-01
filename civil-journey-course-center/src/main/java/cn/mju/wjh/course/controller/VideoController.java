package cn.mju.wjh.course.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.UploadParams;
import cn.mju.wjh.common.core.entity.param.course.CourseParams;
import cn.mju.wjh.common.core.entity.param.course.VideoCommentsParams;
import cn.mju.wjh.common.core.entity.param.course.VideoScheduleParams;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.security.annotation.SaUserCheckLogin;
import cn.mju.wjh.course.service.VideoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * ClassName: VideoController
 * Package: cn.mju.wjh.course.controller
 * Description: 视频服务(前台)
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/27--16:59
 */
@RestController
@SaUserCheckLogin
@Tag(name = "视频服务(前台)")
@RequestMapping("/front/video/")
public class VideoController {

    @Setter(onMethod_ = @Autowired)
    private VideoService videoService;

    @SaIgnore
    @GetMapping("homeShowVideo")
    @Operation(summary = "首页--展示视频", description = "默认8条数据")
    public Result homeShowVideo() {
        return videoService.homeShowVideo();
    }

    @PostMapping("queryVideoHistory")
    @Operation(summary = "查询--视频历史记录")
    public Result queryVideoHistory(@RequestBody @Validated PageParams pageParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return videoService.queryVideoHistory(pageParams);
    }

    @SaIgnore
    @PostMapping("uploadVideo")
    @Operation(summary = "视频--上传视频文件")
    public Result uploadVideo(@RequestParam("file") MultipartFile file, UploadParams params) {
        return videoService.uploadVideo(file, params.getUsername());
    }

    @SaIgnore
    @PostMapping("uploadVideoCover")
    @Operation(summary = "视频--上传视频封面")
    public Result uploadVideoCover(@RequestParam("file") MultipartFile file, UploadParams params) {
        return videoService.uploadVideoCover(file, params.getUsername());
    }

    @SaIgnore
    @PostMapping("uploadPreviewVideo")
    @Operation(summary = "视频--上传预览视频")
    public Result uploadPreviewVideo(@RequestParam("file") MultipartFile file, UploadParams params) {
        return videoService.uploadPreviewVideo(file, params.getUsername());
    }

    @PostMapping("queryVideoCollection")
    @Operation(summary = "视频--视频合集")
    public Result queryVideoCollection(@RequestBody @Validated CourseParams courseParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return videoService.queryVideoCollection(courseParams);
    }

    @GetMapping("queryVideoInfo/{videoId}")
    @Operation(summary = "视频--视频信息")
    public Result queryVideoInfo(@PathVariable("videoId") Long videoId) {
        return videoService.queryVideoInfo(videoId);
    }

    @GetMapping("queryCommentInfo/{videoId}")
    @Operation(summary = "视频--视频评论信息")
    public Result queryCommentInfo(@PathVariable("videoId") Long videoId) {
        return videoService.queryCommentInfo(videoId);
    }

    @GetMapping("videoLikeOrNoLike/{videoId}")
    @Operation(summary = "视频--点赞/取消点赞")
    public Result videoLikeOrNoLike(@PathVariable("videoId") Long videoId) {
        return videoService.videoLikeOrNoLike(videoId);
    }

    @PostMapping("videoComments")
    @Operation(summary = "视频--视频评论")
    public Result videoComments(@RequestBody @Validated VideoCommentsParams commentsParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return videoService.videoComments(commentsParams);
    }

    @PostMapping("insertVideoSchedule")
    @Operation(summary = "视频--记录视频播放时长")
    public Result insertVideoSchedule(@RequestBody @Validated VideoScheduleParams scheduleParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return videoService.insertVideoSchedule(scheduleParams);
    }
}
