### 命名空间

> 新建命名空间--civil-journey,配置和注册都在此命名空间中

![1-1](D:\All-Project\Project-Graduation\Civil-Journey-Project\Project-Civil-Journey-Configuration\Nacos-Configuration\imgs\1-1.png)

### 网关配置

> gateway-service.yml -- DEFAULT_GROUP

```yml
spring:
  cloud:
    gateway:
      discovery:
        locator:
          # 启用服务发现
          enabled: true
          # 服务转化为小写
          lower-case-service-id: true

# 注意不能和 spring.cloud.geteway.routes 一起使用会被路由转发走
# 子模块一定要引入依赖并且配置相应的信息(common-swagger.yml)
knife4j:
  gateway:
    # 开启网关文档
    enabled: true
    # 聚合微服务文档(指定服务发现的模式,默认分组 default)
    strategy: discover
    discover:
      # 开启聚合文档
      enabled: true
      # OpenAPI 3.0 规范
      version: openapi3
      excluded-services:
        - gateway-service

# Sa-Token配置
sa-token:
  # 与子服务的token-name需一致
  token-name: accessToken
  # 路径白名单
  ignore-white:
      - '/doc.html'
      - '/v3/**'
      - '/webjars/**'
      - '/api-docs/**'
      - '/*/v3/api-docs/**'
      - '/auth-center-service/auth/user/loginEmail'
      - '/auth-center-service/auth/user/loginByUsername'
      - '/auth-center-service/auth/user/logout'
      - '/auth-center-service/auth/user/register'
      - '/auth-center-service/auth/user/getEmailCode'
      - '/auth-center-service/auth/admin/login'
      - '/auth-center-service/auth/admin/logout'
```

### 数据库驱动配置

> common-mysql.yml -- COMMON_GROUP

```yml
spring:
  datasource:
    # 数据库地址改成自己的
    url: jdbc:mysql://localhost:3306/civil_journey?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT%2B8
    # 用户名和密码也改成自己的
    username: root
    password: 123456

mybatis-plus:
  configuration:
    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl
```

### Redis配置

> common-redis.yml -- COMMON_GROUP

```yml
spring:
    data:
      redis:
        # redis数据库索引(默认0)
        database: 0
        # redis服务器地址(改成自己的)
        host: localhost
        # redis服务器连接端口
        port: 6379
        # redis的密码(默认空)
        password: root
        # redis连接超时时间
        timeout: 10s
        lettuce:
          pool:
            # 连接池最大连接数
            max-active: 200
            # 连接池最大阻塞等待时间(使用负值表示没有限制)
            max-wait: -1ms
            # 连接池中的最大空闲时间
            max-idle: 10
            # 连接池中的最小空闲时间
            min-idle: 0
```

### Email配置

> common-email.yml -- COMMON_GROUP

```yml
spring:
  mail:
    # smtp服务主机
    # qq邮箱则为smtp.qq.com
    # 网易邮箱则为smtp.163.com
    host: smtp.163.com
    #服务协议
    protocol: smtp
    # 编码集
    default-encoding: UTF-8
    # 发送邮件的账户(改成自己的)
    username: 1111@qq.com
    # 用户昵称
    nickname : '公途平台'
    # 授权码(自己的邮箱中获取)
    password: *
    test-connection: true
    properties:
      mail:
        smtp:
          auth: true
          starttls:
            enable: true
            required: true
```

### MinIO配置

> common-minio.yml -- COMMON_GROUP

```yml
minio:
  # 服务地址(改成自己的)
  endpoint: http://localhost:9000
  # 存储桶名称(改成自己的)
  bucketName: civil-journey-project
  # 用户名(改成自己的)
  accessKey: userOne
  # 密码(改成自己的)
  secretKey: userOne123
```

### Alipay配置

> alipay-service.yml -- PAY-GROUP

``` yml
alipay:
  # 协议
  protocol: https
  # 标记类型
  signType: RSA2
  # 数据类型
  forMat: JSON
  # 编码
  charSet: UTF-8
  # 应用唯一ID
  appId: 9021000131613383
  # 应用私钥(改成自己的)
  appPrivateKey: * 
  # 支付宝公钥(改成自己的)
  alipayPublicKey: *
  # 支付宝网关
  gatewayUrl: https://openapi-sandbox.dl.alipaydev.com/gateway.do
  # 支付宝异步通知路径,付款完毕后会异步调用本项目的接口方法(必须为公网地址)--运行natApp后的映射地址
  notifyUrl: http://msqwdt.natappfree.cc/payment-center-service/alipay/notify
  # 支付宝同步通知路径,付款完毕后会跳转的界面(改成自己需要的)
  returnUrl: http://localhost:10000/userOrderInfo
```

### 子模块的Swagger Api配置

> common-swagger.yml -- COMMON_GROUP

```yml
springdoc:
  swagger-ui:
    # Swagger UI页面路径
    path: /swagger-ui.html
    # 标签排序方式
    tags-sorter: alpha
    # 操作排序方式
    operations-sorter: alpha
  api-docs:
    # API文档路径
    path: /v3/api-docs
  group-configs:
      # 组配置
    - group: 'default'
      # 匹配的路径
      paths-to-match: "/**"
      # 扫描的包名
      packages-to-scan:
        - cn.mju.wjh.auth.controller
        - cn.mju.wjh.user.controller
        - cn.mju.wjh.chart.controller
        - cn.mju.wjh.course.controller
        - cn.mju.wjh.article.controller
        - cn.mju.wjh.message.controller
        - cn.mju.wjh.payment.controller
        - cn.mju.wjh.feedback.controller

knife4j:
  # 开启Knife4j文档
  enable: true
  # 语言
  setting:
    language: zh_cn
```

### 子模块的SaToken配置

> common-security.yml -- COMMON_GROUP

```yml
# Sa-Token配置
sa-token:
  # token名称 (同时也是cookie名称)
  token-name: accessToken
  # token 有效期(单位：秒) 默认30天，-1 代表永久有效
  timeout: 2592000
  # token 最低活跃频率(单位:秒)，如果 token 超过此时间没有访问系统就会被冻结，默认-1 代表不限制，永不冻结
  active-timeout: -1
  # 是否允许同一账号多地同时登录(为 true 时允许一起登录, 为 false 时新登录挤掉旧登录)
  is-concurrent: false
  # 在多人登录同一账号时,是否共用一个 token(为 true 时所有登录共用一个 token, 为 false 时每次登录新建一个 token)
  is-share: false
  # token风格
  token-style: random-128
  # 是否输出操作日志
  is-log: true
  # 自定义密码(会根据Hutool生成密钥)
  key: 1535659865986584
```

### 子模块的热部署配置

> common-devtool.yml -- COMMON_GROUP

```yml
spring:
  devtools:
    restart:
      enabled: true
```
