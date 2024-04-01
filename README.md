# 公途后端项目--微服务架构
## 项目搭建
### 1、项目所需环境
* Nat App服务
* Java 17及以上
* MySQL 8.0及以上
* Redis 6.2.6及以上
* Nacos 2.0.3及以上
* Maven 3.8.1及以上
* MinIO 2022-01-04及以上

### 2、项目所需资源
1. 将sql目录中的sql文件导入数据库中
2. 将doc目录中文档的内容配置到Nacos中
3. 将zip目录中的所有zip文件解压到MinIO中,有图片参考

### 3、 项目运行操作
1. 首先启动Nat App 服务,然后将Nacos中alipay-service.yml文件的内网穿透地址修改
2. 确保MySQL服务、Redis服务、Nacos服务、MinIO服务都在本地或者服务器上跑起来,并且项目重新载入一遍pom文件
3. 启动项目