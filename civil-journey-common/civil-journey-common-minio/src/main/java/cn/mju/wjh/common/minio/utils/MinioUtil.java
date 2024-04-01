package cn.mju.wjh.common.minio.utils;

import cn.mju.wjh.common.minio.config.MinioConfig;
import io.micrometer.common.util.StringUtils;
import io.minio.*;
import io.minio.http.Method;
import io.minio.messages.Bucket;
import io.minio.messages.Item;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.FastByteArrayOutputStream;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 * ClassName: MinioUtil
 * Package: cn.mju.wjh.minio.utils
 * Description: MinIO工具类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/12--15:12
 */
@Component
public class MinioUtil {

    @Autowired
    private MinioConfig minioConfig;
    @Resource
    private MinioClient minioClient;

    /**
     * 查看存储bucket是否存在
     * @return boolean
     */
    public Boolean bucketExists(String bucketName) {
        boolean found;
        try {
            found = minioClient
                    .bucketExists(
                            BucketExistsArgs
                                    .builder()
                                    .bucket(bucketName)
                                    .build()
                    );
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return found;
    }

    /**
     * 创建存储bucket
     * @return Boolean
     */
    public Boolean makeBucket(String bucketName) {
        try {
            minioClient
                    .makeBucket(
                            MakeBucketArgs
                                    .builder()
                                    .bucket(bucketName)
                                    .build()
                    );
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * 删除存储bucket
     * @return Boolean
     */
    public Boolean removeBucket(String bucketName) {
        try {
            minioClient
                    .removeBucket(
                            RemoveBucketArgs
                                    .builder()
                                    .bucket(bucketName)
                                    .build()
                    );
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * 获取全部bucket
     */
    public List<Bucket> getAllBuckets() {
        try {
            return minioClient.listBuckets();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 文件上传
     * @param file 文件
     * @param fileType 文件类型(avatar--头像、video--视频、picture--图片)
     * @param filePublisher 发布者(格式--发布者:课程编号)
     * @return
     */
    public String upload(MultipartFile file, String fileType, String fileCategory, String filePublisher) {
        // 获取源文件名
        String originalFilename = file.getOriginalFilename();

        // 文件名是否为null或只有空格
        if (StringUtils.isBlank(originalFilename)){
            // 可自定义异常
            throw new RuntimeException();
        }

        // 获取文件的后缀
        String substring = originalFilename.substring(originalFilename.lastIndexOf("."));

        // 文件全路径(video/category/文件名)
        StringBuilder folderName = new StringBuilder();

        // 文件夹类型拼接
        if (StringUtils.isNotEmpty(fileType)) {
            folderName.append(fileType).append("/");
        }
        if (StringUtils.isNotEmpty(fileCategory)) {
            folderName.append(fileCategory).append("/");
        }
        if(StringUtils.isNotEmpty(filePublisher)) {
            folderName.append(filePublisher).append("/");
        }

        String objectName;
        // 判断是否有拼接好的路径
        if (StringUtils.isNotEmpty(folderName.toString())) {
            objectName = folderName.toString() + new Date(System.currentTimeMillis()) + "-" + System.currentTimeMillis() + substring;
        } else {
            objectName =  new Date(System.currentTimeMillis()) + "-" + System.currentTimeMillis() + substring;
        }

        try {
            // 将文件存入桶里
            minioClient.putObject(
                    PutObjectArgs
                            .builder()
                            // 获取桶名称
                            .bucket(minioConfig.getBucketName())
                            // 桶里的对象名
                            .object(objectName)
                            // 要上传的流
                            .stream(
                                    file.getInputStream(),
                                    file.getSize(),
                                    -1
                            )
                            .contentType(file.getContentType())
                            .build()
            );
        } catch (Exception e) {
            // 可自定义异常
            throw new RuntimeException(e);
        }

        return objectName;
    }

    /**
     * 预览图片
     * @param fileName
     * @return
     */
    public String preview(String fileName){
        // 查看文件地址
        new GetPresignedObjectUrlArgs();
        GetPresignedObjectUrlArgs build = GetPresignedObjectUrlArgs
                .builder()
                // 桶名称
                .bucket(minioConfig.getBucketName())
                // 文件名称
                .object(fileName)
                .method(Method.GET)
                .build();
        try {
            // 获取预览地址
            return minioClient.getPresignedObjectUrl(build);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 文件下载
     * @param fileName 文件名称
     * @param res response
     * @return Boolean
     */
    public void download(String fileName, HttpServletResponse res) {
        // 获取文件对象
        GetObjectArgs objectArgs = GetObjectArgs
                .builder()
                // 桶名称
                .bucket(minioConfig.getBucketName())
                // 文件名
                .object(fileName)
                .build();

        // 获取文件对象响应体(是否存在)
        try (GetObjectResponse response = minioClient.getObject(objectArgs)){

            // 按 1KB 下载
            byte[] buf = new byte[1024];
            int len;

            // FastByteArrayOutputStream 可动态构建字节数组的输出流
            try (FastByteArrayOutputStream os = new FastByteArrayOutputStream()){

                // 循环写入
                while ((len = response.read(buf)) != -1) {
                    os.write(buf, 0, len);
                }

                // 刷新输出流
                os.flush();
                byte[] bytes = os.toByteArray();

                // 设置字节码
                res.setCharacterEncoding("utf-8");
                // 设置强制下载不打开
                res.setContentType("application/force-download");
                // 设置响应头
                res.addHeader("Content-Disposition", "attachment;fileName=" + fileName);

                // ServletOutputStream 将字节流直接发送给客户端,不需要经过缓冲区(通常用在文件内容、图像数据)
                try (ServletOutputStream stream = res.getOutputStream()){
                    stream.write(bytes);
                    stream.flush();
                }
            }
        } catch (Exception e) {
            // 可自定义异常
            throw new RuntimeException();
        }
    }

    /**
     * 查看某个文件夹下的对象
     * filePath 文件路径(记得以 `/` 结尾)
     * @return 存储bucket内文件对象信息
     */
    public List<Item> listObjects(String filePath) {
        Iterable<Result<Item>> results = minioClient
                .listObjects(
                        ListObjectsArgs
                                .builder()
                                .bucket(minioConfig.getBucketName())
                                // 文件名
                                .prefix(filePath)
                                .build()
                );
        List<Item> items = new ArrayList<>();
        try {
            for (Result<Item> result : results) {
                items.add(result.get());
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return items;
    }

    /**
     * 删除文件对象
     * @param fileName 文件路径
     * @return
     * @throws Exception
     */
    public boolean remove(String fileName){
        try {
            minioClient
                    .removeObject(
                            RemoveObjectArgs
                                    .builder()
                                    .bucket(minioConfig.getBucketName())
                                    .object(fileName).build()
                    );
        }catch (Exception e){
            return false;
        }
        return true;
    }

}