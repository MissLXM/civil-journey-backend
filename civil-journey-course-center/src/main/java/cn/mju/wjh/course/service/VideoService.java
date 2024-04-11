package cn.mju.wjh.course.service;

import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.course.CourseParams;
import cn.mju.wjh.common.core.entity.param.course.VideoCommentsParams;
import cn.mju.wjh.common.core.entity.param.course.VideoScheduleParams;
import cn.mju.wjh.common.core.utils.Result;
import org.springframework.web.multipart.MultipartFile;

/**
 * ClassName: VideoService
 * Package: cn.mju.wjh.course.service
 * Description: 视频服务接口(前台)
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/27--17:00
 */
public interface VideoService {

    /**
     * 首页--展示视频
     * @return 视频信息
     */
    Result homeShowVideo();

    /**
     * 查询--视频历史记录
     * @param pageParams 分页参数
     * @return 视频信息
     */
    Result queryVideoHistory(PageParams pageParams);

    /**
     * 视频--上传视频
     * @param file 文件
     * @param username 登录名称
     * @return 视频地址
     */
    Result uploadVideo(MultipartFile file, String username);

    /**
     * 视频--上传视频封面
     * @param file 文件
     * @param username 登录名称
     * @return 视频封面地址
     */

    Result uploadVideoCover(MultipartFile file, String username);

    /**
     * 视频--上传预览视频
     * @param file 文件
     * @param username 登录名称
     * @return 预览视频地址
     */
    Result uploadPreviewVideo(MultipartFile file, String username);

    /**
     * 视频--获取视频合集信息
     * @param courseParams 课程参数
     * @return 视频合集信息
     */
    Result queryVideoCollection(CourseParams courseParams);

    /**
     * 视频--获取视频详细信息
     * @param videoId 视频ID
     * @return 视频详细信息
     */
    Result queryVideoInfo(Long videoId);

    /**
     * 视频--获取视频评论信息
     * @param videoId 视频ID
     * @return 视频评论信息
     */
    Result queryCommentInfo(Long videoId);

    /**
     * 视频--点赞/取消点赞
     * @param videoId 视频ID
     * @return 是否操作成功
     */
    Result videoLikeOrNoLike(Long videoId);

    /**
     * 视频--视频评论
     * @param commentsParams 评论参数
     * @return 是否操作成功
     */
    Result videoComments(VideoCommentsParams commentsParams);

    /**
     * 视频--记录视频播放时长
     * @param scheduleParams 视频播放时长参数
     * @return 是否记录成功
     */
    Result insertVideoSchedule(VideoScheduleParams scheduleParams);

    /**
     * 视频--删除视频评论
     * @param commentId 评论ID
     * @return 是否删除成功
     */
    Result deleteVideoComment(Long commentId);
}
