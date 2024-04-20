/*
 Navicat Premium Data Transfer

 Source Server         : MySQL-8.0
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : civil_journey

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 20/04/2024 13:16:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `admin_role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '管理员角色ID',
  `admin_id` bigint NOT NULL COMMENT '管理员ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`admin_role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '管理员角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES (1, 1, 1);
INSERT INTO `admin_role` VALUES (2, 2, 1);
INSERT INTO `admin_role` VALUES (3, 3, 1);
INSERT INTO `admin_role` VALUES (4, 4, 1);
INSERT INTO `admin_role` VALUES (5, 5, 2);
INSERT INTO `admin_role` VALUES (6, 6, 2);
INSERT INTO `admin_role` VALUES (7, 7, 2);
INSERT INTO `admin_role` VALUES (8, 8, 2);
INSERT INTO `admin_role` VALUES (9, 9, 2);
INSERT INTO `admin_role` VALUES (10, 10, 2);
INSERT INTO `admin_role` VALUES (11, 11, 2);
INSERT INTO `admin_role` VALUES (12, 12, 2);
INSERT INTO `admin_role` VALUES (13, 13, 2);

-- ----------------------------
-- Table structure for article_collection
-- ----------------------------
DROP TABLE IF EXISTS `article_collection`;
CREATE TABLE `article_collection`  (
  `article_collection_id` bigint NOT NULL AUTO_INCREMENT COMMENT '文章收藏ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `article_id` bigint NOT NULL COMMENT '文章ID',
  PRIMARY KEY (`article_collection_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章收藏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article_collection
-- ----------------------------
INSERT INTO `article_collection` VALUES (3, 1, 3);
INSERT INTO `article_collection` VALUES (4, 1, 4);
INSERT INTO `article_collection` VALUES (5, 1, 5);
INSERT INTO `article_collection` VALUES (6, 1, 6);
INSERT INTO `article_collection` VALUES (7, 1, 7);
INSERT INTO `article_collection` VALUES (8, 1, 8);
INSERT INTO `article_collection` VALUES (9, 1, 9);
INSERT INTO `article_collection` VALUES (10, 1, 10);
INSERT INTO `article_collection` VALUES (11, 1, 11);
INSERT INTO `article_collection` VALUES (12, 1, 12);
INSERT INTO `article_collection` VALUES (13, 1, 13);
INSERT INTO `article_collection` VALUES (14, 1, 14);
INSERT INTO `article_collection` VALUES (15, 1, 15);
INSERT INTO `article_collection` VALUES (23, 1, 1);

-- ----------------------------
-- Table structure for article_comments
-- ----------------------------
DROP TABLE IF EXISTS `article_comments`;
CREATE TABLE `article_comments`  (
  `article_comments_id` bigint NOT NULL AUTO_INCREMENT COMMENT '文章评论ID',
  `article_id` bigint NOT NULL COMMENT '文章ID',
  `user_id` bigint NOT NULL COMMENT '评论者ID',
  `commenter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论者姓名',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论的内容',
  `commenter_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论者头像',
  `comment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论日期',
  PRIMARY KEY (`article_comments_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article_comments
-- ----------------------------
INSERT INTO `article_comments` VALUES (1, 51, 1, '王罗源', '评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试', 'avatar/1.png', '2024-03-04 15:23:20');
INSERT INTO `article_comments` VALUES (2, 51, 1, '王罗源', '评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试', 'avatar/1.png', '2024-03-04 15:23:29');
INSERT INTO `article_comments` VALUES (3, 51, 1, '王罗源', '评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试', 'avatar/1.png', '2024-03-04 15:23:32');
INSERT INTO `article_comments` VALUES (4, 51, 1, '王罗源', '评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试', 'avatar/1.png', '2024-03-04 15:23:34');
INSERT INTO `article_comments` VALUES (5, 51, 1, '王罗源', '评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试', 'avatar/1.png', '2024-03-04 15:23:36');
INSERT INTO `article_comments` VALUES (6, 51, 1, '王罗源', '评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试', 'avatar/1.png', '2024-03-04 15:23:42');
INSERT INTO `article_comments` VALUES (7, 51, 1, '王罗源', '评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试', 'avatar/1.png', '2024-03-04 15:23:45');
INSERT INTO `article_comments` VALUES (8, 51, 1, '王罗源', '评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试', 'avatar/1.png', '2024-03-04 15:23:48');
INSERT INTO `article_comments` VALUES (9, 51, 1, '王罗源', '评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试', 'avatar/1.png', '2024-03-04 15:23:51');
INSERT INTO `article_comments` VALUES (10, 51, 1, '王罗源', '评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试', 'avatar/1.png', '2024-03-04 15:23:55');
INSERT INTO `article_comments` VALUES (11, 51, 1, '王罗源', '评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试', 'avatar/1.png', '2024-03-04 15:23:58');
INSERT INTO `article_comments` VALUES (12, 51, 1, '王罗源', '评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试', 'avatar/1.png', '2024-03-04 15:24:00');
INSERT INTO `article_comments` VALUES (13, 48, 1, '王罗源', '这是一个测试评论??????', 'avatar/1.png', '2024-03-04 16:17:48');
INSERT INTO `article_comments` VALUES (14, 21, 1, '王罗源', 'aaa', 'avatar/1.png', '2024-03-19 17:28:34');
INSERT INTO `article_comments` VALUES (15, 54, 1, '王罗源', 'aaa', 'avatar/1.png', '2024-03-27 20:24:59');
INSERT INTO `article_comments` VALUES (16, 54, 1, '王罗源', 'aa????', 'avatar/1.png', '2024-03-27 20:25:09');
INSERT INTO `article_comments` VALUES (17, 50, 19, 'Lensy', 'aaaa', 'avatar/6.jpg', '2024-03-27 20:30:14');
INSERT INTO `article_comments` VALUES (18, 1, 1, '王罗源', 'aaa', 'avatar/1.png', '2024-04-06 13:22:39');

-- ----------------------------
-- Table structure for article_history
-- ----------------------------
DROP TABLE IF EXISTS `article_history`;
CREATE TABLE `article_history`  (
  `article_history_id` bigint NOT NULL AUTO_INCREMENT COMMENT '文章历史ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `article_id` bigint NOT NULL COMMENT '文章ID',
  `article_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章标题',
  `article_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章封面',
  `creator_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '发布者名称',
  PRIMARY KEY (`article_history_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 163 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章历史表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article_history
-- ----------------------------
INSERT INTO `article_history` VALUES (1, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (2, 1, 2, '公务员面试心得分享', 'article/2.png', '王罗源');
INSERT INTO `article_history` VALUES (3, 1, 3, '军队文职招聘信息汇总', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (4, 1, 4, '事业单位招聘攻略', 'article/4.png', '王罗源');
INSERT INTO `article_history` VALUES (5, 1, 5, '三支一扶招聘信息汇总', 'article/5.png', '王罗源');
INSERT INTO `article_history` VALUES (6, 1, 6, '公安招警笔试经验分享', 'article/6.png', '王罗源');
INSERT INTO `article_history` VALUES (7, 1, 7, '事业单位招聘面试经验分享', 'article/7.png', 'Miss');
INSERT INTO `article_history` VALUES (8, 1, 8, '三支一扶招聘面试技巧', 'article/8.png', 'Miss');
INSERT INTO `article_history` VALUES (9, 1, 9, '事业单位招聘笔试经验分享', 'article/1.png', 'Miss');
INSERT INTO `article_history` VALUES (10, 1, 10, '三支一扶招聘面试经验分享', 'article/2.png', 'Miss');
INSERT INTO `article_history` VALUES (11, 1, 11, '公务员面试技巧与注意事项', 'article/3.png', 'Miss');
INSERT INTO `article_history` VALUES (12, 1, 12, '三支一扶志愿者心得分享', 'article/4.png', 'Miss');
INSERT INTO `article_history` VALUES (13, 1, 13, '公务员面试技巧分享', 'article/5.png', 'Miss');
INSERT INTO `article_history` VALUES (14, 1, 14, '军队文职招聘备考经验', 'article/6.png', 'Miss');
INSERT INTO `article_history` VALUES (15, 1, 15, '事业单位招聘常见面试问题', 'article/7.png', 'Miss');
INSERT INTO `article_history` VALUES (16, 1, 10, '三支一扶招聘面试经验分享', 'article/2.png', '王罗源');
INSERT INTO `article_history` VALUES (17, 1, 10, '三支一扶招聘面试经验分享', 'article/2.png', '王罗源');
INSERT INTO `article_history` VALUES (18, 1, 50, '事业单位面试经验分享', 'article/2.png', '王罗源');
INSERT INTO `article_history` VALUES (19, 1, 50, '事业单位面试经验分享', 'article/2.png', '王罗源');
INSERT INTO `article_history` VALUES (20, 1, 50, '事业单位面试经验分享', 'article/2.png', '王罗源');
INSERT INTO `article_history` VALUES (21, 1, 19, '公务员笔记分享：政治常识', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (22, 1, 50, '事业单位面试经验分享', 'article/2.png', '王罗源');
INSERT INTO `article_history` VALUES (23, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (24, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (25, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (26, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (27, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (28, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (29, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (30, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (31, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (32, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (33, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (34, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (35, 1, 47, '事业单位面试经验分享', 'article/7.png', '王罗源');
INSERT INTO `article_history` VALUES (36, 1, 47, '事业单位面试经验分享', 'article/7.png', '王罗源');
INSERT INTO `article_history` VALUES (37, 1, 47, '事业单位面试经验分享', 'article/7.png', '王罗源');
INSERT INTO `article_history` VALUES (38, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (39, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (40, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (41, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (42, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (43, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (44, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (45, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (46, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (47, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (48, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (49, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (50, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (51, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (52, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (53, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (54, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (55, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (56, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (57, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (58, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (59, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (60, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (61, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (62, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (63, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (64, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (65, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (66, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (67, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (68, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (69, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (70, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (71, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (72, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (73, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (74, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (75, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (76, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (77, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (78, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (79, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (80, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (81, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (82, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (83, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (84, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (85, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (86, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (87, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (88, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (89, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (90, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (91, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (92, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (93, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (94, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (95, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (96, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (97, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (98, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (99, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (100, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (101, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (102, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (103, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (104, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (105, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (106, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (107, 1, 52, '军队文职岗位解析', 'article/4.png', '王罗源');
INSERT INTO `article_history` VALUES (108, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (109, 1, 51, '公考面试技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (110, 1, 50, '事业单位面试经验分享', 'article/2.png', '王罗源');
INSERT INTO `article_history` VALUES (111, 1, 50, '事业单位面试经验分享', 'article/2.png', '王罗源');
INSERT INTO `article_history` VALUES (112, 1, 101, '事业单位笔记分享', 'article/articleType: 解题技巧/username: /2024-03-05-1709620540211.jpg', '王罗源');
INSERT INTO `article_history` VALUES (113, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (114, 1, 20, '公务员笔记分享：行测技巧', 'article/4.png', '王罗源');
INSERT INTO `article_history` VALUES (115, 1, 2, '公务员面试心得分享', 'article/2.png', '王罗源');
INSERT INTO `article_history` VALUES (116, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (117, 1, 3, '军队文职招聘信息汇总', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (118, 1, 3, '军队文职招聘信息汇总', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (119, 1, 3, '军队文职招聘信息汇总', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (120, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (121, 1, 8, '三支一扶招聘面试技巧', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (122, 1, 102, '军队文职笔记分享', 'article/6.png', '王罗源');
INSERT INTO `article_history` VALUES (123, 1, 21, '军队文职考试经验分享', 'article/5.png', '王罗源');
INSERT INTO `article_history` VALUES (124, 1, 91, '三支一扶解题技巧分享', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (125, 1, 94, '军队文职解题技巧分享', 'article/6.png', '王罗源');
INSERT INTO `article_history` VALUES (126, 1, 95, '事业单位解题技巧分享', 'article/7.png', '王罗源');
INSERT INTO `article_history` VALUES (127, 1, 95, '事业单位解题技巧分享', 'article/7.png', '王罗源');
INSERT INTO `article_history` VALUES (128, 1, 95, '事业单位解题技巧分享', 'article/7.png', '王罗源');
INSERT INTO `article_history` VALUES (129, 1, 95, '事业单位解题技巧分享', 'article/7.png', '王罗源');
INSERT INTO `article_history` VALUES (130, 1, 95, '事业单位解题技巧分享', 'article/7.png', '王罗源');
INSERT INTO `article_history` VALUES (131, 1, 54, '公安招警体能测试注意事项', 'article/6.png', '王罗源');
INSERT INTO `article_history` VALUES (132, 1, 50, '事业单位面试经验分享', 'article/2.png', '王罗源');
INSERT INTO `article_history` VALUES (133, 1, 11, '公务员面试技巧与注意事项', 'article/3.png', '王罗源');
INSERT INTO `article_history` VALUES (134, 19, 104, '测试', 'article/articleType: 解题技巧/username: /2024-03-27-1711542752960.jpg', 'Lensy');
INSERT INTO `article_history` VALUES (135, 19, 104, '测试', 'article/articleType: 解题技巧/username: /2024-03-27-1711542752960.jpg', 'Lensy');
INSERT INTO `article_history` VALUES (136, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (137, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (138, 1, 54, '公安招警体能测试注意事项', 'article/6.png', '王罗源');
INSERT INTO `article_history` VALUES (139, 1, 1, '公务员笔试技巧分享', 'article/1.png', '王罗源');
INSERT INTO `article_history` VALUES (140, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (141, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (142, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (143, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (144, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (145, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (146, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (147, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (148, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (149, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (150, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (151, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (152, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (153, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (154, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (155, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (156, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (157, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (158, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (159, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (160, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (161, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (162, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');
INSERT INTO `article_history` VALUES (163, 1, 48, '三支一扶服务心得体会', 'article/8.png', '王罗源');

-- ----------------------------
-- Table structure for article_like
-- ----------------------------
DROP TABLE IF EXISTS `article_like`;
CREATE TABLE `article_like`  (
  `article_like_id` bigint NOT NULL AUTO_INCREMENT COMMENT '文章点赞ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `article_id` bigint NOT NULL COMMENT '文章ID',
  PRIMARY KEY (`article_like_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章点赞表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article_like
-- ----------------------------
INSERT INTO `article_like` VALUES (2, 1, 5);
INSERT INTO `article_like` VALUES (3, 1, 8);
INSERT INTO `article_like` VALUES (9, 1, 1);

-- ----------------------------
-- Table structure for civil_admin
-- ----------------------------
DROP TABLE IF EXISTS `civil_admin`;
CREATE TABLE `civil_admin`  (
  `admin_id` bigint NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录名称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录密码',
  `signature` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '个性签名',
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '管理员性别',
  `nickname` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '管理员昵称',
  `admin_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '管理员邮箱',
  `head_portrait` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'avatar/defualt.png' COMMENT '管理员头像',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除(0:正常、1:禁用、2:删除)',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '管理员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of civil_admin
-- ----------------------------
INSERT INTO `civil_admin` VALUES (1, 'lenzy', 'M3iNdz1sYhs6U8nlSn+bqg==', '这是一个个性签名', '男', 'Miss_Lenzy', '2026661261@qq.com', 'avatar/1.jpeg', 0);
INSERT INTO `civil_admin` VALUES (2, 'admin1', 'M3iNdz1sYhs6U8nlSn+bqg==', '这是一个个性签名', '女', '管理员一号', '2415624512@qq.com', 'avatar/2.jpeg', 0);
INSERT INTO `civil_admin` VALUES (3, 'admin2', 'M3iNdz1sYhs6U8nlSn+bqg==', '这是一个个性签名', '男', '管理员二号', '1542523658@qq.com', 'avatar/3.jpeg', 0);
INSERT INTO `civil_admin` VALUES (4, 'admin3', 'M3iNdz1sYhs6U8nlSn+bqg==', '这是一个个性签名', '男', '管理员三号', '1547584586@qq.com', 'avatar/4.jpeg', 0);
INSERT INTO `civil_admin` VALUES (5, 'admin4', 'M3iNdz1sYhs6U8nlSn+bqg==', '这是一个个性签名', '女', '管理员四号', '1354854865@qq.com', 'avatar/5.jpeg', 0);
INSERT INTO `civil_admin` VALUES (6, 'admin5', 'M3iNdz1sYhs6U8nlSn+bqg==', '这是一个个性签名', '男', '管理员五号', '1547658956@qq.com', 'avatar/6.jpeg', 0);
INSERT INTO `civil_admin` VALUES (7, 'admin6', 'M3iNdz1sYhs6U8nlSn+bqg==', '这是一个个性签名', '女', '管理员六号', '1547658951@qq.com', 'avatar/7.jpeg', 0);
INSERT INTO `civil_admin` VALUES (8, 'admin7', 'M3iNdz1sYhs6U8nlSn+bqg==', '这是一个个性签名', '男', '管理员七号', '1245652546@qq.com', 'avatar/1.jpeg', 0);
INSERT INTO `civil_admin` VALUES (9, 'admin8', 'M3iNdz1sYhs6U8nlSn+bqg==', '这是一个个性签名', '女', '管理员八号', '1845758658@qq.com', 'avatar/2.jpeg', 0);
INSERT INTO `civil_admin` VALUES (10, 'admin9', 'M3iNdz1sYhs6U8nlSn+bqg==', '这是一个个性签名', '男', '管理员九号', '1985458452@qq.com', 'avatar/3.jpeg', 0);
INSERT INTO `civil_admin` VALUES (11, 'admin10', 'M3iNdz1sYhs6U8nlSn+bqg==', '这是一个个性签名', '女', '管理员十号', '1845754564@qq.com', 'avatar/4.jpeg', 0);
INSERT INTO `civil_admin` VALUES (12, 'admin11', 'M3iNdz1sYhs6U8nlSn+bqg==', '这是一个个性签名', '男', '管理员十一号', '1485458475@qq.com', 'avatar/5.jpeg', 0);
INSERT INTO `civil_admin` VALUES (13, 'admin12', 'M3iNdz1sYhs6U8nlSn+bqg==', '这是一个个性签名', '男', '管理员十二号', '1548475486@qq.com', 'avatar/6.jpeg', 0);

-- ----------------------------
-- Table structure for civil_article
-- ----------------------------
DROP TABLE IF EXISTS `civil_article`;
CREATE TABLE `civil_article`  (
  `article_id` bigint NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `article_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章标题',
  `article_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章内容',
  `category_id` bigint NOT NULL COMMENT '分类ID',
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `article_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章类型(解题技巧、学习笔记)',
  `article_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章封面',
  `user_id` bigint NOT NULL COMMENT '发布者ID',
  `creator_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '发布者名称',
  `creator_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '发布者头像',
  `is_curation` tinyint NOT NULL DEFAULT 0 COMMENT '是否精选(0:不精选、1:精选)',
  `like_number` bigint NOT NULL DEFAULT 0 COMMENT '点赞数',
  `browse_number` bigint NOT NULL DEFAULT 0 COMMENT '收藏数',
  `collection_number` bigint NOT NULL DEFAULT 0 COMMENT '浏览数',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `audit_failure_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核失败原因',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态(0:待审核、1:审核成功、2:审核失败)',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of civil_article
-- ----------------------------
INSERT INTO `civil_article` VALUES (1, '公务员笔试技巧分享', '公务员笔试技巧分享 在公务员笔试中，很多考生都面临着各种各样的难题，本文总结了一些解题技巧和经验，希望能够帮助大家更好地备战公务员笔试。 首先，要注重对题目的理解，不要匆忙作答。通过仔细阅读题目，理清思路，可以更准确地解答问题。其次，划重点，抓重点。在解题过程中，要注意找出问题的重点，有针对性地解决问题，提高解题效率。 另外，多做模拟题也是提高笔试水平的有效方法。通过模拟考试，可以熟悉考试环境，提高应试能力。同时，及时总结经验教训，发现问题并加以改进。 总之，公务员笔试是一个综合考察各方面能力的过程，良好的备考方法和技巧对提高考试水平至关重要。希望大家都能在考试中取得好成绩，顺利通过笔试关。 ', 1, '公考笔试', '解题技巧', 'article/1.png', 1, '王罗源', 'avatar/1.png', 0, 1, 50, 1, '2024-01-13 20:19:42', NULL, 1);
INSERT INTO `civil_article` VALUES (2, '公务员面试心得分享', '公务员面试心得分享 公务员面试是很多考生的最后一关，通过面试更是跻身于公务员行列的关键。在面试过程中，一些经验和技巧的掌握可以帮助考生更好地展现自己，提高通过面试的几率。 首先，要注意形象仪容，穿着得体。整齐的仪容和得体的服装能够给考官留下良好的印象。其次，要自信大方，表达清晰。在回答问题时，要有条理地陈述观点，表达清楚自己的思考过程。 另外，要注重沟通能力，与考官保持良好的互动。积极主动地与考官交流，展现自己积极向上的一面。最后，要做好心理准备，保持冷静。面对各种问题和情境，要保持冷静沉着，展现出应对复杂环境的能力。 希望大家都能在面试中取得好成绩，成功通过公务员面试，实现自己的梦想。 ', 2, '公考面试', '学习笔记', 'article/2.png', 1, '王罗源', 'avatar/1.png', 0, 0, 2, 0, '2024-01-13 20:19:42', NULL, 1);
INSERT INTO `civil_article` VALUES (3, '军队文职招聘信息汇总', '军队文职招聘信息汇总 军队文职招聘信息变化较快，及时了解最新的招聘信息对考生非常重要。本文对最新的军队文职招聘信息进行了详细汇总，希望能够为广大考生提供参考。 文章中包含了各个岗位的招聘条件、报名时间、考试科目等重要信息。对于有意向报考军队文职的考生，可以通过详细阅读了解各个岗位的要求，有针对性地进行备考。 希望广大考生都能够顺利通过军队文职招聘，成为优秀的文职人员。 ', 3, '军队文职', '解题技巧', 'article/3.png', 1, '王罗源', 'avatar/1.png', 0, 0, 4, 1, '2024-01-13 20:19:42', NULL, 1);
INSERT INTO `civil_article` VALUES (4, '事业单位招聘攻略', '事业单位招聘攻略 事业单位招聘是许多考生追求稳定工作的首选，但竞争激烈。本文总结了一些事业单位招聘的攻略，希望能够帮助考生更好地备战事业单位招聘。 首先，要了解招聘信息，掌握招聘动态。了解事业单位招聘的岗位信息、招聘条件等，有针对性地进行备考。其次，要注重综合素质，提高综合素养。事业单位注重综合素质，考生要在各个方面都有一定的基础。 另外，要注重模拟考试，提高应试水平。通过模拟考试，可以熟悉考试形式，提高解题速度和准确度。最后，要保持良好的心态，稳定发挥。事业单位招聘考试是一个长期的过程，保持稳定的心态很重要。 希望大家都能够在事业单位招聘中取得好成绩，成功加入事业单位。 ', 4, '事业单位', '学习笔记', 'article/4.png', 1, '王罗源', 'avatar/1.png', 0, 0, 1, 1, '2024-01-13 20:19:42', NULL, 1);
INSERT INTO `civil_article` VALUES (5, '三支一扶招聘信息汇总', '三支一扶招聘信息汇总 三支一扶是为了支持农村和贫困地区发展的招聘计划，也是一条脱贫致富的好途径。本文对最新的三支一扶招聘信息进行了详细汇总，希望能够为有意向报考的考生提供参考。 文章中包含了三支一扶各个岗位的招聘条件、报名时间、考试科目等重要信息。对于有志愿者们，可以通过详细阅读了解各个岗位的要求，有针对性地进行备考。 希望有志愿者们都能够通过三支一扶招聘，为农村和贫困地区的发展贡献自己的力量。 ', 5, '三支一扶', '解题技巧', 'article/5.png', 1, '王罗源', 'avatar/1.png', 0, 0, 1, 1, '2024-01-13 20:19:42', NULL, 1);
INSERT INTO `civil_article` VALUES (6, '公安招警笔试经验分享', '公安招警笔试经验分享 公安招警是一个备受关注的招聘岗位，笔试是其中的重要环节。本文分享了一些公安招警笔试的经验，希望对正在备考的考生有所帮助。 首先，要熟悉考试大纲，明确考试内容和重点。通过仔细阅读大纲，了解考试的范围和要求，可以更有针对性地进行备考。其次，要注重做题技巧，提高解题速度。公安招警笔试时间紧张，掌握一些做题技巧可以更高效地完成考试。 另外，多做模拟题也是提高笔试水平的有效方法。通过模拟考试，可以熟悉考试环境，提高应试能力。最后，要保持良好的心态，不要因为一道题而影响整体发挥。 希望大家都能在公安招警笔试中取得好成绩，顺利进入下一轮选拔。 ', 6, '公安招警', '解题技巧', 'article/6.png', 1, '王罗源', 'avatar/1.png', 0, 0, 1, 1, '2024-01-13 20:26:46', NULL, 1);
INSERT INTO `civil_article` VALUES (7, '事业单位招聘面试经验分享', '事业单位招聘面试经验分享 事业单位招聘面试是考生进入事业单位的重要环节，具有很大的分数比例。本文分享了一些事业单位招聘面试的经验，希望对考生们有所启发。 首先，要熟悉岗位要求，明确自己的优势和不足。在回答问题时，突出自己符合岗位要求的优势。其次，要注重形象仪容，展现出良好的职业形象。整洁得体的仪容能够给考官留下良好的印象。 另外，要善于沟通，表达清晰。在面试中，要有良好的语言表达能力，能够清晰地陈述观点。最后，要有自信心，保持冷静。面试是一个展示个人综合素质的机会，自信而冷静的表现更容易给人好印象。 希望大家都能在事业单位招聘面试中取得好成绩，顺利通过面试关。 ', 4, '事业单位', '学习笔记', 'article/7.png', 1, '王罗源', 'avatar/1.png', 0, 0, 1, 1, '2024-01-13 20:26:46', NULL, 1);
INSERT INTO `civil_article` VALUES (8, '三支一扶招聘面试技巧', '三支一扶招聘面试技巧 三支一扶招聘是为了支持农村和贫困地区发展的招聘计划，面试是其中至关重要的一环。本文分享了一些三支一扶招聘面试的技巧，希望能够帮助考生更好地应对面试。 首先，要准备充分，了解招聘岗位的特点和要求。在回答问题时，突出自己符合岗位要求的经验和能力。其次，要注重沟通能力，与面试官保持良好的互动。积极主动地回答问题，展现自己的综合素质。 另外，要保持自信心，表现出积极向上的一面。在面试中展现出自信而积极的形象，更容易赢得面试官的好感。最后，要注意言行举止，保持良好的仪容。良好的仪容和言行举止能够给人留下良好的印象。 希望有志愿者们都能够在三支一扶招聘面试中取得好成绩，为农村和贫困地区的发展贡献自己的力量。 ', 5, '三支一扶', '解题技巧', 'article/8.png', 1, '王罗源', 'avatar/1.png', 0, 0, 2, 1, '2024-01-13 20:26:46', NULL, 1);
INSERT INTO `civil_article` VALUES (9, '事业单位招聘笔试经验分享', '事业单位招聘笔试经验分享 事业单位招聘笔试是考生进入事业单位的重要关口，具有一定的难度。本文分享了一些事业单位招聘笔试的经验，希望对正在备考的考生有所帮助。 首先，要熟悉考试大纲，明确考试内容和重点。通过仔细阅读大纲，了解考试的范围和要求，可以更有针对性地进行备考。其次，要注重做题技巧，提高解题速度。事业单位招聘笔试时间紧张，掌握一些做题技巧可以更高效地完成考试。 另外，多做模拟题也是提高笔试水平的有效方法。通过模拟考试，可以熟悉考试环境，提高应试能力。最后，要保持良好的心态，不要因为一道题而影响整体发挥。 希望大家都能在事业单位招聘笔试中取得好成绩，顺利进入下一轮选拔。 ', 4, '事业单位', '解题技巧', 'article/1.png', 1, '王罗源', 'avatar/1.png', 0, 0, 1, 1, '2024-01-13 20:26:46', NULL, 1);
INSERT INTO `civil_article` VALUES (10, '三支一扶招聘面试经验分享', '三支一扶招聘面试经验分享 三支一扶是为了支持农村和贫困地区发展的招聘计划，也是一条脱贫致富的好途径。本文分享了一些三支一扶招聘面试的经验，希望对正在备考的考生有所帮助。 首先，要准备充分，了解招聘岗位的特点和要求。在回答问题时，突出自己符合岗位要求的经验和能力。其次，要注重沟通能力，与面试官保持良好的互动。积极主动地回答问题，展现自己的综合素质。 另外，要保持自信心，表现出积极向上的一面。在面试中展现出自信而积极的形象，更容易赢得面试官的好感。最后，要注意言行举止，保持良好的仪容。良好的仪容和言行举止能够给人留下良好的印象。 希望有志愿者们都能够在三支一扶招聘面试中取得好成绩，为农村和贫困地区的发展贡献自己的力量。 ', 5, '三支一扶', '学习笔记', 'article/2.png', 1, '王罗源', 'avatar/1.png', 0, 0, 3, 1, '2024-01-13 20:26:46', NULL, 1);
INSERT INTO `civil_article` VALUES (11, '公务员面试技巧与注意事项', '公务员面试技巧与注意事项 公务员面试是进入事业单位的关键环节，也是考生综合素质的体现。本文分享了一些公务员面试的技巧与注意事项，希望对即将参加面试的考生有所帮助。 首先，要了解面试形式，熟悉考试流程。了解面试的整体安排，心里有数会更有信心。其次，要注重形象仪容，展现出良好的职业形象。整洁得体的仪容能够给考官留下良好的印象。 另外，要善于表达，清晰明了。在面试中，良好的语言表达能力是得分的重要因素，要避免口齿不清、表达混乱。最后，要保持自信心，从容应对问题。在面对考官的提问时，保持冷静自信，展现出自己的综合素质。 希望大家都能在公务员面试中取得好成绩，成功进入心仪的事业单位。 ', 5, '三支一扶', '学习笔记', 'article/3.png', 1, '王罗源', 'avatar/1.png', 0, 0, 2, 1, '2024-01-13 20:26:46', NULL, 1);
INSERT INTO `civil_article` VALUES (12, '三支一扶志愿者心得分享', '三支一扶志愿者心得分享 三支一扶是一项为农村和贫困地区服务的志愿者计划，志愿者在服务过程中积累了许多宝贵的经验。本文分享了一位三支一扶志愿者的心得体会，希望能够激励更多人参与到志愿服务中。 在志愿服务中，我们不仅为农村提供帮助，也收获了很多感动和成长。通过与当地居民的交流，我们更深刻地理解了他们的生活状况，也更加珍惜自己的生活。在服务过程中，我们团结协作，形成了紧密的团队。 希望更多的人能够加入到三支一扶志愿者的行列，为社会贡献一份力量。 ', 5, '三支一扶', '学习笔记', 'article/4.png', 1, '王罗源', 'avatar/1.png', 0, 0, 1, 1, '2024-01-13 20:30:03', NULL, 1);
INSERT INTO `civil_article` VALUES (13, '公务员面试技巧分享', '公务员面试技巧分享 公务员面试是招聘过程中的重要环节，面试表现直接关系到是否能够顺利进入公务员行列。本文分享了一些公务员面试的技巧，希望能够帮助考生在面试中取得好成绩。 首先，要注重形象仪容，穿着得体。整齐的仪容和得体的服装能够给考官留下良好的印象。其次，要自信大方，表达清晰。在回答问题时，要有条理地陈述观点，表达清楚自己的思考过程。 另外，要注重沟通能力，与考官保持良好的互动。积极主动地与考官交流，展现自己积极向上的一面。最后，要做好心理准备，保持冷静。面对各种问题和情境，要保持冷静沉着，展现出应对复杂环境的能力。 希望大家都能够在公务员面试中取得好成绩，成功进入下一轮选拔。 ', 2, '公考面试', '解题技巧', 'article/5.png', 1, '王罗源', 'avatar/1.png', 0, 0, 1, 1, '2024-01-13 20:30:03', NULL, 1);
INSERT INTO `civil_article` VALUES (14, '军队文职招聘备考经验', '军队文职招聘备考经验 军队文职招聘备考是一个系统性的过程，需要考生全面提高各科知识水平。本文分享了一些备考经验，希望能够帮助考生更好地备战军队文职招聘。 首先，要熟悉招聘信息，了解招聘范围和要求。通过仔细阅读招聘公告，明确考试科目和重点，有针对性地进行复习。其次，要注重做题技巧，提高解题速度。军队文职招聘考试时间紧张，掌握一些做题技巧可以更高效地完成考试。 另外，多做模拟题也是备考的有效方法。通过模拟考试，可以熟悉考试形式，提高应试能力。最后，要保持良好的心态，不要因为一道题而影响整体发挥。 希望大家都能在军队文职招聘中取得好成绩，实现自己的招聘目标。 ', 3, '军队文职', '学习笔记', 'article/6.png', 1, '王罗源', 'avatar/1.png', 0, 0, 1, 1, '2024-01-13 20:30:03', NULL, 1);
INSERT INTO `civil_article` VALUES (15, '事业单位招聘常见面试问题', '事业单位招聘常见面试问题 事业单位招聘面试是招聘过程中的重要环节，面试表现直接关系到是否能够成功录取。本文整理了一些事业单位招聘面试中常见的问题，希望考生们能够在面试中有所准备。 在事业单位招聘面试中，常见的问题包括个人介绍、职业规划、专业知识等方面。考生可以提前准备这些问题的回答，突出自己的优势。另外，要注重沟通能力和应变能力，能够灵活应对各种情境。 最后，要保持自信和积极的心态，展现出积极向上的形象。在面试中展示出自己的专业素养和团队合作能力，给考官留下深刻的印象。 希望大家都能够在事业单位招聘面试中取得好成绩，顺利进入事业单位。 ', 4, '事业单位', '解题技巧', 'article/7.png', 1, '王罗源', 'avatar/1.png', 0, 0, 1, 1, '2024-01-13 20:30:03', NULL, 1);
INSERT INTO `civil_article` VALUES (16, '公考笔试技巧分享', '公考笔试技巧分享 公考笔试是很多考生备战的重要环节，掌握一些技巧能够更好地应对考试。本文分享了一些公考笔试的技巧，希望能够帮助考生在考试中取得好成绩。 首先，要熟悉考试大纲和题型，明确考试内容和重点。通过仔细阅读大纲，了解考试的范围和要求，可以更有针对性地进行备考。其次，要注重时间分配，合理安排每一道题目的答题时间。 另外，要注重做题技巧，提高解题速度。公考笔试时间紧张，掌握一些做题技巧可以更高效地完成考试。最后，要保持良好的心态，不要因为一道题而影响整体发挥。 希望大家都能在公考笔试中取得好成绩，成功进入下一轮选拔。 ', 1, '公考笔试', '解题技巧', 'article/8.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:30:03', NULL, 1);
INSERT INTO `civil_article` VALUES (17, '公考面试经验分享', '公考面试经验分享 公考面试是决定是否能够成功录取的关键环节，考生在面试中的表现直接关系到最终结果。本文分享了一些公考面试的经验，希望能够帮助考生在面试中取得好成绩。 首先，要注重形象仪容，穿着得体。整齐的仪容和得体的服装能够给考官留下良好的印象。其次，要自信大方，表达清晰。在回答问题时，要有条理地陈述观点，表达清楚自己的思考过程。 另外，要注重沟通能力，与考官保持良好的互动。积极主动地与考官交流，展现自己积极向上的一面。最后，要做好心理准备，保持冷静。面对各种问题和情境，要保持冷静沉着，展现出应对复杂环境的能力。 希望大家都能够在公考面试中取得好成绩，成功进入下一轮选拔。 ', 2, '公考面试', '学习笔记', 'article/1.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:30:03', NULL, 1);
INSERT INTO `civil_article` VALUES (18, '公务员笔试解题技巧分享', '公务员笔试解题技巧分享 在公务员笔试中，解题技巧是考生备考过程中需要重点关注的方面。本文分享了一些解题技巧，希望能够帮助考生更好地应对笔试中的各类题目。 首先，要注重题目的分析，理清题目的要求和考点。通过仔细阅读题目，找出关键信息，明确解题思路。其次，要注意时间的合理分配，不要在某一道题目上花费过多时间，导致其他题目无法作答。 另外，要灵活运用各种解题方法，不拘泥于一种固定的思路。根据题目的特点，选择合适的解题方法，提高解题效率。最后，要多做模拟题，检验解题能力，发现问题并及时调整备考计划。 希望大家在公务员笔试中能够灵活运用解题技巧，取得优异的成绩。 ', 1, '公考笔试', '解题技巧', 'article/2.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:31:33', NULL, 1);
INSERT INTO `civil_article` VALUES (19, '公务员笔记分享：政治常识', '公务员笔记分享：政治常识 政治常识是公务员考试中的重要科目之一，备考过程中要重点关注。本文分享了一些关于政治常识的笔记，希望能够为考生提供学习参考。 文章主要涵盖了政治体制、国家制度、法律法规等方面的知识点，以及一些热点时事政治。通过系统地整理和总结这些知识，可以帮助考生更好地理解政治常识科目的考点。 希望广大考生通过阅读这份笔记，对政治常识科目有更深入的了解，为考试取得好成绩奠定基础。 ', 1, '公考笔试', '学习笔记', 'article/3.png', 1, '王罗源', 'avatar/1.png', 0, 0, 1, 0, '2024-01-13 20:31:33', NULL, 1);
INSERT INTO `civil_article` VALUES (20, '公务员笔记分享：行测技巧', '公务员笔记分享：行测技巧 行测是公务员考试中的重要科目，备考过程中需要注重技巧和方法的运用。本文分享了一些关于行测技巧的笔记，希望能够为考生提供学习指导。 文章主要包括了言语理解与表达、数量关系、判断推理等方面的行测技巧。通过学习这些技巧，考生可以更好地应对行测题目，提高解题效率。 希望广大考生通过阅读这份笔记，掌握行测技巧，取得优异的成绩。 ', 1, '公考笔试', '学习笔记', 'article/4.png', 1, '王罗源', 'avatar/1.png', 1, 0, 1, 0, '2024-01-13 20:31:33', NULL, 1);
INSERT INTO `civil_article` VALUES (21, '军队文职考试经验分享', '军队文职考试经验分享 军队文职考试是一个具有一定难度的招聘考试，备考过程中需要有一些科学有效的方法。本文分享了一些军队文职考试的经验，希望对考生有所帮助。 首先，要了解考试大纲和考试范围，有针对性地进行备考。通过详细了解考试科目和重点，可以更有针对性地进行复习。其次，要注重做题技巧，提高解题速度。军队文职考试的时间较为紧张，掌握一些解题技巧可以更高效地完成考试。 另外，要保持良好的心态，不要因为一时的困难而放弃。军队文职考试是一个全面考察考生综合素质的过程，良好的心态能够更好地发挥考生的实力。 希望大家都能够在军队文职考试中取得优异的成绩，成功加入军队。 ', 3, '军队文职', '解题技巧', 'article/5.png', 1, '王罗源', 'avatar/1.png', 0, 0, 1, 0, '2024-01-13 20:32:52', NULL, 1);
INSERT INTO `civil_article` VALUES (22, '事业单位面试经验分享', '事业单位面试经验分享 事业单位面试是招聘过程中的重要环节，成功通过面试至关重要。本文分享了一些事业单位面试的经验，希望能够为面试考生提供一些建议。 首先，要了解事业单位的招聘岗位要求，明确面试的重点。通过对招聘岗位的了解，可以更有针对性地准备面试内容。其次，要注重自我表达能力的培养，能够清晰、流利地表达自己的观点。 另外，要进行模拟面试，提前熟悉面试流程，增加面试的信心。通过模拟面试，可以发现自己的不足之处，及时调整面试策略。最后，要保持自信和冷静，不要因为紧张而影响发挥。 希望大家都能够在事业单位面试中取得好成绩，顺利通过面试。 ', 4, '事业单位', '解题技巧', 'article/6.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:32:52', NULL, 1);
INSERT INTO `civil_article` VALUES (23, '三支一扶申请攻略', '三支一扶申请攻略 三支一扶是一个服务基层、支持农村发展的招募计划，备考过程中需要有一些科学的准备。本文分享了一些建议，希望对有意向申请三支一扶的考生有所帮助。 首先，要了解三支一扶的招聘信息，包括招聘岗位、报名条件等。通过仔细研读招聘公告，了解招聘的基本情况，可以更有针对性地进行申请准备。其次，要注重综合素质的提升，不仅要有专业知识，还要具备服务基层的能力。 另外，要提前准备好所需的材料，确保申请过程顺利进行。准备好个人简历、证书等相关材料，以便在申请时能够及时提交。最后，要保持积极的心态，相信自己能够成功申请到心仪的岗位。 希望大家都能够顺利申请到理想的三支一扶岗位，为基层服务贡献自己的力量。 ', 5, '三支一扶', '学习笔记', 'article/7.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:32:52', NULL, 1);
INSERT INTO `civil_article` VALUES (24, '公安招警面试技巧分享', '公安招警面试技巧分享 公安招警面试是选拔过程中的重要环节，面试表现直接影响最终录取结果。本文分享了一些公安招警面试的技巧，希望能够帮助考生在面试中脱颖而出。 首先，要了解公安招警的招聘要求和面试内容，有针对性地准备面试材料。清晰了解面试考点，有助于更好地应对各种问题。其次，要注重形象和言谈举止，保持良好的面试形象。 另外，要多进行模拟面试，提前适应面试环境和氛围。通过模拟面试，可以发现自己的不足之处，及时进行改进。最后，要保持自信和沉稳，应对面试过程中的各种情况。 希望大家都能够在公安招警面试中表现出色，成功进入公安系统。 ', 6, '公安招警', '解题技巧', 'article/8.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:32:52', NULL, 1);
INSERT INTO `civil_article` VALUES (25, '公务员笔记分享：面试经验', '公务员笔记分享：面试经验 公务员面试是招聘过程中的重要环节，成功通过面试至关重要。本文分享了一些建议和经验，希望能够为面试考生提供一些建议。 首先，要了解公务员面试的考察要点，明确面试的重点。通过对招聘岗位的了解，可以更有针对性地准备面试内容。其次，要注重自我表达能力的培养，能够清晰、流利地表达自己的观点。 另外，要进行模拟面试，提前熟悉面试流程，增加面试的信心。通过模拟面试，可以发现自己的不足之处，及时调整面试策略。最后，要保持自信和冷静，不要因为紧张而影响发挥。 希望大家都能够在公务员面试中取得好成绩，顺利通过面试。 ', 1, '公考笔试', '学习笔记', 'article/1.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:32:52', NULL, 1);
INSERT INTO `civil_article` VALUES (26, '公务员备考笔记：科目复习', '公务员备考笔记：科目复习 公务员考试是一个综合素质测试，各科目的复习都至关重要。本文分享了一些科目复习的经验和方法，希望对备考的考生有所帮助。 首先，要合理安排各科目的复习时间，保证每个科目都能够得到充分的复习。通过制定详细的复习计划，有助于更有针对性地进行复习。其次，要注重重点知识点的掌握，确保在考试中能够有针对性地发挥优势。 另外，要多进行模拟考试，提前适应考试环境和时间。通过模拟考试，可以发现自己的不足之处，及时进行调整。最后，要保持耐心和毅力，相信自己能够在考试中取得好成绩。 希望大家都能够在公务员考试中取得优异的成绩，成功进入公务员队伍。 ', 1, '公考笔试', '学习笔记', 'article/2.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:36:40', NULL, 1);
INSERT INTO `civil_article` VALUES (27, '三支一扶岗位选择指南', '三支一扶岗位选择指南 三支一扶招聘岗位众多，考生在选择岗位时需要考虑多方面因素。本文提供了一些建议，希望能够帮助考生更好地选择适合自己的三支一扶岗位。 首先，要了解各个岗位的工作内容和要求，明确自己的兴趣和优势。通过对岗位的深入了解，可以更有针对性地选择适合自己的岗位。其次，要考虑岗位的地域位置，是否适应自己的生活和发展需求。 另外，要关注各岗位的发展前景和晋升空间，选择具有良好发展前景的岗位。最后，要谨慎对待招聘信息，确保选择的岗位符合个人的发展规划。 希望大家都能够根据自身情况，明智选择三支一扶的岗位，为自己的未来打下坚实的基础。 ', 5, '三支一扶', '学习笔记', 'article/3.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:36:41', NULL, 1);
INSERT INTO `civil_article` VALUES (28, '事业单位招聘笔试技巧', '事业单位招聘笔试技巧 事业单位招聘笔试是选拔过程中的重要环节，成功通过笔试至关重要。本文分享了一些事业单位招聘笔试的技巧，希望能够帮助考生在笔试中取得好成绩。 首先，要了解招聘岗位的考试科目和要求，明确笔试的重点。通过对招聘岗位的了解，可以更有针对性地准备笔试内容。其次，要注重解题技巧的培养，提高解题速度和准确率。 另外，要进行模拟考试，模拟真实考试环境，增加对考试的适应性。通过模拟考试，可以发现自己的不足之处，及时进行调整。最后，要保持良好的心态，相信自己能够在笔试中脱颖而出。 希望大家都能够在事业单位招聘笔试中取得优异的成绩，成功进入心仪的事业单位。 ', 4, '事业单位', '解题技巧', 'article/4.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:36:41', NULL, 1);
INSERT INTO `civil_article` VALUES (29, '军队文职招聘考试技巧', '军队文职招聘考试技巧 军队文职招聘考试是选拔过程中的关键环节，成功通过考试是每位考生的期望。本文分享了一些建议和技巧，希望能够帮助考生更好地备考和应对考试。 首先，要深入了解招聘岗位的考试科目和内容，明确备考的方向。通过对招聘岗位的了解，可以更有针对性地进行复习。其次，要注重综合素质的培养，提高解题和应试能力。 另外，要进行模拟考试，模拟真实考试环境，检验自己的考试水平。通过模拟考试，可以发现自己的不足之处，及时进行弥补。最后，要保持积极的心态，相信自己能够在考试中取得好成绩。 希望大家都能够在军队文职招聘考试中取得优异的成绩，成功进入军队文职岗位。 ', 3, '军队文职', '解题技巧', 'article/5.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:36:41', NULL, 1);
INSERT INTO `civil_article` VALUES (30, '公考面试技巧分享', '公考面试技巧分享 公务员面试是决定录取的重要环节，成功面试是每位考生的追求。本文分享了一些公务员面试的技巧和经验，希望对即将参加面试的考生有所启发。 首先，要深入了解招聘岗位的面试要求和考察点，明确面试的重点。通过对招聘岗位的了解，可以更有针对性地准备面试材料。其次，要注重形象和言谈举止，保持良好的面试形象。 另外，要进行模拟面试，提前适应面试环境和氛围。通过模拟面试，可以发现自己的不足之处，及时进行改进。最后，要保持自信和沉稳，应对面试过程中的各种情况。 希望大家都能够在公务员面试中表现出色，成功进入公务员系统。 ', 2, '公考面试', '解题技巧', 'article/6.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:36:41', NULL, 1);
INSERT INTO `civil_article` VALUES (31, '三支一扶志愿者经验分享', '三支一扶志愿者经验分享 三支一扶是一个志愿者服务项目，参与其中可以获得丰富的社会服务经验。本文分享了一位三支一扶志愿者的亲身经历和心得，希望能够为有意向参与的人提供一些参考。 首先，作为三支一扶志愿者，要深入了解服务项目的宗旨和目标，明确自己的参与动机。通过了解项目，可以更好地投入到志愿服务中。其次，要注重团队合作，与团队成员协同合作，共同完成服务任务。 另外，要关注服务对象的需求，提供真正有益的服务。通过与服务对象的沟通，可以更好地理解他们的需求。最后，要保持积极向上的心态，将志愿服务看作是一种人生的丰富经历。 希望更多的人能够加入三支一扶志愿者队伍，为社会贡献自己的一份力量。 ', 5, '三支一扶', '学习笔记', 'article/7.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:37:53', NULL, 1);
INSERT INTO `civil_article` VALUES (32, '事业单位面试经验交流', '事业单位面试经验交流 事业单位面试是招聘过程中的重要环节，成功通过面试至关重要。本文邀请了一些成功通过事业单位面试的考生，分享了他们的经验和心得，希望对即将参加事业单位面试的考生有所启发。 首先，面试考生要充分准备面试材料，包括个人简历、自我介绍等。通过对材料的精心准备，可以提高面试的自信心。其次，要注重形象和仪态，保持良好的面试形象，给面试官留下良好的第一印象。 另外，要深入了解招聘岗位的职责和要求，明确自己的优势和适应度。通过对岗位的深入了解，可以更好地回答面试问题。最后，要保持冷静和自信，应对面试过程中的各种情况。 希望大家都能够在事业单位面试中取得好成绩，成功进入心仪的事业单位。 ', 4, '事业单位', '解题技巧', 'article/8.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:37:53', NULL, 1);
INSERT INTO `civil_article` VALUES (33, '军队文职招聘岗位解析', '军队文职招聘岗位解析 军队文职招聘岗位众多，每个岗位的职责和要求各不相同。本文对一些常见的军队文职招聘岗位进行了解析，希望能够帮助考生更好地选择适合自己的岗位。 首先，对于每个招聘岗位，要详细了解其职责和要求，看是否符合自己的兴趣和能力。通过对岗位的了解，可以更有针对性地进行备考。其次，要考虑岗位的地域位置，是否适应自己的生活和发展需求。 另外，要关注各岗位的发展前景和晋升空间，选择符合个人发展规划的岗位。通过对岗位的全面了解，可以更好地把握招聘信息，提高录取的机会。 希望大家都能够根据自己的兴趣和能力，选择适合自己的军队文职招聘岗位，取得优异的成绩。 ', 3, '军队文职', '学习笔记', 'article/1.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:37:53', NULL, 1);
INSERT INTO `civil_article` VALUES (34, '公安招警面试经验分享', '公安招警面试经验分享 公安招警面试是公安机关招聘过程中的重要环节，成功通过面试是每位考生的期望。本文邀请了一些成功通过公安招警面试的考生，分享了他们的经验和心得，希望对即将参加公安招警面试的考生有所帮助。 首先，面试考生要深入了解公安招警岗位的特点和要求，明确自己的岗位选择。通过对岗位的了解，可以更好地回答面试问题。其次，要注重形象和仪态，保持良好的面试形象，给面试官留下深刻印象。 另外，要注重团队合作和应对突发情况的能力。通过模拟面试，可以提前感受面试环境，更好地应对各种情况。最后，要保持积极向上的心态，相信自己能够在面试中表现出色。 希望大家都能够在公安招警面试中取得好成绩，成功加入公安机关。 ', 6, '公安招警', '解题技巧', 'article/2.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:37:53', NULL, 1);
INSERT INTO `civil_article` VALUES (35, '三支一扶招聘岗位解析', '三支一扶招聘岗位解析 三支一扶是一个重要的招聘项目，招聘岗位众多，包括教育、卫生、社区服务等多个领域。本文对一些常见的三支一扶招聘岗位进行了解析，希望能够帮助考生更好地选择适合自己的岗位。 首先，考生要了解各个岗位的职责和特点，看自己是否符合岗位要求。通过对岗位的了解，可以更好地定位自己的发展方向。其次，要考虑岗位的工作地点和生活条件，选择适合自己的招聘项目。 另外，要了解各个岗位的发展前景和晋升空间，制定自己的职业规划。通过对招聘信息的全面了解，可以更好地准备应聘材料，提高录取的机会。 希望大家都能够根据自己的兴趣和能力，选择适合自己的三支一扶招聘岗位，取得优异的成绩。 ', 5, '三支一扶', '学习笔记', 'article/3.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:37:53', NULL, 1);
INSERT INTO `civil_article` VALUES (36, '公考笔试技巧分享', '公考笔试技巧分享 公务员笔试是决定是否进入面试环节的重要考试，掌握一些有效的笔试技巧是提高成绩的关键。本文分享了一些公考笔试的经验和技巧，希望对即将参加公务员笔试的考生有所帮助。 首先，要了解笔试科目和题型，制定合理的备考计划。通过对题型的了解，可以更有针对性地进行复习。其次，要注重解题技巧，提高做题速度和准确度，争取更多的分数。 另外，要进行模拟考试，提前感受考试环境，检验自己的考试水平。通过模拟考试，可以找到自己的薄弱环节，有针对性地进行弥补。最后，要保持冷静和自信，面对考试时不要紧张，发挥自己的水平。 希望大家都能够在公务员笔试中取得好成绩，成功进入面试环节。 ', 1, '公考笔试', '解题技巧', 'article/4.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:39:17', NULL, 1);
INSERT INTO `civil_article` VALUES (37, '公考面试经验交流', '公考面试经验交流 公务员面试是最终决定是否录取的环节，成功通过面试至关重要。本文邀请了一些成功通过公务员面试的考生，分享了他们的经验和心得，希望对即将参加公务员面试的考生有所帮助。 首先，要深入了解招聘岗位的面试要求和考察点，明确面试的重点。通过对招聘岗位的了解，可以更有针对性地准备面试材料。其次，要注重形象和仪态，保持良好的面试形象，给面试官留下良好的第一印象。 另外，要进行模拟面试，提前适应面试环境和氛围。通过模拟面试，可以发现自己的不足之处，及时进行改进。最后，要保持自信和沉稳，应对面试过程中的各种情况。 希望大家都能够在公务员面试中表现出色，成功进入公务员系统。 ', 2, '公考面试', '解题技巧', 'article/5.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:39:17', NULL, 1);
INSERT INTO `civil_article` VALUES (38, '军队文职招聘考试大纲解读', '军队文职招聘考试大纲解读 军队文职招聘考试大纲是考生备考的重要依据，深入了解大纲有助于有针对性地进行备考。本文对军队文职招聘考试大纲进行了解读，希望为考生提供一些建议和指导。 首先，要仔细阅读大纲，了解考试科目、题型和考试要求。通过对大纲的解读，可以有针对性地进行备考计划。其次，要注重重点和难点，有目的地进行复习。通过对大纲的解读，可以找到备考的重点和难点，有利于提高复习效率。 另外，要结合大纲制定备考计划，合理分配时间和精力。通过有计划地进行备考，可以更好地应对考试。最后，要进行模拟考试，检验自己的考试水平，找到不足之处，进行及时改进。 希望大家都能够根据军队文职招聘考试大纲，有针对性地进行备考，取得优异的成绩。 ', 3, '军队文职', '学习笔记', 'article/6.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:39:17', NULL, 1);
INSERT INTO `civil_article` VALUES (39, '事业单位招聘备考经验', '事业单位招聘备考经验 事业单位招聘考试备考是一个系统性的过程，掌握一些备考经验可以提高备考效率。本文分享了一些事业单位招聘备考经验，希望对考生们有所帮助。 首先，要全面了解招聘岗位的要求和考试科目。通过对岗位的了解，可以更有针对性地进行备考。其次，要制定合理的备考计划，合理分配时间和精力。通过有计划地进行备考，可以更好地掌握各科目的知识点。 另外，要进行模拟考试，提前感受考试环境，检验自己的考试水平。通过模拟考试，可以找到不足之处，及时进行弥补。最后，要保持积极的心态，相信自己能够在考试中取得好成绩。 希望大家都能够根据事业单位招聘备考经验，制定科学的备考计划，取得优异的成绩。 ', 4, '事业单位', '学习笔记', 'article/7.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:39:17', NULL, 1);
INSERT INTO `civil_article` VALUES (40, '三支一扶招聘考察重点', '三支一扶招聘考察重点 三支一扶招聘考察是决定录取的关键环节，了解考察重点有助于更好地准备。本文对三支一扶招聘考察的重点进行了解析，希望对考生提供一些帮助。 首先，要重点关注个人素质和综合能力的考察。考生在招聘考察中，要展现自己的综合素质，包括沟通能力、团队合作能力等。其次，要注重社会责任感和服务意识的考察。考生要展示自己对社会的责任感和服务意识，有利于给考官留下良好印象。 另外，要了解考察的形式和内容，有针对性地进行备考。通过对考察要点的了解，可以更好地应对考察环节。最后，要保持积极向上的心态，相信自己能够在考察中表现出色。 希望大家都能够根据三支一扶招聘考察的重点，有针对性地进行准备，取得优异的成绩。 ', 5, '三支一扶', '学习笔记', 'article/8.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:39:17', NULL, 1);
INSERT INTO `civil_article` VALUES (41, '公安招警体能训练指南', '公安招警体能训练指南 公安招警体能测试是招警考试的重要环节，合理的体能训练可以提高考生的体能水平。本文为准备公安招警考试的考生提供了一份体能训练指南，希望对大家的备考有所帮助。 首先，要了解体能测试的具体内容和要求，制定合理的训练计划。体能测试主要包括跑步、仰卧起坐、引体向上等项目，根据个人的实际情况进行有针对性的训练。其次，要注重全身的训练，包括有氧运动和无氧运动，提高整体的体能水平。 另外，要合理安排训练的强度和频次，防止过度训练导致伤害。通过科学合理的训练，可以更好地应对体能测试。最后，要保持良好的心态，相信自己通过科学的训练能够取得优异的成绩。 希望大家都能够通过科学的体能训练，顺利通过公安招警体能测试，取得好成绩。 ', 6, '公安招警', '学习笔记', 'article/1.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:40:23', NULL, 1);
INSERT INTO `civil_article` VALUES (42, '公考笔试常见错误及改进方法', '公考笔试常见错误及改进方法 公务员笔试是一项重要的考试，很多考生在备考过程中容易犯一些常见错误。本文总结了一些公务员笔试常见错误，并提供了改进方法，希望对考生们有所启发。 首先，很多考生在做选择题时容易出现粗心大意，导致错误。改进的方法是在做选择题时要仔细审题，理清思路，避免因为马虎而失分。其次，一些考生在时间分配上不当，导致某一部分得分较低。改进的方法是提前规划好答题时间，合理分配每个部分的时间。 另外，一些考生在写作题时表达不清晰，逻辑不严谨。改进的方法是提前练习写作，注意语言表达和逻辑结构。最后，要注重错题的总结和复习，及时改正常见错误，确保在考试中不再犯错。 希望大家都能够在备考过程中注意避免这些常见错误，取得好成绩。 ', 1, '公考笔试', '解题技巧', 'article/2.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:40:23', NULL, 1);
INSERT INTO `civil_article` VALUES (43, '公考面试中的语言表达技巧', '公考面试中的语言表达技巧 公务员面试中的语言表达是考官考察的重要点之一，良好的语言表达能够提高考生的综合素质。本文分享了一些在公务员面试中的语言表达技巧，希望对考生们有所帮助。 首先，要注重语言的准确性和得体性，避免口头语和方言的使用。良好的语言表达可以给考官留下良好的印象。其次，要注重语速和节奏的掌握，避免讲话过快或过慢。适当的语速和节奏有助于保持流畅的表达。 另外，要注重语气和语调的把握，避免过于生硬或过于轻松。语气和语调要与面试的场合相匹配，显示出考生的自信和稳重。最后，要注重思维的清晰和逻辑的严谨，让自己的观点表达更加清晰明了。 希望大家都能够在公务员面试中通过良好的语言表达，展现出色的个人素质。 ', 2, '公考面试', '解题技巧', 'article/3.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:40:23', NULL, 1);
INSERT INTO `civil_article` VALUES (44, '军队文职考试心得分享', '军队文职考试心得分享 军队文职考试是一项具有一定难度的考试，备考经验的分享对于其他考生有着重要的意义。本文分享了一位考生的军队文职考试心得，希望对大家有所启发。 首先，要注重对大纲的认真研读，了解考试的内容和要求。通过对大纲的解读，可以有针对性地进行备考计划。其次，要注重重点和难点的攻克，合理分配复习时间。通过攻克重点和难点，可以提高整体的备考水平。 另外，要注重模拟考试，检验自己的考试水平，找到不足之处，进行及时改进。通过模拟考试，可以提高应对考试的信心。最后，要保持积极的心态，相信自己能够在考试中取得好成绩。 希望大家都能够通过认真备考，取得军队文职考试的好成绩。 ', 3, '军队文职', '解题技巧', 'article/4.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:40:23', NULL, 1);
INSERT INTO `civil_article` VALUES (45, '事业单位笔试备考指南', '事业单位笔试备考指南 事业单位笔试备考是一个系统性的过程，需要考生制定合理的备考计划。本文为准备事业单位笔试的考生提供了一份备考指南，希望对大家有所帮助。 首先，要全面了解笔试科目和考试内容，明确备考重点。通过对考试大纲的解读，可以有针对性地进行备考。其次，要制定合理的备考计划，合理分配时间和精力。通过有计划地进行备考，可以更好地掌握各科目的知识点。 另外，要进行模拟考试，提前感受考试氛围，检验自己的考试水平。通过模拟考试，可以找到不足之处，进行及时改进。最后，要保持积极向上的心态，相信自己能够在考试中取得好成绩。 希望大家都能够根据事业单位笔试备考指南，制定科学的备考计划，取得优异的成绩。 ', 4, '事业单位', '解题技巧', 'article/5.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 20:40:23', NULL, 1);
INSERT INTO `civil_article` VALUES (46, '三支一扶政策解读', '三支一扶政策解读 三支一扶是指“三支一扶计划”，是国家为了支持农村和贫困地区发展而实施的一项计划。本文对三支一扶政策进行了详细解读，希望对有意向参与的人员有所帮助。 首先，要了解三支一扶的具体内容和实施范围。三支一扶主要包括大学生村官、中小学教师特设岗位、卫生服务支援计划和农村义务教育支教计划。了解这些计划的具体要求和政策支持，有助于更好地参与其中。 其次，要关注三支一扶的报名和招聘时间，及时准备相关材料。报名和招聘时间是参与计划的第一步，考生要密切关注招聘信息，确保不错过报名时间。另外，要认真准备相关材料，以提高录取的机会。 最后，要了解三支一扶服务期限和相关政策，明确服务期间的权益和责任。通过了解相关政策，可以更好地投身到三支一扶计划中，为农村和贫困地区的发展贡献自己的力量。 希望大家都能够通过详细解读三支一扶政策，更好地参与到计划中，为社会发展贡献力量。 ', 5, '三支一扶', '解题技巧', 'article/6.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:04:09', NULL, 1);
INSERT INTO `civil_article` VALUES (47, '事业单位面试经验分享', '事业单位面试经验分享 事业单位面试是决定录用的关键环节，考生要在面试中展现出色的个人素质。本文分享了一位考生的事业单位面试经验，希望对即将参加面试的考生有所启发。 首先，要注重形象和仪表的整洁，给考官留下良好的第一印象。穿着得体、仪表整洁是展现个人形象的重要方面。其次，要准备充分，熟悉个人的简历和材料，做到对答如流。熟悉个人材料可以更好地回答考官的问题。 另外，要注重语言表达和沟通能力，避免紧张和结巴。良好的语言表达和沟通能力是事业单位面试中考察的重点。最后，要保持自信和积极的心态，展现出对工作的热爱和责任心。 希望大家都能够在事业单位面试中取得好成绩，成功获得录用资格。 ', 4, '事业单位', '解题技巧', 'article/7.png', 1, '王罗源', 'avatar/1.png', 0, 0, 3, 0, '2024-01-13 21:04:09', NULL, 1);
INSERT INTO `civil_article` VALUES (48, '三支一扶服务心得体会', '三支一扶服务心得体会 三支一扶服务是一项充满挑战和收获的工作，服务期间的心得体会对于其他参与者有着积极的作用。本文分享了一位三支一扶服务人员的心得体会，希望对有意向参与的人员有所启发。 首先，要注重与当地群众的沟通和交流，了解他们的实际需求和困难。通过与群众的深入交流，可以更好地了解当地的情况，提供更有针对性的服务。其次，要注重团队协作，与团队成员合作，共同完成工作任务。团队协作是保障工作顺利进行的重要保障。 另外，要注重自身能力的提升，通过学习和培训不断提高自己的综合素质。服务期间可以获得很多学习的机会，要善于抓住这些机会，不断提升自己。最后，要保持积极向上的心态，克服困难，坚持到服务期满。 希望大家都能够在三支一扶服务中有所收获，为农村和贫困地区的发展贡献自己的力量。 ', 5, '三支一扶', '学习笔记', 'article/8.png', 1, '王罗源', 'avatar/1.png', 0, 0, 35, 0, '2024-01-13 21:04:09', NULL, 1);
INSERT INTO `civil_article` VALUES (49, '公安招警面试技巧', '公安招警面试技巧 公安招警面试是公安招聘的重要环节，考生要在面试中展现出优秀的个人素质。本文总结了一些公安招警面试的技巧，希望对即将参加面试的考生有所帮助。 首先，要了解公安招警的招聘政策和要求，明确面试的内容和形式。通过对招聘政策的了解，可以有针对性地准备面试材料。其次，要注重形象和仪表的整洁，给考官留下良好的印象。 另外，要注重应变能力和沟通能力，在面试中展现出优秀的综合素质。在面对各种问题时，要冷静应对，表达清晰。最后，要保持自信和积极的心态，展现出对公安工作的热爱和责任心。 希望大家都能够在公安招警面试中取得好成绩，成功加入公安队伍。 ', 6, '公安招警', '解题技巧', 'article/1.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:04:09', NULL, 1);
INSERT INTO `civil_article` VALUES (50, '事业单位面试经验分享', '事业单位面试经验分享 事业单位面试是考生最后一关，也是最关键的一关，良好的面试经验对于考生非常重要。本文分享了一位考生的事业单位面试经验，供大家参考。 首先，要注重仪表和形象的整洁，穿着得体、仪表端庄是给考官留下好印象的关键。其次，要准备充分，熟悉自己的简历和材料，做到对答如流。熟悉个人材料可以更好地回答考官的问题。 另外，要注重语言表达和沟通能力，避免紧张和结巴。良好的语言表达和沟通能力是事业单位面试中考察的重点。最后，要保持自信和积极的心态，展现出对工作的热爱和责任心。 希望大家都能够在事业单位面试中取得好成绩，成功获得录用资格。 ', 4, '事业单位', '学习笔记', 'article/2.png', 1, '王罗源', 'avatar/1.png', 0, 0, 7, 0, '2024-01-13 21:04:09', NULL, 1);
INSERT INTO `civil_article` VALUES (51, '公考面试技巧分享', '公考面试技巧分享 公考面试是决定录用的关键环节，考生要在面试中展现出色的个人素质。本文分享了一些公考面试的技巧，希望对即将参加面试的考生有所帮助。 首先，要了解公考面试的流程和要求，明确面试的内容和形式。通过对面试要求的了解，可以有针对性地准备面试材料。其次，要注重仪表和形象的整洁，给考官留下良好的印象。 另外，要注重应变能力和沟通能力，在面试中展现出优秀的综合素质。在面对各种问题时，要冷静应对，表达清晰。最后，要保持自信和积极的心态，展现出对公共事业的热爱和责任心。 希望大家都能够在公考面试中取得好成绩，成功加入公共事业领域。 ', 2, '公考面试', '解题技巧', 'article/3.png', 1, '王罗源', 'avatar/1.png', 0, 0, 29, 0, '2024-01-13 21:10:23', NULL, 1);
INSERT INTO `civil_article` VALUES (52, '军队文职岗位解析', '军队文职岗位解析 军队文职岗位是我国军队中的一类特殊岗位，需要具备一定的专业背景和技能。本文对军队文职岗位进行了详细解析，供有意向报考的人员参考。 首先，要了解军队文职岗位的基本要求和特点，明确报考的条件和限制。军队文职岗位通常要求具备一定的专业背景和技能，报考人员需要满足相关条件。其次，要了解军队文职岗位的招聘流程和考核方式，做好充分的准备。 另外，要关注军队文职岗位的发展前景和职业规划，了解从业人员的工作经验和感受。通过了解相关信息，可以更好地决定是否报考军队文职岗位。最后，要准备好相关材料，确保能够顺利通过招聘流程。 希望大家都能够通过详细解析军队文职岗位，顺利报考并取得好成绩。 ', 3, '军队文职', '解题技巧', 'article/4.png', 1, '王罗源', 'avatar/1.png', 0, 0, 1, 0, '2024-01-13 21:10:23', NULL, 1);
INSERT INTO `civil_article` VALUES (53, '三支一扶服务计划', '三支一扶服务计划 三支一扶服务计划是国家为了支持农村和贫困地区发展而实施的一项计划，涵盖多个领域。本文对三支一扶服务计划进行了详细介绍，供有意向参与的人员参考。 首先，要了解三支一扶服务计划的各个子计划，包括大学生村官、中小学教师特设岗位、卫生服务支援计划和农村义务教育支教计划。每个子计划都有其独特的特点和要求。 其次，要关注三支一扶服务计划的申请和报名时间，及时准备相关材料。报名和申请是参与计划的第一步，需要密切关注招募信息，确保不错过报名时间。 另外，要注重个人素质和专业能力的提升，通过学习和培训不断提高自己。三支一扶服务计划对参与者的综合素质有一定要求，要不断提升自己的能力。 希望大家都能够通过详细了解三支一扶服务计划，成功参与其中，为农村和贫困地区的发展贡献一份力量。 ', 5, '三支一扶', '解题技巧', 'article/5.png', 1, '王罗源', 'avatar/1.png', 1, 0, 0, 0, '2024-01-13 21:10:23', NULL, 1);
INSERT INTO `civil_article` VALUES (54, '公安招警体能测试注意事项', '公安招警体能测试注意事项 公安招警体能测试是公安招聘的重要环节，考生需要在体能测试中展现出良好的身体素质。本文总结了一些公安招警体能测试的注意事项，希望对即将参加测试的考生有所帮助。 首先，要了解体能测试的项目和标准，明确每个项目的要求和测试标准。不同的项目对身体各项素质有不同的要求，考生需要有针对性地进行训练。其次，要注重身体的综合素质提升，包括力量、耐力、速度等方面。 另外，要合理安排训练时间，确保充分的休息和恢复。过度训练可能导致身体疲劳和受伤，影响测试表现。最后，要保持良好的心态，不要过于紧张，放松心情参加测试。 希望大家都能够通过详细了解体能测试注意事项，取得好成绩，成功加入公安队伍。 ', 6, '公安招警', '学习笔记', 'article/6.png', 1, '王罗源', 'avatar/1.png', 1, 0, 2, 0, '2024-01-13 21:10:23', NULL, 1);
INSERT INTO `civil_article` VALUES (55, '事业单位考试心得体会', '事业单位考试心得体会 事业单位考试是许多人通过自身努力实现就业梦想的重要途径，也是一次综合素质的考验。本文分享了一位考生的事业单位考试心得体会，供大家参考。 首先，要注重备考规划，合理安排时间和任务，确保每个科目都能够充分准备。考生可以制定详细的学习计划，合理安排每天的学习时间。其次，要注重题库的使用，多做模拟题，提高解题能力。 另外，要注意健康和心理素质的调节，保持良好的身体和心态。长时间的备考可能导致身体疲劳和心理压力，考生需要注意调整自己的状态。最后，要保持自信和坚持不懈的努力，相信自己能够取得好成绩。 希望大家都能够通过详细了解事业单位考试心得，取得好成绩，成功跻身事业单位。 ', 4, '事业单位', '学习笔记', 'article/7.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:10:23', NULL, 1);
INSERT INTO `civil_article` VALUES (56, '公考笔试备考经验分享', '公考笔试备考经验分享 公考笔试是决定考生能否晋级的重要环节，备考经验对于取得好成绩至关重要。本文分享了一位成功考取的考生的备考经验，供即将参加公考笔试的考生参考。 首先，要充分了解考试大纲和考试科目，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地制定备考计划。其次，要注重题库的使用，多做真题和模拟题，提高解题速度和准确度。 另外，要保持良好的学习习惯，合理安排时间，保证充足的休息。长时间的学习可能导致疲劳，考生需要注意休息和调整状态。最后，要保持自信和积极的心态，相信自己能够取得好成绩。 希望大家都能够通过详细了解公考笔试备考经验，取得好成绩，成功晋级。 ', 1, '公考笔试', '学习笔记', 'article/8.png', 1, '王罗源', 'avatar/1.png', 1, 0, 0, 0, '2024-01-13 21:12:25', NULL, 1);
INSERT INTO `civil_article` VALUES (57, '军队文职面试经验分享', '军队文职面试经验分享 军队文职面试是考察考生综合素质和适应能力的环节，备考经验对于取得好成绩至关重要。本文分享了一位成功通过军队文职面试的考生的经验，供即将参加面试的考生参考。 首先，要了解面试的内容和形式，明确面试的要求和考察点。通过对面试题型的了解，可以有针对性地进行准备。其次，要注重形象和仪表的整洁，给考官留下良好的印象。 另外，要注重沟通和表达能力的培养，通过模拟面试提高应变能力。在面试过程中要保持冷静，清晰表达自己的观点。最后，要关注面试的注意事项和常见问题，做好应对准备。 希望大家都能够通过详细了解军队文职面试经验，取得好成绩，成功加入军队文职岗位。 ', 2, '军队文职', '学习笔记', 'article/1.png', 1, '王罗源', 'avatar/1.png', 1, 0, 0, 0, '2024-01-13 21:12:25', NULL, 1);
INSERT INTO `civil_article` VALUES (58, '事业单位面试技巧分享', '事业单位面试技巧分享 事业单位面试是考察考生实际能力和综合素质的环节，备考经验对于取得好成绩至关重要。本文分享了一位成功通过事业单位面试的考生的技巧，供即将参加面试的考生参考。 首先，要了解面试的评分标准和考察点，明确自己需要突出的优势。通过对面试技巧的了解，可以有针对性地进行准备。其次，要注重形象和仪表的整洁，给考官留下良好的印象。 另外，要注重表达和沟通能力的培养，通过模拟面试提高应变能力。在面试过程中要保持自信，清晰表达自己的观点。最后，要关注面试的注意事项和常见问题，做好应对准备。 希望大家都能够通过详细了解事业单位面试技巧，取得好成绩，成功加入事业单位。 ', 4, '事业单位', '学习笔记', 'article/2.png', 1, '王罗源', 'avatar/1.png', 1, 0, 0, 0, '2024-01-13 21:12:25', NULL, 1);
INSERT INTO `civil_article` VALUES (59, '三支一扶岗位特点分析', '三支一扶岗位特点分析 三支一扶是国家为支持农村和贫困地区发展而实施的一项计划，包括大学生村官、中小学教师特设岗位计划、卫生院支援计划。本文对三支一扶各个岗位的特点进行了分析，供即将报考的考生参考。 首先，大学生村官岗位要求考生具备一定的基本素质和适应能力，需要关注农村的实际情况，为村民提供服务。其次，中小学教师特设岗位计划注重考生的教育专业知识和教学能力，需要有较强的教学能力。 另外，卫生院支援计划要求考生具备医学专业知识和实际操作能力，需要关注农村卫生健康工作。希望考生根据自身情况选择合适的岗位，为农村和贫困地区的发展贡献自己的力量。 ', 5, '三支一扶', '学习笔记', 'article/3.png', 1, '王罗源', 'avatar/1.png', 1, 0, 0, 0, '2024-01-13 21:12:25', NULL, 1);
INSERT INTO `civil_article` VALUES (60, '公安招警面试注意事项', '公安招警面试注意事项 公安招警面试是考察考生实际能力和综合素质的环节，备考经验对于取得好成绩至关重要。本文总结了一些公安招警面试的注意事项，希望对即将参加面试的考生有所帮助。 首先，要了解面试的形式和内容，明确面试的评分标准。通过对面试题型的了解，可以有针对性地进行准备。其次，要注重形象和仪表的整洁，给考官留下良好的印象。 另外，要注重沟通和表达能力的培养，通过模拟面试提高应变能力。在面试过程中要保持冷静，清晰表达自己的观点。最后，要关注面试的注意事项和常见问题，做好应对准备。 希望大家都能够通过详细了解公安招警面试注意事项，取得好成绩，成功加入公安队伍。 ', 6, '公安招警', '学习笔记', 'article/4.png', 1, '王罗源', 'avatar/1.png', 1, 0, 0, 0, '2024-01-13 21:12:25', NULL, 1);
INSERT INTO `civil_article` VALUES (61, '公考面试技巧分享', '公考面试技巧分享 公考面试是考察考生实际能力和综合素质的环节，备考经验对于取得好成绩至关重要。本文分享了一位成功通过公考面试的考生的技巧，供即将参加面试的考生参考。 首先，要了解面试的评分标准和考察点，明确自己需要突出的优势。通过对面试技巧的了解，可以有针对性地进行准备。其次，要注重形象和仪表的整洁，给考官留下良好的印象。 另外，要注重表达和沟通能力的培养，通过模拟面试提高应变能力。在面试过程中要保持自信，清晰表达自己的观点。最后，要关注面试的注意事项和常见问题，做好应对准备。 希望大家都能够通过详细了解公考面试技巧，取得好成绩，成功晋级。 ', 2, '公考面试', '学习笔记', 'article/5.png', 1, '王罗源', 'avatar/1.png', 1, 0, 0, 0, '2024-01-13 21:14:42', NULL, 1);
INSERT INTO `civil_article` VALUES (62, '军队文职笔试经验分享', '军队文职笔试经验分享 军队文职笔试是决定考生能否晋级的重要环节，备考经验对于取得好成绩至关重要。本文分享了一位成功考取的考生的笔试经验，供即将参加军队文职笔试的考生参考。 首先，要充分了解考试大纲和考试科目，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地制定备考计划。其次，要注重题库的使用，多做真题和模拟题，提高解题速度和准确度。 另外，要保持良好的学习习惯，合理安排时间，保证充足的休息。长时间的学习可能导致疲劳，考生需要注意休息和调整状态。最后，要保持自信和积极的心态，相信自己能够取得好成绩。 希望大家都能够通过详细了解军队文职笔试经验，取得好成绩，成功晋级。 ', 3, '军队文职', '学习笔记', 'article/6.png', 1, '王罗源', 'avatar/1.png', 1, 0, 0, 0, '2024-01-13 21:14:42', NULL, 1);
INSERT INTO `civil_article` VALUES (63, '三支一扶岗位选择建议', '三支一扶岗位选择建议 三支一扶是国家为加强基层工作而设立的专项计划，吸引了众多大学生的关注。本文提供了一些建议，帮助考生更好地选择适合自己的岗位，取得更好的发展。 首先，要了解各个岗位的特点和职责，明确自己的兴趣和发展方向。通过对岗位的深入了解，可以有针对性地选择合适的岗位。其次，要关注所在地的实际情况，考虑到生活和工作的便利性。 另外，要注意个人的专业背景和能力，选择与自己专业相关的岗位，提高工作的匹配度。最后，要根据个人的发展规划，选择具有发展潜力的岗位，为将来的职业生涯打下坚实的基础。 希望大家都能够通过详细了解三支一扶岗位选择建议，选择合适的岗位，取得更好的发展。 ', 5, '三支一扶', '学习笔记', 'article/7.png', 1, '王罗源', 'avatar/1.png', 1, 0, 0, 0, '2024-01-13 21:14:42', NULL, 1);
INSERT INTO `civil_article` VALUES (64, '事业单位面试经验分享', '事业单位面试经验分享 事业单位面试是考察考生实际能力和综合素质的环节，备考经验对于取得好成绩至关重要。本文分享了一位成功通过事业单位面试的考生的经验，供即将参加面试的考生参考。 首先，要了解事业单位面试的形式和内容，明确面试的评分标准。通过对面试题型的了解，可以有针对性地进行准备。其次，要注重形象和仪表的整洁，给考官留下良好的印象。 另外，要注重沟通和表达能力的培养，通过模拟面试提高应变能力。在面试过程中要保持冷静，清晰表达自己的观点。最后，要关注面试的注意事项和常见问题，做好应对准备。 希望大家都能够通过详细了解事业单位面试经验，取得好成绩，成功晋级。 ', 4, '事业单位', '学习笔记', 'article/8.png', 1, '王罗源', 'avatar/1.png', 1, 0, 0, 0, '2024-01-13 21:14:42', NULL, 1);
INSERT INTO `civil_article` VALUES (65, '公考笔试注意事项', '公考笔试注意事项 公考笔试是考察考生基础知识和解题能力的重要环节，备考经验对于取得好成绩至关重要。本文总结了一些公考笔试的注意事项，希望对即将参加笔试的考生有所帮助。 首先，要熟悉考试大纲和各科目的知识点，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地制定备考计划。其次，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。 另外，要保持良好的学习状态，保证充足的休息，调整好作息时间。在考试前要注意查看考场规定，准备好相关的考试材料。最后，要保持冷静和自信，做到考试时心态稳定，发挥出最佳水平。 希望大家都能够通过详细了解公考笔试注意事项，取得好成绩，成功晋级。 ', 1, '公考笔试', '学习笔记', 'article/1.png', 1, '王罗源', 'avatar/1.png', 1, 0, 0, 0, '2024-01-13 21:14:42', NULL, 1);
INSERT INTO `civil_article` VALUES (66, '公安招警笔试技巧分享', '公安招警笔试技巧分享 公安招警笔试是考察考生基础知识和解题能力的重要环节，备考经验对于取得好成绩至关重要。本文分享了一些成功考取的考生的笔试技巧，供即将参加笔试的考生参考。 首先，要熟悉考试大纲和各科目的知识点，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地制定备考计划。其次，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。 另外，要保持良好的学习状态，保证充足的休息，调整好作息时间。在考试前要注意查看考场规定，准备好相关的考试材料。最后，要保持冷静和自信，做到考试时心态稳定，发挥出最佳水平。 希望大家都能够通过详细了解公安招警笔试技巧，取得好成绩，成功晋级。 ', 6, '公安招警', '学习笔记', 'article/2.png', 1, '王罗源', 'avatar/1.png', 1, 0, 0, 0, '2024-01-13 21:16:56', NULL, 1);
INSERT INTO `civil_article` VALUES (67, '公考面试心得体会', '公考面试心得体会 公考面试是考察考生实际能力和综合素质的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过公考面试的考生的心得体会，供即将参加面试的考生参考。 首先，要对面试的形式和内容有清晰的认识，明确自己的优势和不足。通过对面试题型的了解，可以有针对性地进行准备。其次，要注重形象和仪表的整洁，给考官留下良好的印象。 另外，要注重表达和沟通能力的培养，通过模拟面试提高应变能力。在面试过程中要保持自信，清晰表达自己的观点。最后，要关注面试的注意事项和常见问题，做好应对准备。 希望大家都能够通过详细了解公考面试心得体会，取得好成绩，成功晋级。 ', 2, '公考面试', '学习笔记', 'article/3.png', 1, '王罗源', 'avatar/1.png', 1, 0, 0, 0, '2024-01-13 21:16:56', NULL, 1);
INSERT INTO `civil_article` VALUES (68, '军队文职面试注意事项', '军队文职面试注意事项 军队文职面试是考察考生实际能力和综合素质的环节，备考经验对于取得好成绩至关重要。本文总结了一些军队文职面试的注意事项，希望对即将参加面试的考生有所帮助。 首先，要熟悉军队文职面试的形式和内容，明确面试的评分标准。通过对面试题型的了解，可以有针对性地进行准备。其次，要注重形象和仪表的整洁，给考官留下良好的印象。 另外，要注重表达和沟通能力的培养，通过模拟面试提高应变能力。在面试过程中要保持冷静，清晰表达自己的观点。最后，要关注面试的注意事项和常见问题，做好应对准备。 希望大家都能够通过详细了解军队文职面试注意事项，取得好成绩，成功晋级。 ', 3, '军队文职', '学习笔记', 'article/4.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:16:56', NULL, 1);
INSERT INTO `civil_article` VALUES (69, '事业单位笔试经验分享', '事业单位笔试经验分享 事业单位笔试是考察考生基础知识和解题能力的重要环节，备考经验对于取得好成绩至关重要。本文分享了一位成功通过事业单位笔试的考生的经验，供即将参加笔试的考生参考。 首先，要了解事业单位笔试的形式和内容，明确笔试的评分标准。通过对笔试题型的了解，可以有针对性地进行准备。其次，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。 另外，要保持良好的学习状态，保证充足的休息，调整好作息时间。在考试前要注意查看考场规定，准备好相关的考试材料。最后，要保持冷静和自信，做到考试时心态稳定，发挥出最佳水平。 希望大家都能够通过详细了解事业单位笔试经验分享，取得好成绩，成功晋级。 ', 4, '事业单位', '学习笔记', 'article/5.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:16:56', NULL, 1);
INSERT INTO `civil_article` VALUES (70, '三支一扶申请攻略', '三支一扶申请攻略 三支一扶计划是国家为加强基层工作而设立的专项计划，吸引了众多大学生的关注。本文提供了一些建议，帮助考生更好地选择适合自己的岗位，取得更好的发展。 首先，要了解各个岗位的特点和职责，明确自己的兴趣和发展方向。通过对岗位的深入了解，可以有针对性地选择合适的岗位。其次，要关注所在地的实际情况，考虑到生活和工作的便利性。 另外，要注意个人的专业背景和能力，选择与自己专业相关的岗位，提高工作的匹配度。最后，要根据个人的发展规划，选择具有发展潜力的岗位，为将来的职业生涯打下坚实的基础。 希望大家都能够通过详细了解三支一扶申请攻略，选择合适的岗位，取得更好的发展。 ', 5, '三支一扶', '学习笔记', 'article/6.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:16:56', NULL, 1);
INSERT INTO `civil_article` VALUES (71, '公考笔试备考经验分享', '公考笔试备考经验分享 公考笔试备考是考生成功的关键，通过总结一些备考经验，可以更好地应对考试，提高自己的分数。本文分享了一些成功考取的考生的备考经验，供即将参加公考笔试的考生参考。 首先，要熟悉考试大纲和各科目的知识点，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地制定备考计划。其次，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。 另外，要保持良好的学习状态，保证充足的休息，调整好作息时间。在考试前要注意查看考场规定，准备好相关的考试材料。最后，要保持冷静和自信，做到考试时心态稳定，发挥出最佳水平。 希望大家都能够通过详细了解公考笔试备考经验分享，取得好成绩，成功晋级。 ', 1, '公考笔试', '学习笔记', 'article/7.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:19:43', NULL, 1);
INSERT INTO `civil_article` VALUES (72, '公考面试技巧与经验分享', '公考面试技巧与经验分享 公考面试是考察考生实际能力和综合素质的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过公考面试的考生的技巧与经验，供即将参加面试的考生参考。 首先，要对面试的形式和内容有清晰的认识，明确自己的优势和不足。通过对面试题型的了解，可以有针对性地进行准备。其次，要注重形象和仪表的整洁，给考官留下良好的印象。 另外，要注重表达和沟通能力的培养，通过模拟面试提高应变能力。在面试过程中要保持自信，清晰表达自己的观点。最后，要关注面试的注意事项和常见问题，做好应对准备。 希望大家都能够通过详细了解公考面试技巧与经验分享，取得好成绩，成功晋级。 ', 2, '公考面试', '学习笔记', 'article/8.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:19:43', NULL, 1);
INSERT INTO `civil_article` VALUES (73, '军队文职面试经验分享', '军队文职面试经验分享 军队文职面试是考察考生实际能力和综合素质的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过军队文职面试的考生的经验，供即将参加面试的考生参考。 首先，要熟悉军队文职面试的形式和内容，明确面试的评分标准。通过对面试题型的了解，可以有针对性地进行准备。其次，要注重形象和仪表的整洁，给考官留下良好的印象。 另外，要注重表达和沟通能力的培养，通过模拟面试提高应变能力。在面试过程中要保持冷静，清晰表达自己的观点。最后，要关注面试的注意事项和常见问题，做好应对准备。 希望大家都能够通过详细了解军队文职面试经验分享，取得好成绩，成功晋级。 ', 3, '军队文职', '学习笔记', 'article/1.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:19:43', NULL, 1);
INSERT INTO `civil_article` VALUES (74, '事业单位面试技巧分享', '事业单位面试技巧分享 事业单位面试是考察考生实际能力和综合素质的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过事业单位面试的考生的技巧，供即将参加面试的考生参考。 首先，要对面试的形式和内容有清晰的认识，明确自己的优势和不足。通过对面试题型的了解，可以有针对性地进行准备。其次，要注重形象和仪表的整洁，给考官留下良好的印象。 另外，要注重表达和沟通能力的培养，通过模拟面试提高应变能力。在面试过程中要保持自信，清晰表达自己的观点。最后，要关注面试的注意事项和常见问题，做好应对准备。 希望大家都能够通过详细了解事业单位面试技巧分享，取得好成绩，成功晋级。 ', 4, '事业单位', '学习笔记', 'article/2.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:19:43', NULL, 1);
INSERT INTO `civil_article` VALUES (75, '三支一扶面试经验分享', '三支一扶面试经验分享 三支一扶面试是考察考生实际能力和综合素质的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过三支一扶面试的考生的经验，供即将参加面试的考生参考。 首先，要熟悉三支一扶面试的形式和内容，明确面试的评分标准。通过对面试题型的了解，可以有针对性地进行准备。其次，要注重形象和仪表的整洁，给考官留下良好的印象。 另外，要注重表达和沟通能力的培养，通过模拟面试提高应变能力。在面试过程中要保持冷静，清晰表达自己的观点。最后，要关注面试的注意事项和常见问题，做好应对准备。 希望大家都能够通过详细了解三支一扶面试经验分享，取得好成绩，成功晋级。 ', 5, '三支一扶', '学习笔记', 'article/3.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:19:43', NULL, 1);
INSERT INTO `civil_article` VALUES (76, '公安招警面试经验分享', '公安招警面试经验分享 公安招警面试是考察考生实际能力和综合素质的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过公安招警面试的考生的经验，供即将参加面试的考生参考。 首先，要熟悉公安招警面试的形式和内容，明确面试的评分标准。通过对面试题型的了解，可以有针对性地进行准备。其次，要注重形象和仪表的整洁，给考官留下良好的印象。 另外，要注重表达和沟通能力的培养，通过模拟面试提高应变能力。在面试过程中要保持冷静，清晰表达自己的观点。最后，要关注面试的注意事项和常见问题，做好应对准备。 希望大家都能够通过详细了解公安招警面试经验分享，取得好成绩，成功晋级。 ', 6, '公安招警', '学习笔记', 'article/4.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:21:12', NULL, 1);
INSERT INTO `civil_article` VALUES (77, '公考笔试技巧分享', '公考笔试技巧分享 公考笔试是考察考生基础知识和解题能力的环节，备考技巧对于取得好成绩至关重要。本文分享了一些成功考取的考生的笔试技巧，供即将参加公考笔试的考生参考。 首先，要熟悉考试大纲和各科目的知识点，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地制定备考计划。其次，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。 另外，要保持良好的学习状态，保证充足的休息，调整好作息时间。在考试前要注意查看考场规定，准备好相关的考试材料。最后，要保持冷静和自信，做到考试时心态稳定，发挥出最佳水平。 希望大家都能够通过详细了解公考笔试技巧分享，取得好成绩，成功晋级。 ', 1, '公考笔试', '解题技巧', 'article/5.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:21:12', NULL, 1);
INSERT INTO `civil_article` VALUES (78, '公考面试经验分享', '公考面试经验分享 公考面试是考察考生实际能力和综合素质的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过公考面试的考生的经验，供即将参加面试的考生参考。 首先，要对面试的形式和内容有清晰的认识，明确自己的优势和不足。通过对面试题型的了解，可以有针对性地进行准备。其次，要注重形象和仪表的整洁，给考官留下良好的印象。 另外，要注重表达和沟通能力的培养，通过模拟面试提高应变能力。在面试过程中要保持自信，清晰表达自己的观点。最后，要关注面试的注意事项和常见问题，做好应对准备。 希望大家都能够通过详细了解公考面试经验分享，取得好成绩，成功晋级。 ', 2, '公考面试', '学习笔记', 'article/6.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:21:12', NULL, 1);
INSERT INTO `civil_article` VALUES (79, '军队文职笔试技巧分享', '军队文职笔试技巧分享 军队文职笔试是考察考生基础知识和解题能力的环节，备考技巧对于取得好成绩至关重要。本文分享了一些成功考取的考生的笔试技巧，供即将参加军队文职笔试的考生参考。 首先，要熟悉考试大纲和各科目的知识点，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地制定备考计划。其次，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。 另外，要保持良好的学习状态，保证充足的休息，调整好作息时间。在考试前要注意查看考场规定，准备好相关的考试材料。最后，要保持冷静和自信，做到考试时心态稳定，发挥出最佳水平。 希望大家都能够通过详细了解军队文职笔试技巧分享，取得好成绩，成功晋级。 ', 3, '军队文职', '解题技巧', 'article/7.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:21:12', NULL, 1);
INSERT INTO `civil_article` VALUES (80, '事业单位笔记分享', '事业单位笔记分享 事业单位考试是考察考生综合素质和专业知识的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功考取的考生的笔记，供即将参加事业单位考试的考生参考。 首先，要熟悉考试科目和大纲，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地进行准备。其次，要注重知识的系统化整理，制定科学合理的学习计划。 另外，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。在备考过程中要保持良好的心态，保证充足的休息。最后，要关注考试动态，及时调整复习计划，确保备考效果。 希望大家都能够通过详细了解事业单位笔记分享，取得好成绩，成功晋级。 ', 4, '事业单位', '学习笔记', 'article/8.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:21:12', NULL, 1);
INSERT INTO `civil_article` VALUES (81, '三支一扶解题技巧分享', '三支一扶解题技巧分享 三支一扶考试是考察考生解题能力和专业知识的环节，备考技巧对于取得好成绩至关重要。本文分享了一些成功考取的考生的解题技巧，供即将参加三支一扶考试的考生参考。 首先，要熟悉考试科目和大纲，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地进行准备。其次，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。 另外，要保持良好的学习状态，保证充足的休息，调整好作息时间。在考试前要注意查看考场规定，准备好相关的考试材料。最后，要保持冷静和自信，做到考试时心态稳定，发挥出最佳水平。 希望大家都能够通过详细了解三支一扶解题技巧分享，取得好成绩，成功晋级。 ', 5, '三支一扶', '解题技巧', 'article/1.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:22:59', NULL, 1);
INSERT INTO `civil_article` VALUES (82, '公考笔试经验分享', '公考笔试经验分享 公考笔试是考察考生基础知识和解题能力的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过公考笔试的考生的经验，供即将参加笔试的考生参考。 首先，要熟悉考试科目和大纲，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地进行准备。其次，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。 另外，要保持良好的学习状态，保证充足的休息，调整好作息时间。在考试前要注意查看考场规定，准备好相关的考试材料。最后，要保持冷静和自信，做到考试时心态稳定，发挥出最佳水平。 希望大家都能够通过详细了解公考笔试经验分享，取得好成绩，成功晋级。 ', 1, '公考笔试', '学习笔记', 'article/2.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:22:59', NULL, 1);
INSERT INTO `civil_article` VALUES (83, '公考面试技巧分享', '公考面试技巧分享 公考面试是考察考生实际应用能力和综合素质的环节，备考技巧对于取得好成绩至关重要。本文分享了一些成功通过公考面试的考生的技巧，供即将参加面试的考生参考。 首先，要熟悉面试考题类型和常见问题，进行充分准备。通过模拟面试，提高回答问题的思路和表达能力。其次，要注重形象和仪态的塑造，给面试官留下良好的印象。 另外，要保持自信和冷静，不要紧张，有礼貌地回答问题。在面试前要了解面试流程，准备好相关材料。最后，要注意言行举止，展现出良好的职业素养。 希望大家都能够通过详细了解公考面试技巧分享，取得好成绩，成功晋级。 ', 2, '公考面试', '学习笔记', 'article/3.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:22:59', NULL, 1);
INSERT INTO `civil_article` VALUES (84, '公安招警笔记分享', '公安招警笔记分享 公安招警考试是考察考生基础知识和应变能力的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功考取的考生的笔记，供即将参加招警考试的考生参考。 首先，要熟悉考试科目和大纲，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地进行准备。其次，要注重知识的系统化整理，制定科学合理的学习计划。 另外，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。在备考过程中要保持良好的心态，保证充足的休息。最后，要关注考试动态，及时调整复习计划，确保备考效果。 希望大家都能够通过详细了解公安招警笔记分享，取得好成绩，成功晋级。 ', 6, '公安招警', '学习笔记', 'article/4.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:22:59', NULL, 1);
INSERT INTO `civil_article` VALUES (85, '事业单位解题技巧分享', '事业单位解题技巧分享 事业单位考试是考察考生解题能力和专业知识的环节，备考技巧对于取得好成绩至关重要。本文分享了一些成功考取的考生的解题技巧，供即将参加事业单位考试的考生参考。 首先，要熟悉考试科目和大纲，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地进行准备。其次，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。 另外，要保持良好的学习状态，保证充足的休息，调整好作息时间。在考试前要注意查看考场规定，准备好相关的考试材料。最后，要保持冷静和自信，做到考试时心态稳定，发挥出最佳水平。 希望大家都能够通过详细了解事业单位解题技巧分享，取得好成绩，成功晋级。 ', 4, '事业单位', '解题技巧', 'article/5.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:22:59', NULL, 1);
INSERT INTO `civil_article` VALUES (86, '三支一扶笔记分享', '三支一扶笔记分享 三支一扶考试是考察考生基础知识和解题能力的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功考取的考生的笔记，供即将参加三支一扶考试的考生参考。 首先，要熟悉考试科目和大纲，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地进行准备。其次，要注重知识的系统化整理，制定科学合理的学习计划。 另外，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。在备考过程中要保持良好的心态，保证充足的休息。最后，要关注考试动态，及时调整复习计划，确保备考效果。 希望大家都能够通过详细了解三支一扶笔记分享，取得好成绩，成功晋级。 ', 5, '三支一扶', '学习笔记', 'article/6.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:25:24', NULL, 1);
INSERT INTO `civil_article` VALUES (87, '公考笔试解题技巧分享', '公考笔试解题技巧分享 公考笔试是考察考生基础知识和解题能力的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过公考笔试的考生的解题技巧，供即将参加笔试的考生参考。 首先，要熟悉考试科目和大纲，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地进行准备。其次，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。 另外，要保持良好的学习状态，保证充足的休息，调整好作息时间。在考试前要注意查看考场规定，准备好相关的考试材料。最后，要保持冷静和自信，做到考试时心态稳定，发挥出最佳水平。 希望大家都能够通过详细了解公考笔试解题技巧分享，取得好成绩，成功晋级。 ', 1, '公考笔试', '解题技巧', 'article/7.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:25:24', NULL, 1);
INSERT INTO `civil_article` VALUES (88, '公考面试经验分享', '公考面试经验分享 公考面试是考察考生综合素质和应变能力的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过公考面试的考生的经验，供即将参加面试的考生参考。 首先，要熟悉面试考题类型和常见问题，进行充分准备。通过模拟面试，提高回答问题的思路和表达能力。其次，要注重形象和仪态的塑造，给面试官留下良好的印象。 另外，要保持自信和冷静，不要紧张，有礼貌地回答问题。在面试前要了解面试流程，准备好相关材料。最后，要注意言行举止，展现出良好的职业素养。 希望大家都能够通过详细了解公考面试经验分享，取得好成绩，成功晋级。 ', 2, '公考面试', '学习笔记', 'article/8.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:25:24', NULL, 1);
INSERT INTO `civil_article` VALUES (89, '军队文职笔记分享', '军队文职笔记分享 军队文职考试是考察考生综合素质和专业知识的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功考取的考生的笔记，供即将参加军队文职考试的考生参考。 首先，要熟悉考试科目和大纲，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地进行准备。其次，要注重知识的系统化整理，制定科学合理的学习计划。 另外，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。在备考过程中要保持良好的心态，保证充足的休息。最后，要关注考试动态，及时调整复习计划，确保备考效果。 希望大家都能够通过详细了解军队文职笔记分享，取得好成绩，成功晋级。 ', 3, '军队文职', '学习笔记', 'article/1.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:25:24', NULL, 1);
INSERT INTO `civil_article` VALUES (90, '事业单位经验分享', '事业单位经验分享 事业单位考试是考察考生综合素质和应变能力的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过事业单位考试的考生的经验，供即将参加考试的考生参考。 首先，要熟悉考试科目和大纲，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地进行准备。其次，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。 另外，要保持良好的学习状态，保证充足的休息，调整好作息时间。在考试前要注意查看考场规定，准备好相关的考试材料。最后，要保持冷静和自信，做到考试时心态稳定，发挥出最佳水平。 希望大家都能够通过详细了解事业单位经验分享，取得好成绩，成功晋级。 ', 4, '事业单位', '学习笔记', 'article/2.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:25:24', NULL, 1);
INSERT INTO `civil_article` VALUES (91, '三支一扶解题技巧分享', '三支一扶解题技巧分享 三支一扶考试是考察考生基础知识和解题能力的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过三支一扶考试的考生的解题技巧，供即将参加考试的考生参考。 首先，要熟悉考试科目和大纲，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地进行准备。其次，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。 另外，要保持良好的学习状态，保证充足的休息，调整好作息时间。在考试前要注意查看考场规定，准备好相关的考试材料。最后，要保持冷静和自信，做到考试时心态稳定，发挥出最佳水平。 希望大家都能够通过详细了解三支一扶解题技巧分享，取得好成绩，成功晋级。 ', 5, '三支一扶', '解题技巧', 'article/3.png', 1, '王罗源', 'avatar/1.png', 0, 0, 1, 0, '2024-01-13 21:27:00', NULL, 1);
INSERT INTO `civil_article` VALUES (92, '公考笔试笔记分享', '公考笔试笔记分享 公考笔试是考察考生基础知识和解题能力的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过公考笔试的考生的笔记，供即将参加笔试的考生参考。 首先，要熟悉考试科目和大纲，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地进行准备。其次，要注重知识的系统化整理，制定科学合理的学习计划。 另外，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。在备考过程中要保持良好的心态，保证充足的休息。最后，要关注考试动态，及时调整复习计划，确保备考效果。 希望大家都能够通过详细了解公考笔试笔记分享，取得好成绩，成功晋级。 ', 1, '公考笔试', '学习笔记', 'article/4.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:27:00', NULL, 1);
INSERT INTO `civil_article` VALUES (93, '公考面试解题技巧分享', '公考面试解题技巧分享 公考面试是考察考生综合素质和应变能力的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过公考面试的考生的解题技巧，供即将参加面试的考生参考。 首先，要熟悉面试考题类型和常见问题，进行充分准备。通过模拟面试，提高回答问题的思路和表达能力。其次，要注重形象和仪态的塑造，给面试官留下良好的印象。 另外，要保持自信和冷静，不要紧张，有礼貌地回答问题。在面试前要了解面试流程，准备好相关材料。最后，要注意言行举止，展现出良好的职业素养。 希望大家都能够通过详细了解公考面试解题技巧分享，取得好成绩，成功晋级。 ', 2, '公考面试', '解题技巧', 'article/5.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:27:00', NULL, 1);
INSERT INTO `civil_article` VALUES (94, '军队文职解题技巧分享', '军队文职解题技巧分享 军队文职考试是考察考生综合素质和专业知识的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过军队文职考试的考生的解题技巧，供即将参加考试的考生参考。 首先，要熟悉考试科目和大纲，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地进行准备。其次，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。 另外，要保持良好的学习状态，保证充足的休息，调整好作息时间。在考试前要注意查看考场规定，准备好相关的考试材料。最后，要保持冷静和自信，做到考试时心态稳定，发挥出最佳水平。 希望大家都能够通过详细了解军队文职解题技巧分享，取得好成绩，成功晋级。 ', 3, '军队文职', '解题技巧', 'article/6.png', 1, '王罗源', 'avatar/1.png', 0, 0, 1, 0, '2024-01-13 21:27:00', NULL, 1);
INSERT INTO `civil_article` VALUES (95, '军队文职解题技巧分享', '军队文职解题技巧分享 军队文职考试是考察考生综合素质和专业知识的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过军队文职考试的考生的解题技巧，供即将参加考试的考生参考。 首先，要熟悉考试科目和大纲，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地进行准备。其次，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。 另外，要保持良好的学习状态，保证充足的休息，调整好作息时间。在考试前要注意查看考场规定，准备好相关的考试材料。最后，要保持冷静和自信，做到考试时心态稳定，发挥出最佳水平。 希望大家都能够通过详细了解军队文职解题技巧分享，取得好成绩，成功晋级。 ', 3, '军队文职', '解题技巧', 'article/6.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:27:00', NULL, 1);
INSERT INTO `civil_article` VALUES (96, '三支一扶笔记分享', '三支一扶笔记分享 三支一扶考试是考察考生基础知识和解题能力的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过三支一扶考试的考生的笔记，供即将参加考试的考生参考。 首先，要熟悉考试科目和大纲，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地进行准备。其次，要注重知识的系统化整理，制定科学合理的学习计划。 另外，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。在备考过程中要保持良好的心态，保证充足的休息。最后，要关注考试动态，及时调整复习计划，确保备考效果。 希望大家都能够通过详细了解三支一扶笔记分享，取得好成绩，成功晋级。 ', 5, '三支一扶', '学习笔记', 'article/8.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:28:17', NULL, 0);
INSERT INTO `civil_article` VALUES (97, '公考笔试解题技巧分享', '公考笔试解题技巧分享 公考笔试是考察考生基础知识和解题能力的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过公考笔试的考生的解题技巧，供即将参加笔试的考生参考。 首先，要熟悉考试科目和大纲，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地进行准备。其次，要注重知识的系统化整理，制定科学合理的学习计划。 另外，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。在备考过程中要保持良好的心态，保证充足的休息。最后，要关注考试动态，及时调整复习计划，确保备考效果。 希望大家都能够通过详细了解公考笔试解题技巧分享，取得好成绩，成功晋级。 ', 1, '公考笔试', '解题技巧', 'article/1.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:28:17', NULL, 0);
INSERT INTO `civil_article` VALUES (98, '公考面试笔记分享', '公考面试笔记分享 公考面试是考察考生综合素质和应变能力的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过公考面试的考生的笔记，供即将参加面试的考生参考。 首先，要熟悉面试考题类型和常见问题，进行充分准备。通过模拟面试，提高回答问题的思路和表达能力。其次，要注重形象和仪态的塑造，给面试官留下良好的印象。 另外，要保持自信和冷静，不要紧张，有礼貌地回答问题。在面试前要了解面试流程，准备好相关材料。最后，要注意言行举止，展现出良好的职业素养。 希望大家都能够通过详细了解公考面试笔记分享，取得好成绩，成功晋级。 ', 2, '公考面试', '学习笔记', 'article/2.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:28:17', NULL, 0);
INSERT INTO `civil_article` VALUES (99, '军队文职笔记分享', '军队文职笔记分享 军队文职考试是考察考生综合素质和专业知识的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过军队文职考试的考生的笔记，供即将参加考试的考生参考。 首先，要熟悉考试科目和大纲，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地进行准备。其次，要注重知识的系统化整理，制定科学合理的学习计划。 另外，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。在备考过程中要保持良好的心态，保证充足的休息。最后，要关注考试动态，及时调整复习计划，确保备考效果。 希望大家都能够通过详细了解军队文职笔记分享，取得好成绩，成功晋级。 ', 3, '军队文职', '学习笔记', 'article/3.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:28:17', NULL, 0);
INSERT INTO `civil_article` VALUES (100, '事业单位笔记分享', '事业单位笔记分享 事业单位考试是考察考生基础知识和解题能力的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过事业单位考试的考生的笔记，供即将参加考试的考生参考。 首先，要熟悉考试科目和大纲，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地进行准备。其次，要注重知识的系统化整理，制定科学合理的学习计划。 另外，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。在备考过程中要保持良好的心态，保证充足的休息。最后，要关注考试动态，及时调整复习计划，确保备考效果。 希望大家都能够通过详细了解事业单位笔记分享，取得好成绩，成功晋级。 ', 4, '事业单位', '学习笔记', 'article/4.png', 1, '王罗源', 'avatar/1.png', 0, 0, 0, 0, '2024-01-13 21:28:17', NULL, 0);
INSERT INTO `civil_article` VALUES (101, '公考面试经验分享', '公考面试解题技巧分享 公考面试是考察考生综合素质和应变能力的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过公考面试的考生的解题技巧，供即将参加面试的考生参考。 首先，要熟悉面试考题类型和常见问题，进行充分准备。通过模拟面试，提高回答问题的思路和表达能力。其次，要注重形象和仪态的塑造，给面试官留下良好的印象。 另外，要保持自信和冷静，不要紧张，有礼貌地回答问题。在面试前要了解面试流程，准备好相关材料。最后，要注意言行举止，展现出良好的职业素养。 希望大家都能够通过详细了解公考面试解题技巧分享，取得好成绩，成功晋级。 ', 2, '公考面试', '解题技巧', 'article/5.png', 1, '王罗源', 'avatar/1.png', 0, 0, 1, 0, '2024-03-05 14:40:04', '', 0);
INSERT INTO `civil_article` VALUES (102, '军队文职笔记分享', '军队文职解题技巧分享 军队文职考试是考察考生综合素质和专业知识的环节，备考经验对于取得好成绩至关重要。本文分享了一些成功通过军队文职考试的考生的解题技巧，供即将参加考试的考生参考。 首先，要熟悉考试科目和大纲，明确每个科目的重点和难点。通过对大纲的仔细研究，可以有针对性地进行准备。其次，要注重解题技巧的培养，多做真题和模拟题，提高解题速度和准确度。 另外，要保持良好的学习状态，保证充足的休息，调整好作息时间。在考试前要注意查看考场规定，准备好相关的考试材料。最后，要保持冷静和自信，做到考试时心态稳定，发挥出最佳水平。 希望大家都能够通过详细了解军队文职解题技巧分享，取得好成绩，成功晋级。 ', 2, '公考面试', '解题技巧', 'article/6.png', 1, '王罗源', 'avatar/1.png', 0, 0, 1, 0, '2024-03-05 16:19:35', NULL, 0);
INSERT INTO `civil_article` VALUES (104, '测试', '<p>aaaa<img src=\"http://mju.lenzy.tech:9000/civil-journey-project/article/articleType%3A%20null/username%3A%20null/2024-03-27-1711542745654.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=userOne%2F20240327%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240327T123225Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=6d276a4a57298f97e840d348a817ce514ca5cd8aa127536d0f870d634eb393f9\" alt=\"\" data-href=\"\" style=\"\"/></p>', 3, '军队文职', '解题技巧', 'article/articleType: 解题技巧/username: /2024-03-27-1711542752960.jpg', 19, 'Lensy', 'avatar/6.jpg', 0, 0, 2, 0, '2024-03-27 20:32:39', NULL, 1);

-- ----------------------------
-- Table structure for civil_banner
-- ----------------------------
DROP TABLE IF EXISTS `civil_banner`;
CREATE TABLE `civil_banner`  (
  `banner_id` bigint NOT NULL AUTO_INCREMENT COMMENT '轮播图ID',
  `banner_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片地址',
  `banner_sort` int NOT NULL COMMENT '显示顺序',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`banner_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '轮播图表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of civil_banner
-- ----------------------------
INSERT INTO `civil_banner` VALUES (1, 'banner/banner-1.png', 1, 0);
INSERT INTO `civil_banner` VALUES (2, 'banner/banner-2.png', 2, 0);
INSERT INTO `civil_banner` VALUES (3, 'banner/banner-3.png', 3, 0);
INSERT INTO `civil_banner` VALUES (4, 'banner/banner-4.png', 4, 0);
INSERT INTO `civil_banner` VALUES (5, 'banner/banner-5.png', 5, 0);
INSERT INTO `civil_banner` VALUES (6, 'banner/banner-6.png', 6, 0);
INSERT INTO `civil_banner` VALUES (7, 'banner/banner-7.png', 7, 0);
INSERT INTO `civil_banner` VALUES (8, 'banner/banner-8.png', 8, 1);
INSERT INTO `civil_banner` VALUES (9, 'banner/banner-9.png', 9, 1);
INSERT INTO `civil_banner` VALUES (10, 'banner/banner-10.png', 10, 1);

-- ----------------------------
-- Table structure for civil_category
-- ----------------------------
DROP TABLE IF EXISTS `civil_category`;
CREATE TABLE `civil_category`  (
  `category_id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category_parent_id` bigint NOT NULL COMMENT '父分类ID',
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建者',
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '更新者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除(0:正常、1:禁用、2:删除)',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of civil_category
-- ----------------------------
INSERT INTO `civil_category` VALUES (1, 0, '公考笔试', 'lenzy', 'lenzy', '2023-12-07 15:13:53', '2024-03-14 19:08:36', 0);
INSERT INTO `civil_category` VALUES (2, 0, '公考面试', 'lenzy', 'lenzy', '2023-12-07 15:14:26', '2024-03-14 19:08:36', 0);
INSERT INTO `civil_category` VALUES (3, 0, '军队文职', 'lenzy', 'lenzy', '2023-12-07 15:14:26', '2024-03-14 19:08:36', 0);
INSERT INTO `civil_category` VALUES (4, 0, '事业单位', 'lenzy', 'lenzy', '2023-12-07 15:14:26', '2024-03-14 19:08:36', 0);
INSERT INTO `civil_category` VALUES (5, 0, '三支一扶', 'lenzy', 'Miss_Lenzy', '2023-12-07 15:14:26', '2024-03-26 11:52:34', 0);
INSERT INTO `civil_category` VALUES (6, 0, '公安招警', 'lenzy', 'lenzy', '2023-12-07 15:14:26', '2024-03-14 19:08:36', 0);

-- ----------------------------
-- Table structure for civil_course
-- ----------------------------
DROP TABLE IF EXISTS `civil_course`;
CREATE TABLE `civil_course`  (
  `course_id` bigint NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `course_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程名称',
  `course_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '/image.png' COMMENT '课程封面',
  `course_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程描述',
  `category_id` bigint NOT NULL COMMENT '分类ID',
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名称',
  `user_id` bigint NOT NULL COMMENT '发布者',
  `creator_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '发布者姓名',
  `creator_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '发布者头像',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `pay_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '购买金额',
  `like_number` bigint NOT NULL DEFAULT 0 COMMENT '点赞数',
  `browse_number` bigint NOT NULL DEFAULT 0 COMMENT '浏览数',
  `collection_number` bigint NOT NULL DEFAULT 0 COMMENT '收藏数',
  `audit_failure_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核失败原因',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态(0:待审核、1:审核成功、2:审核失败)',
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 302 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of civil_course
-- ----------------------------
INSERT INTO `civil_course` VALUES (1, '公务员笔试基础课程', 'course/1.png', '公务员笔试基础课程是为有志于公务员考试的学员打造的全面复习课程。通过系统性的讲解和大量实例分析，学员将深入了解各个科目的考点，提高解题能力。课程内容包括常识判断、言语理解与表达、数量关系等，涵盖公务员笔试的基础知识。讲师团队由经验丰富的教育专家组成，确保学员能够得到高质量的教学指导。', 1, '公考笔试', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 150.00, 1, 127, 1, NULL, 1);
INSERT INTO `civil_course` VALUES (2, '公务员面试实战训练', 'course/2.png', '公务员面试实战训练课程旨在帮助考生在面试中表现出色。课程通过模拟公务员面试场景，提高面试技巧。学员将参与实际案例分析和模拟面试，帮助他们熟悉面试流程，培养应对各种问题的能力。讲师团队由经验丰富的面试官和专业人士组成，能够为学员提供真实、有效的指导。课程还包括对常见面试问题的解析和应对策略，帮助学员更加自信地迎接公务员面试的挑战。', 2, '公考面试', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 200.00, 1, 74, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (3, '军队文职考试指南', 'course/3.png', '军队文职考试指南是一门全面解析军队文职考试要点的课程。课程内容涵盖军事理论、组织管理、国防法规等方面的知识。通过系统讲解和实例分析，学员将深入了解军队文职考试的考点，提高应试能力。课程还包括对历年考题的解析和应对策略，帮助学员更好地应对考试。讲师团队由军队文职考试专家组成，确保学员能够得到权威、专业的指导。', 3, '军队文职', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 120.00, 1, 4, 1, NULL, 1);
INSERT INTO `civil_course` VALUES (4, '事业单位考试全程指导', 'course/4.png', '事业单位考试全程指导课程旨在帮助考生全面备战事业单位招聘考试。课程内容包括综合素质面试、笔试技巧、面试模拟等方面的内容。通过实例分析和模拟练习，学员将提高应试能力，更好地应对事业单位招聘考试的各个环节。讲师团队由拥有丰富经验的专业人士组成，确保学员能够获得高质量的培训。', 4, '事业单位', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 90.00, 1, 3, 1, NULL, 1);
INSERT INTO `civil_course` VALUES (5, '三支一扶招聘考试攻略', 'course/5.png', '三支一扶招聘考试攻略课程帮助学员全面了解三支一扶招聘考试的各个环节。包括考试大纲解读、面试技巧、模拟练习等内容。通过实例分析和模拟练习，学员将深入了解考试要点，提高应试能力。讲师团队由有丰富经验的招聘专家组成，确保学员能够获得专业、有效的指导。', 5, '三支一扶', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 60.00, 1, 1, 1, NULL, 1);
INSERT INTO `civil_course` VALUES (6, '公安招警考试精讲', 'course/6.png', '公安招警考试精讲课程旨在帮助考生全面备战公安招警考试。课程内容包括笔试重难点剖析、面试技巧讲解等方面。通过实例分析和模拟练习，学员将深入了解公安招警考试的考察重点，提高应试能力。讲师团队由拥有多年招警考试经验的专业人士组成，确保学员能够得到高质量的指导。', 6, '公安招警', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 180.00, 1, 5, 1, NULL, 1);
INSERT INTO `civil_course` VALUES (7, '事业单位面试技巧', 'course/7.png', '事业单位面试技巧课程帮助学员更好地应对事业单位面试环节。内容包括面试常见问题解析、沟通技巧等方面。通过实际案例和模拟面试，学员将提高面试表现，增加成功机会。讲师团队由具有丰富招聘面试经验的专业人士组成，确保学员能够获得专业的指导。', 4, '事业单位', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 100.00, 1, 15, 1, NULL, 1);
INSERT INTO `civil_course` VALUES (8, '三支一扶申论写作', 'course/8.png', '三支一扶申论写作课程致力于提高学员在招聘考试中的申论写作水平。内容包括写作结构、论述技巧等方面。通过实际案例分析和写作练习，学员将熟悉申论写作要点，增加写作信心。讲师团队由专业的写作辅导专家组成，确保学员能够得到系统的写作培训。', 5, '三支一扶', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 80.00, 1, 2, 1, NULL, 1);
INSERT INTO `civil_course` VALUES (9, '公务员面试技能培训', 'course/9.png', '公务员面试技能培训课程旨在提高考生在公务员面试中的表现水平。内容包括面试技巧、沟通能力等方面。通过模拟面试和实际案例分析，学员将增加面试经验，提高面试水平。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够获得全面的面试技能培训。', 2, '公考面试', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 300.00, 1, 9, 1, NULL, 1);
INSERT INTO `civil_course` VALUES (10, '军队文职申论协作辅导', 'course/10.png', '军队文职申论写作指导课程帮助学员深入了解军队文职申论考试的写作要求。内容包括申论写作技巧、范文解析等方面。通过实例分析和写作练习，学员将更好地应对军队文职申论考试的各个环节。讲师团队由有经验的申论培训专家组成，确保学员能够获得专业的申论写作指导。', 3, '军队文职', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 250.00, 1, 1, 1, NULL, 1);
INSERT INTO `civil_course` VALUES (11, '事业单位招聘笔试突破', 'course/11.png', '事业单位招聘笔试突破课程旨在帮助学员在事业单位招聘笔试中取得优异成绩。内容包括各科目的重点知识点、解题技巧等方面。通过实例分析和模拟练习，学员将更好地应对笔试环节。讲师团队由拥有丰富招聘培训经验的专业人士组成，确保学员能够获得有效的培训。', 4, '事业单位', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 120.00, 1, 5, 1, NULL, 1);
INSERT INTO `civil_course` VALUES (12, '公务员申论范文解析', 'course/12.png', '公务员申论范文解析课程帮助学员深入了解公务员申论考试的写作要求。内容包括范文解析、写作技巧等方面。通过实例分析和写作练习，学员将提高申论写作水平。讲师团队由经验丰富的写作培训专家组成，确保学员能够获得专业的写作指导。', 2, '公考面试', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 90.00, 1, 1, 1, NULL, 1);
INSERT INTO `civil_course` VALUES (13, '三支一扶申论写作指导', 'course/13.png', '三支一扶申论写作指导课程旨在提高学员在申论写作方面的水平。内容包括写作技巧、结构规范等方面。通过实例分析和写作练习，学员将更好地应对三支一扶申论考试的挑战。讲师团队由拥有丰富写作培训经验的专业人士组成，确保学员能够得到专业的指导。', 5, '三支一扶', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 150.00, 1, 1, 1, NULL, 1);
INSERT INTO `civil_course` VALUES (14, '军队文职面试模拟', 'course/14.png', '军队文职面试模拟课程通过实际模拟面试，帮助学员提前适应军队文职面试环境。内容包括面试技巧、形体仪态等方面。通过模拟练习，学员将更好地应对军队文职面试的各个环节。讲师团队由经验丰富的面试培训专家组成，确保学员能够得到真实、有效的面试模拟。', 3, '军队文职', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 200.00, 1, 1, 1, NULL, 1);
INSERT INTO `civil_course` VALUES (15, '公安招警面试技能培训', 'course/15.png', '公安招警面试技能培训课程旨在提高考生在公安招警面试中的表现水平。内容包括面试技巧、心理素质等方面。通过模拟面试和实际案例分析，学员将增加面试经验，提高面试水平。讲师团队由具有丰富面试培训经验的专业人士组成，确保学员能够获得全面的面试技能培训。', 6, '公安招警', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 120.00, 1, 1, 1, NULL, 1);
INSERT INTO `civil_course` VALUES (16, '公务员面试心理辅导', 'course/16.png', '公务员面试心理辅导课程旨在帮助考生调整心态，更好地应对面试压力。内容包括心理素质培养、紧张情绪调控等方面。通过实际案例分析和心理训练，学员将提高应对面试的心理素质。讲师团队由心理辅导专家组成，确保学员能够获得全面的心理辅导。', 2, '公考面试', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 80.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (17, '事业单位招聘面试实战', 'course/17.png', '事业单位招聘面试实战课程旨在帮助学员提高在事业单位招聘面试中的表现水平。内容包括面试技巧、案例分析等方面。通过模拟面试和实际案例分析，学员将更好地适应面试环境，增加成功机会。讲师团队由拥有丰富面试经验的专业人士组成，确保学员能够得到实战性的面试指导。', 4, '事业单位', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 110.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (18, '三支一扶招聘考试解析', 'course/18.png', '三支一扶招聘考试解析课程旨在帮助学员了解三支一扶招聘考试的考点和难点。内容包括考试大纲解读、题型分析等方面。通过实例分析和解题技巧讲解，学员将更好地备战三支一扶招聘考试。讲师团队由有丰富解析经验的招聘专家组成，确保学员能够获得有效的解析指导。', 5, '三支一扶', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 130.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (19, '公务员笔试模拟考场', 'course/19.png', '公务员笔试模拟考场课程通过实际模拟考试，帮助学员提前适应公务员笔试环境。内容包括模拟考试题型、答题技巧等方面。通过模拟练习，学员将更好地适应考场氛围，提高答题效率。讲师团队由具有丰富笔试模拟经验的专业人士组成，确保学员能够得到真实、有效的模拟考场体验。', 1, '公考笔试', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 100.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (20, '军队文职综合素质面试', 'course/20.png', '军队文职综合素质面试课程帮助学员全面备战军队文职招聘考试。内容包括面试重难点剖析、综合素质评价等方面。通过实例分析和模拟练习，学员将更好地应对军队文职综合素质面试的挑战。讲师团队由拥有多年综合素质面试经验的专业人士组成，确保学员能够获得全面的面试培训。', 3, '军队文职', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 170.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (21, '公安招警心理测试训练', 'course/21.png', '公安招警心理测试训练课程旨在帮助考生提高在心理测试环节的应试水平。内容包括心理测试题型、解题技巧等方面。通过模拟测试和实际案例分析，学员将更好地应对公安招警心理测试的各类题目。讲师团队由心理测试专家组成，确保学员能够获得全面的心理测试训练。', 6, '公安招警', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 90.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (22, '事业单位招聘笔试技巧', 'course/22.png', '事业单位招聘笔试技巧课程旨在帮助学员熟悉事业单位招聘笔试题型和解题技巧。内容包括常见题型解析、解题思路等方面。通过实例分析和模拟练习，学员将更好地备战事业单位招聘笔试。讲师团队由拥有多年招聘经验的专业人士组成，确保学员能够得到实用的笔试技巧培训。', 4, '事业单位', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (23, '三支一扶申论范文欣赏', 'course/23.png', '三支一扶申论范文欣赏课程旨在帮助学员深入了解申论写作的要求。内容包括范文解析、写作技巧等方面。通过实例分析和写作练习，学员将提高申论写作水平。讲师团队由有经验的写作培训专家组成，确保学员能够得到专业的写作指导。', 5, '三支一扶', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 110.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (24, '公务员笔试模拟题库', 'course/24.png', '公务员笔试模拟题库课程提供大量的模拟题目，帮助学员在考前进行系统复习。内容包括各科目模拟题、详细解析等方面。通过大量的模拟练习，学员将更好地熟悉考试题型，提高答题效率。讲师团队由有经验的模拟题编写专家组成，确保学员能够获得高质量的模拟题库。', 1, '公考笔试', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 150.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (25, '军队文职申论写作指导', 'course/25.png', '军队文职申论写作指导课程帮助学员深入了解军队文职申论考试的写作要求。内容包括申论写作技巧、范文解析等方面。通过实例分析和写作练习，学员将更好地应对军队文职申论考试的各个环节。讲师团队由有经验的申论培训专家组成，确保学员能够获得专业的申论写作指导。', 3, '军队文职', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 130.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (26, '公务员面试案例分析', 'course/26.png', '公务员面试案例分析课程旨在通过实际案例，帮助学员更好地应对面试问题。内容包括案例分析技巧、回答策略等方面。通过模拟案例和讨论，学员将提高面试应对能力。讲师团队由面试专家组成，确保学员能够获得实用的案例分析指导。', 2, '公考面试', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 110.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (27, '事业单位招聘面试心得分享', 'course/27.png', '事业单位招聘面试心得分享课程旨在让学员通过他人的面试经验，更好地准备自己的面试。内容包括面试经验分享、注意事项等方面。通过互动和讨论，学员将获取丰富的面试心得。讲师团队由有成功面试经验的专业人士组成，确保学员能够得到实用的面试心得分享。', 4, '事业单位', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 90.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (28, '三支一扶招聘考试技巧', 'course/28.png', '三支一扶招聘考试技巧课程旨在帮助学员熟悉三支一扶招聘考试的特点和技巧。内容包括解题思路、考试注意事项等方面。通过实例分析和技巧讲解，学员将更好地备战三支一扶招聘考试。讲师团队由有丰富培训经验的专业人士组成，确保学员能够得到实用的考试技巧培训。', 5, '三支一扶', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (29, '公务员笔试解题技巧', 'course/29.png', '公务员笔试解题技巧课程旨在帮助学员掌握常见笔试题型的解题技巧。内容包括解题思路、时间分配等方面。通过实例分析和技巧讲解，学员将更好地应对公务员笔试的各个科目。讲师团队由有丰富解题经验的专业人士组成，确保学员能够得到实用的解题技巧培训。', 1, '公考笔试', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 100.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (30, '军队文职笔试考点梳理', 'course/30.png', '军队文职笔试考点梳理课程帮助学员系统梳理军队文职笔试的重点考点。内容包括考点解析、重难点剖析等方面。通过实例分析和重难点梳理，学员将更好地备战军队文职笔试。讲师团队由有丰富梳理经验的专业人士组成，确保学员能够得到系统、全面的考点梳理。', 3, '军队文职', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 130.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (31, '公安招警面试技能训练', 'course/31.png', '公安招警面试技能训练课程旨在通过实际技能训练，提高学员在面试中的表现水平。内容包括形象仪态、沟通技巧等方面。通过模拟面试和技能训练，学员将更好地展现自己的面试技能。讲师团队由面试专家和形象顾问组成，确保学员能够得到全面的面试技能培训。', 6, '公安招警', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 90.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (32, '事业单位招聘面试案例分析', 'course/1.png', '事业单位招聘面试案例分析课程旨在通过实际案例，帮助学员更好地应对面试问题。内容包括案例分析技巧、回答策略等方面。通过模拟案例和讨论，学员将提高面试应对能力。讲师团队由面试专家组成，确保学员能够获得实用的案例分析指导。', 4, '事业单位', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 90.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (33, '三支一扶招聘面试技巧', 'course/2.png', '三支一扶招聘面试技巧课程旨在帮助学员熟悉三支一扶招聘面试的特点和技巧。内容包括解题思路、考试注意事项等方面。通过实例分析和技巧讲解，学员将更好地备战三支一扶招聘面试。讲师团队由有丰富培训经验的专业人士组成，确保学员能够得到实用的面试技巧培训。', 5, '三支一扶', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (34, '公务员笔试综合知识讲解', 'course/3.png', '公务员笔试综合知识讲解课程帮助学员系统掌握笔试中的综合知识。内容包括常见科目知识点解析、综合知识整合等方面。通过详细讲解和实例分析，学员将更好地备战公务员笔试。讲师团队由有丰富讲解经验的专业人士组成，确保学员能够得到全面的知识讲解。', 1, '公考笔试', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (35, '军队文职招聘考试技巧', 'course/4.png', '军队文职招聘考试技巧课程帮助学员熟悉军队文职招聘考试的特点和技巧。内容包括解题思路、考试注意事项等方面。通过实例分析和技巧讲解，学员将更好地备战军队文职招聘考试。讲师团队由有丰富培训经验的专业人士组成，确保学员能够得到实用的考试技巧培训。', 3, '军队文职', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 130.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (36, '事业单位招聘面试技能培训', 'course/5.png', '事业单位招聘面试技能培训课程旨在通过实际技能培训，提高学员在面试中的应对能力。内容包括模拟面试、答题技巧等方面。通过专业的培训，学员将更好地应对事业单位招聘面试。讲师团队由有丰富面试经验的专业人士组成，确保学员能够得到实用的面试技能培训。', 4, '事业单位', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 110.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (37, '公务员面试案例解析', 'course/6.png', '公务员面试案例解析课程旨在通过实际案例，帮助学员更好地理解面试的评分标准。内容包括案例分析、评分要点等方面。通过深入解析，学员将更好地应对公务员面试。讲师团队由有丰富面试经验的专业人士组成，确保学员能够深入理解面试评分。', 2, '公考面试', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 150.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (38, '军队文职面试技巧培训', 'course/7.png', '军队文职面试技巧培训课程旨在通过实际技能培训，提高学员在面试中的表现水平。内容包括形象仪态、沟通技巧等方面。通过模拟面试和技能培训，学员将更好地展现自己的面试技巧。讲师团队由面试专家和形象顾问组成，确保学员能够得到全面的面试技能培训。', 3, '军队文职', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (39, '三支一扶招聘笔试技巧', 'course/8.png', '三支一扶招聘笔试技巧课程旨在帮助学员掌握三支一扶招聘笔试的解题技巧。内容包括解题思路、时间分配等方面。通过实例分析和技巧讲解，学员将更好地应对三支一扶招聘笔试。讲师团队由有丰富解题经验的专业人士组成，确保学员能够得到实用的解题技巧培训。', 5, '三支一扶', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 80.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (40, '公务员申论写作技巧', 'course/9.png', '公务员申论写作技巧课程旨在帮助学员提高申论写作水平。内容包括写作结构、论点论据等方面。通过实例分析和写作技巧讲解，学员将更好地应对公务员申论考试。讲师团队由有丰富写作经验的专业人士组成，确保学员能够得到实用的写作技巧培训。', 1, '公考笔试', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 180.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (41, '公务员行测技巧训练', 'course/10.png', '公务员行测技巧训练课程旨在帮助学员提高行测解题速度和准确度。内容包括行测题型解题技巧、时间管理等方面。通过大量题目训练和技巧指导，学员将更好地应对公务员行测考试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够得到实用的行测技巧培训。', 1, '公考笔试', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 150.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (42, '公务员面试心理准备', 'course/11.png', '公务员面试心理准备课程旨在帮助学员调整心态，应对面试压力。内容包括心理调适、自信心培养等方面。通过心理辅导和案例分析，学员将更好地迎接公务员面试。讲师团队由心理专家组成，确保学员能够得到全面的心理准备培训。', 2, '公考面试', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 90.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (43, '军队文职申论写作指导', 'course/12.png', '军队文职申论写作指导课程旨在帮助学员提高申论写作水平。内容包括写作结构、论点论据等方面。通过实例分析和写作技巧讲解，学员将更好地应对军队文职申论考试。讲师团队由有丰富写作经验的专业人士组成，确保学员能够得到实用的写作指导。', 3, '军队文职', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (44, '事业单位招聘笔试技巧', 'course/13.png', '事业单位招聘笔试技巧课程旨在帮助学员掌握事业单位招聘笔试的解题技巧。内容包括解题思路、时间分配等方面。通过实例分析和技巧讲解，学员将更好地应对事业单位招聘笔试。讲师团队由有丰富解题经验的专业人士组成，确保学员能够得到实用的解题技巧培训。', 4, '事业单位', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 130.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (45, '三支一扶招聘面试技巧', 'course/14.png', '三支一扶招聘面试技巧课程旨在帮助学员熟悉三支一扶招聘面试的特点和技巧。内容包括解题思路、考试注意事项等方面。通过实例分析和技巧讲解，学员将更好地备战三支一扶招聘面试。讲师团队由有丰富培训经验的专业人士组成，确保学员能够得到实用的面试技巧培训。', 5, '三支一扶', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 100.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (46, '公务员面试技能培训', 'course/15.png', '公务员面试技能培训课程旨在通过实际技能培训，提高学员在面试中的应对能力。内容包括模拟面试、答题技巧等方面。通过专业的培训，学员将更好地应对公务员面试。讲师团队由有丰富面试经验的专业人士组成，确保学员能够得到实用的面试技能培训。', 2, '公考面试', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 150.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (47, '军队文职招聘笔试技巧', 'course/16.png', '军队文职招聘笔试技巧课程旨在帮助学员掌握军队文职招聘笔试的解题技巧。内容包括解题思路、时间分配等方面。通过实例分析和技巧讲解，学员将更好地应对军队文职招聘笔试。讲师团队由有丰富解题经验的专业人士组成，确保学员能够得到实用的解题技巧培训。', 3, '军队文职', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 100.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (48, '三支一扶申论写作指导', 'course/17.png', '三支一扶申论写作指导课程旨在帮助学员提高申论写作水平。内容包括写作结构、论点论据等方面。通过实例分析和写作技巧讲解，学员将更好地应对三支一扶申论考试。讲师团队由有丰富写作经验的专业人士组成，确保学员能够得到实用的写作指导。', 5, '三支一扶', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 180.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (49, '事业单位面试案例解析', 'course/18.png', '事业单位面试案例解析课程旨在通过实际案例，帮助学员更好地理解面试的评分标准。内容包括案例分析、评分要点等方面。通过深入解析，学员将更好地应对事业单位面试。讲师团队由有丰富面试经验的专业人士组成，确保学员能够深入理解面试评分。', 4, '事业单位', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 150.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (50, '公安招警笔试技巧训练', 'course/19.png', '公安招警笔试技巧训练课程旨在帮助学员掌握公安招警笔试的解题技巧。内容包括题型解析、应试技巧等方面。通过大量题目训练和技巧指导，学员将更好地应对公安招警笔试。讲师团队由有丰富解题经验的专业人士组成，确保学员能够得到实用的解题技巧培训。', 6, '公安招警', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (51, '公考笔试备考全程指导', 'course/20.png', '公考笔试备考全程指导课程为学员提供全面的备考支持。内容包括考试大纲解读、重点知识点讲解、模拟考试等方面。通过系统性的指导，学员将更好地应对公考笔试。讲师团队由有丰富授课经验的专业人士组成，确保学员能够得到全程的备考指导。', 1, '公考笔试', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 200.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (52, '公务员申论高分策略', 'course/21.png', '公务员申论高分策略课程旨在帮助学员制定科学的申论策略，争取更高的分数。内容包括命题趋势分析、高分答题思路等方面。通过实例分析和策略讲解，学员将更好地应对公务员申论考试。讲师团队由有丰富授课经验的专业人士组成，确保学员能够制定有效的策略。', 1, '公考笔试', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 180.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (53, '军队文职招聘面试技巧', 'course/22.png', '军队文职招聘面试技巧课程旨在帮助学员熟悉军队文职招聘面试的特点和技巧。内容包括解题思路、考试注意事项等方面。通过实例分析和技巧讲解，学员将更好地备战军队文职招聘面试。讲师团队由有丰富培训经验的专业人士组成，确保学员能够得到实用的面试技巧培训。', 3, '军队文职', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 180.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (54, '事业单位笔试全程指导', 'course/23.png', '事业单位笔试全程指导课程为学员提供系统性的笔试备考辅导。内容包括科目重点、解题技巧等方面。通过有针对性的指导，学员将更好地应对事业单位笔试。讲师团队由有丰富授课经验的专业人士组成，确保学员能够得到全程的备考辅导。', 4, '事业单位', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 160.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (55, '公安招警面试案例解析', 'course/24.png', '公安招警面试案例解析课程旨在通过实际案例，帮助学员更好地理解公安招警面试的评分标准。内容包括案例分析、评分要点等方面。通过深入解析，学员将更好地应对公安招警面试。讲师团队由有丰富面试经验的专业人士组成，确保学员能够深入理解面试评分。', 6, '公安招警', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 130.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (56, '三支一扶面试技巧培训', 'course/25.png', '三支一扶面试技巧培训课程旨在帮助学员提高面试表现水平。内容包括形式多样的面试题目训练、回答技巧等方面。通过实际案例分析和技巧讲解，学员将更好地应对三支一扶面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够获得实用的面试技巧。', 5, '三支一扶', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (57, '公务员面试模拟训练', 'course/26.png', '公务员面试模拟训练课程旨在通过模拟面试，帮助学员熟悉面试流程和提高应变能力。内容包括模拟题目、实战训练等方面。通过反复练习，学员将更好地适应公务员面试环境。讲师团队由有丰富面试经验的专业人士组成，确保学员能够获得真实的模拟训练。', 2, '公考面试', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 150.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (58, '军队文职招聘笔试辅导', 'course/27.png', '军队文职招聘笔试辅导课程旨在帮助学员掌握军队文职笔试的重点知识和解题技巧。内容包括科目要点、常见题型等方面。通过系统性的辅导，学员将更好地备战军队文职招聘笔试。讲师团队由有丰富授课经验的专业人士组成，确保学员能够得到有效的辅导。', 3, '军队文职', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 180.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (59, '事业单位申论高分策略', 'course/28.png', '事业单位申论高分策略课程旨在帮助学员制定科学的申论策略，争取更高的分数。内容包括命题趋势分析、高分答题思路等方面。通过实例分析和策略讲解，学员将更好地应对事业单位申论考试。讲师团队由有丰富授课经验的专业人士组成，确保学员能够制定有效的策略。', 4, '事业单位', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 200.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (60, '公考面试心理辅导', 'course/29.png', '公考面试心理辅导课程旨在帮助学员应对面试的紧张情绪，提高面试表现水平。内容包括心理调适、应对压力等方面。通过实际案例分析和心理辅导，学员将更好地调整心态，取得更好的面试成绩。讲师团队由有丰富心理辅导经验的专业人士组成，确保学员能够获得专业的心理辅导。', 2, '公考面试', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 250.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (61, '公安招警笔试基础课', 'course/30.png', '公安招警笔试基础课程旨在帮助学员建立扎实的笔试基础，提高解题能力。内容包括常见题型解析、考试技巧等方面。通过系统性的学习，学员将更好地备战公安招警笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够掌握笔试要点。', 6, '公安招警', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 80.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (62, '三支一扶招聘面试技巧', 'course/31.png', '三支一扶招聘面试技巧课程旨在帮助学员提高招聘面试表现水平。内容包括面试技巧、形式多样的题目训练等方面。通过实际案例分析和技巧讲解，学员将更好地应对三支一扶招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够获得实用的面试技巧。', 5, '三支一扶', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (63, '公务员申论高分攻略', 'course/1.png', '公务员申论高分攻略课程旨在帮助学员提高申论水平，争取更高的分数。内容包括写作技巧、素材积累等方面。通过实例分析和攻略讲解，学员将更好地备战公务员申论考试。讲师团队由有丰富授课经验的专业人士组成，确保学员能够得到有效的指导。', 1, '公考笔试', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 90.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (64, '事业单位面试心得分享', 'course/2.png', '事业单位面试心得分享课程旨在帮助学员了解事业单位面试经验，提高面试应对能力。内容包括面试经验分享、注意事项等方面。通过实际案例分析和心得分享，学员将更好地准备事业单位面试。讲师团队由有丰富面试经验的专业人士组成，确保学员能够获得实用的面试经验。', 4, '事业单位', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 100.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (65, '公考面试案例分析', 'course/3.png', '公考面试案例分析课程旨在通过实际案例分析，帮助学员理解面试评分标准和优劣表现。内容包括案例分析、答题技巧等方面。通过深入剖析案例，学员将更好地应对公考面试。讲师团队由有丰富面试经验的专业人士组成，确保学员能够获得实际的案例分析经验。', 2, '公考面试', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 130.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (66, '军队文职招聘面试技巧', 'course/4.png', '军队文职招聘面试技巧课程旨在帮助学员提高面试表现水平。内容包括形式多样的面试题目训练、回答技巧等方面。通过实际案例分析和技巧讲解，学员将更好地应对军队文职招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够获得实用的面试技巧。', 3, '军队文职', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 110.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (67, '事业单位招聘笔试技巧', 'course/5.png', '事业单位招聘笔试技巧课程旨在帮助学员提高笔试表现水平。内容包括常见题型解析、解题技巧等方面。通过实际案例分析和技巧讲解，学员将更好地备战事业单位招聘笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够掌握笔试要点。', 4, '事业单位', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 95.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (68, '三支一扶招聘面试心得', 'course/6.png', '三支一扶招聘面试心得课程旨在帮助学员了解招聘面试经验，提高面试应对能力。内容包括面试经验分享、注意事项等方面。通过实际案例分析和心得分享，学员将更好地准备三支一扶招聘面试。讲师团队由有丰富面试经验的专业人士组成，确保学员能够获得实用的面试经验。', 5, '三支一扶', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 85.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (69, '公务员申论范文赏析', 'course/7.png', '公务员申论范文赏析课程旨在通过范文赏析，帮助学员了解申论高分写作技巧。内容包括范文解析、写作技巧等方面。通过实例分析和赏析，学员将更好地应对公务员申论考试。讲师团队由有丰富授课经验的专业人士组成，确保学员能够得到有效的指导。', 1, '公考笔试', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (70, '公安招警体能训练', 'course/8.png', '公安招警体能训练课程旨在帮助学员提高体能水平，备战公安招警考试。内容包括体能训练计划、注意事项等方面。通过系统性的训练，学员将更好地完成招警体能测试。讲师团队由有丰富体能训练经验的专业人士组成，确保学员能够获得专业的体能指导。', 6, '公安招警', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 70.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (71, '公务员面试模拟训练', 'course/9.png', '公务员面试模拟训练课程旨在通过模拟面试，帮助学员熟悉面试流程，提高面试应对能力。内容包括模拟面试题目、答题技巧等方面。通过反复训练，学员将更好地应对公务员面试。讲师团队由有丰富面试经验的专业人士组成，确保学员能够获得实际的模拟面试经验。', 2, '公考面试', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 100.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (72, '公安招警笔试模拟试题', 'course/10.png', '公安招警笔试模拟试题课程旨在通过模拟试题，帮助学员熟悉笔试题型，提高解题速度。内容包括模拟试题、解题技巧等方面。通过大量实战演练，学员将更好地备战公安招警笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够掌握笔试要点。', 1, '公考笔试', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 80.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (73, '三支一扶招聘笔试技巧', 'course/11.png', '三支一扶招聘笔试技巧课程旨在帮助学员提高笔试表现水平。内容包括常见题型解析、解题技巧等方面。通过实际案例分析和技巧讲解，学员将更好地备战三支一扶招聘笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够掌握笔试要点。', 5, '三支一扶', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 90.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (74, '军队文职申论范文解析', 'course/12.png', '军队文职申论范文解析课程旨在通过范文解析，帮助学员了解申论高分写作技巧。内容包括范文解析、写作技巧等方面。通过实例分析和赏析，学员将更好地应对军队文职申论考试。讲师团队由有丰富授课经验的专业人士组成，确保学员能够得到有效的指导。', 3, '军队文职', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 110.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (75, '事业单位面试技巧分享', 'course/13.png', '事业单位面试技巧分享课程旨在通过技巧分享，帮助学员提高面试应对能力。内容包括面试技巧、注意事项等方面。通过实际案例分享和技巧讲解，学员将更好地应对事业单位面试。讲师团队由有丰富面试经验的专业人士组成，确保学员能够获得实际的面试经验。', 4, '事业单位', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (76, '公考笔试数学基础课', 'course/14.png', '公考笔试数学基础课程旨在帮助学员掌握数学基础知识，备战公考笔试。内容包括数学基础概念、解题技巧等方面。通过系统性的教学，学员将更好地应对数学题型。讲师团队由有丰富教学经验的专业人士组成，确保学员能够轻松掌握数学基础。', 1, '公考笔试', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 90.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (77, '公考面试心理辅导', 'course/15.png', '公考面试心理辅导课程旨在通过心理辅导，帮助学员调整心态，提高面试表现水平。内容包括心理调适、应对紧张等方面。通过专业心理辅导，学员将更好地应对公考面试。讲师团队由有心理学背景的专业人士组成，确保学员能够获得有效的心理辅导。', 2, '公考面试', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 80.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (78, '军队文职招聘笔试模拟题库', 'course/16.png', '军队文职招聘笔试模拟题库课程旨在通过大量模拟题，帮助学员熟悉笔试题型，提高解题速度。内容包括模拟试题、解题技巧等方面。通过实战演练，学员将更好地备战军队文职招聘笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够熟练掌握笔试技巧。', 3, '军队文职', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 95.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (79, '事业单位招聘面试案例解析', 'course/17.png', '事业单位招聘面试案例解析课程旨在通过实际案例分析，帮助学员了解面试评分标准和优劣表现。内容包括案例分析、答题技巧等方面。通过深入剖析案例，学员将更好地应对事业单位招聘面试。讲师团队由有丰富面试经验的专业人士组成，确保学员能够获得实际的案例分析经验。', 4, '事业单位', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 100.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (80, '三支一扶招聘面试技巧培训', 'course/18.png', '三支一扶招聘面试技巧培训课程旨在通过培训，帮助学员提高面试应对水平。内容包括面试技巧、模拟面试等方面。通过系统性培训，学员将更好地备战三支一扶招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够得到有效的面试培训。', 5, '三支一扶', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 110.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (81, '公安招警面试技巧培训', 'course/19.png', '公安招警面试技巧培训课程旨在通过培训，帮助学员提高面试应对水平。内容包括面试技巧、模拟面试等方面。通过系统性培训，学员将更好地备战公安招警面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够得到有效的面试培训。', 6, '公安招警', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (82, '公务员申论写作技巧', 'course/20.png', '公务员申论写作技巧课程旨在通过教学，帮助学员掌握申论写作的技巧和方法。内容包括写作结构、论述技巧等方面。通过实例分析和实践演练，学员将更好地应对公务员申论考试。讲师团队由有丰富授课经验的专业人士组成，确保学员能够灵活运用写作技巧。', 1, '公考笔试', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 100.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (83, '事业单位招聘笔试数学解题', 'course/21.png', '事业单位招聘笔试数学解题课程旨在通过教学，帮助学员提高数学解题水平。内容包括数学解题方法、应对难题等方面。通过实例分析和实践演练，学员将更好地备战事业单位招聘笔试数学科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够灵活应对数学难题。', 4, '事业单位', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 110.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (84, '军队文职招聘面试心理辅导', 'course/22.png', '军队文职招聘面试心理辅导课程旨在通过心理辅导，帮助学员调整心态，提高面试表现水平。内容包括心理调适、应对压力等方面。通过专业心理辅导，学员将更好地备战军队文职招聘面试。讲师团队由有心理学背景的专业人士组成，确保学员能够获得有效的心理辅导。', 3, '军队文职', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 95.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (85, '三支一扶招聘面试模拟场景', 'course/23.png', '三支一扶招聘面试模拟场景课程旨在通过实景模拟，帮助学员熟悉面试场景，提高应对能力。内容包括模拟场景演练、答题技巧等方面。通过实际演练，学员将更好地备战三支一扶招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够应对各类面试场景。', 5, '三支一扶', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 105.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (86, '公考面试模拟场景演练', 'course/24.png', '公考面试模拟场景演练课程旨在通过实景模拟，帮助学员熟悉面试场景，提高应对能力。内容包括模拟场景演练、答题技巧等方面。通过实际演练，学员将更好地备战公考面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够应对各类面试场景。', 2, '公考面试', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 95.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (87, '事业单位招聘面试心理辅导', 'course/25.png', '事业单位招聘面试心理辅导课程旨在通过心理辅导，帮助学员调整心态，提高面试表现水平。内容包括心理调适、应对压力等方面。通过专业心理辅导，学员将更好地备战事业单位招聘面试。讲师团队由有心理学背景的专业人士组成，确保学员能够获得有效的心理辅导。', 4, '事业单位', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 110.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (88, '军队文职招聘笔试英语', 'course/26.png', '军队文职招聘笔试英语课程旨在通过教学，帮助学员提高英语应试水平。内容包括英语基础知识、解题技巧等方面。通过实例分析和实践演练，学员将更好地备战军队文职招聘笔试英语科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够灵活应对英语题型。', 3, '军队文职', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (89, '公考笔试逻辑思维训练', 'course/27.png', '公考笔试逻辑思维训练课程旨在通过训练，帮助学员提高逻辑思维和解题速度。内容包括逻辑思维训练、常见题型解析等方面。通过大量练习，学员将更好地应对公考笔试中的逻辑思维题目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够灵活应对各类逻辑题。', 1, '公考笔试', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 100.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (90, '三支一扶申论写作技巧', 'course/28.png', '三支一扶申论写作技巧课程旨在通过教学，帮助学员掌握申论写作的技巧和方法。内容包括写作结构、论述技巧等方面。通过实例分析和实践演练，学员将更好地应对三支一扶申论考试。讲师团队由有丰富授课经验的专业人士组成，确保学员能够灵活运用写作技巧。', 5, '三支一扶', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 105.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (91, '公务员行测考点精讲', 'course/29.png', '公务员行测考点精讲课程旨在通过教学，帮助学员深入理解行测考点，提高解题能力。内容包括各类行测题型的精讲和解题技巧等方面。通过详细解析和实际演练，学员将更好地备战公务员行测考试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够灵活应对各类行测题。', 1, '公考笔试', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 90.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (92, '三支一扶招聘笔试常识综合', 'course/30.png', '三支一扶招聘笔试常识综合课程旨在通过教学，帮助学员掌握常识综合解题方法。内容包括常识综合题型解析、实例讲解等方面。通过详细解析和实际演练，学员将更好地备战三支一扶招聘笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够灵活应对各类常识综合题目。', 5, '三支一扶', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 85.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (93, '军队文职招聘面试形势与政策', 'course/31.png', '军队文职招聘面试形势与政策课程旨在通过教学，帮助学员了解面试中的形势与政策相关知识。内容包括时事政治、军队相关政策等方面。通过专业讲解和实例分析，学员将更好地备战军队文职招聘面试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够了解最新的政策信息。', 3, '军队文职', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 95.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (94, '事业单位招聘面试实战演练', 'course/1.png', '事业单位招聘面试实战演练课程旨在通过实景模拟，帮助学员熟悉面试场景，提高应对能力。内容包括实战模拟面试、答题技巧等方面。通过实际演练，学员将更好地备战事业单位招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够应对各类面试场景。', 4, '事业单位', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 100.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (95, '公安招警笔试科目解析', 'course/2.png', '公安招警笔试科目解析课程旨在通过教学，帮助学员深入理解公安招警笔试科目内容。内容包括各科目题型解析和解题技巧等方面。通过详细解析和实际演练，学员将更好地备战公安招警笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够灵活应对各科目的考试。', 6, '公安招警', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 105.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (96, '公考面试技巧培训', 'course/3.png', '公考面试技巧培训课程旨在通过教学，帮助学员掌握面试技巧，提高面试表现水平。内容包括形象仪表、语言表达等方面。通过详细讲解和实际演练，学员将更好地备战公考面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在面试中展现自己的优势。', 2, '公考面试', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 88.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (97, '事业单位笔试数学基础', 'course/4.png', '事业单位笔试数学基础课程旨在通过教学，帮助学员夯实数学基础，提高笔试成绩。内容包括数学基础知识、解题技巧等方面。通过详细讲解和实例演练，学员将更好地备战事业单位笔试数学科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够灵活应对各类数学题。', 4, '事业单位', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 92.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (98, '军队文职招聘面试形势政策', 'course/5.png', '军队文职招聘面试形势政策课程旨在通过教学，帮助学员了解面试中的形势与政策相关知识。内容包括时事政治、军队相关政策等方面。通过专业讲解和实例分析，学员将更好地备战军队文职招聘面试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够了解最新的政策信息。', 3, '军队文职', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 94.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (99, '公考笔试言语理解训练', 'course/6.png', '公考笔试言语理解训练课程旨在通过训练，帮助学员提高言语理解和应试水平。内容包括言语理解技巧、实例分析等方面。通过大量练习，学员将更好地应对公考笔试中的言语理解题目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够灵活应对各类言语理解题。', 1, '公考笔试', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 98.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (100, '三支一扶招聘面试技巧', 'course/7.png', '三支一扶招聘面试技巧课程旨在通过教学，帮助学员掌握招聘面试的技巧和方法。内容包括面试准备、回答问题等方面。通过实例分析和实际演练，学员将更好地应对三支一扶招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在面试中展现自己的优势。', 5, '三支一扶', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 102.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (101, '公考面试心理测试技巧', 'course/8.png', '公考面试心理测试技巧课程旨在通过教学，帮助学员了解面试心理测试的题型和解题方法。内容包括心理测试常见题型、解题技巧等方面。通过详细解析和实际演练，学员将更好地应对公考面试中的心理测试环节。讲师团队由有丰富心理测试经验的专业人士组成，确保学员能够理解并合理应对各种心理测试题。', 2, '公考面试', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 110.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (102, '事业单位招聘笔试言语理解', 'course/9.png', '事业单位招聘笔试言语理解课程旨在通过教学，帮助学员提高言语理解水平。内容包括言语理解题型解析、实例分析等方面。通过详细解析和实际演练，学员将更好地备战事业单位招聘笔试中的言语理解题目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够灵活应对各类言语理解题。', 4, '事业单位', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (103, '军队文职招聘笔试综合素质面试', 'course/10.png', '军队文职招聘笔试综合素质面试课程旨在通过教学，帮助学员了解综合素质面试的考察要点。内容包括综合素质面试题型、答题技巧等方面。通过专业讲解和实例分析，学员将更好地备战军队文职招聘笔试综合素质面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在综合素质面试中展现个人优势。', 3, '军队文职', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 115.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (104, '公安招警面试实战演练', 'course/11.png', '公安招警面试实战演练课程旨在通过实际演练，帮助学员熟悉面试场景，提高应对能力。内容包括实战模拟面试、答题技巧等方面。通过实际演练，学员将更好地备战公安招警面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够应对各类面试场景。', 6, '公安招警', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 98.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (105, '三支一扶招聘笔试综合素质面试', 'course/12.png', '三支一扶招聘笔试综合素质面试课程旨在通过教学，帮助学员了解综合素质面试的考察要点。内容包括综合素质面试题型、答题技巧等方面。通过专业讲解和实例分析，学员将更好地备战三支一扶招聘笔试综合素质面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在综合素质面试中展现个人优势。', 5, '三支一扶', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 115.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (106, '公考笔试行测技巧培训', 'course/13.png', '公考笔试行测技巧培训课程旨在通过教学，帮助学员掌握行测技巧，提高笔试成绩。内容包括行测题型解析、解题技巧等方面。通过详细讲解和实际演练，学员将更好地备战公考笔试行测科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够灵活应对各类行测题。', 1, '公考笔试', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 105.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (107, '军队文职招聘面试模拟演练', 'course/14.png', '军队文职招聘面试模拟演练课程旨在通过实际演练，帮助学员熟悉面试场景，提高应对能力。内容包括模拟面试、答题技巧等方面。通过实际演练，学员将更好地备战军队文职招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够应对各类面试场景。', 3, '军队文职', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 99.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (108, '公安招警笔试刑法知识点详解', 'course/15.png', '公安招警笔试刑法知识点详解课程旨在通过教学，帮助学员深入理解刑法知识点。内容包括刑法常见知识点解析、案例分析等方面。通过详细解析和实际演练，学员将更好地备战公安招警笔试刑法科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够灵活应对各类刑法题。', 6, '公安招警', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 118.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (109, '三支一扶招聘面试模拟演练', 'course/16.png', '三支一扶招聘面试模拟演练课程旨在通过实际演练，帮助学员熟悉面试场景，提高应对能力。内容包括模拟面试、答题技巧等方面。通过实际演练，学员将更好地备战三支一扶招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够应对各类面试场景。', 5, '三支一扶', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 106.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (110, '公考面试言语表达技巧', 'course/17.png', '公考面试言语表达技巧课程旨在通过教学，帮助学员提高面试中的言语表达水平。内容包括言语表达技巧、实例分析等方面。通过详细解析和实际演练，学员将更好地应对公考面试中的言语表达环节。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够流利自如地进行言语表达。', 2, '公考面试', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 92.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (111, '军队文职招聘面试心理测试', 'course/18.png', '军队文职招聘面试心理测试课程旨在通过教学，帮助学员了解面试心理测试的题型和解题方法。内容包括心理测试常见题型、解题技巧等方面。通过详细解析和实际演练，学员将更好地备战军队文职招聘面试。讲师团队由有丰富心理测试经验的专业人士组成，确保学员能够理解并合理应对各种心理测试题。', 3, '军队文职', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 125.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (112, '事业单位招聘面试模拟演练', 'course/19.png', '事业单位招聘面试模拟演练课程旨在通过实际演练，帮助学员熟悉面试场景，提高应对能力。内容包括模拟面试、答题技巧等方面。通过实际演练，学员将更好地备战事业单位招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够应对各类面试场景。', 4, '事业单位', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 118.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (113, '三支一扶招聘笔试行测技巧', 'course/20.png', '三支一扶招聘笔试行测技巧课程旨在通过教学，帮助学员掌握行测技巧，提高笔试成绩。内容包括行测题型解析、解题技巧等方面。通过详细讲解和实际演练，学员将更好地备战三支一扶招聘笔试行测科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够灵活应对各类行测题。', 5, '三支一扶', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 112.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (114, '公考面试形势政策解读', 'course/21.png', '公考面试形势政策解读课程旨在通过教学，帮助学员了解面试中的形势政策题型和解题方法。内容包括形势政策知识点解析、实例分析等方面。通过详细解析和实际演练，学员将更好地应对公考面试中的形势政策环节。讲师团队由有丰富教学经验的专业人士组成，确保学员能够理解并合理应对各种形势政策题。', 2, '公考面试', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 105.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (115, '公安招警笔试综合知识点讲解', 'course/22.png', '公安招警笔试综合知识点讲解课程旨在通过教学，帮助学员深入了解笔试中的综合知识点。内容包括综合知识点解析、案例分析等方面。通过详细解析和实际演练，学员将更好地备战公安招警笔试综合科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够灵活应对各类综合知识点。', 6, '公安招警', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 120.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (116, '事业单位招聘笔试行测题库解析', 'course/23.png', '事业单位招聘笔试行测题库解析课程旨在通过教学，帮助学员熟悉事业单位招聘笔试行测题库。内容包括行测题型解析、解题技巧等方面。通过详细解析和实际演练，学员将更好地备战事业单位招聘笔试行测科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够灵活应对各类行测题。', 4, '事业单位', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 113.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (117, '三支一扶招聘面试心理测试', 'course/24.png', '三支一扶招聘面试心理测试课程旨在通过教学，帮助学员了解面试心理测试的题型和解题方法。内容包括心理测试常见题型、解题技巧等方面。通过详细解析和实际演练，学员将更好地备战三支一扶招聘面试。讲师团队由有丰富心理测试经验的专业人士组成，确保学员能够理解并合理应对各种心理测试题。', 5, '三支一扶', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 118.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (118, '公考笔试行测模拟考试', 'course/25.png', '公考笔试行测模拟考试课程旨在通过实际模拟考试，帮助学员熟悉公考笔试行测题型和提高解题速度。内容包括行测题型模拟考试、答题技巧等方面。通过实际演练，学员将更好地备战公考笔试行测科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够在考试中取得理想成绩。', 1, '公考笔试', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 95.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (119, '公安招警笔试常识科目精讲', 'course/26.png', '公安招警笔试常识科目精讲课程旨在通过教学，帮助学员深入了解笔试中的常识科目。内容包括常识科目知识点解析、实例分析等方面。通过详细解析和实际演练，学员将更好地备战公安招警笔试常识科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够灵活应对各类常识科目题。', 6, '公安招警', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 99.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (120, '军队文职招聘面试技巧', 'course/27.png', '军队文职招聘面试技巧课程旨在通过教学，帮助学员提高面试技巧。内容包括面试技巧要点、实例分析等方面。通过详细解析和实际演练，学员将更好地备战军队文职招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在面试中表现出色。', 3, '军队文职', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 102.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (121, '公考笔试言语理解与表达', 'course/28.png', '公考笔试言语理解与表达课程旨在通过教学，帮助学员提高言语理解与表达能力。内容包括言语理解与表达题型解析、实例分析等方面。通过详细解析和实际演练，学员将更好地备战公考笔试言语理解与表达科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够在考试中取得理想成绩。', 1, '公考笔试', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 110.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (122, '公安招警面试形势政策解读', 'course/29.png', '公安招警面试形势政策解读课程旨在通过教学，帮助学员了解面试中的形势政策题型和解题方法。内容包括形势政策知识点解析、实例分析等方面。通过详细解析和实际演练，学员将更好地应对公安招警面试中的形势政策环节。讲师团队由有丰富教学经验的专业人士组成，确保学员能够理解并合理应对各种形势政策题。', 6, '公安招警', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 99.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (123, '三支一扶招聘笔试言语理解与表达', 'course/30.png', '三支一扶招聘笔试言语理解与表达课程旨在通过教学，帮助学员提高言语理解与表达能力。内容包括言语理解与表达题型解析、实例分析等方面。通过详细解析和实际演练，学员将更好地备战三支一扶招聘笔试言语理解与表达科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够在考试中取得理想成绩。', 5, '三支一扶', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (124, '事业单位招聘面试形势政策解读', 'course/31.png', '事业单位招聘面试形势政策解读课程旨在通过教学，帮助学员了解面试中的形势政策题型和解题方法。内容包括形势政策知识点解析、实例分析等方面。通过详细解析和实际演练，学员将更好地应对事业单位招聘面试中的形势政策环节。讲师团队由有丰富教学经验的专业人士组成，确保学员能够理解并合理应对各种形势政策题。', 4, '事业单位', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 105.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (125, '公考面试心理测试技巧', 'course/1.png', '公考面试心理测试技巧课程旨在通过教学，帮助学员了解面试心理测试的题型和解题方法。内容包括心理测试常见题型、解题技巧等方面。通过详细解析和实际演练，学员将更好地应对公考面试中的心理测试环节。讲师团队由有丰富心理测试经验的专业人士组成，确保学员能够理解并合理应对各种心理测试题。', 2, '公考面试', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 115.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (126, '军队文职招聘面试形势政策解读', 'course/2.png', '军队文职招聘面试形势政策解读课程旨在通过教学，帮助学员了解面试中的形势政策题型和解题方法。内容包括形势政策知识点解析、实例分析等方面。通过详细解析和实际演练，学员将更好地应对军队文职招聘面试中的形势政策环节。讲师团队由有丰富教学经验的专业人士组成，确保学员能够理解并合理应对各种形势政策题。', 3, '军队文职', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 98.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (127, '公考笔试数学基础知识讲解', 'course/3.png', '公考笔试数学基础知识讲解课程旨在通过教学，帮助学员理解数学基础知识点。内容包括数学基础知识点解析、实例分析等方面。通过详细解析和实际演练，学员将更好地备战公考笔试数学科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够在考试中取得理想成绩。', 1, '公考笔试', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 105.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (128, '公安招警面试模拟演练', 'course/4.png', '公安招警面试模拟演练课程旨在通过实际演练，帮助学员熟悉面试场景，提高应对能力。内容包括模拟面试、答题技巧等方面。通过实际演练，学员将更好地备战公安招警面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够应对各类面试场景。', 6, '公安招警', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 124.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (129, '三支一扶招聘面试技巧', 'course/5.png', '三支一扶招聘面试技巧课程旨在通过教学，帮助学员提高面试技巧。内容包括面试技巧要点、实例分析等方面。通过详细解析和实际演练，学员将更好地备战三支一扶招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在面试中表现出色。', 5, '三支一扶', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 112.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (130, '军队文职笔试行测技巧', 'course/6.png', '军队文职笔试行测技巧课程旨在通过教学，帮助学员掌握行测技巧，提高笔试成绩。内容包括行测题型解析、解题技巧等方面。通过详细讲解和实际演练，学员将更好地备战军队文职笔试行测科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够灵活应对各类行测题。', 3, '军队文职', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 118.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (131, '公考面试心理测试实战演练', 'course/7.png', '公考面试心理测试实战演练课程旨在通过实际演练，帮助学员熟悉面试心理测试的实际操作。内容包括心理测试实战演练、答题技巧等方面。通过实际演练，学员将更好地备战公考面试心理测试。讲师团队由有丰富心理测试经验的专业人士组成，确保学员能够应对各类心理测试场景。', 2, '公考面试', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 125.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (132, '事业单位招聘面试技巧', 'course/8.png', '事业单位招聘面试技巧课程旨在通过教学，帮助学员提高面试技巧。内容包括面试技巧要点、实例分析等方面。通过详细解析和实际演练，学员将更好地备战事业单位招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在面试中表现出色。', 4, '事业单位', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 110.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (133, '三支一扶招聘笔试技巧', 'course/9.png', '三支一扶招聘笔试技巧课程旨在通过教学，帮助学员提高笔试技巧。内容包括笔试技巧要点、解题技巧等方面。通过详细解析和实际演练，学员将更好地备战三支一扶招聘笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够在笔试中取得理想成绩。', 5, '三支一扶', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 98.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (134, '公考笔试行测强化训练', 'course/10.png', '公考笔试行测强化训练课程旨在通过大量练习，帮助学员巩固行测知识点，提高解题速度。内容包括大量行测题库练习、答题技巧等方面。通过实际练习，学员将更好地备战公考笔试行测科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够在考试中取得理想成绩。', 1, '公考笔试', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 125.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (135, '公安招警面试技巧培训', 'course/11.png', '公安招警面试技巧培训课程旨在通过教学，帮助学员提高面试技巧。内容包括面试技巧要点、实例分析等方面。通过详细解析和实际演练，学员将更好地备战公安招警面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在面试中表现出色。', 6, '公安招警', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 108.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (136, '事业单位招聘面试实战演练', 'course/12.png', '事业单位招聘面试实战演练课程旨在通过实际演练，帮助学员熟悉面试场景，提高应对能力。内容包括模拟面试、答题技巧等方面。通过实际演练，学员将更好地备战事业单位招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够灵活应对各类面试场景。', 4, '事业单位', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 117.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (137, '三支一扶招聘面试技巧', 'course/13.png', '三支一扶招聘面试技巧课程旨在通过教学，帮助学员提高面试技巧。内容包括面试技巧要点、实例分析等方面。通过详细解析和实际演练，学员将更好地备战三支一扶招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在面试中表现出色。', 5, '三支一扶', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 95.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (138, '公考面试心理测试', 'course/14.png', '公考面试心理测试课程旨在通过教学，帮助学员了解面试心理测试的题型和解题方法。内容包括心理测试常见题型、解题技巧等方面。通过详细解析和实际演练，学员将更好地应对公考面试中的心理测试环节。讲师团队由有丰富心理测试经验的专业人士组成，确保学员能够理解并合理应对各种心理测试题。', 2, '公考面试', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 110.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (139, '军队文职招聘笔试常识科目', 'course/15.png', '军队文职招聘笔试常识科目课程旨在通过教学，帮助学员深入了解军队文职招聘笔试的常识科目。内容包括常识科目知识点解析、实例分析等方面。通过详细解析和实际演练，学员将更好地备战军队文职招聘笔试常识科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够灵活应对各类常识科目题。', 3, '军队文职', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 96.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (140, '三支一扶面试模拟演练', 'course/16.png', '三支一扶面试模拟演练课程旨在通过实际模拟面试，帮助学员熟悉面试场景，提高应对能力。内容包括模拟面试、答题技巧等方面。通过实际演练，学员将更好地备战三支一扶招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在真实面试中表现出色。', 5, '三支一扶', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 112.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (141, '公考面试实战演练', 'course/17.png', '公考面试实战演练课程旨在通过实际演练，帮助学员熟悉面试场景，提高应对能力。内容包括模拟面试、答题技巧等方面。通过实际演练，学员将更好地备战公考面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在真实面试中表现出色。', 2, '公考面试', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (142, '军队文职招聘面试模拟考核', 'course/18.png', '军队文职招聘面试模拟考核课程旨在通过实际模拟考核，帮助学员熟悉面试场景，提高应对能力。内容包括模拟面试、答题技巧等方面。通过实际演练，学员将更好地备战军队文职招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在真实面试中表现出色。', 3, '军队文职', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 105.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (143, '事业单位招聘笔试实战演练', 'course/19.png', '事业单位招聘笔试实战演练课程旨在通过实际演练，帮助学员熟悉笔试场景，提高应对能力。内容包括模拟笔试、答题技巧等方面。通过实际演练，学员将更好地备战事业单位招聘笔试。讲师团队由有丰富笔试培训经验的专业人士组成，确保学员能够在考试中取得理想成绩。', 4, '事业单位', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 99.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (144, '公安招警笔试考点解析', 'course/20.png', '公安招警笔试考点解析课程旨在通过教学，帮助学员深入了解公安招警笔试的考点。内容包括考点解析、重难点讲解等方面。通过详细解析和实际演练，学员将更好地备战公安招警笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够理解并熟练掌握各类考点。', 6, '公安招警', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 88.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (145, '公考笔试行测全程解析', 'course/21.png', '公考笔试行测全程解析课程旨在通过教学，帮助学员深入了解公考笔试行测科目。内容包括全程解析、解题技巧等方面。通过详细解析和实际演练，学员将更好地备战公考笔试行测科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够理解并熟练掌握各类行测题。', 1, '公考笔试', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 102.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (146, '事业单位面试实战演练', 'course/22.png', '事业单位面试实战演练课程旨在通过实际演练，帮助学员熟悉面试场景，提高应对能力。内容包括模拟面试、答题技巧等方面。通过实际演练，学员将更好地备战事业单位面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在真实面试中表现出色。', 4, '事业单位', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 95.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (147, '公考面试技巧培训', 'course/23.png', '公考面试技巧培训课程旨在通过教学，帮助学员提高面试技巧。内容包括面试技巧要点、实例分析等方面。通过详细解析和实际演练，学员将更好地备战公考面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在面试中表现出色。', 2, '公考面试', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 88.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (148, '三支一扶申论辅导', 'course/24.png', '三支一扶申论辅导课程旨在通过教学，帮助学员提高申论水平。内容包括申论写作技巧、范文解析等方面。通过详细解析和实际演练，学员将更好地备战三支一扶申论考试。讲师团队由有丰富申论培训经验的专业人士组成，确保学员能够写出高质量的申论作品。', 5, '三支一扶', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 105.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (149, '军队文职面试实战演练', 'course/25.png', '军队文职面试实战演练课程旨在通过实际演练，帮助学员熟悉面试场景，提高应对能力。内容包括模拟面试、答题技巧等方面。通过实际演练，学员将更好地备战军队文职面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在真实面试中表现出色。', 3, '军队文职', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 92.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (150, '公安招警心理测试辅导', 'course/26.png', '公安招警心理测试辅导课程旨在通过教学，帮助学员了解心理测试要点，提高应对能力。内容包括心理测试解析、应对策略等方面。通过详细解析和实际演练，学员将更好地备战公安招警心理测试。讲师团队由有丰富心理测试培训经验的专业人士组成，确保学员能够应对各类心理测试。', 6, '公安招警', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 78.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (151, '事业单位招聘面试心得分享', 'course/27.png', '事业单位招聘面试心得分享课程旨在通过学员分享，帮助其他学员更好地准备事业单位招聘面试。内容包括面试经验分享、注意事项等方面。通过学员的真实分享，其他学员将更好地了解面试环节，并能够更从容地应对。', 4, '事业单位', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 75.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (152, '公考面试模拟演练', 'course/28.png', '公考面试模拟演练课程旨在通过实际演练，帮助学员熟悉面试场景，提高应对能力。内容包括模拟面试、答题技巧等方面。通过实际演练，学员将更好地备战公考面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在真实面试中表现出色。', 2, '公考面试', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 89.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (153, '公安招警面试技巧培训', 'course/29.png', '公安招警面试技巧培训课程旨在通过教学，帮助学员提高面试技巧。内容包括面试技巧要点、实例分析等方面。通过详细解析和实际演练，学员将更好地备战公安招警面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在面试中表现出色。', 6, '公安招警', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 95.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (154, '三支一扶笔试全程解析', 'course/30.png', '三支一扶笔试全程解析课程旨在通过教学，帮助学员深入了解三支一扶笔试科目。内容包括全程解析、解题技巧等方面。通过详细解析和实际演练，学员将更好地备战三支一扶笔试科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够理解并熟练掌握各类笔试题。', 5, '三支一扶', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 88.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (155, '事业单位招聘笔试辅导', 'course/31.png', '事业单位招聘笔试辅导课程旨在通过教学，帮助学员备战事业单位招聘笔试科目。内容包括重难点解析、解题技巧等方面。通过详细解析和实际演练，学员将更好地备战事业单位招聘笔试科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够灵活应对各类笔试题。', 4, '事业单位', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 105.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (156, '公考笔试模拟试题解析', 'course/1.png', '公考笔试模拟试题解析课程旨在通过详细解析，帮助学员更好地理解和应对公考笔试题。内容包括模拟试题解析、答题技巧等方面。通过实际演练，学员将更好地备战公考笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够熟悉各类笔试题型。', 1, '公考笔试', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 78.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (157, '军队文职面试技巧培训', 'course/2.png', '军队文职面试技巧培训课程旨在通过教学，帮助学员提高军队文职面试技巧。内容包括面试技巧要点、实例分析等方面。通过详细解析和实际演练，学员将更好地备战军队文职面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在面试中表现出色。', 3, '军队文职', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 92.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (158, '公安招警笔试全程解析', 'course/3.png', '公安招警笔试全程解析课程旨在通过教学，帮助学员深入了解公安招警笔试科目。内容包括全程解析、解题技巧等方面。通过详细解析和实际演练，学员将更好地备战公安招警笔试科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够理解并熟练掌握各类笔试题。', 6, '公安招警', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 110.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (159, '公考面试心得分享', 'course/4.png', '公考面试心得分享课程旨在通过学员分享，帮助其他学员更好地准备公考面试。内容包括面试经验分享、注意事项等方面。通过学员的真实分享，其他学员将更好地了解面试环节，并能够更从容地应对。', 2, '公考面试', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 85.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (160, '三支一扶面试模拟演练', 'course/5.png', '三支一扶面试模拟演练课程旨在通过实际演练，帮助学员熟悉面试场景，提高应对能力。内容包括模拟面试、答题技巧等方面。通过实际演练，学员将更好地备战三支一扶面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在真实面试中表现出色。', 5, '三支一扶', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 92.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (161, '事业单位招聘面试技巧培训', 'course/6.png', '事业单位招聘面试技巧培训课程旨在通过教学，帮助学员提高面试技巧。内容包括面试技巧要点、实例分析等方面。通过详细解析和实际演练，学员将更好地备战事业单位招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在面试中表现出色。', 4, '事业单位', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 98.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (162, '公安招警笔试技巧分享', 'course/7.png', '公安招警笔试技巧分享课程旨在通过学员分享，帮助其他学员更好地应对公安招警笔试。内容包括笔试技巧分享、注意事项等方面。通过学员的真实分享，其他学员将更好地了解并应对各类公安招警笔试题型。', 6, '公安招警', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 87.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (163, '军队文职笔试全程解析', 'course/8.png', '军队文职笔试全程解析课程旨在通过教学，帮助学员深入了解军队文职笔试科目。内容包括全程解析、解题技巧等方面。通过详细解析和实际演练，学员将更好地备战军队文职笔试科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够理解并熟练掌握各类笔试题。', 3, '军队文职', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 96.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (164, '公考笔试解题技巧', 'course/9.png', '公考笔试解题技巧课程旨在通过教学，帮助学员提高笔试解题能力。内容包括解题技巧讲解、实例演练等方面。通过详细解析和实际演练，学员将更好地备战公考笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够熟悉各类笔试题型。', 1, '公考笔试', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 82.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (165, '公安招警面试实战演练', 'course/10.png', '公安招警面试实战演练课程旨在通过实际演练，帮助学员熟悉面试场景，提高应对能力。内容包括实战演练、答题技巧等方面。通过实际演练，学员将更好地备战公安招警面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在真实面试中表现出色。', 6, '公安招警', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 101.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (166, '三支一扶答题技巧培训', 'course/11.png', '三支一扶答题技巧培训课程旨在通过教学，帮助学员提高答题技巧。内容包括答题技巧讲解、实例演练等方面。通过详细解析和实际演练，学员将更好地备战三支一扶考试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够熟悉各类考试题型。', 5, '三支一扶', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 89.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (167, '公考笔试模拟考试', 'course/12.png', '公考笔试模拟考试课程旨在通过实际模拟，帮助学员熟悉考试环境，提高应考能力。内容包括模拟考试、成绩分析等方面。通过实际模拟，学员将更好地备战公考笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够在真实考试中表现出色。', 1, '公考笔试', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 95.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (168, '公安招警面试实战演练', 'course/13.png', '公安招警面试实战演练课程旨在通过实际演练，帮助学员熟悉面试场景，提高应对能力。内容包括实战演练、答题技巧等方面。通过实际演练，学员将更好地备战公安招警面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在真实面试中表现出色。', 6, '公安招警', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 102.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (169, '事业单位招聘笔试全程解析', 'course/14.png', '事业单位招聘笔试全程解析课程旨在通过教学，帮助学员深入了解事业单位招聘笔试科目。内容包括全程解析、解题技巧等方面。通过详细解析和实际演练，学员将更好地备战事业单位招聘笔试科目。讲师团队由有丰富教学经验的专业人士组成，确保学员能够理解并熟练掌握各类笔试题。', 4, '事业单位', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 93.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (170, '军队文职面试技巧培训', 'course/15.png', '军队文职面试技巧培训课程旨在通过教学，帮助学员提高面试技巧。内容包括面试技巧要点、实例分析等方面。通过详细解析和实际演练，学员将更好地备战军队文职面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在面试中表现出色。', 3, '军队文职', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 97.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (171, '公考面试心理准备', 'course/16.png', '公考面试心理准备课程旨在通过心理学知识，帮助学员调整心态，提高面试表现。内容包括心理准备要点、紧张情绪处理等方面。通过理论学习和实际操作，学员将更好地应对公考面试中的心理压力。讲师团队由心理学专业人士组成，确保学员能够在面试中保持冷静自信。', 2, '公考面试', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 78.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (172, '三支一扶招聘面试技巧', 'course/17.png', '三支一扶招聘面试技巧课程旨在通过教学，帮助学员提高面试技巧。内容包括面试技巧要点、实例分析等方面。通过详细解析和实际演练，学员将更好地备战三支一扶招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在面试中脱颖而出。', 5, '三支一扶', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 85.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (173, '公安招警体能训练指导', 'course/18.png', '公安招警体能训练指导课程旨在通过专业教学，帮助学员合理制定体能训练计划，提高体能水平。内容包括体能训练要点、实际操作等方面。通过详细指导和实际操作，学员将更好地备战公安招警体能测试。讲师团队由专业体能训练师组成，确保学员能够达到体能测试标准。', 6, '公安招警', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 78.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (174, '事业单位面试技巧分享', 'course/19.png', '事业单位面试技巧分享课程旨在通过教学，帮助学员熟悉事业单位面试场景，提高应对能力。内容包括面试技巧分享、实例分析等方面。通过详细解析和实际演练，学员将更好地备战事业单位面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在面试中表现出色。', 4, '事业单位', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 90.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (175, '军队文职招聘面试演练', 'course/20.png', '军队文职招聘面试演练课程旨在通过实际演练，帮助学员熟悉面试场景，提高应对能力。内容包括实战演练、答题技巧等方面。通过实际演练，学员将更好地备战军队文职招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在真实面试中表现出色。', 3, '军队文职', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 95.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (176, '公考笔试答题技巧讲解', 'course/21.png', '公考笔试答题技巧讲解课程旨在通过教学，帮助学员掌握公考笔试答题技巧。内容包括答题技巧讲解、实例演练等方面。通过详细解析和实际演练，学员将更好地备战公考笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够应对各类笔试题型。', 1, '公考笔试', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 88.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (177, '公考面试模拟考试', 'course/22.png', '公考面试模拟考试课程旨在通过实际模拟，帮助学员熟悉面试环境，提高应考能力。内容包括模拟考试、成绩分析等方面。通过实际模拟，学员将更好地备战公考面试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够在真实考试中表现出色。', 2, '公考面试', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 96.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (178, '公考笔试答题技巧讲解', 'course/23.png', '公考笔试答题技巧讲解课程旨在通过教学，帮助学员掌握公考笔试答题技巧。内容包括答题技巧讲解、实例演练等方面。通过详细解析和实际演练，学员将更好地备战公考笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够应对各类笔试题型。', 1, '公考笔试', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 88.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (179, '事业单位招聘笔试突破', 'course/24.png', '事业单位招聘笔试突破课程旨在通过教学，帮助学员突破笔试难关。内容包括答题技巧讲解、模拟考试等方面。通过详细解析和实际演练，学员将更好地备战事业单位招聘笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够应对各类笔试题型。', 4, '事业单位', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 92.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (180, '三支一扶招聘面试实战', 'course/25.png', '三支一扶招聘面试实战课程旨在通过实际演练，帮助学员熟悉面试场景，提高应对能力。内容包括实战演练、答题技巧等方面。通过实际演练，学员将更好地备战三支一扶招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在真实面试中表现出色。', 5, '三支一扶', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 105.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (181, '公考面试心理准备', 'course/26.png', '公考面试心理准备课程旨在通过心理学知识，帮助学员在面试中保持冷静、自信。内容包括心理准备、应对紧张等方面。通过理论学习和实际演练，学员将更好地备战公考面试。讲师团队由心理学专业人士组成，确保学员能够在面试中展现最佳状态。', 2, '公考面试', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 98.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (182, '事业单位招聘面试实战', 'course/27.png', '事业单位招聘面试实战课程旨在通过实际演练，帮助学员熟悉面试场景，提高应对能力。内容包括实战演练、答题技巧等方面。通过实际演练，学员将更好地备战事业单位招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在真实面试中表现出色。', 4, '事业单位', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 102.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (183, '公安招警模拟考试', 'course/28.png', '公安招警模拟考试课程旨在通过模拟考试，帮助学员熟悉考试形式，提高应对能力。内容包括模拟考试、答题技巧等方面。通过实际演练，学员将更好地备战公安招警考试。讲师团队由有丰富考试培训经验的专业人士组成，确保学员能够在真实考场中表现出色。', 6, '公安招警', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 79.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (184, '公考笔试冲刺班', 'course/29.png', '公考笔试冲刺班课程旨在通过密集教学，帮助学员在短时间内进行全面复习。内容包括重难点讲解、模拟考试等方面。通过集中学习，学员将更好地备战公考笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够应对各类笔试题型。', 1, '公考笔试', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (185, '三支一扶招聘笔试突破', 'course/30.png', '三支一扶招聘笔试突破课程旨在通过教学，帮助学员突破笔试难关。内容包括答题技巧讲解、模拟考试等方面。通过详细解析和实际演练，学员将更好地备战三支一扶招聘笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够应对各类笔试题型。', 5, '三支一扶', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 95.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (186, '公考面试模拟考场', 'course/31.png', '公考面试模拟考场课程旨在通过模拟考场，帮助学员熟悉面试环境，提高应对能力。内容包括模拟考试、答题技巧等方面。通过实际演练，学员将更好地备战公考面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在真实面试中表现出色。', 2, '公考面试', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 85.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (187, '事业单位招聘笔试全程解析', 'course/1.png', '事业单位招聘笔试全程解析课程旨在通过教学，帮助学员深入了解各个考点。内容包括全程解析、重难点讲解等方面。通过详细解析和实际演练，学员将更好地备战事业单位招聘笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够应对各类笔试题型。', 4, '事业单位', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 92.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (188, '军队文职面试攻略', 'course/2.png', '军队文职面试攻略课程旨在通过攻略分享，帮助学员了解军队文职面试的各个环节。内容包括面试技巧、常见问题解析等方面。通过详细解析，学员将更好地备战军队文职面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在面试中表现出色。', 3, '军队文职', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 92.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (189, '三支一扶面试技巧', 'course/3.png', '三支一扶面试技巧课程旨在通过技巧分享，帮助学员了解三支一扶面试的各个环节。内容包括面试技巧、常见问题解析等方面。通过详细解析，学员将更好地备战三支一扶面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在面试中表现出色。', 5, '三支一扶', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 88.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (190, '公安招警笔试全程解析', 'course/4.png', '公安招警笔试全程解析课程旨在通过教学，帮助学员全面解析笔试内容。内容包括重难点讲解、模拟考试等方面。通过详细解析和实际演练，学员将更好地备战公安招警笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够应对各类笔试题型。', 6, '公安招警', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 115.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (191, '事业单位招聘笔试模拟考场', 'course/5.png', '事业单位招聘笔试模拟考场课程旨在通过模拟考场，帮助学员熟悉考试环境，提高应对能力。内容包括模拟考试、答题技巧等方面。通过实际演练，学员将更好地备战事业单位招聘笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够应对各类笔试题型。', 4, '事业单位', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 98.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (192, '公考面试技巧分享', 'course/6.png', '公考面试技巧分享课程旨在通过技巧分享，帮助学员了解公考面试的各个环节。内容包括面试技巧、常见问题解析等方面。通过详细解析，学员将更好地备战公考面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在面试中表现出色。', 2, '公考面试', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 82.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (193, '军队文职笔试冲刺班', 'course/7.png', '军队文职笔试冲刺班课程旨在通过密集教学，帮助学员在短时间内进行全面复习。内容包括重难点讲解、模拟考试等方面。通过集中学习，学员将更好地备战军队文职笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够应对各类笔试题型。', 3, '军队文职', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 110.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (194, '三支一扶招聘面试模拟考场', 'course/8.png', '三支一扶招聘面试模拟考场课程旨在通过模拟考场，帮助学员熟悉面试环境，提高应对能力。内容包括模拟考试、答题技巧等方面。通过实际演练，学员将更好地备战三支一扶招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在真实面试中表现出色。', 5, '三支一扶', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 96.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (195, '三支一扶招聘面试突破', 'course/9.png', '三支一扶招聘面试突破课程旨在通过实际演练，帮助学员熟悉面试场景，提高应对能力。内容包括实战演练、答题技巧等方面。通过实际演练，学员将更好地备战三支一扶招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在真实面试中表现出色。', 5, '三支一扶', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 115.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (196, '公考笔试冲刺班', 'course/10.png', '公考笔试冲刺班课程旨在通过密集教学，帮助学员在短时间内进行全面复习。内容包括重难点讲解、模拟考试等方面。通过集中学习，学员将更好地备战公考笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够应对各类笔试题型。', 1, '公考笔试', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 120.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (197, '事业单位招聘面试实战', 'course/11.png', '事业单位招聘面试实战课程旨在通过实际演练，帮助学员熟悉面试场景，提高应对能力。内容包括实战演练、答题技巧等方面。通过实际演练，学员将更好地备战事业单位招聘面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在真实面试中表现出色。', 4, '事业单位', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 105.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (198, '公考面试心理准备', 'course/12.png', '公考面试心理准备课程旨在通过心理学知识，帮助学员在面试中保持冷静、自信。内容包括心理准备、应对紧张等方面。通过理论学习和实际演练，学员将更好地备战公考面试。讲师团队由心理学专业人士组成，确保学员能够在面试中展现最佳状态。', 2, '公考面试', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 98.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (199, '公安招警模拟考试', 'course/13.png', '公安招警模拟考试课程旨在通过模拟考试，帮助学员熟悉考试形式，提高应对能力。内容包括模拟考试、答题技巧等方面。通过实际演练，学员将更好地备战公安招警考试。讲师团队由有丰富考试培训经验的专业人士组成，确保学员能够在真实考场中表现出色。', 6, '公安招警', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 79.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (200, '事业单位招聘笔试突破', 'course/14.png', '事业单位招聘笔试突破课程旨在通过教学，帮助学员突破笔试难关。内容包括答题技巧讲解、模拟考试等方面。通过详细解析和实际演练，学员将更好地备战事业单位招聘笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够应对各类笔试题型。', 4, '事业单位', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 92.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (201, '公考笔试名师讲解', 'course/15.png', '公考笔试名师讲解课程旨在通过名师授课，帮助学员深入理解各个考点。内容包括名师讲解、重难点突破等方面。通过专业讲解，学员将更好地备战公考笔试。讲师团队由公考领域的资深名师组成，确保学员能够应对复杂题型。', 1, '公考笔试', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 150.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (202, '三支一扶招聘面试技巧', 'course/16.png', '三支一扶招聘面试技巧课程旨在通过技巧讲解，帮助学员掌握面试技巧。内容包括技巧讲解、实战演练等方面。通过系统学习和实际演练，学员将更好地备战三支一扶招聘面试。讲师团队由有丰富面试经验的专业人士组成，确保学员能够应对各类面试题目。', 5, '三支一扶', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 110.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (203, '军队文职考试技巧', 'course/17.png', '军队文职考试技巧课程旨在通过技巧讲解，帮助学员提高答题速度和准确性。内容包括技巧讲解、实战演练等方面。通过系统学习和实际演练，学员将更好地备战军队文职考试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够应对各类考试题目。', 3, '军队文职', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 95.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (204, '公安招警笔试突破班', 'course/18.png', '公安招警笔试突破班课程旨在通过系统学习，帮助学员突破笔试难关。内容包括重难点讲解、模拟考试等方面。通过详细解析和实际演练，学员将更好地备战公安招警笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够应对各类笔试题型。', 6, '公安招警', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 125.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (205, '事业单位招聘面试心得分享', 'course/19.png', '事业单位招聘面试心得分享课程旨在通过学员分享，帮助其他考生更好地准备面试。内容包括面试心得、经验分享等方面。通过真实经历的分享，学员将更好地理解面试过程。分享人员有丰富的面试经验，确保学员能够从中获益。', 4, '事业单位', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 80.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (206, '三支一扶招聘面试案例分析', 'course/20.png', '三支一扶招聘面试案例分析课程旨在通过案例分析，帮助学员更深入地理解面试过程。内容包括案例分析、答题技巧等方面。通过实际案例，学员将更好地备战三支一扶招聘面试。讲师团队由有丰富面试经验的专业人士组成，确保学员能够应对各类面试题目。', 5, '三支一扶', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 95.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (207, '公安招警面试技巧培训', 'course/21.png', '公安招警面试技巧培训课程旨在通过技巧培训，帮助学员掌握面试技巧。内容包括技巧讲解、模拟面试等方面。通过系统学习和实际演练，学员将更好地备战公安招警面试。讲师团队由有丰富面试经验的专业人士组成，确保学员能够应对各类面试题目。', 6, '公安招警', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (208, '军队文职模拟考试讲解', 'course/22.png', '军队文职模拟考试讲解课程旨在通过讲解，帮助学员熟悉考试形式。内容包括模拟考试、答题技巧等方面。通过详细解析和实际演练，学员将更好地备战军队文职考试。讲师团队由有丰富考试培训经验的专业人士组成，确保学员能够在真实考场中表现出色。', 3, '军队文职', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 110.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (209, '公考面试形势政策解读', 'course/23.png', '公考面试形势政策解读课程旨在通过对时事政策的深入解析，帮助学员在面试中更好地应对相关问题。内容包括政治热点、经济形势、社会问题等方面。通过理论学习和实际案例分析，学员将更好地备战公考面试。讲师团队由相关领域专业人士组成，确保学员对时事政策有清晰的认识。', 2, '公考面试', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 115.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (210, '公安招警心理测试', 'course/24.png', '公安招警心理测试课程旨在通过心理学知识，帮助学员了解心理测试的类型和应对策略。内容包括心理测试题型解析、实际演练等方面。通过系统的学习和模拟测试，学员将更好地备战公安招警心理测试。讲师团队由心理学专业人士组成，确保学员能够在测试中取得优异成绩。', 6, '公安招警', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 87.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (211, '事业单位招聘笔试技巧', 'course/25.png', '事业单位招聘笔试技巧课程旨在通过实际案例分析，帮助学员提高笔试答题技能。内容包括技巧讲解、模拟考试等方面。通过详细解析和实际演练，学员将更好地备战事业单位招聘笔试。讲师团队由有丰富教学经验的专业人士组成，确保学员能够应对各类笔试题型。', 4, '事业单位', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 95.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (212, '公考笔试数学精讲', 'course/26.png', '公考笔试数学精讲课程旨在通过深入讲解数学知识点，帮助学员提高数学解题能力。内容包括数学基础知识、解题技巧等方面。通过理论学习和实际案例分析，学员将更好地备战公考笔试数学部分。讲师团队由数学专业人士组成，确保学员能够在考场上取得优异成绩。', 1, '公考笔试', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 110.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (213, '公考面试实战演练', 'course/27.png', '公考面试实战演练课程旨在通过模拟面试，帮助学员熟悉面试环境，提高面试表现。内容包括模拟面试、答题技巧等方面。通过实际演练，学员将更好地备战公考面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员能够在真实面试中自信从容。', 2, '公考面试', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 105.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (214, '军队文职面试技巧', 'course/28.png', '军队文职面试技巧课程旨在通过实际案例分析，帮助学员提高面试表现。内容包括面试技巧、形象管理等方面。通过详细解析和实际演练，学员将更好地备战军队文职面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员在面试中脱颖而出。', 3, '军队文职', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 85.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (215, '三支一扶实战演练', 'course/29.png', '三支一扶实战演练课程旨在通过模拟考试，帮助学员熟悉考试形式，提高应对能力。内容包括模拟考试、答题技巧等方面。通过实际演练，学员将更好地备战三支一扶考试。讲师团队由有丰富考试培训经验的专业人士组成，确保学员在真实考场中表现出色。', 5, '三支一扶', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 99.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (216, '事业单位面试技能培训', 'course/30.png', '事业单位面试技能培训课程旨在通过实际演练，帮助学员提高面试表现。内容包括面试技能、沟通能力等方面。通过详细解析和实际演练，学员将更好地备战事业单位面试。讲师团队由有丰富面试培训经验的专业人士组成，确保学员在面试中脱颖而出。', 4, '事业单位', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 93.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (217, '公安招警体能训练', 'course/31.png', '公安招警体能训练课程旨在通过实际动作训练，帮助学员提高体能水平。内容包括体能训练计划、实际动作演示等方面。通过系统训练，学员将更好地备战公安招警体能测试。讲师团队由体育专业人士组成，确保学员在体能测试中取得优异成绩。', 6, '公安招警', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 80.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (218, '公考笔试语文精讲', 'course/1.png', '公考笔试语文精讲课程旨在通过深入讲解语文知识点，帮助学员提高语文解题能力。内容包括语文基础知识、解题技巧等方面。通过理论学习和实际案例分析，学员将更好地备战公考笔试语文部分。讲师团队由语文专业人士组成，确保学员能够在考场上取得优异成绩。', 1, '公考笔试', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 115.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (219, '公考面试形势政策解读', 'course/2.png', '公考面试形势政策解读课程旨在通过深入解析国家形势和政策，帮助学员更好地应对面试考察。内容包括形势政策解读、热点问题分析等方面。通过详细解析和实际演练，学员将更好地备战公考面试。讲师团队由政治学专业人士组成，确保学员在面试中展现深厚政策素养。', 2, '公考面试', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 98.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (220, '军队文职招聘宣讲', 'course/3.png', '军队文职招聘宣讲课程旨在通过详细介绍文职招聘信息，帮助学员更好地了解招聘流程和要求。内容包括文职招聘政策、岗位要求等方面。通过招聘宣讲和互动交流，学员将更好地备战军队文职招聘。讲师团队由有丰富招聘宣讲经验的专业人士组成，确保学员获取最新招聘信息。', 3, '军队文职', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 75.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (221, '事业单位招聘法律法规解读', 'course/4.png', '事业单位招聘法律法规解读课程旨在通过深入解析相关法规，帮助学员更好地应对招聘考试。内容包括法律法规解读、案例分析等方面。通过详细解析和实际演练，学员将更好地备战事业单位招聘。讲师团队由法学专业人士组成，确保学员在考试中合法合规取胜。', 4, '事业单位', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 89.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (222, '三支一扶考试技巧分享', 'course/5.png', '三支一扶考试技巧分享课程旨在通过分享考试经验，帮助学员提高答题效率。内容包括考试技巧、时间管理等方面。通过经验分享和互动交流，学员将更好地备战三支一扶考试。讲师团队由有丰富考试经验的专业人士组成，确保学员在考场上游刃有余。', 5, '三支一扶', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 105.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (223, '公安招警模拟面试', 'course/6.png', '公安招警模拟面试课程旨在通过模拟面试，帮助学员熟悉面试流程和提高应对能力。内容包括模拟面试、面试技巧等方面。通过实际模拟和专业点评，学员将更好地备战公安招警面试。讲师团队由有丰富面试经验的专业人士组成，确保学员在面试中从容应对。', 6, '公安招警', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 88.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (224, '公考笔试数学突破', 'course/7.png', '公考笔试数学突破课程旨在通过突破性讲解数学难点，帮助学员提高数学解题能力。内容包括数学难点攻略、解题技巧等方面。通过理论学习和实际案例分析，学员将更好地备战公考笔试数学部分。讲师团队由数学专业人士组成，确保学员能够在考场上取得优异成绩。', 1, '公考笔试', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (225, '公考面试心理辅导', 'course/8.png', '公考面试心理辅导课程旨在通过心理学角度，帮助学员调整心态和提高面试表现。内容包括心理辅导、心理准备等方面。通过案例分析和实际演练，学员将更好地备战公考面试。讲师团队由心理学专业人士组成，确保学员在面试中展现良好心理素质。', 2, '公考面试', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 105.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (226, '军队文职招聘答题技巧', 'course/9.png', '军队文职招聘答题技巧课程旨在通过独家技巧分享，帮助学员提高答题速度和准确率。内容包括答题技巧、实战演练等方面。通过技巧点拨和实际操作，学员将更好地备战军队文职招聘考试。讲师团队由有丰富经验的专业人士组成，确保学员在考场上游刃有余。', 3, '军队文职', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 95.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (227, '事业单位招聘实操指南', 'course/10.png', '事业单位招聘实操指南课程旨在通过实操演练，帮助学员掌握招聘考试的实际操作技巧。内容包括实操演练、案例解析等方面。通过实际操作和讲师点评，学员将更好地备战事业单位招聘考试。讲师团队由实操经验丰富的专业人士组成，确保学员在考场上熟练应对。', 4, '事业单位', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 78.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (228, '三支一扶面试技巧分享', 'course/11.png', '三支一扶面试技巧分享课程旨在通过分享面试经验，帮助学员提高面试水平。内容包括面试技巧、形势题应对等方面。通过经验分享和模拟面试，学员将更好地备战三支一扶面试。讲师团队由有丰富面试经验的专业人士组成，确保学员在面试中表现出色。', 5, '三支一扶', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 92.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (229, '公考笔试英语突破', 'course/12.png', '公考笔试英语突破课程旨在通过深度解析英语难点，帮助学员提高英语解题能力。内容包括英语难点攻略、实战演练等方面。通过理论学习和实际案例分析，学员将更好地备战公考笔试英语部分。讲师团队由英语专业人士组成，确保学员能够在考场上脱颖而出。', 1, '公考笔试', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 110.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (230, '公考面试形势题解析', 'course/13.png', '公考面试形势题解析课程旨在通过深度解析形势题，帮助学员掌握解题技巧。内容包括形势题解析、实战演练等方面。通过案例分析和实际演练，学员将更好地备战公考面试形势题。讲师团队由有丰富面试经验的专业人士组成，确保学员在形势题部分得心应手。', 2, '公考面试', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 98.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (231, '军队文职面试实操', 'course/14.png', '军队文职面试实操课程旨在通过实际操作，帮助学员熟悉面试流程和提高应对能力。内容包括面试流程、实操演练等方面。通过实际操作和专业点评，学员将更好地备战军队文职面试。讲师团队由有丰富面试经验的专业人士组成，确保学员在面试中表现出众。', 3, '军队文职', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 85.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (232, '事业单位招聘面试攻略', 'course/15.png', '事业单位招聘面试攻略课程旨在通过攻略面试流程，帮助学员提高面试水平。内容包括面试攻略、实操演练等方面。通过案例分析和实际演练，学员将更好地备战事业单位招聘面试。讲师团队由有丰富面试经验的专业人士组成，确保学员在面试中脱颖而出。', 4, '事业单位', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 75.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (233, '三支一扶招聘政策解读', 'course/16.png', '三支一扶招聘政策解读课程旨在通过深度解读政策文件，帮助学员理解招聘政策。内容包括政策解读、实际案例分析等方面。通过理论学习和实际操作，学员将更好地备战三支一扶招聘考试。讲师团队由有深厚政策解读经验的专业人士组成，确保学员了解政策核心。', 5, '三支一扶', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 88.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (234, '公考笔试数学突破', 'course/17.png', '公考笔试数学突破课程旨在通过深度解析数学难点，帮助学员提高数学解题能力。内容包括数学难点攻略、实战演练等方面。通过理论学习和实际案例分析，学员将更好地备战公考笔试数学部分。讲师团队由数学专业人士组成，确保学员能够在考场上取得高分。', 1, '公考笔试', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (235, '公考面试模拟演练', 'course/18.png', '公考面试模拟演练课程旨在通过模拟面试，帮助学员熟悉面试流程和提高应对能力。内容包括模拟面试、实操演练等方面。通过实际操作和专业点评，学员将更好地备战公考面试。讲师团队由有丰富面试经验的专业人士组成，确保学员在模拟面试中表现出众。', 2, '公考面试', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 105.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (236, '军队文职招聘政策解读', 'course/19.png', '军队文职招聘政策解读课程旨在通过深度解读政策文件，帮助学员理解招聘政策。内容包括政策解读、实际案例分析等方面。通过理论学习和实际操作，学员将更好地备战军队文职招聘考试。讲师团队由有深厚政策解读经验的专业人士组成，确保学员了解政策核心。', 3, '军队文职', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 93.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (237, '事业单位招聘模拟面试', 'course/20.png', '事业单位招聘模拟面试课程旨在通过模拟面试，帮助学员熟悉面试流程和提高应对能力。内容包括模拟面试、实操演练等方面。通过实际操作和专业点评，学员将更好地备战事业单位招聘面试。讲师团队由有丰富面试经验的专业人士组成，确保学员在模拟面试中脱颖而出。', 4, '事业单位', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 80.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (238, '三支一扶招聘面试攻略', 'course/21.png', '三支一扶招聘面试攻略课程旨在通过攻略面试流程，帮助学员提高面试水平。内容包括面试攻略、实操演练等方面。通过案例分析和实际演练，学员将更好地备战三支一扶招聘面试。讲师团队由有丰富面试经验的专业人士组成，确保学员在面试中脱颖而出。', 5, '三支一扶', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 85.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (239, '公安招警笔试突破', 'course/22.png', '公安招警笔试突破课程旨在通过深度解析考试难点，帮助学员提高解题能力。内容包括笔试难点攻略、实战演练等方面。通过理论学习和实际案例分析，学员将更好地备战公安招警笔试。讲师团队由公安招警考试专业人士组成，确保学员能够在考场上取得高分。', 6, '公安招警', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 95.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (240, '事业单位招聘笔试突破', 'course/23.png', '事业单位招聘笔试突破课程旨在通过深度解析考试难点，帮助学员提高解题能力。内容包括笔试难点攻略、实战演练等方面。通过理论学习和实际案例分析，学员将更好地备战事业单位招聘笔试。讲师团队由事业单位招聘专业人士组成，确保学员能够在考场上取得高分。', 4, '事业单位', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 88.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (241, '公考面试心理准备', 'course/24.png', '公考面试心理准备课程旨在通过心理辅导，帮助学员应对面试紧张情绪。内容包括心理准备、模拟面试等方面。通过心理辅导和模拟操作，学员将更好地备战公考面试。讲师团队由心理辅导专业人士组成，确保学员在面试中保持良好心态。', 2, '公考面试', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 75.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (242, '军队文职招聘模拟笔试', 'course/25.png', '军队文职招聘模拟笔试课程旨在通过模拟笔试，帮助学员熟悉考试流程和提高解题能力。内容包括模拟笔试、实操演练等方面。通过实际操作和专业点评，学员将更好地备战军队文职招聘笔试。讲师团队由有深厚考试经验的专业人士组成，确保学员能够在考场上取得高分。', 3, '军队文职', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 90.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (243, '三支一扶申论答题技巧', 'course/26.png', '三支一扶申论答题技巧课程旨在通过讲解答题技巧，帮助学员提高申论得分。内容包括申论答题技巧、实操演练等方面。通过实际案例分析和实操演练，学员将更好地备战三支一扶申论考试。讲师团队由申论考试专业人士组成，确保学员能够在考场上表现出色。', 5, '三支一扶', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 78.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (244, '公考笔试数学高分攻略', 'course/27.png', '公考笔试数学高分攻略课程旨在通过讲解数学考试技巧，帮助学员提高数学得分。内容包括数学考试技巧、实操演练等方面。通过理论学习和实际操作，学员将更好地备战公考笔试数学部分。讲师团队由数学考试专业人士组成，确保学员能够在数学考试中脱颖而出。', 1, '公考笔试', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 92.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (245, '军队文职英语口语训练', 'course/28.png', '军队文职英语口语训练课程旨在通过口语训练，帮助学员提高英语口语水平。内容包括口语训练、实操演练等方面。通过实际口语练习和专业点评，学员将更好地备战军队文职英语口语考试。讲师团队由英语口语专业人士组成，确保学员在口语考试中表现优异。', 3, '军队文职', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 86.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (246, '事业单位招聘面试实战演练', 'course/29.png', '事业单位招聘面试实战演练课程旨在通过实际面试演练，帮助学员熟悉面试流程和提高应对能力。内容包括实战演练、模拟面试等方面。通过实际操作和专业点评，学员将更好地备战事业单位招聘面试。讲师团队由有丰富面试经验的专业人士组成，确保学员在面试中脱颖而出。', 4, '事业单位', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 82.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (247, '公安招警体能训练指南', 'course/30.png', '公安招警体能训练指南课程旨在通过指导体能训练，帮助学员提高身体素质。内容包括体能训练指导、实际演练等方面。通过系统训练和实际操作，学员将更好地备战公安招警体能测试。讲师团队由体能训练专业人士组成，确保学员在体能测试中取得优异成绩。', 6, '公安招警', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 70.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (248, '三支一扶面试心理准备', 'course/31.png', '三支一扶面试心理准备课程旨在通过心理准备，帮助学员面对面试时保持冷静和自信。内容包括面试心理准备、实操演练等方面。通过心理辅导和实际操作，学员将更好地应对三支一扶面试环节。讲师团队由心理学专业人士组成，确保学员在面试中展现最佳状态。', 5, '三支一扶', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 85.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (249, '公考笔试法律知识讲解', 'course/1.png', '公考笔试法律知识讲解课程旨在通过深入讲解法律知识，帮助学员掌握考试重点。内容包括法律知识点讲解、实操演练等方面。通过理论学习和案例分析，学员将更好地备战公考笔试法律部分。讲师团队由法学专业人士组成，确保学员在法律考试中取得优异成绩。', 1, '公考笔试', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 96.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (250, '军队文职面试技巧分享', 'course/2.png', '军队文职面试技巧分享课程旨在通过分享面试经验，帮助学员了解面试要点。内容包括面试技巧分享、实操演练等方面。通过经验交流和实际操作，学员将更好地备战军队文职面试。讲师团队由有丰富面试经验的专业人士组成，确保学员在面试中取得成功。', 3, '军队文职', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 88.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (251, '事业单位招聘笔试实战指南', 'course/3.png', '事业单位招聘笔试实战指南课程旨在通过实战演练，帮助学员熟悉笔试流程和提高解题能力。内容包括笔试实战演练、模拟考试等方面。通过实际操作和专业点评，学员将更好地备战事业单位招聘笔试。讲师团队由有丰富笔试经验的专业人士组成，确保学员在笔试中脱颖而出。', 4, '事业单位', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 81.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (252, '公安招警法律常识全解析', 'course/4.png', '公安招警法律常识全解析课程旨在通过全面解析法律常识，帮助学员掌握考试重点。内容包括法律知识点解析、实操演练等方面。通过深入解析和实际操作，学员将更好地备战公安招警法律常识考试。讲师团队由法学专业人士组成，确保学员在法律考试中获得优异成绩。', 6, '公安招警', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 89.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (253, '公考面试实战演练', 'course/5.png', '公考面试实战演练课程旨在通过实际演练，帮助学员熟悉面试流程和提高应变能力。内容包括面试模拟演练、专业点评等方面。通过真实模拟和专业指导，学员将更好地备战公考面试环节。讲师团队由有面试经验的专业人士组成，确保学员在面试中表现出色。', 2, '公考面试', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 78.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (254, '军队文职面试案例分析', 'course/6.png', '军队文职面试案例分析课程旨在通过案例分析，帮助学员理解面试题目背后的考察点。内容包括案例分析讲解、实际操作等方面。通过深度分析和实际操作，学员将更好地应对军队文职面试。讲师团队由有成功面试经验的专业人士组成，确保学员在面试中取得好成绩。', 3, '军队文职', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 72.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (255, '事业单位招聘面试技巧', 'course/7.png', '事业单位招聘面试技巧课程旨在通过技巧讲解，帮助学员掌握面试技巧。内容包括面试技巧分享、实操演练等方面。通过技巧培训和实际操作，学员将更好地备战事业单位招聘面试。讲师团队由有丰富面试经验的专业人士组成，确保学员在面试中取得成功。', 4, '事业单位', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 93.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (256, '公安招警面试技巧全解析', 'course/8.png', '公安招警面试技巧全解析课程旨在通过全面解析面试技巧，帮助学员应对各种面试场景。内容包括技巧解析、实操演练等方面。通过深入解析和实际操作，学员将更好地备战公安招警面试。讲师团队由有成功面试经验的专业人士组成，确保学员在面试中脱颖而出。', 6, '公安招警', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 84.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (257, '三支一扶招聘考察重点', 'course/9.png', '三支一扶招聘考察重点课程旨在通过分析考察要点，帮助学员了解招聘流程。内容包括考察重点分析、实操演练等方面。通过深度分析和实际操作，学员将更好地备战三支一扶招聘考察。讲师团队由有成功考察经验的专业人士组成，确保学员在招聘中脱颖而出。', 5, '三支一扶', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 79.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (258, '事业单位招聘考试全程指导', 'course/10.png', '事业单位招聘考试全程指导课程旨在通过全程指导，帮助学员系统备战考试。内容包括科目解析、答题技巧等方面。通过系统指导和实际操作，学员将更好地备战事业单位招聘考试。讲师团队由科目专家组成，确保学员在考试中取得优异成绩。', 4, '事业单位', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (259, '公考笔试技巧与模拟', 'course/11.png', '公考笔试技巧与模拟课程旨在通过技巧讲解和实际模拟，帮助学员提高笔试水平。内容包括技巧分享、模拟考试等方面。通过技巧培训和实际模拟，学员将更好地备战公考笔试。讲师团队由有成功考试经验的专业人士组成，确保学员在笔试中取得好成绩。', 1, '公考笔试', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 95.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (260, '三支一扶招聘考试技巧', 'course/12.png', '三支一扶招聘考试技巧课程旨在通过技巧讲解，帮助学员提高应试水平。内容包括技巧分享、实操演练等方面。通过技巧培训和实际操作，学员将更好地备战三支一扶招聘考试。讲师团队由有成功考试经验的专业人士组成，确保学员在考试中脱颖而出。', 5, '三支一扶', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 82.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (261, '军队文职考试必备知识', 'course/13.png', '军队文职考试必备知识课程旨在通过知识点讲解，帮助学员掌握考试重点。内容包括知识点解析、实操演练等方面。通过深入解析和实际操作，学员将更好地备战军队文职考试。讲师团队由相关领域的专业人士组成，确保学员在考试中取得优异成绩。', 3, '军队文职', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 110.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (262, '公安招警笔试解题技巧', 'course/14.png', '公安招警笔试解题技巧课程旨在通过解题技巧讲解，帮助学员提高解题速度和准确度。内容包括技巧分享、实操演练等方面。通过技巧培训和实际操作，学员将更好地备战公安招警笔试。讲师团队由有成功考试经验的专业人士组成，确保学员在笔试中表现出色。', 6, '公安招警', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 98.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (263, '事业单位招聘面试技巧', 'course/15.png', '事业单位招聘面试技巧课程旨在通过技巧讲解，帮助学员提高面试水平。内容包括技巧分享、模拟面试等方面。通过技巧培训和实际操作，学员将更好地备战事业单位招聘面试。讲师团队由面试专家组成，确保学员在面试中脱颖而出。', 4, '事业单位', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 115.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (264, '公考面试心理准备', 'course/16.png', '公考面试心理准备课程旨在通过心理学知识，帮助学员调整心态备战面试。内容包括心理准备策略、实操演练等方面。通过心理调适和实际操作，学员将更好地应对公考面试压力。讲师团队由心理学专家组成，确保学员在面试中表现自信。', 2, '公考面试', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 105.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (265, '三支一扶招聘面试技巧', 'course/17.png', '三支一扶招聘面试技巧课程旨在通过技巧讲解，帮助学员提高面试水平。内容包括技巧分享、模拟面试等方面。通过技巧培训和实际操作，学员将更好地备战三支一扶招聘面试。讲师团队由面试专家组成，确保学员在面试中脱颖而出。', 5, '三支一扶', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 88.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (266, '军队文职招聘面试实操', 'course/18.png', '军队文职招聘面试实操课程旨在通过实际操作，帮助学员熟悉面试流程。内容包括面试实操演练、反馈指导等方面。通过实操演练和专业反馈，学员将更好地备战军队文职招聘面试。讲师团队由相关领域的专业人士组成，确保学员在面试中表现出众。', 3, '军队文职', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 118.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (267, '公安招警面试心理辅导', 'course/19.png', '公安招警面试心理辅导课程旨在通过心理学知识，帮助学员调整面试心态。内容包括心理调适策略、实操演练等方面。通过心理辅导和实际操作，学员将更好地应对公安招警面试挑战。讲师团队由心理学专家组成，确保学员在面试中展现最佳状态。', 6, '公安招警', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 101.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (268, '事业单位招聘笔试全程解析', 'course/20.png', '事业单位招聘笔试全程解析课程旨在通过全面解析，帮助学员深入理解笔试题型和解题技巧。内容包括各科目详细解析、解题方法分享等方面。通过解析和实际操作，学员将更好地备战事业单位招聘笔试。讲师团队由相关科目专家组成，确保学员在笔试中取得优异成绩。', 4, '事业单位', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 130.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (269, '公考笔试技巧讲解', 'course/21.png', '公考笔试技巧讲解课程旨在通过技巧讲解，帮助学员提高笔试解题速度和准确度。内容包括各科目技巧分享、实操演练等方面。通过技巧培训和实际操作，学员将更好地备战公考笔试。讲师团队由有成功考试经验的专业人士组成，确保学员在笔试中表现卓越。', 1, '公考笔试', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 98.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (270, '三支一扶申论高分策略', 'course/22.png', '三支一扶申论高分策略课程旨在通过策略分享，帮助学员提高申论成绩。内容包括策略分析、实操演练等方面。通过策略培训和实际操作，学员将更好地备战三支一扶申论考试。讲师团队由申论专家组成，确保学员在考试中取得高分。', 5, '三支一扶', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 112.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (271, '军队文职招聘考察技巧', 'course/23.png', '军队文职招聘考察技巧课程旨在通过技巧讲解，帮助学员提高考察阶段表现。内容包括考察技巧分享、实操演练等方面。通过技巧培训和实际操作，学员将更好地应对军队文职招聘考察。讲师团队由考察专家组成，确保学员在考察中表现出众。', 3, '军队文职', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 95.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (272, '公安招警体能训练指导', 'course/24.png', '公安招警体能训练指导课程旨在通过专业指导，帮助学员达到招警体能标准。内容包括训练计划制定、实际操作演练等方面。通过训练指导和实际操作，学员将更好地备战公安招警体能测试。讲师团队由体能专家组成，确保学员在体能测试中达到最佳状态。', 6, '公安招警', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 120.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (273, '公考面试技巧培训', 'course/25.png', '公考面试技巧培训课程旨在通过专业培训，提高学员面试水平。内容包括面试技巧分享、模拟面试等方面。通过面试培训和实际操作，学员将更好地备战公考面试。讲师团队由面试专家组成，确保学员在面试中表现出众。', 2, '公考面试', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 105.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (274, '三支一扶招聘笔试突破', 'course/26.png', '三支一扶招聘笔试突破课程旨在通过重难点攻克，帮助学员提高笔试成绩。内容包括突破策略分享、实操演练等方面。通过突破培训和实际操作，学员将更好地备战三支一扶招聘笔试。讲师团队由招聘专家组成，确保学员在笔试中取得优异成绩。', 5, '三支一扶', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 118.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (275, '事业单位面试经验分享', 'course/27.png', '事业单位面试经验分享课程旨在通过经验分享，提高学员面试水平。内容包括面试经验讲解、模拟面试等方面。通过经验分享和实际操作，学员将更好地备战事业单位面试。讲师团队由有面试经验的专业人士组成，确保学员在面试中取得优异成绩。', 4, '事业单位', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 88.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (276, '公安招警面试实操指南', 'course/28.png', '公安招警面试实操指南课程旨在通过实操演练，提高学员面试实战能力。内容包括实操训练、模拟面试等方面。通过实操指导和实际操作，学员将更好地应对公安招警面试挑战。讲师团队由面试专家和招警人员组成，确保学员在面试中表现卓越。', 6, '公安招警', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 99.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (277, '军队文职招聘模拟考察', 'course/29.png', '军队文职招聘模拟考察课程旨在通过模拟考察，提高学员在考察阶段的应对能力。内容包括模拟考察流程、考察技巧分享等方面。通过模拟考察和实际操作，学员将更好地备战军队文职招聘考察。讲师团队由考察专家组成，确保学员在考察中取得优异成绩。', 3, '军队文职', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 115.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (278, '事业单位招聘策略解析', 'course/30.png', '事业单位招聘策略解析课程旨在通过策略分析，帮助学员制定招聘备考计划。内容包括招聘政策解读、备考策略分享等方面。通过策略解析和实际操作，学员将更好地备战事业单位招聘。讲师团队由招聘专家组成，确保学员在备考中取得优异成绩。', 4, '事业单位', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 92.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (279, '公考笔试全程解析', 'course/31.png', '公考笔试全程解析课程旨在通过全程解析，帮助学员深入理解笔试考点。内容包括笔试科目解析、题型分析等方面。通过全程解析和实际操作，学员将更好地备战公考笔试。讲师团队由公考专家组成，确保学员在笔试中取得优异成绩。', 1, '公考笔试', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 125.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (280, '三支一扶面试技能提升', 'course/1.png', '三支一扶面试技能提升课程旨在通过技能培训，提高学员面试表现。内容包括面试技能训练、实操演练等方面。通过技能提升和实际操作，学员将更好地备战三支一扶面试。讲师团队由面试专家组成，确保学员在面试中脱颖而出。', 5, '三支一扶', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 110.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (281, '公安招警模拟考察演练', 'course/2.png', '公安招警模拟考察演练课程旨在通过实战演练，提高学员在考察阶段的应对能力。内容包括模拟考察流程、考察技巧分享等方面。通过模拟考察和实际操作，学员将更好地备战公安招警考察。讲师团队由考察专家组成，确保学员在考察中取得优异成绩。', 6, '公安招警', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 96.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (282, '军队文职笔试突破攻略', 'course/3.png', '军队文职笔试突破攻略课程旨在通过攻略分享，帮助学员提高笔试成绩。内容包括突破策略讲解、实操演练等方面。通过突破培训和实际操作，学员将更好地备战军队文职笔试。讲师团队由军队文职专家组成，确保学员在笔试中取得优异成绩。', 3, '军队文职', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 82.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (283, '事业单位面试技巧培训', 'course/4.png', '事业单位面试技巧培训课程旨在通过技巧培训，提高学员在面试阶段的表现。内容包括面试技巧讲解、实操演练等方面。通过技巧培训和实际操作，学员将更好地备战事业单位面试。讲师团队由面试专家组成，确保学员在面试中取得优异成绩。', 4, '事业单位', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 107.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (284, '三支一扶招聘政策解读', 'course/5.png', '三支一扶招聘政策解读课程旨在通过政策解读，帮助学员了解最新招聘政策。内容包括招聘政策解读、备考策略分享等方面。通过政策解读和实际操作，学员将更好地备战三支一扶招聘。讲师团队由招聘专家组成，确保学员在备考中取得优异成绩。', 5, '三支一扶', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 95.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (285, '公安招警面试实战演练', 'course/6.png', '公安招警面试实战演练课程旨在通过实战演练，提高学员在面试阶段的应对能力。内容包括面试流程解析、实操演练等方面。通过实战演练和实际操作，学员将更好地备战公安招警面试。讲师团队由面试专家组成，确保学员在面试中表现出色。', 6, '公安招警', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 103.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (286, '公考面试精华分享', 'course/7.png', '公考面试精华分享课程旨在通过面试经验分享，帮助学员更好地应对公考面试。内容包括面试经验分享、技巧讲解等方面。通过精华分享和实际操作，学员将更好地备战公考面试。讲师团队由面试专家组成，确保学员在面试中表现出色。', 2, '公考面试', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 118.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (287, '公考笔试突破攻略', 'course/8.png', '公考笔试突破攻略课程旨在通过攻略分享，帮助学员提高笔试成绩。内容包括突破策略讲解、实操演练等方面。通过突破培训和实际操作，学员将更好地备战公考笔试。讲师团队由公考专家组成，确保学员在笔试中取得优异成绩。', 1, '公考笔试', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 102.00, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (288, '三支一扶岗位知识详解', 'course/9.png', '三支一扶岗位知识详解课程旨在通过详细解读岗位知识，帮助学员更好地理解招聘内容。内容包括岗位知识解读、案例分析等方面。通过知识详解和实际操作，学员将更好地备战三支一扶招聘。讲师团队由招聘专家组成，确保学员在备考中取得优异成绩。', 5, '三支一扶', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 94.50, 0, 0, 0, NULL, 1);
INSERT INTO `civil_course` VALUES (289, '公考面试心理应对', 'course/10.png', '公考面试心理应对课程旨在通过心理学角度，帮助学员应对面试压力。内容包括心理调适方法、案例分析等方面。通过心理应对培训和实际操作，学员将更好地备战公考面试。讲师团队由心理学专家组成，确保学员在面试中保持良好状态。', 2, '公考面试', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 115.50, 0, 0, 0, NULL, 0);
INSERT INTO `civil_course` VALUES (290, '事业单位面试技巧分享', 'course/11.png', '事业单位面试技巧分享课程旨在通过分享经验，提高学员在事业单位面试中的技巧。内容包括面试技巧分享、成功经验讲解等方面。通过技巧分享和实际操作，学员将更好地备战事业单位面试。讲师团队由面试专家组成，确保学员在面试中取得优异成绩。', 4, '事业单位', 10, '赵小敏', 'avatar/10.jpg', '2024-01-19 11:00:00', 108.50, 0, 0, 0, NULL, 0);
INSERT INTO `civil_course` VALUES (291, '公安招警体能训练指导', 'course/12.png', '公安招警体能训练指导课程旨在通过专业指导，帮助学员提高体能水平。内容包括体能训练计划、实操演练等方面。通过训练指导和实际操作，学员将更好地备战公安招警体能测试。讲师团队由体能训练专家组成，确保学员在体能测试中达到优异水平。', 6, '公安招警', 1, '王罗源', 'avatar/1.png', '2024-01-19 11:00:00', 98.00, 0, 0, 0, NULL, 0);
INSERT INTO `civil_course` VALUES (292, '三支一扶招聘政策深度解析', 'course/13.png', '三支一扶招聘政策深度解析课程旨在通过深度解析政策，帮助学员全面了解招聘政策背后的含义。内容包括政策解读、案例分析等方面。通过政策深度解析和实际操作，学员将更好地备战三支一扶招聘。讲师团队由招聘专家组成，确保学员在备考中取得优异成绩。', 5, '三支一扶', 2, '严唐钟', 'avatar/2.jpg', '2024-01-19 11:00:00', 110.00, 0, 0, 0, NULL, 0);
INSERT INTO `civil_course` VALUES (293, '公考笔试数学强化训练', 'course/14.png', '公考笔试数学强化训练课程旨在通过数学强化训练，提高学员在笔试数学部分的应试能力。内容包括数学题型解析、实操演练等方面。通过数学强化训练和实际操作，学员将更好地备战公考笔试数学部分。讲师团队由数学专家组成，确保学员在笔试中取得优异成绩。', 1, '公考笔试', 3, '林伟杰', 'avatar/3.jpg', '2024-01-19 11:00:00', 120.00, 0, 0, 0, NULL, 0);
INSERT INTO `civil_course` VALUES (294, '公考面试模拟演练', 'course/15.png', '公考面试模拟演练课程旨在通过模拟演练，提高学员在面试中的表现水平。内容包括面试场景模拟、实操演练等方面。通过模拟演练和实际操作，学员将更好地备战公考面试。讲师团队由面试专家组成，确保学员在面试中取得优异成绩。', 2, '公考面试', 4, '张明华', 'avatar/4.jpg', '2024-01-19 11:00:00', 135.00, 0, 0, 0, '', 0);
INSERT INTO `civil_course` VALUES (295, '军队文职招聘政策解读', 'course/16.png', '军队文职招聘政策解读课程旨在通过深度解析政策，帮助学员全面了解军队文职招聘政策背后的含义。内容包括政策解读、案例分析等方面。通过政策解读和实际操作，学员将更好地备战军队文职招聘。讲师团队由招聘专家组成，确保学员在备考中取得优异成绩。', 3, '军队文职', 5, '王小芳', 'avatar/5.jpg', '2024-01-19 11:00:00', 98.50, 0, 0, 0, NULL, 0);
INSERT INTO `civil_course` VALUES (296, '事业单位招聘考点分析', 'course/17.png', '事业单位招聘考点分析课程旨在通过考点分析，帮助学员更好地应对事业单位招聘考试。内容包括考点解析、实操演练等方面。通过考点分析和实际操作，学员将更好地备战事业单位招聘。讲师团队由考试专家组成，确保学员在考试中取得优异成绩。', 4, '事业单位', 6, '李文娜', 'avatar/6.jpg', '2024-01-19 11:00:00', 115.00, 0, 0, 0, NULL, 0);
INSERT INTO `civil_course` VALUES (297, '三支一扶招聘经验分享', 'course/18.png', '三支一扶招聘经验分享课程旨在通过分享成功经验，帮助学员更好地应对招聘过程中的各种情况。内容包括成功经验分享、案例分析等方面。通过经验分享和实际操作，学员将更好地备战三支一扶招聘。讲师团队由成功经验者组成，确保学员在备考中取得优异成绩。', 5, '三支一扶', 7, '刘力强', 'avatar/7.jpg', '2024-01-19 11:00:00', 88.00, 0, 0, 0, NULL, 0);
INSERT INTO `civil_course` VALUES (298, '公安招警面试技巧培训', 'course/19.png', '公安招警面试技巧培训课程旨在通过技巧培训，提高学员在公安招警面试中的表现水平。内容包括面试技巧解析、实操演练等方面。通过技巧培训和实际操作，学员将更好地备战公安招警面试。讲师团队由面试专家组成，确保学员在面试中取得优异成绩。', 6, '公安招警', 8, '陈小静', 'avatar/8.jpg', '2024-01-19 11:00:00', 145.00, 0, 0, 0, NULL, 0);
INSERT INTO `civil_course` VALUES (299, '公考笔试英语强化训练', 'course/20.png', '公考笔试英语强化训练课程旨在通过英语强化训练，提高学员在笔试英语部分的应试能力。内容包括英语题型解析、实操演练等方面。通过英语强化训练和实际操作，学员将更好地备战公考笔试英语部分。讲师团队由英语专家组成，确保学员在笔试中取得优异成绩。', 1, '公考笔试', 9, '周大勇', 'avatar/9.jpg', '2024-01-19 11:00:00', 128.00, 0, 0, 0, NULL, 0);
INSERT INTO `civil_course` VALUES (300, '公考面试心理准备', 'course/21.png', '公考面试心理准备课程旨在通过心理准备，提高学员在面试中的心理素质。内容包括心理调适方法、实操演练等方面。通过心理准备和实际操作，学员将更好地备战公考面试。讲师团队由心理专家组成，确保学员在面试中取得优异成绩。', 2, '公考面试', 10, '赵小敏', 'avatar/10.jpg', '2024-01-05 11:00:00', 112.50, 0, 0, 0, NULL, 0);
INSERT INTO `civil_course` VALUES (301, '军队文职面试技能培训', 'course/22.png', '军队文职面试技能培训课程旨在通过技能培训，提高学员在军队文职面试中的表现水平。内容包括面试技能解析、实操演练等方面。通过技能培训和实际操作，学员将更好地备战军队文职面试。讲师团队由面试专家组成，确保学员在面试中取得优异成绩。', 3, '军队文职', 1, '王罗源', 'avatar/1.png', '2024-01-20 11:00:00', 95.75, 0, 0, 0, NULL, 1);

-- ----------------------------
-- Table structure for civil_opinion
-- ----------------------------
DROP TABLE IF EXISTS `civil_opinion`;
CREATE TABLE `civil_opinion`  (
  `opinion_id` bigint NOT NULL AUTO_INCREMENT COMMENT '意见ID',
  `opinion_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '意见内容',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '提出者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`opinion_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '意见反馈表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of civil_opinion
-- ----------------------------
INSERT INTO `civil_opinion` VALUES (1, '这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验', 'Miss', '2024-02-02 19:36:16');
INSERT INTO `civil_opinion` VALUES (2, '我想提一个意见这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验', 'Miss', '2024-03-03 23:57:42');
INSERT INTO `civil_opinion` VALUES (3, '这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验', 'Miss', '2024-02-02 19:36:16');
INSERT INTO `civil_opinion` VALUES (4, '这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验', 'Miss', '2024-02-02 19:36:16');
INSERT INTO `civil_opinion` VALUES (5, '这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验', 'Miss', '2024-02-02 19:36:16');
INSERT INTO `civil_opinion` VALUES (6, '这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验', 'Miss', '2024-02-02 19:36:16');
INSERT INTO `civil_opinion` VALUES (7, '这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验', 'Miss', '2024-02-02 19:36:16');
INSERT INTO `civil_opinion` VALUES (8, '这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验', 'Miss', '2024-02-02 19:36:16');
INSERT INTO `civil_opinion` VALUES (9, '这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验', 'Miss', '2024-02-02 19:36:16');
INSERT INTO `civil_opinion` VALUES (11, '这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验', 'Miss', '2024-02-02 19:36:16');
INSERT INTO `civil_opinion` VALUES (12, '这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验', 'Miss', '2024-02-02 19:36:16');
INSERT INTO `civil_opinion` VALUES (13, '这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验', 'Miss', '2024-02-02 19:36:16');
INSERT INTO `civil_opinion` VALUES (14, '这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验', 'Miss', '2024-02-02 19:36:16');
INSERT INTO `civil_opinion` VALUES (15, '这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验', 'Miss', '2024-02-02 19:36:16');
INSERT INTO `civil_opinion` VALUES (16, '这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验', 'Miss', '2024-02-02 19:36:16');
INSERT INTO `civil_opinion` VALUES (17, '这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验这是一个意见反馈的测试第一次实验', 'Miss', '2024-02-02 19:36:16');

-- ----------------------------
-- Table structure for civil_order
-- ----------------------------
DROP TABLE IF EXISTS `civil_order`;
CREATE TABLE `civil_order`  (
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `course_id` bigint NOT NULL COMMENT '课程ID',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系方式',
  `consignee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收货人姓名',
  `trade_amount` decimal(24, 2) NOT NULL COMMENT '交易金额',
  `trade_voucher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易凭证',
  `course_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程名称',
  `course_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程封面',
  `use_free_number` int NULL DEFAULT NULL COMMENT '使用的免费次数',
  `course_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程简介',
  `trade_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '交易时间',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态(0:待支付、1:已支付、2:已退款)',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of civil_order
-- ----------------------------
INSERT INTO `civil_order` VALUES ('1770046145719439360', 2, 15, '18678987898', '王罗源', 120.00, '2024031922001494680502438249', '公安招警面试技能培训', 'course/15.png', 0, '公安招警面试技能培训课程旨在提高考生在公安招警面试中的表现水平。内容包括面试技巧、心理素质等方面。通过模拟面试和实际案例分析，学员将增加面试经验，提高面试水平。讲师团队由具有丰富面试培训经验的专业人士组成，确保学员能够获得全面的面试技能培训。', '2024-03-19 19:14:21', 2);
INSERT INTO `civil_order` VALUES ('1772970353948626944', 19, 1, '18568547856', '王罗源', 150.00, '2024032722001494680502514938', '公务员笔试基础课程', 'course/1.png', 0, '公务员笔试基础课程是为有志于公务员考试的学员打造的全面复习课程。通过系统性的讲解和大量实例分析，学员将深入了解各个科目的考点，提高解题能力。课程内容包括常识判断、言语理解与表达、数量关系等，涵盖公务员笔试的基础知识。讲师团队由经验丰富的教育专家组成，确保学员能够得到高质量的教学指导。', '2024-03-27 20:54:07', 2);
INSERT INTO `civil_order` VALUES ('1776511576814653440', 19, 1, '18659785487', 'lensy', 150.00, '2024040622001494680502608174', '公务员笔试基础课程', 'course/1.png', 0, '公务员笔试基础课程是为有志于公务员考试的学员打造的全面复习课程。通过系统性的讲解和大量实例分析，学员将深入了解各个科目的考点，提高解题能力。课程内容包括常识判断、言语理解与表达、数量关系等，涵盖公务员笔试的基础知识。讲师团队由经验丰富的教育专家组成，确保学员能够得到高质量的教学指导。', '2024-04-06 15:25:40', 2);
INSERT INTO `civil_order` VALUES ('1776511840854478848', 19, 2, '18659785487', 'lensy', 200.00, '2024040622001494680502608175', '公务员面试实战训练', 'course/2.png', 0, '公务员面试实战训练课程旨在帮助考生在面试中表现出色。课程通过模拟公务员面试场景，提高面试技巧。学员将参与实际案例分析和模拟面试，帮助他们熟悉面试流程，培养应对各种问题的能力。讲师团队由经验丰富的面试官和专业人士组成，能够为学员提供真实、有效的指导。课程还包括对常见面试问题的解析和应对策略，帮助学员更加自信地迎接公务员面试的挑战。', '2024-04-06 15:26:43', 1);
INSERT INTO `civil_order` VALUES ('1776511998149267456', 19, 7, '18659785487', 'lensy', 100.00, '2024040622001494680502609992', '事业单位面试技巧', 'course/7.png', 0, '事业单位面试技巧课程帮助学员更好地应对事业单位面试环节。内容包括面试常见问题解析、沟通技巧等方面。通过实际案例和模拟面试，学员将提高面试表现，增加成功机会。讲师团队由具有丰富招聘面试经验的专业人士组成，确保学员能够获得专业的指导。', '2024-04-06 15:27:21', 1);

-- ----------------------------
-- Table structure for civil_role
-- ----------------------------
DROP TABLE IF EXISTS `civil_role`;
CREATE TABLE `civil_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色编码',
  `role_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色描述',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建者',
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of civil_role
-- ----------------------------
INSERT INTO `civil_role` VALUES (1, 'super-admin', '000', '超级管理员', 'DBA', 'DBA', '2023-12-12 12:00:50', '2023-12-12 12:06:27');
INSERT INTO `civil_role` VALUES (2, 'admin', '100', '普通管理员', 'DBA', 'DBA', '2023-12-12 12:01:50', '2023-12-12 12:06:30');
INSERT INTO `civil_role` VALUES (3, 'teacher', '200', '讲师', 'DBA', 'DBA', '2023-12-12 12:02:19', '2023-12-12 12:06:33');
INSERT INTO `civil_role` VALUES (4, 'user', '300', '用户', 'DBA', 'DBA', '2023-12-13 02:06:28', '2023-12-13 02:06:28');

-- ----------------------------
-- Table structure for civil_technical
-- ----------------------------
DROP TABLE IF EXISTS `civil_technical`;
CREATE TABLE `civil_technical`  (
  `technical_id` bigint NOT NULL AUTO_INCREMENT COMMENT '资讯ID',
  `technical_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资讯标题',
  `technical_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '资讯封面',
  `technical_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资讯内容',
  `category_id` bigint NOT NULL COMMENT '分类ID',
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `user_id` bigint NOT NULL COMMENT '发布者ID',
  `creator_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '发布者姓名',
  `creator_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '发布者头像',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`technical_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '资讯表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of civil_technical
-- ----------------------------
INSERT INTO `civil_technical` VALUES (1, '如何高效备考公务员考试', 'article/1.png', '在备考公务员考试的过程中，考生们常常会面临各种挑战，需要制定科学合理的备考策略。首先，建议考生在备考前充分了解考试大纲和考试要点，明确每个科目的重点和难点，制定针对性的学习计划。其次，选择合适的学习资料和辅导课程，确保能够全面系统地学习相关知识。同时，注重做模拟试题和真题，通过练习提高解题能力和应试水平。\r\n\r\n在备考的同时，合理安排休息时间也是非常关键的。过度的学习可能会导致身体疲劳和学习效果下降，因此要确保每天有足够的休息时间，保持良好的身体状态。此外，保持积极乐观的心态也是非常重要的，考生们要相信自己的实力，保持对考试的信心。\r\n\r\n交流与分享也是备考的一部分，可以参加一些备考交流群或者线下活动，与其他考生交流经验和心得，相互鼓励，共同进步。同时，及时关注考试动态和变化，调整备考计划，保持对考试信息的敏感度。\r\n\r\n总的来说，高效备考公务员考试需要科学的方法、合理的计划、良好的心态和不懈的努力。祝愿所有备考的考生都能在考试中取得优异成绩，实现自己的梦想！', 1, '公考笔试', 1, 'lenzy', 'avatar/1.jpeg', '2024-01-14 19:59:50');
INSERT INTO `civil_technical` VALUES (2, '公务员面试经验分享', 'article/2.png', '参加公务员面试是考生们备考过程中的重要环节。在面试中，考生除了需要展现自己的专业知识外，还需要具备一定的沟通和表达能力。以下是一些成功考生分享的面试经验：首先，要保持冷静自信，面对考官的提问时要清晰明了地表达自己的观点。其次，要注重礼貌和仪态，给考官留下良好的印象。同时，要了解相关的社会热点和政策，以便在面试中能够做出合理的分析和回答。最后，要重视形象，穿着得体，展现出一名合格公务员的形象。\r\n\r\n通过这些经验分享，考生们可以更好地应对公务员面试中的各种情况，提高面试的成功率。希望每一位参加公务员面试的考生都能够取得优异的成绩，顺利通过面试环节。', 2, '公考面试', 2, 'admin1', 'avatar/2.jpeg', '2024-01-14 19:59:50');
INSERT INTO `civil_technical` VALUES (3, '军队文职招聘信息', 'article/3.png', '军队文职是一项重要的招聘计划，吸引着大量应聘者。在了解军队文职招聘信息时，考生们需要注意一些重要的事项。首先，要仔细阅读招聘公告，了解招聘岗位、条件和流程。其次，准备相关材料，包括个人简历、证书等。在报名时要确保信息的真实性和完整性。同时，要关注招聘单位的特点和要求，准备相关面试和考试知识。\r\n\r\n军队文职招聘通常有一定的竞争，考生们要提前做好充分的准备。参加模拟考试和面试，提高自己的竞争力。祝愿所有报考军队文职的考生都能够顺利通过招聘流程，加入到优秀的军队文职团队中。', 3, '军队文职', 3, 'admin2', 'avatar/3.jpeg', '2024-01-14 19:59:50');
INSERT INTO `civil_technical` VALUES (4, '事业单位招聘政策解读', 'article/4.png', '事业单位招聘政策一直备受关注，对于准备报考事业单位的考生们来说，了解相关政策非常重要。在解读事业单位招聘政策时，考生们要关注招聘的对象、条件、流程等方面。首先，要明确事业单位的基本要求和特点，了解招聘的职位和岗位。其次，关注招聘流程，包括报名、笔试、面试等环节，提前准备相关材料和知识。\r\n\r\n了解事业单位招聘政策还需要关注一些细节，比如招聘单位的背景、发展前景等。这些信息有助于考生更好地理解招聘的背景和特点，提高报考的针对性。希望所有备考事业单位招聘的考生都能够在招聘中取得好成绩，顺利加入到事业单位中。', 4, '事业单位', 4, 'admin3', 'avatar/4.jpeg', '2024-01-14 19:59:50');
INSERT INTO `civil_technical` VALUES (5, '三支一扶招聘政策详解', 'article/5.png', '三支一扶计划是国家对农村和贫困地区实施的人才支持计划，备受关注。在了解三支一扶招聘政策时，考生们要注意一些关键点。首先，要了解三支一扶的政策目标和招聘对象，明确服务地区和服务对象。其次，关注招聘流程，包括报名、资格审核、面试等环节，准备相关材料和知识。\r\n\r\n三支一扶计划通常有一些特殊的要求，比如服务承诺、服务期限等，考生们需要提前了解并做好相应准备。同时，要关注服务地区的特点和需求，为将来的服务做好充分的准备。希望所有报考三支一扶的考生都能够顺利通过招聘流程，为农村和贫困地区的发展贡献自己的力量。', 5, '三支一扶', 5, 'admin4', 'avatar/5.jpeg', '2024-01-14 19:59:50');
INSERT INTO `civil_technical` VALUES (6, '公安招警考试大纲解析', 'article/6.png', '公安招警考试是对于公安机关招聘警察的一项全国性考试。考生们在备考时，首先需要详细了解考试大纲，明确考试科目和内容。公安招警考试大纲通常包括法律法规、业务知识、面试等科目，考生们需要有针对性地进行学习。在解析法律法规时，要关注最新的法律变化和修订，确保学习的材料是最新的。同时，业务知识也是考试的重要组成部分，要深入了解公安工作的相关知识，提高解题和应试水平。\r\n\r\n在备考过程中，要注重做模拟试题，了解考试形式和难度。通过模拟考试，考生们可以更好地适应考试环境，提高应对考试的信心。此外，要保持良好的心态，合理安排学习和休息时间，确保备考的高效性和健康性。祝愿所有备考公安招警的考生都能够在考试中取得好成绩，顺利加入到公安机关。', 6, '公安招警', 6, 'admin5', 'avatar/6.jpeg', '2024-01-14 19:59:50');
INSERT INTO `civil_technical` VALUES (7, '公考笔试高分策略分享', 'article/7.png', '公务员考试中，笔试是非常重要的一部分，也是考生们争取高分的关键。在分享高分策略时，一些成功考生提出了一些建议。首先，要熟悉考试大纲，明确每个科目的重点和难点，有针对性地进行复习。其次，要注重时间管理，合理安排每个科目的答题时间，确保每个题目都能得到充分的发挥。同时，要注重答题技巧，包括查找关键词、构建逻辑框架等，提高解题效率。\r\n\r\n在备考过程中，要多做模拟试题，熟悉考试的题型和难度。通过模拟考试，找到自己的薄弱环节，有针对性地进行强化训练。此外，要保持冷静和自信，遇到难题不要过分纠结，可以先跳过，争取先完成易题，再回头解决难题。希望所有备考公务员笔试的考生都能够采用科学合理的策略，取得优异的成绩。', 1, '公考笔试', 7, 'admin6', 'avatar/7.jpeg', '2024-01-14 19:59:50');
INSERT INTO `civil_technical` VALUES (8, '三支一扶服务心得分享', 'article/8.png', '三支一扶计划是一项为农村和贫困地区提供服务的计划，通过服务回报社会。在服务期间，一些参与者分享了他们的服务心得。首先，要深入了解服务地区的实际情况，与当地居民建立良好的关系。了解他们的需求和困难，有针对性地提供帮助。其次，要保持积极乐观的心态，尽量解决遇到的问题，同时理解和接纳当地的文化和生活方式。\r\n\r\n服务期间，要注重团队合作，与团队成员协作完成任务，形成良好的工作氛围。同时，要灵活应对各种复杂情况，具备一定的应变能力。通过服务，参与者们不仅帮助了他人，也收获了宝贵的人生经验。祝愿所有参与三支一扶计划的人员都能够为社会贡献一份力量，取得成功。', 5, '三支一扶', 8, 'admin7', 'avatar/1.jpeg', '2024-01-14 19:59:50');
INSERT INTO `civil_technical` VALUES (9, '公务员面试经验分享', 'article/1.png', '公务员面试是进入公务员岗位的最后一关，也是考生们展示自己综合素质的机会。一些成功通过面试的考生分享了他们的经验。首先，要深入了解面试流程和评分标准，明确面试的考察重点。其次，要保持自信和冷静，与面试官进行良好的沟通，展示自己的优势和特长。同时，要注重礼仪和形象，给面试官留下良好的印象。\r\n\r\n在准备过程中，要进行模拟面试，提前预演可能出现的问题，并进行合理的回答。通过模拟面试，可以提高面试的流畅度和自信度。此外，要关注一些热点问题和社会热点，增加综合素质的表达。希望所有备考公务员面试的考生都能够在面试中展现出色，成功进入公务员队伍。', 2, '公考面试', 9, 'admin8', 'avatar/2.jpeg', '2024-01-14 19:59:50');
INSERT INTO `civil_technical` VALUES (10, '军队文职岗位解析', 'article/2.png', '军队文职岗位是军队中的一类职业，负责军队内部的管理和协调工作。对于有意报考军队文职的考生，需要了解相关岗位的性质和要求。首先，要明确文职岗位的工作内容，了解在军队内的职责和任务。其次，要关注岗位的特殊性和要求，包括管理能力、组织协调能力等方面。在岗位解析中，考生们可以了解一些成功文职人员的经验，了解岗位的挑战和机遇。\r\n\r\n军队文职岗位通常要求应聘者具备一定的政治觉悟和军事素养，要有较强的组织协调和沟通能力。在备考过程中，要注重政治理论的学习，提高自己的综合素质。希望所有备考军队文职的考生都能够通过努力，顺利进入军队文职岗位。', 3, '军队文职', 10, 'admin9', 'avatar/3.jpeg', '2024-01-14 19:59:50');
INSERT INTO `civil_technical` VALUES (11, '事业单位招聘流程详解', 'article/3.png', '事业单位招聘是许多考生备考的重点，因为事业单位在就业稳定性和发展空间方面有很多优势。事业单位招聘流程一般包括报名、笔试、面试等环节。在报名阶段，考生需要提前关注招聘信息，准备相关材料，并按时完成报名。在笔试环节，要熟悉考试科目，有针对性地进行复习，提高应试水平。在面试阶段，要注重形象和表达能力，与考官进行良好的互动。\r\n\r\n备考过程中，可以参加一些模拟笔试和面试活动，了解考试的难度和形式。通过模拟，考生可以更好地适应考试环境，提高应对考试的信心。同时，要保持良好的心态，合理安排学习和休息时间，确保备考的高效性和健康性。祝愿所有备考事业单位招聘的考生都能够取得优异的成绩。', 4, '事业单位', 11, 'admin10', 'avatar/4.jpeg', '2024-01-14 20:02:41');
INSERT INTO `civil_technical` VALUES (12, '公务员考试心得分享', 'article/4.png', '公务员考试是一个相对庞大的系统，包括笔试和面试两个环节。一些成功考入公务员的考生分享了他们的备考心得。在笔试阶段，要注重基础知识的掌握，同时培养良好的时间管理能力。考生们可以通过刷题，提高解题速度和准确性。在面试环节，要关注与政策法规相关的问题，同时展示自己的综合素质，如沟通能力、组织协调能力等。\r\n\r\n备考过程中，建议考生们制定科学合理的学习计划，保证每个科目都能够得到充分的复习。同时，要保持积极的心态，遇到困难时不要轻易放弃。通过努力和坚持，相信每一位考生都能够取得理想的成绩。希望所有备考公务员的考生都能够成功上岸，为社会做出更多的贡献。', 1, '公考笔试', 12, 'admin11', 'avatar/5.jpeg', '2024-01-14 20:02:41');
INSERT INTO `civil_technical` VALUES (13, '军队文职岗位发展前景', 'article/5.png', '军队文职岗位是军队中的一类特殊岗位，主要负责军队内的管理和协调工作。对于考生来说，了解军队文职岗位的发展前景是备考的重要一环。军队文职岗位通常要求应聘者具备一定的政治觉悟和军事素养，要有较强的组织协调和沟通能力。在了解发展前景时，可以关注军队的发展方向和对文职人才的需求。\r\n\r\n军队文职人员有机会参与军队的管理和组织工作，为国家安全和军队建设贡献自己的力量。此外，军队文职人员的晋升通道也相对较宽，有更多的发展空间。在备考过程中，考生们可以通过参加招聘宣讲会、了解相关政策等方式，获取更多关于军队文职岗位的信息。希望所有备考军队文职的考生都能够把握机会，取得优异的成绩。', 3, '军队文职', 13, 'admin12', 'avatar/6.jpeg', '2024-01-14 20:02:41');
INSERT INTO `civil_technical` VALUES (14, '三支一扶政策解读', 'article/6.png', '三支一扶是指农村义务教育阶段、中等职业教育阶段和中小学特岗教师的支教项目。对于有意报考的考生，需要了解相关政策和招聘信息。首先，要明确项目的资格条件和招聘计划。其次，要关注招聘流程和考试科目，有针对性地进行备考。在政策解读中，可以了解一些成功考入三支一扶项目的考生的经验，获取备考的指导意见。\r\n\r\n三支一扶项目有助于支援农村地区的教育工作，为农村学生提供更多的学习机会。在备考过程中，要关注教育政策和法规，提高自己的教育素养。同时，要注重实践经验的积累，为将来的支教工作做好充分准备。祝愿所有备考三支一扶的考生都能够成功实现自己的支教梦想。', 5, '三支一扶', 1, 'lenzy', 'avatar/1.jpeg', '2024-01-14 20:02:41');
INSERT INTO `civil_technical` VALUES (15, '公安招警体能训练指南', 'article/7.png', '公安招警是一个综合素质要求较高的岗位，其中体能测试是招聘的重要环节之一。考生们在备考过程中需要注重体能训练，提高自己的身体素质。体能训练指南包括有氧运动、力量训练、爬楼梯、跳远等多个方面。考生们可以根据自身情况，制定科学合理的训练计划，逐步提高体能水平。\r\n\r\n此外，体能训练不仅有助于应对招聘中的体测项目，还能提高身体的抗逆性和应激能力。在训练过程中，要注重安全，避免受伤。希望所有备考公安招警的考生都能够通过艰苦的体能训练，顺利通过体测环节，取得优异的成绩。', 6, '公安招警', 2, 'admin1', 'avatar/2.jpeg', '2024-01-14 20:02:41');
INSERT INTO `civil_technical` VALUES (16, '公务员面试技巧分享', 'article/8.png', '公务员面试是考察考生综合素质和应变能力的环节。在面试中，考生需要展现自己的政治觉悟、表达能力和团队协作精神。一些成功考入公务员的考生分享了他们的面试经验。首先，要对考试大纲和政策有清晰的了解，了解国家的方向和政策取向。其次，要注重礼仪和形象，给考官一个良好的第一印象。\r\n\r\n在面试中，要冷静应对各种问题，不慌不忙地回答。考生们可以通过模拟面试，提高应变能力。同时，要注意语言表达的流畅度和条理性。在备考过程中，可以参加一些面试技巧培训班，获取更多实战经验。希望所有备考公务员面试的考生都能够在面试中表现出色。', 2, '公考面试', 3, 'admin2', 'avatar/3.jpeg', '2024-01-14 20:02:41');
INSERT INTO `civil_technical` VALUES (17, '事业单位面试经验分享', 'article/1.png', '事业单位面试是考察考生是否适合岗位的关键环节。在面试中，考生需要展示自己的专业素养和团队协作能力。一些建议是提前了解事业单位的工作特点和岗位要求，有针对性地准备相关知识。在面试中，要展现出自己的学科专业知识，回答问题要清晰明了。此外，要注重团队协作精神，与考官进行良好的沟通。\r\n\r\n在备考过程中，可以参加一些模拟面试，提高自己的应变能力。要有自信，保持良好的心态，不要过分紧张。在面试结束后，要注意总结经验教训，为下一次面试做好准备。祝愿所有备考事业单位面试的考生都能够成功。', 4, '事业单位', 4, 'admin3', 'avatar/4.jpeg', '2024-01-14 20:02:41');
INSERT INTO `civil_technical` VALUES (18, '军队文职岗位招聘政策解读', 'article/2.png', '军队文职岗位招聘是军队为了满足内部管理和协调需要而进行的人才招募。考生在备考过程中需要仔细了解招聘政策，明确岗位要求。招聘政策解读包括岗位条件、报名材料、考试科目等方面。在备考过程中，要有针对性地复习相关知识，提高应试水平。\r\n\r\n了解招聘政策还有助于考生制定合理的备考计划，高效利用备考时间。同时，要关注招聘信息的更新，及时获取最新的考试动态。希望所有备考军队文职岗位的考生都能够根据政策要求，顺利通过招聘环节。', 3, '军队文职', 5, 'admin4', 'avatar/5.jpeg', '2024-01-14 20:02:41');
INSERT INTO `civil_technical` VALUES (19, '三支一扶项目志愿者经验分享', 'article/3.png', '三支一扶项目是一个服务农村教育的重要项目，吸引了众多有志青年参与。一些三支一扶项目的志愿者分享了他们的经验。在服务过程中，志愿者们要关注农村学生的实际需求，制定合理的服务计划。与农村学生建立良好的关系，成为他们的知心朋友。\r\n\r\n在项目中，要注重团队协作，与队友们共同解决问题。同时，要关注自身的成长，培养团队领导力和组织能力。在经验分享中，志愿者们强调了互帮互助的重要性，希望更多的人能够加入到服务农村的行列。祝愿所有参与三支一扶项目的志愿者都能够有所收获。', 5, '三支一扶', 6, 'admin5', 'avatar/6.jpeg', '2024-01-14 20:02:41');
INSERT INTO `civil_technical` VALUES (20, '公安招警面试题目解析', 'article/4.png', '公安招警面试是选拔优秀人才的关键环节。考生们在备考过程中需要了解一些常见的面试题目及解题思路。例如，关于法律法规的问题，考生需要熟悉相关法规，清晰表达自己的观点。在解析案例题时，要注重分析问题的深度，展现出较强的思考能力。\r\n\r\n此外，要注重形象和仪态，给考官留下良好的印象。在模拟面试中，可以请教老师或资深考官，获取专业的指导建议。希望所有备考公安招警面试的考生都能够在面试中取得令人满意的成绩。', 6, '公安招警', 7, 'admin6', 'avatar/7.jpeg', '2024-01-14 20:02:41');
INSERT INTO `civil_technical` VALUES (21, '公务员考试政策解读与备考建议', 'article/5.png', '公务员考试一直是许多人追逐的目标，但考试政策的不断调整常常让人感到迷茫。本文将对最新的公务员考试政策进行解读，并提供一些建议供考生参考。首先，要了解考试的整体框架和重要变化，做到心中有数。\r\n\r\n其次，要制定合理的备考计划，根据自己的实际情况有针对性地进行复习。在备考过程中，不仅要注重知识的积累，还要提高解决问题的能力。同时，要关注时事政治，了解国家的最新动态。希望所有备考公务员的考生都能够在考试中取得好成绩。', 1, '公考笔试', 8, 'WilliamHall', 'avatar/8.jpg', '2024-01-14 20:03:51');
INSERT INTO `civil_technical` VALUES (22, '公务员考试心得分享', 'article/6.png', '作为一名成功考入公务员的考生，我想分享一些备考心得。首先，要树立明确的目标和坚定的信念，这将是你坚持备考的动力。其次，合理规划时间，充分利用每一天，有计划地进行复习。\r\n\r\n在备考过程中，要善于总结，及时发现和纠正自己的不足。参加模拟考试，了解自己的考试水平，有针对性地调整备考计划。同时，保持良好的心态，遇到问题不要灰心丧气，相信自己的能力。希望我的经验分享能够帮助到正在备考的考生。', 1, '公考笔试', 9, 'admin8', 'avatar/2.jpeg', '2024-01-14 20:03:51');
INSERT INTO `civil_technical` VALUES (23, '军队文职招聘公告解读', 'article/7.png', '军队文职招聘是一项具有特殊性的招聘活动，招聘公告是考生了解岗位信息的关键。本文将对军队文职招聘公告进行详细解读，包括岗位要求、招聘流程等方面。首先，要仔细阅读招聘公告的每一个环节，了解岗位的特殊性。\r\n\r\n其次，关注报名材料的准备，确保自己具备报名条件。在备考过程中，要注重军事理论知识的学习，提高综合素质。同时，要了解军队的组织结构和文职人员的职责。祝愿所有报考军队文职的考生都能够顺利通过招聘环节。', 3, '军队文职', 10, 'admin9', 'avatar/3.jpeg', '2024-01-14 20:03:51');
INSERT INTO `civil_technical` VALUES (24, '事业单位招聘考试流程解析', 'article/8.png', '事业单位招聘考试是一种重要的人才选拔方式，了解考试流程有助于考生提前做好准备。本文将对事业单位招聘考试流程进行解析，包括笔试、面试等环节。首先，要仔细阅读招聘公告，了解报名条件和流程。\r\n\r\n在笔试阶段，要有针对性地复习相关知识，注重解题技巧。面试阶段，要注重形象和仪态，表达能力要清晰流利。此外，要了解招聘单位的特点，有针对性地展现自己的优势。祝愿所有报考事业单位的考生都能够取得优异的成绩。', 4, '事业单位', 11, 'admin10', 'avatar/4.jpeg', '2024-01-14 20:03:51');
INSERT INTO `civil_technical` VALUES (25, '三支一扶计划报名流程指南', 'article/1.png', '三支一扶计划是支持大学毕业生到农村服务的重要项目，了解报名流程是考生成功参与的第一步。本文将对三支一扶计划报名流程进行详细指导。首先，要提前了解招募信息，关注招聘公告发布的时间。\r\n\r\n在报名过程中，要准备好相关材料，确保符合报名条件。同时，要注重个人形象和能力的展现，在报名表和面试环节突出自己的特长和志愿服务经验。希望所有报考三支一扶计划的大学毕业生都能够成功入选。', 5, '三支一扶', 12, 'admin11', 'avatar/5.jpeg', '2024-01-14 20:03:51');
INSERT INTO `civil_technical` VALUES (26, '事业单位面试经验分享', 'article/2.png', '事业单位招聘中，面试是非常重要的一个环节。在事业单位面试中，考生需要展现出自己的综合素质和适应能力。本文将分享一位考生在事业单位面试中的经验。首先，要准备好常见问题的回答，如自我介绍、职业规划等。\r\n\r\n在面试过程中，要注重表达能力和沟通技巧，与面试官保持良好的互动。同时，要展现出对所应聘职位的热爱和了解。希望这些经验分享能够帮助即将参加事业单位面试的考生。', 4, '事业单位', 13, 'admin12', 'avatar/6.jpeg', '2024-01-14 20:03:51');
INSERT INTO `civil_technical` VALUES (27, '公务员考试心理调适建议', 'article/3.png', '公务员考试是一项压力较大的考试，考生需要保持良好的心理状态。本文将分享一些公务员考试心理调适的建议。首先，要保持积极的心态，相信自己的能力。\r\n\r\n在备考过程中，要适时休息，保证充足的睡眠。可以通过运动、听音乐等方式释放压力。同时，建议考生和家人、朋友保持沟通，分享自己的压力和困惑。希望这些建议能够帮助考生在考试中更好地发挥水平。', 1, '公考笔试', 1, 'lenzy', 'avatar/1.jpeg', '2024-01-14 20:03:51');
INSERT INTO `civil_technical` VALUES (28, '军队文职招聘面试技巧分享', 'article/4.png', '军队文职招聘是一项严格的选拔工作，面试是考生展示自己的关键环节。本文将分享一些军队文职招聘面试的技巧。首先，要了解军队文职的特殊性，注重军事理论知识的学习。\r\n\r\n在面试中，要注重形象和仪态，表达能力要清晰流利。要有针对性地准备案例题，展现解决问题的能力。同时，与考官保持良好的互动，展现出团队协作和沟通能力。希望这些建议对军队文职招聘面试的考生有所帮助。', 3, '军队文职', 2, 'admin1', 'avatar/2.jpeg', '2024-01-14 20:03:51');
INSERT INTO `civil_technical` VALUES (29, '事业单位笔试备考经验分享', 'article/5.png', '事业单位笔试是选拔人才的重要环节，考生在备考过程中需要掌握一些备考经验。本文将分享一位成功考入事业单位的考生的备考经验。首先，要制定合理的备考计划，有针对性地进行复习。\r\n\r\n在复习过程中，要注重知识的系统性学习，做到全面掌握考试内容。可以通过刷题、模拟考试等方式检验自己的水平。在考试前，要保持良好的状态，充分休息，确保有足够的精力参加考试。希望这些建议对事业单位笔试考生有所帮助。', 4, '事业单位', 3, 'admin2', 'avatar/3.jpeg', '2024-01-14 20:03:51');
INSERT INTO `civil_technical` VALUES (30, '公安招警体能测试注意事项', 'article/6.png', '公安招警是一项体能要求较高的招聘工作，体能测试是考生需要面对的关键环节。本文将分享一些公安招警体能测试的注意事项。首先，要提前了解体能测试的项目和标准，制定合理的训练计划。\r\n\r\n在训练过程中，要注重全面发展各项体能，包括耐力、爆发力等。在体能测试当天，要注意热身，保持良好的状态。同时，要保持良好的心理素质，保持冷静应对各项测试。希望这些注意事项对参加公安招警体能测试的考生有所帮助。', 6, '公安招警', 4, 'admin3', 'avatar/4.jpeg', '2024-01-14 20:03:51');
INSERT INTO `civil_technical` VALUES (31, '公考面试技巧与注意事项', 'article/7.png', '公考面试是考生展现自己综合素质的关键环节。本文将分享一些公考面试的技巧与注意事项。首先，要提前了解面试的形式和题型，进行有针对性的准备。\r\n\r\n在面试中，要注重表达能力和沟通技巧，与考官保持良好的互动。同时，要关注社会热点问题，展现自己对时事的了解。在面试过程中保持冷静，不要过分紧张。希望这些建议能够帮助参加公考面试的考生。', 2, '公考面试', 5, 'admin4', 'avatar/5.jpeg', '2024-01-14 20:05:19');
INSERT INTO `civil_technical` VALUES (32, '军队文职招聘笔试攻略', 'article/8.png', '军队文职招聘笔试是选拔人才的重要环节，考生需要掌握一些备考攻略。本文将分享一些军队文职招聘笔试的攻略。首先，要了解考试科目和题型，有针对性地进行复习。\r\n\r\n在复习过程中，要注重提高解题速度，可以通过刷题和模拟考试检验自己的水平。同时，要关注招聘公告中的重点内容，确保备考的方向正确。希望这些建议对即将参加军队文职招聘笔试的考生有所帮助。', 3, '军队文职', 6, 'admin5', 'avatar/6.jpeg', '2024-01-14 20:05:19');
INSERT INTO `civil_technical` VALUES (33, '三支一扶计划招募政策解读', 'article/1.png', '三支一扶计划是支持大学毕业生到农村服务的项目，了解招募政策是成功报名的关键。本文将对三支一扶计划的招募政策进行详细解读。首先，要了解报名条件和资格要求，确保自己符合报名条件。\r\n\r\n在报名过程中，要准备好相关材料，如学历证明、身份证等。要关注招募公告发布的时间，提前了解报名流程。希望这些解读能够帮助有意向参加三支一扶计划的大学毕业生。', 5, '三支一扶', 7, 'admin6', 'avatar/7.jpeg', '2024-01-14 20:05:19');
INSERT INTO `civil_technical` VALUES (34, '事业单位招聘面试案例分析', 'article/2.png', '事业单位招聘面试中，案例分析是一个常见的题型。本文将通过实际案例对事业单位招聘面试中的案例分析进行详细分析。首先，要了解案例的背景和问题，抓住关键信息。\r\n\r\n在回答问题时，要清晰地表达自己的分析思路和解决方案。同时，要注重与面试官的互动，展现自己的分析能力和判断力。希望这些案例分析能够帮助事业单位招聘面试考生更好地备战面试。', 4, '事业单位', 8, 'admin7', 'avatar/1.jpeg', '2024-01-14 20:05:19');
INSERT INTO `civil_technical` VALUES (35, '公务员考试经验分享', 'article/3.png', '公务员考试是一项竞争激烈的考试，考生们需要总结经验，不断提高备考效率。本文将分享一位成功考取公务员的考生的经验分享。首先，要制定科学的学习计划，合理安排每个科目的复习时间。\r\n\r\n在考试中，要注意答题技巧，提高解题速度。同时，要保持良好的心态，应对考试中的各种情况。希望这位考生的经验分享能够对即将参加公务员考试的考生有所启发。', 1, '公考笔试', 9, 'admin8', 'avatar/2.jpeg', '2024-01-14 20:05:19');
INSERT INTO `civil_technical` VALUES (36, '公务员申论高分策略分享', 'article/4.png', '公务员申论是考试中的重要科目，想要取得高分需要有一定的策略。本文将分享一些公务员申论高分策略。首先，要熟悉申论题型和常见的命题方向，有针对性地进行备考。\r\n\r\n在写作过程中，要注重论证的深度和广度，结构要清晰，论点要有说服力。同时，要勤加练习，提高写作速度和表达能力。希望这些建议能够帮助有意向参加公务员考试的考生。', 1, '公考笔试', 10, 'admin9', 'avatar/3.jpeg', '2024-01-14 20:05:19');
INSERT INTO `civil_technical` VALUES (37, '公考面试模拟题及解析', 'article/5.png', '公考面试是考生通过的关键，模拟题的练习可以帮助考生更好地适应考试环境。本文提供一些公考面试模拟题及解析。首先，要了解模拟题的题型和考察点，有针对性地进行准备。\r\n\r\n在解题过程中，要注重表达能力和思维逻辑，清晰地陈述自己的观点。同时，要关注解析，了解标准答案的要求。希望这些模拟题及解析能够帮助即将参加公考面试的考生。', 2, '公考面试', 11, 'admin10', 'avatar/4.jpeg', '2024-01-14 20:05:19');
INSERT INTO `civil_technical` VALUES (38, '军队文职招聘面试经验分享', 'article/6.png', '军队文职招聘面试是考生进入军队文职工作的重要关口，经验分享有助于提高面试水平。本文分享一位考生的军队文职招聘面试经验。首先，要了解面试的形式和内容，进行有针对性的准备。\r\n\r\n在面试中，要表达自己的职业素养和适应能力，展现对军队文职工作的热爱。同时，要注重仪表仪态，给面试官留下良好的印象。希望这位考生的经验分享对即将参加军队文职招聘面试的考生有所启发。', 3, '军队文职', 12, 'admin11', 'avatar/5.jpeg', '2024-01-14 20:05:19');
INSERT INTO `civil_technical` VALUES (39, '三支一扶计划服务心得体会', 'article/7.png', '三支一扶计划是为支持大学生到农村服务提供的机会，参与者在服务过程中有很多心得体会。本文分享一位参与三支一扶计划的大学生的服务心得。首先，要了解农村的实际情况，做好心理准备。\r\n\r\n在服务过程中，要与当地居民建立良好的关系，理解并尊重当地的文化。同时，要关注自身成长，不断提升服务能力。希望这位参与者的心得体会对有意向参加三支一扶计划的大学生有所启发。', 5, '三支一扶', 13, 'admin12', 'avatar/6.jpeg', '2024-01-14 20:05:19');
INSERT INTO `civil_technical` VALUES (40, '事业单位招聘笔试备考心得', 'article/8.png', '事业单位招聘笔试是考生进入事业单位工作的第一步，备考心得对于提高考试水平至关重要。本文分享一位成功考取事业单位职位的考生的备考心得。首先，要理清考试大纲，有针对性地进行知识点的学习。\r\n\r\n在做题过程中，要注重时间管理，提高解题速度。同时，要保持良好的心态，对待考试时要保持平和。希望这位考生的备考心得能够为即将参加事业单位招聘笔试的考生提供帮助。', 4, '事业单位', 1, 'lenzy', 'avatar/1.jpeg', '2024-01-14 20:05:19');
INSERT INTO `civil_technical` VALUES (41, '公安招警面试经验分享', 'article/1.png', '公安招警是一个竞争激烈的岗位，面试经验对于成功入选至关重要。本文分享一位成功通过公安招警面试的考生的经验。首先，要了解面试的考察点，进行有针对性的准备。\r\n\r\n在面试中，要表达对公安工作的热爱和责任心，同时展现出自己的团队协作能力。要注意形象仪表，给面试官留下良好的第一印象。希望这位考生的经验分享对即将参加公安招警面试的考生有所帮助。', 6, '公安招警', 2, 'admin1', 'avatar/2.jpeg', '2024-01-14 20:06:04');
INSERT INTO `civil_technical` VALUES (42, '公务员考试技巧与经验分享', 'article/2.png', '公务员考试是一个全面考察综合素质的考试，具备一定的技巧能够提高考试水平。本文分享一些公务员考试的技巧与经验。首先，要充分了解考试大纲，有针对性地进行知识点的复习。\r\n\r\n在考试中，要注重解题技巧，提高答题速度。同时，保持冷静，对待各类题型要有应对的策略。希望这些建议能够为即将参加公务员考试的考生提供一些帮助。', 1, '公考笔试', 3, 'admin2', 'avatar/3.jpeg', '2024-01-14 20:06:04');
INSERT INTO `civil_technical` VALUES (43, '公务员面试常见问题及答案', 'article/3.png', '公务员面试是考生进入面试环节的重要关口，了解常见问题及答案能够提高应对能力。本文总结了一些公务员面试常见问题及答案供考生参考。首先，要准备自我介绍，突出个人优势和适应公务员岗位的能力。\r\n\r\n在回答问题时，要结合实际经验，展示自己的实际能力。同时，要注意表达清晰，语言得体。希望这些问题及答案对即将参加公务员面试的考生有所帮助。', 2, '公考面试', 4, 'admin3', 'avatar/4.jpeg', '2024-01-14 20:06:04');
INSERT INTO `civil_technical` VALUES (44, '军队文职招聘笔试备考经验', 'article/4.png', '军队文职招聘笔试是军队文职人员选拔的重要环节，备考经验对于提高考试水平至关重要。本文分享了一位成功考取军队文职职位的考生的备考经验。首先，要理清考试大纲，有针对性地进行知识点的学习。\r\n\r\n在做题过程中，要注重时间管理，提高解题速度。同时，要保持良好的心态，对待考试时要保持平和。希望这位考生的备考经验对即将参加军队文职招聘笔试的考生提供一些建议。', 3, '军队文职', 5, 'admin4', 'avatar/5.jpeg', '2024-01-14 20:06:04');
INSERT INTO `civil_technical` VALUES (45, '事业单位招聘面试注意事项', 'article/5.png', '事业单位招聘面试是事业单位考试的重要组成部分，了解注意事项能够提高面试表现。本文总结了一些事业单位招聘面试的注意事项。首先，要注意仪表仪容，保持整洁得体。\r\n\r\n在回答问题时，要结合实际经验，突出个人实际能力。同时，要对所报考的事业单位有深入了解，展现自己的热爱和适应能力。希望这些建议对即将参加事业单位招聘面试的考生有所启发。', 4, '事业单位', 6, 'admin5', 'avatar/6.jpeg', '2024-01-14 20:06:04');
INSERT INTO `civil_technical` VALUES (46, '三支一扶面试心得分享', 'article/6.png', '三支一扶是一个关注基层社区服务的项目，面试心得对于成功入选至关重要。本文分享了一位成功通过三支一扶项目面试的考生的心得。首先，要了解三支一扶的服务宗旨，展现对社区服务的热爱。\r\n\r\n在面试中，要表达对团队协作的重视，同时突出自己在服务方面的经验和优势。希望这些建议对即将参加三支一扶项目面试的考生有所帮助。', 5, '三支一扶', 7, 'admin6', 'avatar/7.jpeg', '2024-01-14 20:06:04');
INSERT INTO `civil_technical` VALUES (47, '公考笔试高分经验分享', 'article/7.png', '公考笔试是众多考生进入公务员队伍的重要关卡，高分经验对于提高笔试水平至关重要。本文分享了一位成功考取公务员的考生的高分经验。首先，要理清考试大纲，有针对性地进行知识点的学习。\r\n\r\n在备考过程中，要注重模拟考试，提高答题速度和准确性。同时，要保持冷静，对待考试时要保持平和。希望这位考生的高分经验对即将参加公考笔试的考生有所启发。', 1, '公考笔试', 8, 'admin7', 'avatar/1.jpeg', '2024-01-14 20:06:04');
INSERT INTO `civil_technical` VALUES (48, '事业单位招聘面试经验分享', 'article/8.png', '事业单位招聘面试是考生进入事业单位工作的重要环节，经验分享对于提高面试水平至关重要。本文分享了一位成功通过事业单位招聘面试的考生的经验。首先，要准备自我介绍，突出个人优势和适应岗位的能力。\r\n\r\n在面试中，要注重表达清晰，回答问题时结合实际经验，展现实际能力。希望这些建议对即将参加事业单位招聘面试的考生有所帮助。', 4, '事业单位', 9, 'admin8', 'avatar/2.jpeg', '2024-01-14 20:06:04');
INSERT INTO `civil_technical` VALUES (49, '三支一扶招募政策解读', 'article/1.png', '三支一扶项目是面向高校毕业生的招募项目，政策解读对于了解招募条件至关重要。本文解读了三支一扶招募政策，包括报名条件、服务期限等方面。首先，要认真阅读招募公告，了解报名资格及要求。\r\n\r\n在准备材料时，要按照招募要求准备齐全。希望这些建议对即将参加三支一扶项目的考生有所帮助。', 5, '三支一扶', 10, 'admin9', 'avatar/3.jpeg', '2024-01-14 20:06:04');
INSERT INTO `civil_technical` VALUES (50, '公安招警笔试备考攻略', 'article/2.png', '公安招警笔试是公安部门选拔人才的重要环节，备考攻略对于提高笔试水平至关重要。本文总结了一位成功考取公安招警岗位的考生的备考攻略。首先，要理清考试大纲，有针对性地', 6, '公安招警', 11, 'admin10', 'avatar/4.jpeg', '2024-01-14 20:06:04');
INSERT INTO `civil_technical` VALUES (51, '军队文职面试经验分享', 'article/3.png', '军队文职面试是军队文职人员选拔的关键环节，经验分享对于提高面试水平至关重要。本文分享了一位成功通过军队文职面试的考生的经验。首先，要了解军队文职的服务宗旨，展现对军队事业的热爱。\r\n\r\n在面试中，要表达对团队协作的重视，同时突出自己在服务方面的经验和优势。希望这些建议对即将参加军队文职面试的考生有所帮助。', 3, '军队文职', 12, 'admin11', 'avatar/5.jpeg', '2024-01-14 20:06:49');
INSERT INTO `civil_technical` VALUES (52, '公务员面试技巧与注意事项', 'article/4.png', '公务员面试是考生进入公务员工作的关键环节，掌握技巧与注意事项能够提高面试表现。本文总结了一些公务员面试的技巧与注意事项。首先，要注重形象仪表，保持整洁得体。\r\n\r\n在回答问题时，要结合实际经验，突出个人实际能力。同时，要对所报考的公务员职位有深入了解，展现适应和热爱的态度。希望这些建议对即将参加公务员面试的考生有所启发。', 1, '公考笔试', 13, 'admin12', 'avatar/6.jpeg', '2024-01-14 20:06:49');
INSERT INTO `civil_technical` VALUES (53, '事业单位招聘笔试高分经验分享', 'article/5.png', '事业单位招聘笔试是事业单位考试的重要组成部分，高分经验分享对于提高笔试水平至关重要。本文分享了一位成功考取事业单位岗位的考生的高分经验。首先，要理清考试大纲，有针对性地进行知识点的学习。\r\n\r\n在备考过程中，要注重模拟考试，提高答题速度和准确性。同时，要保持冷静，对待考试时要保持平和。希望这位考生的高分经验对即将参加事业单位笔试的考生有所启发。', 4, '事业单位', 1, 'lenzy', 'avatar/1.jpeg', '2024-01-14 20:06:49');
INSERT INTO `civil_technical` VALUES (54, '三支一扶服务心得分享', 'article/6.png', '三支一扶项目是一项为社区服务的公益项目，服务心得分享对于了解项目特点及服务经验至关重要。本文分享了一位三支一扶志愿者的服务心得。首先，要深入社区，了解社区需求，制定有针对性的服务计划。\r\n\r\n在服务过程中，要注重团队协作，发挥个人专长，提高服务质量。希望这位志愿者的服务心得对即将参加三支一扶项目的志愿者有所启发。', 5, '三支一扶', 2, 'admin1', 'avatar/2.jpeg', '2024-01-14 20:06:49');
INSERT INTO `civil_technical` VALUES (55, '公安招警面试注意事项', 'article/7.png', '公安招警是一个高度专业化的岗位，面试是选拔人才的关键环节。本文总结了一些公安招警面试的注意事项。首先，要了解公安招警的岗位特点，突出个人对公安事业的责任心。\r\n\r\n在面试中，要表达对团队协作的认同，并展现自己的应变能力。希望这些建议对即将参加公安招警面试的考生有所帮助。', 6, '公安招警', 3, 'admin2', 'avatar/3.jpeg', '2024-01-14 20:06:49');
INSERT INTO `civil_technical` VALUES (56, '军队文职招聘面试技巧', 'article/8.png', '军队文职招聘面试是军队文职选拔的重要环节，技巧是提高面试水平的关键。本文分享了一些军队文职招聘面试的技巧。首先，要了解军队文职的服务宗旨，展现对军队事业的热爱。\r\n\r\n在面试中，要突出个人在服务方面的经验和优势，同时表达对团队协作的认同。希望这些建议对即将参加军队文职招聘面试的考生有所帮助。', 3, '军队文职', 4, 'admin3', 'avatar/4.jpeg', '2024-01-14 20:06:49');
INSERT INTO `civil_technical` VALUES (57, '公务员面试案例分析', 'article/1.png', '公务员面试是一个全面考察综合素质的环节，案例分析有助于理解面试题目。本文分享了一些公务员面试案例分析。首先，要注重案例中的关键问题，深入思考解决方案。\r\n\r\n在面试中，要结合个人经验，展现对问题的深刻理解和解决能力。希望这些案例分析对即将参加公务员面试的考生有所启发。', 1, '公考笔试', 5, 'admin4', 'avatar/5.jpeg', '2024-01-14 20:06:49');
INSERT INTO `civil_technical` VALUES (58, '三支一扶招聘政策解读', 'article/2.png', '三支一扶项目是一项服务社区的招聘项目，政策解读对于了解项目特点至关重要。本文解读了三支一扶招聘政策。首先，要了解项目的服务宗旨，明确招聘的岗位和要求。\r\n\r\n在申请过程中，要注意材料准备，确保符合招聘条件。希望这份政策解读对即将参加三支一扶招聘的申请者有所帮助。', 5, '三支一扶', 6, 'admin5', 'avatar/6.jpeg', '2024-01-14 20:06:49');
INSERT INTO `civil_technical` VALUES (59, '公务员笔试经验分享', 'article/3.png', '公务员笔试是通过公务员考试的第一关，经验分享对于备考至关重要。本文分享了一位成功考取公务员的考生的笔试经验。首先，要了解考试大纲，有针对性地进行复习。\r\n\r\n在笔试中，要注重时间分配，提高解题速度。同时，要保持良好的心态，对待考试时要保持冷静。希望这位考生的经验分享对即将参加公务员笔试的考生有所帮助。', 1, '公考笔试', 7, 'admin6', 'avatar/7.jpeg', '2024-01-14 20:06:49');
INSERT INTO `civil_technical` VALUES (60, '事业单位招聘笔试技巧', 'article/4.png', '事业单位招聘笔试是考生进入面试环节的重要关口，技巧是提高笔试水平的关键。本文分享了一些事业单位招聘笔试的技巧。首先，要充分了解考试科目，有针对性地进行知识点的学习。\r\n\r\n在笔试中，要注重解题技巧，提高答题速度。同时，要保持冷静，对待各类题型要有应对的策略。希望这些建议能够为即将参加事业单位招聘笔试的考生提供一些帮助。', 4, '事业单位', 8, 'admin7', 'avatar/1.jpeg', '2024-01-14 20:06:49');
INSERT INTO `civil_technical` VALUES (61, '公务员面试技巧与注意事项', 'article/5.png', '公务员面试是一个决定是否录用的关键环节，技巧与注意事项至关重要。本文分享了一些公务员面试的技巧与注意事项。首先，要在面试前做好充分准备，了解招聘单位的背景和要求。\r\n\r\n在面试中，要注重表达能力，清晰地陈述观点。同时，要保持良好的仪表仪容，给面试官留下良好印象。希望这些建议对即将参加公务员面试的考生有所帮助。', 2, '公考面试', 9, 'admin8', 'avatar/2.jpeg', '2024-01-14 20:07:27');
INSERT INTO `civil_technical` VALUES (62, '军队文职招聘面试经验分享', 'article/6.png', '军队文职招聘是一项选拔人才的重要工作，面试经验分享对于备考至关重要。本文分享了一位成功通过军队文职招聘面试的考生的经验。首先，要了解面试的流程和考察要点。\r\n\r\n在面试中，要展现自己的综合素质和适应能力，同时对军队事业有坚定的信念。希望这位考生的经验分享对即将参加军队文职招聘面试的考生提供一些建议。', 3, '军队文职', 10, 'admin9', 'avatar/3.jpeg', '2024-01-14 20:07:27');
INSERT INTO `civil_technical` VALUES (63, '事业单位招聘笔试解题技巧', 'article/7.png', '事业单位招聘笔试是决定是否进入面试环节的重要考试，解题技巧是提高分数的关键。本文分享了一些事业单位招聘笔试解题技巧。首先，要仔细阅读题目，理清解题思路。\r\n\r\n在答题过程中，要注重细节，注意计算过程和步骤。同时，要合理分配时间，确保各个题目都能够有所涉猎。希望这些建议能够为即将参加事业单位招聘笔试的考生提供一些参考。', 4, '事业单位', 11, 'admin10', 'avatar/4.jpeg', '2024-01-14 20:07:27');
INSERT INTO `civil_technical` VALUES (64, '公安招警笔试备考心得', 'article/8.png', '公安招警是一个高度竞争的岗位，笔试备考至关重要。本文分享了一位成功考取公安招警的考生的备考心得。首先，要理清考试大纲，有针对性地进行知识点的学习。\r\n\r\n在笔试中，要注重解题技巧，提高答题速度。同时，要保持良好的心态，对待考试时要保持冷静。希望这位考生的心得分享对即将参加公安招警笔试的考生有所启发。', 6, '公安招警', 12, 'admin11', 'avatar/5.jpeg', '2024-01-14 20:07:27');
INSERT INTO `civil_technical` VALUES (65, '三支一扶招聘面试技巧', 'article/1.png', '三支一扶招聘是一个服务社区的岗位，面试技巧对于成功入选至关重要。本文分享了一些三支一扶招聘面试技巧。首先，要了解社区服务的特点和需求。\r\n\r\n在面试中，要表达对服务社区的热爱和责任心。同时，要展现出自己的团队协作能力和解决问题的能力。希望这些建议能够为即将参加三支一扶招聘面试的考生提供一些帮助。', 5, '三支一扶', 13, 'admin12', 'avatar/6.jpeg', '2024-01-14 20:07:27');
INSERT INTO `civil_technical` VALUES (66, '公务员招聘考试大纲解读', 'article/2.png', '公务员招聘考试大纲是备考的重要依据，深入解读对于有针对性的复习至关重要。本文分享了一份公务员招聘考试大纲的解读。首先，要了解各科目的考察重点和难点。\r\n\r\n在复习过程中，要结合大纲进行有针对性的备考，注重基础知识的掌握。希望这份解读能够为即将参加公务员招聘考试的考生提供一些建议。', 1, '公考笔试', 1, 'lenzy', 'avatar/1.jpeg', '2024-01-14 20:07:27');
INSERT INTO `civil_technical` VALUES (67, '公安招警面试注意事项', 'article/3.png', '公安招警是一个特殊而重要的职位，面试是考察应聘者素质的重要环节。本文总结了一些公安招警面试的注意事项。首先，要了解公安工作的性质和要求。\r\n\r\n在面试中，要表达对公安事业的热爱和责任心，同时展现出自己的冷静应对能力。希望这些建议对即将参加公安招警面试的考生有所帮助。', 6, '公安招警', 2, 'admin1', 'avatar/2.jpeg', '2024-01-14 20:07:27');
INSERT INTO `civil_technical` VALUES (68, '三支一扶招聘考试大纲详解', 'article/4.png', '三支一扶招聘考试大纲是备考的指导方针，详细了解对备考有很大的帮助。本文详细解读了三支一扶招聘考试大纲。首先，要理清各科目的考察范围和重点。\r\n\r\n在备考过程中，要有目标地进行知识点的学习，注重实际应用能力的培养。希望这份详解能够为即将参加三支一扶招聘考试的考生提供一些指导。', 5, '三支一扶', 3, 'admin2', 'avatar/3.jpeg', '2024-01-14 20:07:27');
INSERT INTO `civil_technical` VALUES (69, '事业单位招聘笔试技巧分享', 'article/5.png', '事业单位招聘笔试是很多人迈入职场的一个重要通道，掌握一些技巧能够更好地备考。本文分享了一些事业单位招聘笔试技巧。首先，要熟悉考试大纲，了解考试的题型和分值。\r\n\r\n在解题过程中，要注重时间管理，合理安排每道题目的答题时间。希望这些建议能够为即将参加事业单位招聘笔试的考生提供一些帮助。', 4, '事业单位', 4, 'admin3', 'avatar/4.jpeg', '2024-01-14 20:07:27');
INSERT INTO `civil_technical` VALUES (70, '军队文职招聘面试经验分享', 'article/6.png', '军队文职招聘面试是军队选拔文职人员的重要环节，了解经验对于成功入选很有帮助。本文分享了一位成功通过军队文职招聘面试的考生的经验。首先，要了解面试的评分要点，进行有针对性的准备。\r\n\r\n在面试中，要表达对军队文职工作的热爱和责任心，同时展现出自己的团队协作精神。希望这位考生的经验分享对即将参加军队文职招聘面试的考生有所启发。', 3, '军队文职', 5, 'admin4', 'avatar/5.jpeg', '2024-01-14 20:07:27');
INSERT INTO `civil_technical` VALUES (71, '公考面试技巧与注意事项分享', 'article/7.png', '参加公务员考试面试是一个重要的环节，具备一定的技巧和注意事项能够提高面试表现。本文分享了一些公务员面试技巧与注意事项。首先，要注意仪表仪容，给面试官留下良好的第一印象。\r\n\r\n在回答问题时，要清晰明了，表达能力要强。希望这些建议能够为即将参加公务员面试的考生提供一些帮助。', 2, '公考面试', 6, 'JacksonMiller', 'avatar/6.jpg', '2024-01-14 20:08:07');
INSERT INTO `civil_technical` VALUES (72, '事业单位招聘面试常见问题及答案', 'article/8.png', '事业单位招聘面试是关键环节，了解常见问题及答案能够提高应对能力。本文总结了一些事业单位招聘面试常见问题及答案。首先，要准备自我介绍，介绍时要突出与应聘职位相关的经验和能力。\r\n\r\n在回答问题时，要实事求是，展示出自己的实际能力。希望这些问题及答案对即将参加事业单位招聘面试的考生有所帮助。', 4, '事业单位', 7, 'admin6', 'avatar/7.jpeg', '2024-01-14 20:08:07');
INSERT INTO `civil_technical` VALUES (73, '三支一扶招聘笔试常见错误及避免方法', 'article/1.png', '三支一扶招聘笔试是一个重要的环节，了解常见错误及避免方法有助于提高考试水平。本文总结了一些三支一扶招聘笔试常见错误及避免方法。首先，要注意审题，确保理解题意后再作答。\r\n\r\n在答题过程中，要注意细节，避免粗心大意导致失分。希望这些建议能够为即将参加三支一扶招聘笔试的考生提供一些参考。', 5, '三支一扶', 8, 'admin7', 'avatar/1.jpeg', '2024-01-14 20:08:07');
INSERT INTO `civil_technical` VALUES (74, '公安招警笔试备考经验分享', 'article/2.png', '公安招警笔试是一个关键环节，备考经验对于成功通过考试至关重要。本文分享了一位成功通过公安招警笔试的考生的经验。首先，要制定合理的学习计划，有针对性地进行复习。\r\n\r\n在考试中，要冷静应对，掌握好时间，避免因时间不足而影响答题质量。希望这位考生的经验分享对即将参加公安招警笔试的考生有所启发。', 6, '公安招警', 9, 'admin8', 'avatar/2.jpeg', '2024-01-14 20:08:07');
INSERT INTO `civil_technical` VALUES (75, '军队文职招聘面试技巧与注意事项', 'article/3.png', '军队文职招聘面试是选拔文职人员的重要环节，具备一定的技巧和注意事项对于成功面试至关重要。本文分享了一些军队文职招聘面试技巧与注意事项。首先，要了解面试评分标准，有针对性地准备。\r\n\r\n在面试中，要展现出自己的实际能力，同时注意言行举止，保持得体。希望这些建议能够为即将参加军队文职招聘面试的考生提供一些建议。', 3, '军队文职', 10, 'admin9', 'avatar/3.jpeg', '2024-01-14 20:08:07');
INSERT INTO `civil_technical` VALUES (76, '公务员招聘面试常见问题及答案', 'article/4.png', '公务员招聘面试是考察应聘者素质和能力的关键环节，了解常见问题及答案能够提高应对能力。本文总结了一些公务员招聘面试常见问题及答案。首先，要准备自我介绍，突出个人的特长和适应能力。\r\n\r\n在回答问题时，要实事求是，言之有物。希望这些问题及答案对即将参加公务员招聘面试的考生有所启发。', 1, '公考笔试', 11, 'admin10', 'avatar/4.jpeg', '2024-01-14 20:08:07');
INSERT INTO `civil_technical` VALUES (77, '三支一扶招聘面试技巧分享', 'article/5.png', '三支一扶招聘考试面试是考察综合素质的关键环节，具备一定技巧能够提高表现。本文分享了一些三支一扶招聘面试技巧。首先，要了解面试的形式和考察要点，有针对性地准备。\r\n\r\n在面试中，要表现出自己的实际经验和能力，同时保持冷静应对各种问题。希望这些建议能够为即将参加三支一扶招聘面试的考生提供一些建议。', 5, '三支一扶', 12, 'admin11', 'avatar/5.jpeg', '2024-01-14 20:08:07');
INSERT INTO `civil_technical` VALUES (78, '事业单位招聘笔试经验分享', 'article/6.png', '事业单位招聘笔试是选拔人才的重要环节，备考经验对于提高考试水平至关重要。本文分享了一位成功通过事业单位招聘笔试的考生的经验。首先，要充分了解考试大纲，有针对性地进行复习。\r\n\r\n在考试中，要注重答题技巧，提高解题速度。希望这位考生的经验分享对即将参加事业单位招聘笔试的考生有所帮助。', 4, '事业单位', 13, 'admin12', 'avatar/6.jpeg', '2024-01-14 20:08:07');
INSERT INTO `civil_technical` VALUES (79, '公安招警招聘考试大纲解析', 'article/7.png', '公安招警招聘考试大纲是备考的指导方针，深入解析对于备考有很大帮助。本文对公安招警招聘考试大纲进行了详细解析。首先，要了解各科目的考察范围和难点。\r\n\r\n在备考过程中，要结合大纲进行有针对性的复习，注重基础知识的掌握。希望这份解析能够为即将参加公安招警招聘考试的考生提供一些建议。', 6, '公安招警', 1, 'lenzy', 'avatar/1.jpeg', '2024-01-14 20:08:07');
INSERT INTO `civil_technical` VALUES (80, '三支一扶招聘笔试技巧分享', 'article/8.png', '三支一扶招聘笔试是选拔人才的关键环节，具备一定技巧能够更好地备考。本文分享了一些三支一扶招聘笔试技巧。首先，要熟悉考试大纲，了解考试的题型和分值。\r\n\r\n在解题过程中，要注重时间管理，合理安排每道题目的答题时间。希望这些建议能够为即将参加三支一扶招聘笔试的考生提供一些帮助。', 5, '三支一扶', 2, 'admin1', 'avatar/2.jpeg', '2024-01-14 20:08:07');
INSERT INTO `civil_technical` VALUES (81, '军队文职招聘笔试经验分享', 'article/1.png', '军队文职招聘笔试是军队选拔文职人员的重要环节，备考经验对于提高考试水平至关重要。本文分享了一位成功考取军队文职职位的考生的备考经验。首先，要理清考试大纲，有针对性地进行知识点的学习。\r\n\r\n在做题过程中，要注重时间管理，提高解题速度。同时，要保持良好的心态，对待考试时要保持平和。希望这位考生的备考经验对即将参加军队文职招聘笔试的考生提供一些建议。', 3, '军队文职', 3, 'admin2', 'avatar/3.jpeg', '2024-01-14 20:09:02');
INSERT INTO `civil_technical` VALUES (82, '事业单位招聘面试经验分享', 'article/2.png', '事业单位招聘面试是事业单位考试的重要组成部分，了解经验能够提高面试表现。本文分享了一位成功通过事业单位招聘面试的考生的经验。首先，要准备自我介绍，突出个人实际经验和适应能力。\r\n\r\n在回答问题时，要结合实际情况，展示自己的实际经验。希望这位考生的经验分享对即将参加事业单位招聘面试的考生有所帮助。', 4, '事业单位', 4, 'admin3', 'avatar/4.jpeg', '2024-01-14 20:09:02');
INSERT INTO `civil_technical` VALUES (83, '公务员考试备考计划分享', 'article/3.png', '公务员考试是一个全面考察综合素质的考试，制定合理的备考计划对于备考很有帮助。本文分享了一份公务员考试备考计划。首先，要明确考试科目和大纲要求，有针对性地制定每科的学习计划。\r\n\r\n在备考过程中，要注重模拟考试，检验自己的考试水平。希望这份备考计划能够为即将参加公务员考试的考生提供一些建议。', 1, '公考笔试', 5, 'admin4', 'avatar/5.jpeg', '2024-01-14 20:09:02');
INSERT INTO `civil_technical` VALUES (84, '三支一扶招聘面试注意事项', 'article/4.png', '三支一扶招聘面试是选拔人才的重要环节，了解注意事项能够提高面试表现。本文总结了一些三支一扶招聘面试的注意事项。首先，要注重仪表仪容，保持整洁得体。\r\n\r\n在回答问题时，要结合实际经验，突出个人实际能力。同时，要对所报考的三支一扶岗位有深入了解，展现自己的热爱和适应能力。希望这些建议对即将参加三支一扶招聘面试的考生有所启发。', 5, '三支一扶', 6, 'admin5', 'avatar/6.jpeg', '2024-01-14 20:09:02');
INSERT INTO `civil_technical` VALUES (85, '事业单位招聘笔试经验分享', 'article/5.png', '事业单位招聘笔试是很多人迈入职场的一个重要通道，备考经验对于提高考试水平至关重要。本文分享了一位成功考取事业单位职位的考生的备考经验。首先，要理清考试大纲，有针对性地进行知识点的学习。\r\n\r\n在做题过程中，要注重时间管理，提高解题速度。同时，要保持良好的心态，对待考试时要保持平和。希望这位考生的备考经验对即将参加事业单位招聘笔试的考生提供一些建议。', 4, '事业单位', 7, 'admin6', 'avatar/7.jpeg', '2024-01-14 20:09:02');
INSERT INTO `civil_technical` VALUES (86, '公务员考试面试技巧分享', 'article/6.png', '公务员考试面试是考察应聘者素质的重要环节，具备一定的面试技巧能够提高面试表现。本文分享了一些公务员考试面试技巧。首先，要准备自我介绍，突出个人实际经验和适应能力。\r\n\r\n在回答问题时，要结合实际情况，展示自己的实际经验。同时，要注意表达清晰，语言得体。希望这些建议能够为即将参加公务员考试面试的考生提供一些帮助。', 1, '公考笔试', 8, 'admin7', 'avatar/1.jpeg', '2024-01-14 20:09:02');
INSERT INTO `civil_technical` VALUES (87, '公安招警笔试技巧与经验分享', 'article/7.png', '公安招警笔试是一个竞争激烈的考试，备考经验对于提高考试水平至关重要。本文分享了一位成功考取公安招警职位的考生的笔试技巧与经验。首先，要理清考试大纲，有针对性地进行知识点的学习。\r\n\r\n在做题过程中，要注重解题技巧，提高答题速度。同时，要保持良好的心态，对待考试时要保持平和。希望这位考生的经验分享对即将参加公安招警笔试的考生提供一些建议。', 6, '公安招警', 9, 'admin8', 'avatar/2.jpeg', '2024-01-14 20:09:02');
INSERT INTO `civil_technical` VALUES (88, '三支一扶招聘笔试注意事项', 'article/8.png', '三支一扶招聘笔试是选拔人才的重要环节，了解注意事项能够提高考试表现。本文总结了一些三支一扶招聘笔试的注意事项。首先，要了解各科目的考察范围和难点。\r\n\r\n在备考过程中，要有目标地进行知识点的学习，注重实际应用能力的培养。希望这些建议对即将参加三支一扶招聘笔试的考生有所启发。', 5, '三支一扶', 10, 'admin9', 'avatar/3.jpeg', '2024-01-14 20:09:02');
INSERT INTO `civil_technical` VALUES (89, '军队文职招聘面试技巧分享', 'article/1.png', '军队文职招聘面试是军队选拔文职人员的重要环节，了解一些面试技巧对于成功入选很有帮助。本文分享了一位成功通过军队文职招聘面试的考生的技巧与经验。首先，要了解面试的考察要点，进行有针对性的准备。\r\n\r\n在面试中，要表达对军队文职工作的热爱和责任心，同时展现出自己的团队协作能力。希望这位考生的技巧分享对即将参加军队文职招聘面试的考生有所启发。', 3, '军队文职', 11, 'admin10', 'avatar/4.jpeg', '2024-01-14 20:09:02');
INSERT INTO `civil_technical` VALUES (90, '事业单位招聘面试经验分享', 'article/2.png', '事业单位招聘面试是考生进入面试环节的重要关口，了解一些经验能够提高面试水平。本文分享了一位成功通过事业单位招聘面试的考生的经验。首先，要了解面试的评分要点，进行有针对性的准备。\r\n\r\n在面试中，要表达对事业单位工作的热爱和责任心，同时展现出自己的实际能力。希望这位考生的经验分享对即将参加事业单位招聘面试的考生有所帮助。', 4, '事业单位', 12, 'admin11', 'avatar/5.jpeg', '2024-01-14 20:09:02');
INSERT INTO `civil_technical` VALUES (91, '公务员招聘笔试备考攻略', 'article/3.png', '公务员招聘笔试备考是考生成功的第一步，制定科学的备考计划能够提高备考效果。本文分享了一份公务员招聘笔试备考攻略。首先，要制定详细的备考计划，明确每个阶段的目标。\r\n\r\n在备考过程中，要注重知识点的系统梳理，做到全面掌握。希望这份攻略能够为即将参加公务员招聘笔试的考生提供一些建议。', 1, '公考笔试', 13, 'admin12', 'avatar/6.jpeg', '2024-01-14 20:14:10');
INSERT INTO `civil_technical` VALUES (92, '公安招警笔试常见题型解析', 'article/4.png', '公安招警笔试是一个综合性考试，熟悉常见题型对备考有很大帮助。本文解析了一些公安招警笔试的常见题型。首先，要了解各科目的题型分布和重点。\r\n\r\n在备考过程中，要有重点突破，注重解题技巧。希望这些建议能够为即将参加公安招警笔试的考生提供一些帮助。', 6, '公安招警', 1, 'lenzy', 'avatar/1.jpeg', '2024-01-14 20:14:10');
INSERT INTO `civil_technical` VALUES (93, '三支一扶招聘面试技巧分享', 'article/5.png', '三支一扶招聘面试是选拔人才的重要环节，具备一定的面试技巧能够提高面试表现。本文分享了一些三支一扶招聘面试技巧。首先，要准备自我介绍，突出个人实际经验和适应能力。\r\n\r\n在回答问题时，要结合实际情况，展示自己的实际经验。希望这些建议能够为即将参加三支一扶招聘面试的考生提供一些帮助。', 5, '三支一扶', 2, 'admin1', 'avatar/2.jpeg', '2024-01-14 20:14:10');
INSERT INTO `civil_technical` VALUES (94, '事业单位招聘笔试常见错误分析', 'article/6.png', '事业单位招聘笔试中，很多考生容易犯一些常见的错误，了解并避免这些错误对备考有益。本文分析了一些事业单位招聘笔试中常见的错误。首先，要认真审题，确保理解题意。\r\n\r\n在答题过程中，要注意细节，防止因粗心而丢分。希望这些建议能够为即将参加事业单位招聘笔试的考生提供一些启示。', 4, '事业单位', 3, 'admin2', 'avatar/3.jpeg', '2024-01-14 20:14:10');
INSERT INTO `civil_technical` VALUES (95, '军队文职招聘笔试答题技巧分享', 'article/7.png', '军队文职招聘笔试是选拔人才的重要环节，具备一定的答题技巧能够提高答题效率。本文分享了一些军队文职招聘笔试的答题技巧。首先，要仔细阅读题目，确保理解清楚每一道题。\r\n\r\n在答题时，要注重解题思路，合理安排时间。希望这些建议能够为即将参加军队文职招聘笔试的考生提供一些建议。', 3, '军队文职', 4, 'admin3', 'avatar/4.jpeg', '2024-01-14 20:14:10');
INSERT INTO `civil_technical` VALUES (96, '公务员招聘面试中的沟通技巧', 'article/8.png', '公务员招聘面试中，良好的沟通技巧是成功的关键之一。本文分享了一些在公务员招聘面试中应用的沟通技巧。首先，要保持自信，表达清晰。\r\n\r\n在回答问题时，要有条理，突出重点，与面试官保持良好的沟通。希望这些建议能够为即将参加公务员招聘面试的考生提供一些建议。', 1, '公考笔试', 5, 'admin4', 'avatar/5.jpeg', '2024-01-14 20:14:10');
INSERT INTO `civil_technical` VALUES (97, '公安招警体能测试准备指南', 'article/1.png', '公安招警体能测试是选拔过程中的重要环节，科学合理的准备能够提高体能表现。本文提供了一份公安招警体能测试准备指南。首先，要了解测试项目和标准。\r\n\r\n在准备过程中，要有针对性地进行相关训练，提高身体素质。希望这份指南能够为即将参加公安招警体能测试的考生提供一些建议。', 6, '公安招警', 6, 'admin5', 'avatar/6.jpeg', '2024-01-14 20:14:10');
INSERT INTO `civil_technical` VALUES (98, '三支一扶招聘考试注意事项', 'article/2.png', '三支一扶招聘考试是选拔人才的重要环节，了解注意事项能够提高考试表现。本文总结了一些三支一扶招聘考试的注意事项。首先，要提前了解考试内容和考察要点。\r\n\r\n在考试中，要保持冷静，合理安排时间，注重答题技巧。希望这些建议能够为即将参加三支一扶招聘考试的考生提供一些建议。', 5, '三支一扶', 7, 'admin6', 'avatar/7.jpeg', '2024-01-14 20:14:10');
INSERT INTO `civil_technical` VALUES (99, '事业单位招聘面试中的形象与仪表', 'article/3.png', '事业单位招聘面试中，良好的形象和仪表给面试官留下良好的印象。本文分享了一些在事业单位招聘面试中的形象与仪表注意事项。首先，要穿着得体，注意服装搭配。\r\n\r\n在面试中，要注意仪表仪容，展现出端庄得体的形象。希望这些建议能够为即将参加事业单位招聘面试的考生提供一些指导。', 4, '事业单位', 8, 'admin7', 'avatar/1.jpeg', '2024-01-14 20:14:10');
INSERT INTO `civil_technical` VALUES (100, '军队文职招聘面试注意事项', 'article/4.png', '军队文职招聘面试是选拔人才的关键环节，了解注意事项能够提高面试表现。本文总结了一些军队文职招聘面试的注意事项。首先，要了解军队文职工作的特点和要求。\r\n\r\n在面试中，要展现出对军队文职工作的热爱和适应能力。希望这些建议能够为即将参加军队文职招聘面试的考生提供一些帮助。', 3, '军队文职', 9, 'admin8', 'avatar/2.jpeg', '2024-01-14 20:14:10');
INSERT INTO `civil_technical` VALUES (101, '公务员考试心理调适策略', 'article/5.png', '公务员考试压力大，心理调适至关重要。本文分享了一些公务员考试心理调适的策略。首先，要保持乐观的心态，对考试有信心。\r\n\r\n在备考过程中，要适时放松，避免紧张影响发挥。希望这些建议能够为即将参加公务员考试的考生提供一些帮助。', 1, '公考笔试', 10, 'admin9', 'avatar/3.jpeg', '2024-01-14 20:17:05');
INSERT INTO `civil_technical` VALUES (102, '公安招警笔试备考经验分享', 'article/6.png', '公安招警笔试是选拔人才的重要环节，备考经验对于成功通过至关重要。本文分享了一位成功考取公安招警的考生的备考经验。首先，要理清考试大纲，有针对性地进行知识点的学习。\r\n\r\n在解题过程中，要注重答题技巧，提高答题速度。希望这位考生的经验分享对即将参加公安招警笔试的考生提供一些建议。', 6, '公安招警', 11, 'admin10', 'avatar/4.jpeg', '2024-01-14 20:17:05');
INSERT INTO `civil_technical` VALUES (103, '三支一扶招聘面试注意事项', 'article/7.png', '三支一扶招聘面试是选拔人才的重要环节，了解注意事项能够提高面试表现。本文总结了一些三支一扶招聘面试的注意事项。首先，要了解面试评分要点和考察内容。\r\n\r\n在面试中，要突出个人优势，展现适应工作的能力。希望这些建议能够为即将参加三支一扶招聘面试的考生提供一些建议。', 5, '三支一扶', 12, 'admin11', 'avatar/5.jpeg', '2024-01-14 20:17:05');
INSERT INTO `civil_technical` VALUES (104, '事业单位招聘面试技巧分享', 'article/8.png', '事业单位招聘面试是很多人迈入职场的一个重要通道，掌握一些技巧能够更好地备考。本文分享了一些事业单位招聘面试技巧。首先，要熟悉招聘单位的背景和职责。\r\n\r\n在面试中，要结合实际经验，突出个人能力。希望这些建议能够为即将参加事业单位招聘面试的考生提供一些指导。', 4, '事业单位', 13, 'admin12', 'avatar/6.jpeg', '2024-01-14 20:17:05');

-- ----------------------------
-- Table structure for civil_user
-- ----------------------------
DROP TABLE IF EXISTS `civil_user`;
CREATE TABLE `civil_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录名称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录密码',
  `user_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户邮箱',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `signature` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '个性签名',
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '未知' COMMENT '用户性别',
  `free_view_number` int NULL DEFAULT NULL COMMENT '免费次数',
  `head_portrait` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'avatar/defualt.png' COMMENT '用户头像',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除(0:正常、1:禁用、2:删除)',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of civil_user
-- ----------------------------
INSERT INTO `civil_user` VALUES (1, 'Miss', 'M3iNdz1sYhs6U8nlSn+bqg==', '2026661261@qq.com', '王罗源', '热衷于摄影和创作的，追逐梦想的艺术家', '男', 29, 'avatar/1.png', '2023-12-11 06:22:49', 0);
INSERT INTO `civil_user` VALUES (2, 'Ocean', 'M3iNdz1sYhs6U8nlSn+bqg==', '2521085414@qq.com', '严唐钟', '热爱户外活动和冒险的，追逐自然的足迹', '女', 0, 'avatar/2.jpg', '2023-12-12 03:31:25', 0);
INSERT INTO `civil_user` VALUES (3, 'Jerry', 'M3iNdz1sYhs6U8nlSn+bqg==', '2145325154@qq.com', '林伟杰', '喜欢品味不同美食和烹饪', '男', 0, 'avatar/3.jpg', '2023-12-15 06:14:50', 0);
INSERT INTO `civil_user` VALUES (4, 'JohnDoe', 'M3iNdz1sYhs6U8nlSn+bqg==', '123456@qq.com', '张明华', '喜欢探索未知世界', '男', 0, 'avatar/4.jpg', '2024-01-13 19:44:55', 0);
INSERT INTO `civil_user` VALUES (5, 'EmmaSmith', 'M3iNdz1sYhs6U8nlSn+bqg==', '654321@qq.com', '王小芳', '热爱艺术和阅读', '女', 0, 'avatar/5.jpg', '2024-01-13 19:44:55', 0);
INSERT INTO `civil_user` VALUES (6, 'JacksonMiller', 'M3iNdz1sYhs6U8nlSn+bqg==', '987654321@qq.com', '李文娜', '梦想成为科技领域的领导者', '男', 0, 'avatar/6.jpg', '2024-01-13 19:44:55', 0);
INSERT INTO `civil_user` VALUES (7, 'OliviaClark', 'M3iNdz1sYhs6U8nlSn+bqg==', '111222@qq.com', '刘力强', '热衷于保护自然环境', '女', 0, 'avatar/7.jpg', '2024-01-13 19:44:55', 0);
INSERT INTO `civil_user` VALUES (8, 'WilliamHall', 'M3iNdz1sYhs6U8nlSn+bqg==', '999999@qq.com', '陈小静', '喜欢挑战极限的冒险者', '男', 0, 'avatar/8.jpg', '2024-01-13 19:44:55', 0);
INSERT INTO `civil_user` VALUES (9, 'SophiaBaker', 'M3iNdz1sYhs6U8nlSn+bqg==', '123456789@qq.com', '周大勇', '热爱音乐和写作的自由灵魂', '女', 0, 'avatar/9.jpg', '2024-01-13 19:44:55', 0);
INSERT INTO `civil_user` VALUES (10, 'MichaelTurner', 'M3iNdz1sYhs6U8nlSn+bqg==', '9876543@qq.com', '赵小敏', '追求科学和知识的探索者', '男', 0, 'avatar/10.jpg', '2024-01-13 19:44:55', 0);
INSERT INTO `civil_user` VALUES (11, 'IsabellaWhite', 'M3iNdz1sYhs6U8nlSn+bqg==', '87654321@qq.com', '杨明达', '梦想成为社会的改变者', '女', 0, 'avatar/11.jpg', '2024-01-13 19:44:55', 0);
INSERT INTO `civil_user` VALUES (12, 'AlexanderAdams', 'M3iNdz1sYhs6U8nlSn+bqg==', '555555@qq.com', '许小婧', '享受编程和技术创新', '男', 0, 'avatar/12.jpg', '2024-01-13 19:44:55', 0);
INSERT INTO `civil_user` VALUES (13, 'OliverMorris', 'M3iNdz1sYhs6U8nlSn+bqg==', '111222333@qq.com', '吴小亮', '热爱运动和健康生活', '男', 0, 'avatar/13.jpg', '2024-01-13 19:44:55', 0);
INSERT INTO `civil_user` VALUES (14, 'AbigailNelson', 'M3iNdz1sYhs6U8nlSn+bqg==', '7777777@qq.com', '朱小琳', '追求艺术与设计的美学追求者', '女', 0, 'avatar/1.png', '2024-01-13 19:44:55', 0);
INSERT INTO `civil_user` VALUES (15, 'EthanCampbell', 'M3iNdz1sYhs6U8nlSn+bqg==', '88888888@qq.com', '秦东华', '对宇宙和星辰充满好奇心', '男', 0, 'avatar/2.jpg', '2024-01-13 19:44:55', 0);
INSERT INTO `civil_user` VALUES (16, 'AvaCollins', 'M3iNdz1sYhs6U8nlSn+bqg==', '666666@qq.com', '何宇宁', '热衷于公益事业的志愿者', '女', 0, 'avatar/3.jpg', '2024-01-13 19:44:55', 0);
INSERT INTO `civil_user` VALUES (17, 'NoahRogers', 'M3iNdz1sYhs6U8nlSn+bqg==', '4444444@qq.com', '孙小慧', '热衷于科幻文学和科技前沿', '男', 0, 'avatar/4.jpg', '2024-01-13 19:44:55', 0);
INSERT INTO `civil_user` VALUES (18, 'MiaMorgan', 'M3iNdz1sYhs6U8nlSn+bqg==', '22222222@qq.com', '马小健', '热爱摄影和自然风光', '女', 0, 'avatar/5.jpg', '2024-01-13 19:44:55', 0);
INSERT INTO `civil_user` VALUES (19, 'Lensy', 'M3iNdz1sYhs6U8nlSn+bqg==', '2026661260@qq.com', 'Lensy', '追求艺术与设计的美学追求者追求艺术与设计的美学追求者追求艺术与设计的美学追求者追求艺术与设计的美学追求者追求艺术与设计的美学追求者', '男', 1, 'avatar/6.jpg', '2024-01-16 20:10:33', 0);

-- ----------------------------
-- Table structure for civil_video
-- ----------------------------
DROP TABLE IF EXISTS `civil_video`;
CREATE TABLE `civil_video`  (
  `video_id` bigint NOT NULL AUTO_INCREMENT COMMENT '视频ID',
  `course_id` bigint NOT NULL COMMENT '课程ID',
  `video_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频名称',
  `video_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频链接',
  `video_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频封面',
  `video_preview` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '视频预览',
  `video_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频描述',
  `video_sort` int NULL DEFAULT NULL COMMENT '课程内排序',
  `video_duration` bigint NOT NULL DEFAULT 0 COMMENT '视频时长(秒)',
  `like_number` bigint NOT NULL DEFAULT 0 COMMENT '点赞数',
  `browse_number` bigint NOT NULL DEFAULT 0 COMMENT '浏览数',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`video_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 629 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of civil_video
-- ----------------------------
INSERT INTO `civil_video` VALUES (1, 1, '公务员笔试基础课程第1集', 'video/link/1.mp4', 'video/image/1-1.png', 'video/preview/1.mp4', '公务员笔试基础课程是为有志于公务员考试的学员打造的全面复习课程。', 1, 137, 1, 108, '2024-01-14 19:59:50');
INSERT INTO `civil_video` VALUES (2, 1, '公务员笔试基础课程第2集', 'video/link/2.mp4', 'video/image/1-2.png', 'video/preview/2.mp4', '在本视频中，我们将深入剖析公务员笔试中常见题型，提供解题技巧和策略，帮助学员更加熟练地应对各种考题。', 2, 136, 0, 29, '2024-01-14 19:59:50');
INSERT INTO `civil_video` VALUES (3, 1, '公务员笔试基础课程第3集', 'video/link/3.mp4', 'video/image/1-3.png', 'video/preview/3.mp4', '通过大量实例演练，我们将全面解析各科目的典型题目，帮助学员理解解题思路和方法，为考试做好充分准备。', 3, 166, 0, 6, '2024-01-14 19:59:50');
INSERT INTO `civil_video` VALUES (4, 1, '公务员笔试基础课程第4集', 'video/link/4.mp4', 'video/image/1-4.png', 'video/preview/4.mp4', '在本集中，我们将深入研究常识判断题目，提供解题技巧和实例讲解，帮助学员提高答题准确率。', 4, 123, 0, 1, '2024-01-14 19:59:50');
INSERT INTO `civil_video` VALUES (5, 1, '公务员笔试基础课程第5集', 'video/link/5.mp4', 'video/image/1-5.png', 'video/preview/5.mp4', '在这一集中，我们将重点讨论言语理解与表达题目，为学员提供解题技巧和实例演练，确保应对考试时能够得心应手。', 5, 138, 0, 5, '2024-01-14 19:59:50');
INSERT INTO `civil_video` VALUES (6, 1, '公务员笔试基础课程第6集', 'video/link/6.mp4', 'video/image/1-6.png', 'video/preview/6.mp4', '在本视频中，我们将深入探讨数量关系题目，提供解题技巧和大量实例演练，帮助学员掌握解题方法。', 6, 162, 0, 0, '2024-01-14 19:59:50');
INSERT INTO `civil_video` VALUES (7, 1, '公务员笔试基础课程第7集', 'video/link/7.mp4', 'video/image/1-7.png', 'video/preview/7.mp4', '在这一集中，我们将全面解析公务员笔试的难点，提供详细的解题思路和实例讲解，帮助学员攻克考试难关。', 7, 147, 0, 0, '2024-01-14 19:59:50');
INSERT INTO `civil_video` VALUES (8, 1, '公务员笔试基础课程第8集', 'video/link/1.mp4', 'video/image/1-8.png', 'video/preview/1.mp4', '在本视频中，我们将通过实例演练讲解常见题型，为学员提供更多解题技巧，确保备战考试更有信心。', 8, 137, 0, 1, '2024-01-14 19:59:50');
INSERT INTO `civil_video` VALUES (9, 1, '公务员笔试基础课程第9集', 'video/link/2.mp4', 'video/image/1-9.png', 'video/preview/2.mp4', '在这一集中，我们将深入剖析笔试中的典型问题，提供解题技巧和实例分析，帮助学员更好地应对考试挑战。', 9, 136, 0, 0, '2024-01-14 19:59:50');
INSERT INTO `civil_video` VALUES (10, 1, '公务员笔试基础课程第10集', 'video/link/3.mp4', 'video/image/1-10.png', 'video/preview/3.mp4', '在本视频中，我们将全面解析公务员笔试的典型题目，通过大量实例演练，帮助学员理解解题思路和方法，为考试做好充分准备。', 10, 166, 0, 0, '2024-01-14 19:59:50');
INSERT INTO `civil_video` VALUES (11, 2, '公务员面试实战训练第1集', 'video/link/4.mp4', 'video/image/2-1.png', 'video/preview/4.mp4', '在本视频中，我们将进行公务员面试实战训练，模拟真实面试场景，帮助学员熟悉面试流程，提高面试技巧。', 1, 123, 0, 46, '2024-01-14 20:02:41');
INSERT INTO `civil_video` VALUES (12, 2, '公务员面试实战训练第2集', 'video/link/5.mp4', 'video/image/2-2.png', 'video/preview/5.mp4', '在本视频中，我们将深入分析常见面试问题，提供解答技巧和实例演练，帮助学员更好地应对各种挑战。', 2, 138, 0, 1, '2024-01-14 20:02:41');
INSERT INTO `civil_video` VALUES (13, 2, '公务员面试实战训练第3集', 'video/link/6.mp4', 'video/image/2-3.png', 'video/preview/6.mp4', '这一集将着重讨论面试中的沟通技巧，通过实例演示和讲解，帮助学员提高沟通表达能力，更好地展现自己。', 3, 162, 0, 0, '2024-01-14 20:02:41');
INSERT INTO `civil_video` VALUES (14, 2, '公务员面试实战训练第4集', 'video/link/7.mp4', 'video/image/2-4.png', 'video/preview/7.mp4', '在本视频中，我们将详细解析面试中的案例分析题目，提供解答思路和实例讲解，帮助学员在面试中游刃有余。', 4, 147, 0, 1, '2024-01-14 20:02:41');
INSERT INTO `civil_video` VALUES (15, 2, '公务员面试实战训练第5集', 'video/link/1.mp4', 'video/image/2-5.png', 'video/preview/1.mp4', '在这一集中，我们将模拟实际面试场景，进行全程模拟，帮助学员在真实压力下提高应对能力，增加面试经验。', 5, 137, 0, 0, '2024-01-14 20:02:41');
INSERT INTO `civil_video` VALUES (16, 2, '公务员面试实战训练第6集', 'video/link/2.mp4', 'video/image/2-6.png', 'video/preview/2.mp4', '在这一集中，我们将深入讨论面试中的综合素质评价题目，提供解答技巧和实例分析，帮助学员在评价中脱颖而出。', 6, 136, 0, 6, '2024-01-14 20:02:41');
INSERT INTO `civil_video` VALUES (17, 2, '公务员面试实战训练第7集', 'video/link/3.mp4', 'video/image/2-7.png', 'video/preview/3.mp4', '在本视频中，我们将解析面试中的各类特殊问题，包括如何回答敏感问题和不确定性问题，帮助学员应对各种情况。', 7, 166, 0, 0, '2024-01-14 20:02:41');
INSERT INTO `civil_video` VALUES (18, 2, '公务员面试实战训练第8集', 'video/link/4.mp4', 'video/image/2-8.png', 'video/preview/4.mp4', '这一集将聚焦于面试中的心理素质评价，通过实例演示和讲解，帮助学员理解评价标准，做好心理准备。', 8, 123, 0, 1, '2024-01-14 20:02:41');
INSERT INTO `civil_video` VALUES (19, 2, '公务员面试实战训练第9集', 'video/link/5.mp4', 'video/image/2-9.png', 'video/preview/5.mp4', '在这一集中，我们将通过实例演示和模拟练习，帮助学员提高在面试中的仪态和形象，增加面试的整体分数。', 9, 138, 0, 1, '2024-01-14 20:02:41');
INSERT INTO `civil_video` VALUES (20, 2, '公务员面试实战训练第10集', 'video/link/6.mp4', 'video/image/2-10.png', 'video/preview/6.mp4', '在本视频中，我们将总结面试中的要点，提供面试注意事项和建议，帮助学员做好最后的冲刺和准备。', 10, 162, 0, 0, '2024-01-14 20:02:41');
INSERT INTO `civil_video` VALUES (21, 3, '军队文职考试指南第1集', 'video/link/7.mp4', 'video/image/3-1.png', 'video/preview/7.mp4', '在本视频中，我们将全面解析军队文职考试要点，深入讲解军事理论、组织管理等知识，帮助学员备战考试。', 1, 147, 0, 3, '2024-01-14 20:03:51');
INSERT INTO `civil_video` VALUES (22, 3, '军队文职考试指南第2集', 'video/link/1.mp4', 'video/image/3-2.png', 'video/preview/1.mp4', '在这一集中，我们将重点关注文职考试中的重难点问题，提供详细解答和实例分析，帮助学员理清复习方向。', 2, 137, 0, 0, '2024-01-14 20:03:51');
INSERT INTO `civil_video` VALUES (23, 3, '军队文职考试指南第3集', 'video/link/2.mp4', 'video/image/3-3.png', 'video/preview/2.mp4', '在本视频中，我们将详细解析军队文职考试中的组织管理和国防法规方面的考点，为考生提供备考重点。', 3, 136, 0, 0, '2024-01-14 20:03:51');
INSERT INTO `civil_video` VALUES (24, 3, '军队文职考试指南第4集', 'video/link/3.mp4', 'video/image/3-4.png', 'video/preview/3.mp4', '在这一集中，我们将通过实例分析，帮助学员深入了解文职考试中的军事理论，提高应试水平。', 4, 166, 0, 0, '2024-01-14 20:03:51');
INSERT INTO `civil_video` VALUES (25, 3, '军队文职考试指南第5集', 'video/link/4.mp4', 'video/image/3-5.png', 'video/preview/4.mp4', '在本视频中，我们将解析军队文职考试的模拟题目，提供解答技巧和实例演练，帮助学员熟悉考试形式。', 5, 123, 0, 0, '2024-01-14 20:03:51');
INSERT INTO `civil_video` VALUES (26, 3, '军队文职考试指南第6集', 'video/link/5.mp4', 'video/image/3-6.png', 'video/preview/5.mp4', '在这一集中，我们将聚焦于文职考试中的应用文写作，通过实例分析和写作练习，提高学员的写作水平。', 6, 138, 0, 0, '2024-01-14 20:03:51');
INSERT INTO `civil_video` VALUES (27, 3, '军队文职考试指南第7集', 'video/link/6.mp4', 'video/image/3-7.png', 'video/preview/6.mp4', '在本视频中，我们将深入讲解军队文职考试的综合素质评价题目，提供解答技巧和实例演示，帮助学员备战。', 7, 162, 0, 0, '2024-01-14 20:03:51');
INSERT INTO `civil_video` VALUES (28, 3, '军队文职考试指南第8集', 'video/link/7.mp4', 'video/image/3-8.png', 'video/preview/7.mp4', '这一集将聚焦于文职考试中的英语考点，通过实例分析和英语练习，提高学员在英语科目中的应试水平。', 8, 147, 0, 0, '2024-01-14 20:03:51');
INSERT INTO `civil_video` VALUES (29, 3, '军队文职考试指南第9集', 'video/link/1.mp4', 'video/image/3-9.png', 'video/preview/1.mp4', '在本视频中，我们将解析军队文职考试中的模拟面试题目，提供解答技巧和实例演练，帮助学员熟悉面试流程。', 9, 137, 0, 0, '2024-01-14 20:03:51');
INSERT INTO `civil_video` VALUES (30, 3, '军队文职考试指南第10集', 'video/link/2.mp4', 'video/image/3-10.png', 'video/preview/2.mp4', '在这一集中，我们将总结军队文职考试的复习要点，提供备考建议和注意事项，帮助学员做好最后冲刺。', 10, 136, 0, 0, '2024-01-14 20:03:51');
INSERT INTO `civil_video` VALUES (31, 4, '事业单位考试全程指导第1集', 'video/link/3.mp4', 'video/image/4-1.png', 'video/preview/3.mp4', '事业单位考试全程指导课程旨在帮助考生全面备战招聘考试。在本视频中，我们将深入分析事业单位考试的综合素质面试，提供解答技巧和实例演示。', 1, 166, 0, 2, '2024-01-14 20:05:19');
INSERT INTO `civil_video` VALUES (32, 4, '事业单位考试全程指导第2集', 'video/link/4.mp4', 'video/image/4-2.png', 'video/preview/4.mp4', '在这一集中，我们将讲解事业单位考试的笔试技巧，通过实例分析和模拟练习，帮助学员提高应试能力。', 2, 123, 0, 0, '2024-01-14 20:05:19');
INSERT INTO `civil_video` VALUES (33, 4, '事业单位考试全程指导第3集', 'video/link/5.mp4', 'video/image/4-3.png', 'video/preview/5.mp4', '在本视频中，我们将解析事业单位考试的面试模拟题目，提供解答技巧和实例演示，帮助学员熟悉面试流程。', 3, 138, 0, 0, '2024-01-14 20:05:19');
INSERT INTO `civil_video` VALUES (34, 4, '事业单位考试全程指导第4集', 'video/link/6.mp4', 'video/image/4-4.png', 'video/preview/6.mp4', '在这一集中，我们将重点关注事业单位考试中的常见问题，提供解答技巧和实例演练，帮助学员更好地应对面试挑战。', 4, 162, 0, 0, '2024-01-14 20:05:19');
INSERT INTO `civil_video` VALUES (35, 4, '事业单位考试全程指导第5集', 'video/link/7.mp4', 'video/image/4-5.png', 'video/preview/7.mp4', '在本视频中，我们将深入分析事业单位考试的申论写作，提供写作结构和论述技巧，帮助学员提高写作水平。', 5, 147, 0, 0, '2024-01-14 20:05:19');
INSERT INTO `civil_video` VALUES (36, 4, '事业单位考试全程指导第6集', 'video/link/1.mp4', 'video/image/4-6.png', 'video/preview/1.mp4', '在这一集中，我们将讲解事业单位考试的面试技巧，包括沟通能力和形象表达，帮助学员在面试中脱颖而出。', 6, 137, 0, 0, '2024-01-14 20:05:19');
INSERT INTO `civil_video` VALUES (37, 4, '事业单位考试全程指导第7集', 'video/link/2.mp4', 'video/image/4-7.png', 'video/preview/2.mp4', '在本视频中，我们将解析事业单位考试的模拟笔试题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 7, 136, 0, 0, '2024-01-14 20:05:19');
INSERT INTO `civil_video` VALUES (38, 4, '事业单位考试全程指导第8集', 'video/link/3.mp4', 'video/image/4-8.png', 'video/preview/3.mp4', '在这一集中，我们将重点关注事业单位考试的面试常见问题，提供解答技巧和实例演示，帮助学员做好面试准备。', 8, 166, 0, 0, '2024-01-14 20:05:19');
INSERT INTO `civil_video` VALUES (39, 4, '事业单位考试全程指导第9集', 'video/link/4.mp4', 'video/image/4-9.png', 'video/preview/4.mp4', '在本视频中，我们将深入分析事业单位考试的综合素质面试，提供解答技巧和实例演示，帮助学员备战考试。', 9, 123, 0, 0, '2024-01-14 20:05:19');
INSERT INTO `civil_video` VALUES (40, 4, '事业单位考试全程指导第10集', 'video/link/5.mp4', 'video/image/4-10.png', 'video/preview/5.mp4', '在这一集中，我们将总结事业单位考试的复习要点，提供备考建议和注意事项，帮助学员做好最后冲刺。', 10, 138, 0, 0, '2024-01-14 20:05:19');
INSERT INTO `civil_video` VALUES (41, 5, '三支一扶招聘考试攻略第1集', 'video/link/6.mp4', 'video/image/5-1.png', 'video/preview/6.mp4', '三支一扶招聘考试攻略课程帮助学员全面了解招聘考试的各个环节。在本视频中，我们将解析考试大纲，提供备考指导和注意事项。', 1, 162, 0, 0, '2024-01-14 20:06:04');
INSERT INTO `civil_video` VALUES (42, 5, '三支一扶招聘考试攻略第2集', 'video/link/7.mp4', 'video/image/5-2.png', 'video/preview/7.mp4', '在这一集中，我们将聚焦于招聘考试中的面试技巧，包括模拟面试和实际案例分析，帮助学员提高面试表现。', 2, 147, 0, 0, '2024-01-14 20:06:04');
INSERT INTO `civil_video` VALUES (43, 5, '三支一扶招聘考试攻略第3集', 'video/link/1.mp4', 'video/image/5-3.png', 'video/preview/1.mp4', '在本视频中，我们将详细解析三支一扶招聘考试的模拟题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 3, 137, 0, 0, '2024-01-14 20:06:04');
INSERT INTO `civil_video` VALUES (44, 5, '三支一扶招聘考试攻略第4集', 'video/link/2.mp4', 'video/image/5-4.png', 'video/preview/2.mp4', '在这一集中，我们将重点关注招聘考试中的申论写作，提供写作结构和论述技巧，帮助学员提高写作水平。', 4, 136, 0, 0, '2024-01-14 20:06:04');
INSERT INTO `civil_video` VALUES (45, 5, '三支一扶招聘考试攻略第5集', 'video/link/3.mp4', 'video/image/5-5.png', 'video/preview/3.mp4', '在本视频中，我们将深入分析三支一扶招聘考试的面试技巧，提供解答技巧和实例演示，帮助学员备战面试。', 5, 166, 0, 0, '2024-01-14 20:06:04');
INSERT INTO `civil_video` VALUES (46, 5, '三支一扶招聘考试攻略第6集', 'video/link/4.mp4', 'video/image/5-6.png', 'video/preview/4.mp4', '在这一集中，我们将解析招聘考试的模拟笔试题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 6, 123, 0, 0, '2024-01-14 20:06:04');
INSERT INTO `civil_video` VALUES (47, 5, '三支一扶招聘考试攻略第7集', 'video/link/5.mp4', 'video/image/5-7.png', 'video/preview/5.mp4', '在本视频中，我们将深入分析三支一扶招聘考试的综合素质评价题目，提供解答技巧和实例演示，帮助学员备战考试。', 7, 138, 0, 0, '2024-01-14 20:06:04');
INSERT INTO `civil_video` VALUES (48, 5, '三支一扶招聘考试攻略第8集', 'video/link/6.mp4', 'video/image/5-8.png', 'video/preview/6.mp4', '在这一集中，我们将重点关注招聘考试的面试常见问题，提供解答技巧和实例演示，帮助学员做好面试准备。', 8, 162, 0, 0, '2024-01-14 20:06:04');
INSERT INTO `civil_video` VALUES (49, 5, '三支一扶招聘考试攻略第9集', 'video/link/7.mp4', 'video/image/5-9.png', 'video/preview/7.mp4', '在本视频中，我们将详细解析三支一扶招聘考试的笔试技巧，通过实例分析和模拟练习，帮助学员提高应试能力。', 9, 147, 0, 0, '2024-01-14 20:06:04');
INSERT INTO `civil_video` VALUES (50, 5, '三支一扶招聘考试攻略第10集', 'video/link/1.mp4', 'video/image/5-10.png', 'video/preview/1.mp4', '在这一集中，我们将总结招聘考试的复习要点，提供备考建议和注意事项，帮助学员做好最后冲刺。', 10, 137, 0, 0, '2024-01-14 20:06:04');
INSERT INTO `civil_video` VALUES (51, 6, '公安招警考试精讲第1集', 'video/link/2.mp4', 'video/image/6-1.png', 'video/preview/2.mp4', '公安招警考试精讲课程旨在帮助考生全面备战公安招警考试。在本视频中，我们将深入分析考试的笔试重难点，提供解答技巧和实例演示。', 1, 136, 0, 4, '2024-01-14 20:06:49');
INSERT INTO `civil_video` VALUES (52, 6, '公安招警考试精讲第2集', 'video/link/3.mp4', 'video/image/6-2.png', 'video/preview/3.mp4', '在这一集中，我们将聚焦于招警考试中的面试技巧，包括模拟面试和实际案例分析，帮助学员提高面试表现。', 2, 166, 0, 0, '2024-01-14 20:06:49');
INSERT INTO `civil_video` VALUES (53, 6, '公安招警考试精讲第3集', 'video/link/4.mp4', 'video/image/6-3.png', 'video/preview/4.mp4', '在本视频中，我们将详细解析公安招警考试的模拟题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 3, 123, 0, 0, '2024-01-14 20:06:49');
INSERT INTO `civil_video` VALUES (54, 6, '公安招警考试精讲第4集', 'video/link/5.mp4', 'video/image/6-4.png', 'video/preview/5.mp4', '在这一集中，我们将重点关注招警考试中的常见问题，提供解答技巧和实例演示，帮助学员更好地应对面试挑战。', 4, 138, 0, 0, '2024-01-14 20:06:49');
INSERT INTO `civil_video` VALUES (55, 6, '公安招警考试精讲第5集', 'video/link/6.mp4', 'video/image/6-5.png', 'video/preview/6.mp4', '在本视频中，我们将深入分析招警考试的申论写作，提供写作结构和论述技巧，帮助学员提高写作水平。', 5, 162, 0, 0, '2024-01-14 20:06:49');
INSERT INTO `civil_video` VALUES (56, 6, '公安招警考试精讲第6集', 'video/link/7.mp4', 'video/image/6-6.png', 'video/preview/7.mp4', '在这一集中，我们将讲解招警考试的面试技巧，包括沟通能力和形象表达，帮助学员在面试中脱颖而出。', 6, 147, 0, 0, '2024-01-14 20:06:49');
INSERT INTO `civil_video` VALUES (57, 6, '公安招警考试精讲第7集', 'video/link/1.mp4', 'video/image/6-7.png', 'video/preview/1.mp4', '在本视频中，我们将解析招警考试的模拟笔试题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 7, 137, 0, 0, '2024-01-14 20:06:49');
INSERT INTO `civil_video` VALUES (58, 6, '公安招警考试精讲第8集', 'video/link/2.mp4', 'video/image/6-8.png', 'video/preview/2.mp4', '在这一集中，我们将重点关注招警考试的面试常见问题，提供解答技巧和实例演示，帮助学员做好面试准备。', 8, 136, 0, 0, '2024-01-14 20:06:49');
INSERT INTO `civil_video` VALUES (59, 6, '公安招警考试精讲第9集', 'video/link/3.mp4', 'video/image/6-9.png', 'video/preview/3.mp4', '在本视频中，我们将详细解析招警考试的笔试技巧，通过实例分析和模拟练习，帮助学员提高应试能力。', 9, 166, 0, 0, '2024-01-14 20:06:49');
INSERT INTO `civil_video` VALUES (60, 6, '公安招警考试精讲第10集', 'video/link/4.mp4', 'video/image/6-10.png', 'video/preview/4.mp4', '在这一集中，我们将总结招警考试的复习要点，提供备考建议和注意事项，帮助学员做好最后冲刺。', 10, 123, 0, 0, '2024-01-14 20:06:49');
INSERT INTO `civil_video` VALUES (61, 7, '事业单位面试技巧第1集', 'video/link/5.mp4', 'video/image/1-1.png', 'video/preview/5.mp4', '事业单位面试技巧课程帮助学员更好地应对事业单位面试环节。在本视频中，我们将解析面试的常见问题，提供解答技巧和实例演示。', 1, 138, 0, 14, '2024-01-14 20:07:27');
INSERT INTO `civil_video` VALUES (62, 7, '事业单位面试技巧第2集', 'video/link/6.mp4', 'video/image/1-2.png', 'video/preview/6.mp4', '在这一集中，我们将聚焦于事业单位面试中的沟通技巧，包括与考官的有效沟通和表达能力，帮助学员提高面试表现。', 2, 162, 0, 0, '2024-01-14 20:07:27');
INSERT INTO `civil_video` VALUES (63, 7, '事业单位面试技巧第3集', 'video/link/7.mp4', 'video/image/1-3.png', 'video/preview/7.mp4', '在本视频中，我们将详细解析事业单位面试的模拟题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 3, 147, 0, 0, '2024-01-14 20:07:27');
INSERT INTO `civil_video` VALUES (64, 7, '事业单位面试技巧第4集', 'video/link/1.mp4', 'video/image/1-4.png', 'video/preview/1.mp4', '在这一集中，我们将重点关注事业单位面试中的形象表达，提供形象打造和仪态礼仪技巧，帮助学员塑造良好形象。', 4, 137, 0, 0, '2024-01-14 20:07:27');
INSERT INTO `civil_video` VALUES (65, 7, '事业单位面试技巧第5集', 'video/link/2.mp4', 'video/image/1-5.png', 'video/preview/2.mp4', '在本视频中，我们将深入分析事业单位面试的申论写作，提供写作结构和论述技巧，帮助学员提高写作水平。', 5, 136, 0, 0, '2024-01-14 20:07:27');
INSERT INTO `civil_video` VALUES (66, 7, '事业单位面试技巧第6集', 'video/link/3.mp4', 'video/image/1-6.png', 'video/preview/3.mp4', '在这一集中，我们将讲解事业单位面试的综合素质评价题目，提供解答技巧和实例演示，帮助学员备战考试。', 6, 166, 0, 0, '2024-01-14 20:07:27');
INSERT INTO `civil_video` VALUES (67, 7, '事业单位面试技巧第7集', 'video/link/4.mp4', 'video/image/1-7.png', 'video/preview/4.mp4', '在本视频中，我们将解析事业单位面试的模拟笔试题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 7, 123, 0, 0, '2024-01-14 20:07:27');
INSERT INTO `civil_video` VALUES (68, 7, '事业单位面试技巧第8集', 'video/link/5.mp4', 'video/image/1-8.png', 'video/preview/5.mp4', '在这一集中，我们将重点关注事业单位面试的面试常见问题，提供解答技巧和实例演示，帮助学员做好面试准备。', 8, 138, 0, 0, '2024-01-14 20:07:27');
INSERT INTO `civil_video` VALUES (69, 7, '事业单位面试技巧第9集', 'video/link/6.mp4', 'video/image/1-9.png', 'video/preview/6.mp4', '在本视频中，我们将详细解析事业单位面试的笔试技巧，通过实例分析和模拟练习，帮助学员提高应试能力。', 9, 162, 0, 0, '2024-01-14 20:07:27');
INSERT INTO `civil_video` VALUES (70, 7, '事业单位面试技巧第10集', 'video/link/7.mp4', 'video/image/1-10.png', 'video/preview/7.mp4', '在这一集中，我们将总结事业单位面试的复习要点，提供备考建议和注意事项，帮助学员做好最后冲刺。', 10, 147, 0, 0, '2024-01-14 20:07:27');
INSERT INTO `civil_video` VALUES (71, 8, '三支一扶申论写作第1集', 'video/link/1.mp4', 'video/image/2-1.png', 'video/preview/1.mp4', '三支一扶申论写作课程致力于提高学员在招聘考试中的申论写作水平。在本视频中，我们将深入分析申论写作的基本结构和论述技巧，帮助学员提高写作水平。', 1, 137, 0, 1, '2024-01-14 20:08:07');
INSERT INTO `civil_video` VALUES (72, 8, '三支一扶申论写作第2集', 'video/link/2.mp4', 'video/image/2-2.png', 'video/preview/2.mp4', '在这一集中，我们将聚焦于申论写作中的论证方法，包括实例分析和写作练习，帮助学员熟悉各类论题的应对策略。', 2, 136, 0, 0, '2024-01-14 20:08:07');
INSERT INTO `civil_video` VALUES (73, 8, '三支一扶申论写作第3集', 'video/link/3.mp4', 'video/image/2-3.png', 'video/preview/3.mp4', '在本视频中，我们将详细解析申论写作的题材范围，提供实例演示和写作技巧，帮助学员在考试中更好地选择和应对论题。', 3, 166, 0, 0, '2024-01-14 20:08:07');
INSERT INTO `civil_video` VALUES (74, 8, '三支一扶申论写作第4集', 'video/link/4.mp4', 'video/image/2-4.png', 'video/preview/4.mp4', '在这一集中，我们将重点关注申论写作的语言表达，提供写作技巧和实例演示，帮助学员提高语言表达水平。', 4, 123, 0, 0, '2024-01-14 20:08:07');
INSERT INTO `civil_video` VALUES (75, 8, '三支一扶申论写作第5集', 'video/link/5.mp4', 'video/image/2-5.png', 'video/preview/5.mp4', '在本视频中，我们将深入分析申论写作的实例题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 5, 138, 0, 0, '2024-01-14 20:08:07');
INSERT INTO `civil_video` VALUES (76, 8, '三支一扶申论写作第6集', 'video/link/6.mp4', 'video/image/2-6.png', 'video/preview/6.mp4', '在这一集中，我们将讲解申论写作的论题分析，包括如何理解和解答各类申论题目，帮助学员应对考试挑战。', 6, 162, 0, 0, '2024-01-14 20:08:07');
INSERT INTO `civil_video` VALUES (77, 8, '三支一扶申论写作第7集', 'video/link/7.mp4', 'video/image/2-7.png', 'video/preview/7.mp4', '在本视频中，我们将解析申论写作的模拟笔试题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 7, 147, 0, 0, '2024-01-14 20:08:07');
INSERT INTO `civil_video` VALUES (78, 8, '三支一扶申论写作第8集', 'video/link/1.mp4', 'video/image/2-8.png', 'video/preview/1.mp4', '在这一集中，我们将重点关注申论写作的面试常见问题，提供解答技巧和实例演示，帮助学员做好面试准备。', 8, 137, 0, 0, '2024-01-14 20:08:07');
INSERT INTO `civil_video` VALUES (79, 8, '三支一扶申论写作第9集', 'video/link/2.mp4', 'video/image/2-9.png', 'video/preview/2.mp4', '在本视频中，我们将详细解析申论写作的笔试技巧，通过实例分析和模拟练习，帮助学员提高应试能力。', 9, 136, 0, 0, '2024-01-14 20:08:07');
INSERT INTO `civil_video` VALUES (80, 8, '三支一扶申论写作第10集', 'video/link/3.mp4', 'video/image/2-10.png', 'video/preview/3.mp4', '在这一集中，我们将总结申论写作的复习要点，提供备考建议和注意事项，帮助学员做好最后冲刺。', 10, 166, 0, 0, '2024-01-14 20:08:07');
INSERT INTO `civil_video` VALUES (81, 9, '公务员面试技能培训第1集', 'video/link/4.mp4', 'video/image/3-1.png', 'video/preview/4.mp4', '公务员面试技能培训课程旨在提高考生在公务员面试中的表现水平。在本视频中，我们将介绍面试的基本流程和注意事项，帮助学员建立面试思维。', 1, 123, 0, 8, '2024-01-14 20:09:02');
INSERT INTO `civil_video` VALUES (82, 9, '公务员面试技能培训第2集', 'video/link/5.mp4', 'video/image/3-2.png', 'video/preview/5.mp4', '在这一集中，我们将聚焦于公务员面试中的形象塑造，包括仪容仪表和形象气质的打造，帮助学员在面试中留下良好印象。', 2, 138, 0, 1, '2024-01-14 20:09:02');
INSERT INTO `civil_video` VALUES (83, 9, '公务员面试技能培训第3集', 'video/link/6.mp4', 'video/image/3-3.png', 'video/preview/6.mp4', '在本视频中，我们将详细解析公务员面试的模拟题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 3, 162, 0, 0, '2024-01-14 20:09:02');
INSERT INTO `civil_video` VALUES (84, 9, '公务员面试技能培训第4集', 'video/link/7.mp4', 'video/image/3-4.png', 'video/preview/7.mp4', '在这一集中，我们将重点关注公务员面试中的沟通技巧，包括与考官的有效沟通和表达能力，帮助学员提高面试表现。', 4, 147, 0, 0, '2024-01-14 20:09:02');
INSERT INTO `civil_video` VALUES (85, 9, '公务员面试技能培训第5集', 'video/link/1.mp4', 'video/image/3-5.png', 'video/preview/1.mp4', '在本视频中，我们将深入分析公务员面试的申论写作，提供写作结构和论述技巧，帮助学员提高写作水平。', 5, 137, 0, 0, '2024-01-14 20:09:02');
INSERT INTO `civil_video` VALUES (86, 9, '公务员面试技能培训第6集', 'video/link/2.mp4', 'video/image/3-6.png', 'video/preview/2.mp4', '在这一集中，我们将讲解公务员面试的论题分析，包括如何理解和解答各类面试题目，帮助学员应对考试挑战。', 6, 136, 0, 0, '2024-01-14 20:09:02');
INSERT INTO `civil_video` VALUES (87, 9, '公务员面试技能培训第7集', 'video/link/3.mp4', 'video/image/3-7.png', 'video/preview/3.mp4', '在本视频中，我们将解析公务员面试的模拟笔试题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 7, 166, 0, 0, '2024-01-14 20:09:02');
INSERT INTO `civil_video` VALUES (88, 9, '公务员面试技能培训第8集', 'video/link/4.mp4', 'video/image/3-8.png', 'video/preview/4.mp4', '在这一集中，我们将重点关注公务员面试的面试常见问题，提供解答技巧和实例演示，帮助学员做好面试准备。', 8, 123, 0, 0, '2024-01-14 20:09:02');
INSERT INTO `civil_video` VALUES (89, 9, '公务员面试技能培训第9集', 'video/link/5.mp4', 'video/image/3-9.png', 'video/preview/5.mp4', '在本视频中，我们将详细解析公务员面试的笔试技巧，通过实例分析和模拟练习，帮助学员提高应试能力。', 9, 138, 0, 0, '2024-01-14 20:09:02');
INSERT INTO `civil_video` VALUES (90, 9, '公务员面试技能培训第10集', 'video/link/6.mp4', 'video/image/3-10.png', 'video/preview/6.mp4', '在这一集中，我们将总结公务员面试的复习要点，提供备考建议和注意事项，帮助学员做好最后冲刺。', 10, 162, 0, 0, '2024-01-14 20:09:02');
INSERT INTO `civil_video` VALUES (91, 10, '军队文职申论协作辅导第1集', 'video/link/7.mp4', 'video/image/4-1.png', 'video/preview/7.mp4', '本集课程将从军队文职申论的基础知识入手，介绍申论的协作辅导策略，帮助学员理解申论的重要性和复习方法。', 1, 147, 0, 0, '2024-01-14 20:14:10');
INSERT INTO `civil_video` VALUES (92, 10, '军队文职申论协作辅导第2集', 'video/link/1.mp4', 'video/image/4-2.png', 'video/preview/1.mp4', '在这一集中，我们将深入解析军队文职申论的题型和题材，提供协作辅导的实例分析，帮助学员更好地应对不同类型的申论题目。', 2, 137, 0, 0, '2024-01-14 20:14:10');
INSERT INTO `civil_video` VALUES (93, 10, '军队文职申论协作辅导第3集', 'video/link/2.mp4', 'video/image/4-3.png', 'video/preview/2.mp4', '本集课程将重点讲解军队文职申论的写作技巧和表达方法，通过实例演练帮助学员提高申论写作水平。', 3, 136, 0, 0, '2024-01-14 20:14:10');
INSERT INTO `civil_video` VALUES (94, 10, '军队文职申论协作辅导第4集', 'video/link/3.mp4', 'video/image/4-4.png', 'video/preview/3.mp4', '在这一集中，我们将分享军队文职申论的范文解析和评价标准，帮助学员了解申论的评分规则和注意事项。', 4, 166, 0, 0, '2024-01-14 20:14:10');
INSERT INTO `civil_video` VALUES (95, 10, '军队文职申论协作辅导第5集', 'video/link/4.mp4', 'video/image/4-5.png', 'video/preview/4.mp4', '本集课程将全面解析军队文职申论的协作辅导计划，包括复习计划和备考建议，助力学员更好地备战申论考试。', 5, 123, 0, 0, '2024-01-14 20:14:10');
INSERT INTO `civil_video` VALUES (96, 10, '军队文职申论协作辅导第6集', 'video/link/5.mp4', 'video/image/4-6.png', 'video/preview/5.mp4', '在这一集中，我们将进行军队文职申论的实际案例分析和协作辅导演示，通过实例帮助学员理解申论的实际应用场景。', 6, 138, 0, 0, '2024-01-14 20:14:10');
INSERT INTO `civil_video` VALUES (97, 10, '军队文职申论协作辅导第7集', 'video/link/6.mp4', 'video/image/4-7.png', 'video/preview/6.mp4', '本集课程将提供军队文职申论的协作辅导题目，通过实际操作帮助学员熟悉协作辅导环境，提高应试水平。', 7, 162, 0, 0, '2024-01-14 20:14:10');
INSERT INTO `civil_video` VALUES (98, 10, '军队文职申论协作辅导第8集', 'video/link/7.mp4', 'video/image/4-8.png', 'video/preview/7.mp4', '在这一集中，我们将进行军队文职申论的协作辅导模拟考场，通过实际模拟协作辅导帮助学员适应考场氛围，提高答题效率。', 8, 147, 0, 0, '2024-01-14 20:14:10');
INSERT INTO `civil_video` VALUES (99, 10, '军队文职申论协作辅导第9集', 'video/link/1.mp4', 'video/image/4-9.png', 'video/preview/1.mp4', '本集课程将分享军队文职申论协作辅导的心得体会和备考经验，帮助学员更好地制定协作辅导备考计划。', 9, 137, 0, 0, '2024-01-14 20:14:10');
INSERT INTO `civil_video` VALUES (100, 10, '军队文职申论协作辅导第10集', 'video/link/2.mp4', 'video/image/4-10.png', 'video/preview/2.mp4', '在这一集中，我们将总结军队文职申论协作辅导的重点，提供备考注意事项和最后的冲刺建议，助力学员在考前取得更好的成绩。', 10, 136, 0, 0, '2024-01-14 20:14:10');
INSERT INTO `civil_video` VALUES (101, 11, '事业单位招聘笔试突破第1集', 'video/link/3.mp4', 'video/image/5-1.png', 'video/preview/3.mp4', '本集课程将从事业单位招聘笔试的重点知识入手，介绍笔试的突破策略，帮助学员理解笔试的难点和备考方法。', 1, 166, 0, 4, '2024-01-14 20:17:05');
INSERT INTO `civil_video` VALUES (102, 11, '事业单位招聘笔试突破第2集', 'video/link/4.mp4', 'video/image/5-2.png', 'video/preview/4.mp4', '在这一集中，我们将深入解析事业单位招聘笔试的题型和解题技巧，提供突破策略的实例分析，帮助学员更好地应对各科目的笔试题目。', 2, 123, 0, 0, '2024-01-14 20:17:05');
INSERT INTO `civil_video` VALUES (103, 11, '事业单位招聘笔试突破第3集', 'video/link/5.mp4', 'video/image/5-3.png', 'video/preview/5.mp4', '本集课程将重点讲解事业单位招聘笔试的时间管理和答题技巧，通过实例演练帮助学员提高笔试效率。', 3, 138, 0, 0, '2024-01-14 20:17:05');
INSERT INTO `civil_video` VALUES (104, 11, '事业单位招聘笔试突破第4集', 'video/link/6.mp4', 'video/image/5-4.png', 'video/preview/6.mp4', '在这一集中，我们将分享事业单位招聘笔试的范文解析和评分标准，帮助学员了解笔试的评分规则和注意事项。', 4, 162, 0, 0, '2024-01-14 20:17:05');
INSERT INTO `civil_video` VALUES (105, 11, '事业单位招聘笔试突破第5集', 'video/link/7.mp4', 'video/image/5-5.png', 'video/preview/7.mp4', '本集课程将全面解析事业单位招聘笔试的突破策略，包括复习计划和备考建议，助力学员更好地备战笔试环节。', 5, 147, 0, 0, '2024-01-14 20:17:05');
INSERT INTO `civil_video` VALUES (106, 11, '事业单位招聘笔试突破第6集', 'video/link/1.mp4', 'video/image/5-6.png', 'video/preview/1.mp4', '在这一集中，我们将进行事业单位招聘笔试的实际案例分析和突破策略演示，通过实例帮助学员理解笔试的实际应用场景。', 6, 137, 0, 0, '2024-01-14 20:17:05');
INSERT INTO `civil_video` VALUES (107, 11, '事业单位招聘笔试突破第7集', 'video/link/2.mp4', 'video/image/5-7.png', 'video/preview/2.mp4', '本集课程将提供事业单位招聘笔试的突破策略题目，通过实际操作帮助学员熟悉突破策略环境，提高应试水平。', 7, 136, 0, 0, '2024-01-14 20:17:05');
INSERT INTO `civil_video` VALUES (108, 11, '事业单位招聘笔试突破第8集', 'video/link/3.mp4', 'video/image/5-8.png', 'video/preview/3.mp4', '在这一集中，我们将进行事业单位招聘笔试的突破策略模拟考场，通过实际模拟突破策略帮助学员适应考场氛围，提高答题效率。', 8, 166, 0, 0, '2024-01-14 20:17:05');
INSERT INTO `civil_video` VALUES (109, 11, '事业单位招聘笔试突破第9集', 'video/link/4.mp4', 'video/image/5-9.png', 'video/preview/4.mp4', '本集课程将分享事业单位招聘笔试的经验教训和考试注意事项，帮助学员在考前做好最后的冲刺准备，取得优异成绩。', 9, 123, 0, 0, '2024-01-14 20:17:05');
INSERT INTO `civil_video` VALUES (110, 11, '事业单位招聘笔试突破第10集', 'video/link/5.mp4', 'video/image/5-10.png', 'video/preview/5.mp4', '在这一集中，我们将总结事业单位招聘笔试的突破策略，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 10, 138, 0, 0, '2024-01-14 20:17:05');
INSERT INTO `civil_video` VALUES (111, 11, '事业单位招聘笔试突破第1集', 'video/link/6.mp4', 'video/image/6-1.png', 'video/preview/6.mp4', '本集课程将从事业单位招聘笔试的重点知识入手，介绍笔试的突破策略，帮助学员理解笔试的难点和备考方法。', 1, 162, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (112, 11, '事业单位招聘笔试突破第2集', 'video/link/7.mp4', 'video/image/6-2.png', 'video/preview/7.mp4', '在这一集中，我们将深入解析事业单位招聘笔试的题型和解题技巧，提供突破策略的实例分析，帮助学员更好地应对各科目的笔试题目。', 2, 147, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (113, 11, '事业单位招聘笔试突破第3集', 'video/link/1.mp4', 'video/image/6-3.png', 'video/preview/1.mp4', '本集课程将重点讲解事业单位招聘笔试的时间管理和答题技巧，通过实例演练帮助学员提高笔试效率。', 3, 137, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (114, 11, '事业单位招聘笔试突破第4集', 'video/link/2.mp4', 'video/image/6-4.png', 'video/preview/2.mp4', '在这一集中，我们将分享事业单位招聘笔试的范文解析和评分标准，帮助学员了解笔试的评分规则和注意事项。', 4, 136, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (115, 11, '事业单位招聘笔试突破第5集', 'video/link/3.mp4', 'video/image/6-5.png', 'video/preview/3.mp4', '本集课程将全面解析事业单位招聘笔试的突破策略，包括复习计划和备考建议，助力学员更好地备战笔试环节。', 5, 166, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (116, 11, '事业单位招聘笔试突破第6集', 'video/link/4.mp4', 'video/image/6-6.png', 'video/preview/4.mp4', '在这一集中，我们将进行事业单位招聘笔试的实际案例分析和突破策略演示，通过实例帮助学员理解笔试的实际应用场景。', 6, 123, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (117, 11, '事业单位招聘笔试突破第7集', 'video/link/5.mp4', 'video/image/6-7.png', 'video/preview/5.mp4', '本集课程将提供事业单位招聘笔试的突破策略题目，通过实际操作帮助学员熟悉突破策略环境，提高应试水平。', 7, 138, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (118, 11, '事业单位招聘笔试突破第8集', 'video/link/6.mp4', 'video/image/6-8.png', 'video/preview/6.mp4', '在这一集中，我们将进行事业单位招聘笔试的突破策略模拟考场，通过实际模拟突破策略帮助学员适应考场氛围，提高答题效率。', 8, 162, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (119, 11, '事业单位招聘笔试突破第9集', 'video/link/7.mp4', 'video/image/6-9.png', 'video/preview/7.mp4', '本集课程将分享事业单位招聘笔试的经验教训和考试注意事项，帮助学员在考前做好最后的冲刺准备，取得优异成绩。', 9, 147, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (120, 11, '事业单位招聘笔试突破第10集', 'video/link/1.mp4', 'video/image/6-10.png', 'video/preview/1.mp4', '在这一集中，我们将总结事业单位招聘笔试的突破策略，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 10, 137, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (121, 12, '公务员申论范文解析第1集', 'video/link/2.mp4', 'video/image/1-1.png', 'video/preview/2.mp4', '本集课程将从公务员申论范文解析的角度，介绍申论写作的基本要求和评分标准，帮助学员了解申论写作的重点和难点。', 1, 136, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (122, 12, '公务员申论范文解析第2集', 'video/link/3.mp4', 'video/image/1-2.png', 'video/preview/3.mp4', '在这一集中，我们将深入解析公务员申论范文的写作结构和论述技巧，提供实例分析，帮助学员更好地理解范文解析的方法。', 2, 166, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (123, 12, '公务员申论范文解析第3集', 'video/link/4.mp4', 'video/image/1-3.png', 'video/preview/4.mp4', '本集课程将重点讲解公务员申论范文的写作思路和逻辑展开，通过实例演练帮助学员提高申论写作水平。', 3, 123, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (124, 12, '公务员申论范文解析第4集', 'video/link/5.mp4', 'video/image/1-4.png', 'video/preview/5.mp4', '在这一集中，我们将分享公务员申论范文的范文解析和评分标准，帮助学员了解申论范文的评分规则和注意事项。', 4, 138, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (125, 12, '公务员申论范文解析第5集', 'video/link/6.mp4', 'video/image/1-5.png', 'video/preview/6.mp4', '本集课程将全面解析公务员申论范文解析的技巧，包括复习计划和备考建议，助力学员更好地备战申论写作环节。', 5, 162, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (126, 12, '公务员申论范文解析第6集', 'video/link/7.mp4', 'video/image/1-6.png', 'video/preview/7.mp4', '在这一集中，我们将进行公务员申论范文解析的实际案例分析和演示，通过实例帮助学员理解申论范文解析的实际应用场景。', 6, 147, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (127, 12, '公务员申论范文解析第7集', 'video/link/1.mp4', 'video/image/1-7.png', 'video/preview/1.mp4', '本集课程将提供公务员申论范文解析的实例题目，通过实际操作帮助学员熟悉解析环境，提高应试水平。', 7, 137, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (128, 12, '公务员申论范文解析第8集', 'video/link/2.mp4', 'video/image/1-8.png', 'video/preview/2.mp4', '在这一集中，我们将进行公务员申论范文解析的模拟考场，通过实际模拟解析帮助学员适应考场氛围，提高解析效率。', 8, 136, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (129, 12, '公务员申论范文解析第9集', 'video/link/3.mp4', 'video/image/1-9.png', 'video/preview/3.mp4', '本集课程将分享公务员申论范文解析的经验教训和考试注意事项，帮助学员在考前做好最后的冲刺准备，取得优异成绩。', 9, 166, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (130, 12, '公务员申论范文解析第10集', 'video/link/4.mp4', 'video/image/1-10.png', 'video/preview/4.mp4', '在这一集中，我们将总结公务员申论范文解析的方法和技巧，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 10, 123, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (131, 13, '三支一扶申论写作指导第1集', 'video/link/5.mp4', 'video/image/2-1.png', 'video/preview/5.mp4', '本集课程将从三支一扶申论写作的基本要求入手，介绍写作的结构和论述技巧，帮助学员理解申论写作的难点。', 1, 138, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (132, 13, '三支一扶申论写作指导第2集', 'video/link/6.mp4', 'video/image/2-2.png', 'video/preview/6.mp4', '在这一集中，我们将深入解析三支一扶申论写作的写作思路和逻辑展开，提供实例分析，帮助学员更好地掌握写作指导的方法。', 2, 162, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (133, 13, '三支一扶申论写作指导第3集', 'video/link/7.mp4', 'video/image/2-3.png', 'video/preview/7.mp4', '本集课程将重点讲解三支一扶申论写作的时间管理和答题技巧，通过实例演练帮助学员提高写作水平。', 3, 147, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (134, 13, '三支一扶申论写作指导第4集', 'video/link/1.mp4', 'video/image/2-4.png', 'video/preview/1.mp4', '在这一集中，我们将分享三支一扶申论写作的范文解析和评分标准，帮助学员了解写作的评分规则和注意事项。', 4, 137, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (135, 13, '三支一扶申论写作指导第5集', 'video/link/2.mp4', 'video/image/2-5.png', 'video/preview/2.mp4', '本集课程将全面解析三支一扶申论写作的指导技巧，包括复习计划和备考建议，助力学员更好地备战写作环节。', 5, 136, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (136, 13, '三支一扶申论写作指导第6集', 'video/link/3.mp4', 'video/image/2-6.png', 'video/preview/3.mp4', '在这一集中，我们将进行三支一扶申论写作的实际案例分析和演示，通过实例帮助学员理解写作指导的实际应用场景。', 6, 166, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (137, 13, '三支一扶申论写作指导第7集', 'video/link/4.mp4', 'video/image/2-7.png', 'video/preview/4.mp4', '本集课程将提供三支一扶申论写作的实例题目，通过实际操作帮助学员熟悉指导环境，提高应试水平。', 7, 123, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (138, 13, '三支一扶申论写作指导第8集', 'video/link/5.mp4', 'video/image/2-8.png', 'video/preview/5.mp4', '在这一集中，我们将进行三支一扶申论写作的模拟考场，通过实际模拟指导帮助学员适应考场氛围，提高写作效率。', 8, 138, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (139, 13, '三支一扶申论写作指导第9集', 'video/link/6.mp4', 'video/image/2-9.png', 'video/preview/6.mp4', '本集课程将分享三支一扶申论写作的经验教训和考试注意事项，帮助学员在考前做好最后的冲刺准备，取得优异成绩。', 9, 162, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (140, 13, '三支一扶申论写作指导第10集', 'video/link/7.mp4', 'video/image/2-10.png', 'video/preview/7.mp4', '在这一集中，我们将总结三支一扶申论写作的指导方法和技巧，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 10, 147, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (141, 14, '军队文职面试模拟第1集', 'video/link/1.mp4', 'video/image/3-1.png', 'video/preview/1.mp4', '本集课程将从军队文职面试的面试流程入手，介绍面试的基本要求和形式，帮助学员理解面试的难点。', 1, 137, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (142, 14, '军队文职面试模拟第2集', 'video/link/2.mp4', 'video/image/3-2.png', 'video/preview/2.mp4', '在这一集中，我们将深入解析军队文职面试的面试技巧和形体仪态，提供实例分析，帮助学员更好地应对面试环节。', 2, 136, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (143, 14, '军队文职面试模拟第3集', 'video/link/3.mp4', 'video/image/3-3.png', 'video/preview/3.mp4', '本集课程将重点讲解军队文职面试的模拟面试案例，通过实例演练帮助学员提高面试水平。', 3, 166, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (144, 14, '军队文职面试模拟第4集', 'video/link/4.mp4', 'video/image/3-4.png', 'video/preview/4.mp4', '在这一集中，我们将分享军队文职面试的面试注意事项和评分标准，帮助学员了解面试的评分规则和注意事项。', 4, 123, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (145, 14, '军队文职面试模拟第5集', 'video/link/5.mp4', 'video/image/3-5.png', 'video/preview/5.mp4', '本集课程将全面解析军队文职面试的模拟面试技巧，包括形体仪态和应对问题的方法，助力学员更好地备战面试环节。', 5, 138, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (146, 14, '军队文职面试模拟第6集', 'video/link/6.mp4', 'video/image/3-6.png', 'video/preview/6.mp4', '在这一集中，我们将进行军队文职面试的实际案例分析和模拟面试，通过实例帮助学员理解面试的实际应用场景。', 6, 162, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (147, 14, '军队文职面试模拟第7集', 'video/link/7.mp4', 'video/image/3-7.png', 'video/preview/7.mp4', '本集课程将提供军队文职面试的模拟面试题目，通过实际操作帮助学员熟悉模拟环境，提高应试水平。', 7, 147, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (148, 14, '军队文职面试模拟第8集', 'video/link/1.mp4', 'video/image/3-8.png', 'video/preview/1.mp4', '在这一集中，我们将进行军队文职面试的模拟考场，通过实际模拟面试帮助学员适应考场氛围，提高面试效率。', 8, 137, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (149, 14, '军队文职面试模拟第9集', 'video/link/2.mp4', 'video/image/3-9.png', 'video/preview/2.mp4', '本集课程将分享军队文职面试的经验教训和考试注意事项，帮助学员在考前做好最后的冲刺准备，取得优异成绩。', 9, 136, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (150, 14, '军队文职面试模拟第10集', 'video/link/3.mp4', 'video/image/3-10.png', 'video/preview/3.mp4', '在这一集中，我们将总结军队文职面试的模拟方法和技巧，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 10, 166, 0, 0, '2024-01-14 20:18:11');
INSERT INTO `civil_video` VALUES (151, 15, '公安招警面试技能培训第1集', 'video/link/4.mp4', 'video/image/4-1.png', 'video/preview/4.mp4', '本集课程将从公安招警面试的基本要求入手，介绍面试的技能培训内容，帮助学员理解面试的难点。', 1, 123, 0, 0, '2024-01-14 20:19:25');
INSERT INTO `civil_video` VALUES (152, 15, '公安招警面试技能培训第2集', 'video/link/5.mp4', 'video/image/4-2.png', 'video/preview/5.mp4', '在这一集中，我们将深入解析公安招警面试的技能培训重点和方法，提供实例分析，帮助学员更好地掌握面试技能。', 2, 138, 0, 0, '2024-01-14 20:19:25');
INSERT INTO `civil_video` VALUES (153, 15, '公安招警面试技能培训第3集', 'video/link/6.mp4', 'video/image/4-3.png', 'video/preview/6.mp4', '本集课程将重点讲解公安招警面试的模拟培训案例，通过实例演练帮助学员提高面试水平。', 3, 162, 0, 0, '2024-01-14 20:19:25');
INSERT INTO `civil_video` VALUES (154, 15, '公安招警面试技能培训第4集', 'video/link/7.mp4', 'video/image/4-4.png', 'video/preview/7.mp4', '在这一集中，我们将分享公安招警面试的技能培训注意事项和评分标准，帮助学员了解技能培训的评分规则和注意事项。', 4, 147, 0, 0, '2024-01-14 20:19:25');
INSERT INTO `civil_video` VALUES (155, 15, '公安招警面试技能培训第5集', 'video/link/1.mp4', 'video/image/4-5.png', 'video/preview/1.mp4', '本集课程将全面解析公安招警面试的模拟培训技巧，包括技能表现和应对问题的方法，助力学员更好地备战面试环节。', 5, 137, 0, 0, '2024-01-14 20:19:25');
INSERT INTO `civil_video` VALUES (156, 15, '公安招警面试技能培训第6集', 'video/link/2.mp4', 'video/image/4-6.png', 'video/preview/2.mp4', '在这一集中，我们将进行公安招警面试的实际技能培训案例分析和演示，通过实例帮助学员理解技能培训的实际应用场景。', 6, 136, 0, 0, '2024-01-14 20:19:25');
INSERT INTO `civil_video` VALUES (157, 15, '公安招警面试技能培训第7集', 'video/link/3.mp4', 'video/image/4-7.png', 'video/preview/3.mp4', '本集课程将提供公安招警面试的模拟培训题目，通过实际操作帮助学员熟悉培训环境，提高应试水平。', 7, 166, 0, 0, '2024-01-14 20:19:25');
INSERT INTO `civil_video` VALUES (158, 15, '公安招警面试技能培训第8集', 'video/link/4.mp4', 'video/image/4-8.png', 'video/preview/4.mp4', '在这一集中，我们将进行公安招警面试的模拟培训考场，通过实际模拟培训帮助学员适应考场氛围，提高面试效率。', 8, 123, 0, 0, '2024-01-14 20:19:25');
INSERT INTO `civil_video` VALUES (159, 15, '公安招警面试技能培训第9集', 'video/link/5.mp4', 'video/image/4-9.png', 'video/preview/5.mp4', '本集课程将分享公安招警面试的经验教训和考试注意事项，帮助学员在考前做好最后的冲刺准备，取得优异成绩。', 9, 138, 0, 0, '2024-01-14 20:19:25');
INSERT INTO `civil_video` VALUES (160, 15, '公安招警面试技能培训第10集', 'video/link/6.mp4', 'video/image/4-10.png', 'video/preview/6.mp4', '在这一集中，我们将总结公安招警面试的技能培训方法和技巧，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 10, 162, 0, 0, '2024-01-14 20:19:25');
INSERT INTO `civil_video` VALUES (161, 16, '公务员面试心理辅导第1集', 'video/link/7.mp4', 'video/image/5-1.png', 'video/preview/7.mp4', '在这一集中，我们将介绍公务员面试心理辅导的基本概念和重要性，帮助学员认识并提高心理素质。', 1, 147, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (162, 16, '公务员面试心理辅导第2集', 'video/link/1.mp4', 'video/image/5-2.png', 'video/preview/1.mp4', '本集课程将深入解析公务员面试中可能遇到的心理压力和挑战，提供应对方法和心理调节建议。', 2, 137, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (163, 16, '公务员面试心理辅导第3集', 'video/link/2.mp4', 'video/image/5-3.png', 'video/preview/2.mp4', '在这一集中，我们将进行公务员面试心理辅导的模拟案例分析，通过实例演示帮助学员理解心理辅导的实际应用场景。', 3, 136, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (164, 16, '公务员面试心理辅导第4集', 'video/link/3.mp4', 'video/image/5-4.png', 'video/preview/3.mp4', '本集课程将分享公务员面试心理辅导的成功经验和心得体会，提供学员宝贵的心理辅导经验。', 4, 166, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (165, 16, '公务员面试心理辅导第5集', 'video/link/4.mp4', 'video/image/5-5.png', 'video/preview/4.mp4', '在这一集中，我们将进行公务员面试心理辅导的实际心理调训，通过实际操作帮助学员提高心理应对能力。', 5, 123, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (166, 16, '公务员面试心理辅导第6集', 'video/link/5.mp4', 'video/image/5-6.png', 'video/preview/5.mp4', '本集课程将提供公务员面试心理辅导的模拟调训题目，通过实际操作帮助学员熟悉心理辅导环境，提高应试水平。', 6, 138, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (167, 16, '公务员面试心理辅导第7集', 'video/link/6.mp4', 'video/image/5-7.png', 'video/preview/6.mp4', '在这一集中，我们将进行公务员面试心理辅导的实际心理辅导考场，通过实际模拟培训帮助学员适应考场氛围。', 7, 162, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (168, 16, '公务员面试心理辅导第8集', 'video/link/7.mp4', 'video/image/5-8.png', 'video/preview/7.mp4', '本集课程将分享公务员面试心理辅导的经验教训和心得体会，帮助学员在考前做好最后的心理调整，取得更好的成绩。', 8, 147, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (169, 16, '公务员面试心理辅导第9集', 'video/link/1.mp4', 'video/image/5-9.png', 'video/preview/1.mp4', '在这一集中，我们将总结公务员面试心理辅导的方法和技巧，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 9, 137, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (170, 16, '公务员面试心理辅导第10集', 'video/link/2.mp4', 'video/image/5-10.png', 'video/preview/2.mp4', '本集课程将总结公务员面试心理辅导的成功经验和心得体会，为学员提供最后的备考建议，取得优异成绩。', 10, 136, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (171, 17, '事业单位招聘面试实战第1集', 'video/link/3.mp4', 'video/image/6-1.png', 'video/preview/3.mp4', '在这一集中，我们将介绍事业单位招聘面试实战的基本概念和实施方法，帮助学员了解面试实战的要点。', 1, 166, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (172, 17, '事业单位招聘面试实战第2集', 'video/link/4.mp4', 'video/image/6-2.png', 'video/preview/4.mp4', '本集课程将深入解析事业单位招聘面试实战的评分规则和注意事项，提供实例分析和解决方案。', 2, 123, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (173, 17, '事业单位招聘面试实战第3集', 'video/link/5.mp4', 'video/image/6-3.png', 'video/preview/5.mp4', '在这一集中，我们将进行事业单位招聘面试实战的模拟案例分析，通过实例演示帮助学员理解实战的实际应用场景。', 3, 138, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (174, 17, '事业单位招聘面试实战第4集', 'video/link/6.mp4', 'video/image/6-4.png', 'video/preview/6.mp4', '本集课程将分享事业单位招聘面试实战的成功经验和心得体会，提供学员宝贵的实战经验。', 4, 162, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (175, 17, '事业单位招聘面试实战第5集', 'video/link/7.mp4', 'video/image/6-5.png', 'video/preview/7.mp4', '在这一集中，我们将进行事业单位招聘面试实战的实际操作演示，通过实际操作帮助学员提高实战水平。', 5, 147, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (176, 17, '事业单位招聘面试实战第6集', 'video/link/1.mp4', 'video/image/6-6.png', 'video/preview/1.mp4', '本集课程将提供事业单位招聘面试实战的模拟实战题目，通过实际操作帮助学员熟悉实战环境，提高应试水平。', 6, 137, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (177, 17, '事业单位招聘面试实战第7集', 'video/link/2.mp4', 'video/image/6-7.png', 'video/preview/2.mp4', '在这一集中，我们将进行事业单位招聘面试实战的实际考场，通过实际模拟培训帮助学员适应考场氛围。', 7, 136, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (178, 17, '事业单位招聘面试实战第8集', 'video/link/3.mp4', 'video/image/6-8.png', 'video/preview/3.mp4', '本集课程将分享事业单位招聘面试实战的经验教训和心得体会，帮助学员在考前做好最后的实战准备，取得更好的成绩。', 8, 166, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (179, 17, '事业单位招聘面试实战第9集', 'video/link/4.mp4', 'video/image/6-9.png', 'video/preview/4.mp4', '在这一集中，我们将总结事业单位招聘面试实战的方法和技巧，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 9, 123, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (180, 17, '事业单位招聘面试实战第10集', 'video/link/5.mp4', 'video/image/6-10.png', 'video/preview/5.mp4', '本集课程将总结事业单位招聘面试实战的成功经验和心得体会，为学员提供最后的备考建议，取得优异成绩。', 10, 138, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (181, 18, '三支一扶招聘考试解析第1集', 'video/link/6.mp4', 'video/image/1-1.png', 'video/preview/6.mp4', '在这一集中，我们将介绍三支一扶招聘考试解析的基本概念和解析方法，帮助学员了解解析的要点。', 1, 162, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (182, 18, '三支一扶招聘考试解析第2集', 'video/link/7.mp4', 'video/image/1-2.png', 'video/preview/7.mp4', '本集课程将深入解析三支一扶招聘考试解析的难点和注意事项，提供实例分析和解决方案。', 2, 147, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (183, 18, '三支一扶招聘考试解析第3集', 'video/link/1.mp4', 'video/image/1-3.png', 'video/preview/1.mp4', '在这一集中，我们将进行三支一扶招聘考试解析的模拟案例分析，通过实例演示帮助学员理解解析的实际应用场景。', 3, 137, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (184, 18, '三支一扶招聘考试解析第4集', 'video/link/2.mp4', 'video/image/1-4.png', 'video/preview/2.mp4', '本集课程将分享三支一扶招聘考试解析的成功经验和心得体会，提供学员宝贵的解析经验。', 4, 136, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (185, 18, '三支一扶招聘考试解析第5集', 'video/link/3.mp4', 'video/image/1-5.png', 'video/preview/3.mp4', '在这一集中，我们将进行三支一扶招聘考试解析的实际操作演示，通过实际操作帮助学员提高解析水平。', 5, 166, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (186, 18, '三支一扶招聘考试解析第6集', 'video/link/4.mp4', 'video/image/1-6.png', 'video/preview/4.mp4', '本集课程将提供三支一扶招聘考试解析的模拟解析题目，通过实际操作帮助学员熟悉解析环境，提高应试水平。', 6, 123, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (187, 18, '三支一扶招聘考试解析第7集', 'video/link/5.mp4', 'video/image/1-7.png', 'video/preview/5.mp4', '在这一集中，我们将进行三支一扶招聘考试解析的实际考场，通过实际模拟培训帮助学员适应考场氛围。', 7, 138, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (188, 18, '三支一扶招聘考试解析第8集', 'video/link/6.mp4', 'video/image/1-8.png', 'video/preview/6.mp4', '本集课程将分享三支一扶招聘考试解析的经验教训和心得体会，帮助学员在考前做好最后的解析准备，取得更好的成绩。', 8, 162, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (189, 18, '三支一扶招聘考试解析第9集', 'video/link/7.mp4', 'video/image/1-9.png', 'video/preview/7.mp4', '在这一集中，我们将总结三支一扶招聘考试解析的方法和技巧，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 9, 147, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (190, 18, '三支一扶招聘考试解析第10集', 'video/link/1.mp4', 'video/image/1-10.png', 'video/preview/1.mp4', '本集课程将总结三支一扶招聘考试解析的成功经验和心得体会，为学员提供最后的备考建议，取得优异成绩。', 10, 137, 0, 0, '2024-01-14 20:23:15');
INSERT INTO `civil_video` VALUES (191, 19, '公务员笔试模拟考场第1集', 'video/link/2.mp4', 'video/image/2-1.png', 'video/preview/2.mp4', '在这一集中，我们将介绍公务员笔试模拟考场的基本概念和考场规则，帮助学员了解模拟考场的要点。', 1, 136, 0, 0, '2024-01-14 20:24:44');
INSERT INTO `civil_video` VALUES (192, 19, '公务员笔试模拟考场第2集', 'video/link/3.mp4', 'video/image/2-2.png', 'video/preview/3.mp4', '本集课程将深入解析公务员笔试模拟考场的题型和难度，提供实例分析和解决方案。', 2, 166, 0, 0, '2024-01-14 20:24:44');
INSERT INTO `civil_video` VALUES (193, 19, '公务员笔试模拟考场第3集', 'video/link/4.mp4', 'video/image/2-3.png', 'video/preview/4.mp4', '在这一集中，我们将进行公务员笔试模拟考场的模拟案例分析，通过实例演示帮助学员理解模拟考场的实际应用场景。', 3, 123, 0, 0, '2024-01-14 20:24:44');
INSERT INTO `civil_video` VALUES (194, 19, '公务员笔试模拟考场第4集', 'video/link/5.mp4', 'video/image/2-4.png', 'video/preview/5.mp4', '本集课程将分享公务员笔试模拟考场的成功经验和心得体会，提供学员宝贵的模拟考场经验。', 4, 138, 0, 0, '2024-01-14 20:24:44');
INSERT INTO `civil_video` VALUES (195, 19, '公务员笔试模拟考场第5集', 'video/link/6.mp4', 'video/image/2-5.png', 'video/preview/6.mp4', '在这一集中，我们将进行公务员笔试模拟考场的实际操作演示，通过实际操作帮助学员提高模拟考场水平。', 5, 162, 0, 0, '2024-01-14 20:24:44');
INSERT INTO `civil_video` VALUES (196, 19, '公务员笔试模拟考场第6集', 'video/link/7.mp4', 'video/image/2-6.png', 'video/preview/7.mp4', '本集课程将提供公务员笔试模拟考场的模拟考场题目，通过实际操作帮助学员熟悉模拟考场环境，提高应试水平。', 6, 147, 0, 0, '2024-01-14 20:24:44');
INSERT INTO `civil_video` VALUES (197, 19, '公务员笔试模拟考场第7集', 'video/link/1.mp4', 'video/image/2-7.png', 'video/preview/1.mp4', '在这一集中，我们将进行公务员笔试模拟考场的实际考场，通过实际模拟培训帮助学员适应考场氛围。', 7, 137, 0, 0, '2024-01-14 20:24:44');
INSERT INTO `civil_video` VALUES (198, 19, '公务员笔试模拟考场第8集', 'video/link/2.mp4', 'video/image/2-8.png', 'video/preview/2.mp4', '本集课程将分享公务员笔试模拟考场的经验教训和心得体会，帮助学员在考前做好最后的模拟考场准备，取得更好的成绩。', 8, 136, 0, 0, '2024-01-14 20:24:44');
INSERT INTO `civil_video` VALUES (199, 19, '公务员笔试模拟考场第9集', 'video/link/3.mp4', 'video/image/2-9.png', 'video/preview/3.mp4', '在这一集中，我们将总结公务员笔试模拟考场的方法和技巧，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 9, 166, 0, 0, '2024-01-14 20:24:44');
INSERT INTO `civil_video` VALUES (200, 19, '公务员笔试模拟考场第10集', 'video/link/4.mp4', 'video/image/2-10.png', 'video/preview/4.mp4', '本集课程将总结公务员笔试模拟考场的成功经验和心得体会，为学员提供最后的备考建议，取得优异成绩。', 10, 123, 0, 0, '2024-01-14 20:24:44');
INSERT INTO `civil_video` VALUES (201, 20, '军队文职综合素质面试第1集', 'video/link/5.mp4', 'video/image/3-1.png', 'video/preview/5.mp4', '在这一集中，我们将介绍军队文职综合素质面试的基本概念和面试流程，帮助学员了解面试的要点。', 1, 138, 0, 0, '2024-01-14 20:25:36');
INSERT INTO `civil_video` VALUES (202, 20, '军队文职综合素质面试第2集', 'video/link/6.mp4', 'video/image/3-2.png', 'video/preview/6.mp4', '本集课程将深入解析军队文职综合素质面试的各个环节和考察要点，提供实例分析和解决方案。', 2, 162, 0, 0, '2024-01-14 20:25:36');
INSERT INTO `civil_video` VALUES (203, 20, '军队文职综合素质面试第3集', 'video/link/7.mp4', 'video/image/3-3.png', 'video/preview/7.mp4', '在这一集中，我们将进行军队文职综合素质面试的模拟案例分析，通过实例演示帮助学员理解面试的实际应用场景。', 3, 147, 0, 0, '2024-01-14 20:25:36');
INSERT INTO `civil_video` VALUES (204, 20, '军队文职综合素质面试第4集', 'video/link/1.mp4', 'video/image/3-4.png', 'video/preview/1.mp4', '本集课程将分享军队文职综合素质面试的成功经验和心得体会，提供学员宝贵的面试经验。', 4, 137, 0, 0, '2024-01-14 20:25:36');
INSERT INTO `civil_video` VALUES (205, 20, '军队文职综合素质面试第5集', 'video/link/2.mp4', 'video/image/3-5.png', 'video/preview/2.mp4', '在这一集中，我们将进行军队文职综合素质面试的实际操作演示，通过实际操作帮助学员提高面试水平。', 5, 136, 0, 0, '2024-01-14 20:25:36');
INSERT INTO `civil_video` VALUES (206, 20, '军队文职综合素质面试第6集', 'video/link/3.mp4', 'video/image/3-6.png', 'video/preview/3.mp4', '本集课程将提供军队文职综合素质面试的模拟面试题目，通过实际操作帮助学员熟悉面试环境，提高应试水平。', 6, 166, 0, 0, '2024-01-14 20:25:36');
INSERT INTO `civil_video` VALUES (207, 20, '军队文职综合素质面试第7集', 'video/link/4.mp4', 'video/image/3-7.png', 'video/preview/4.mp4', '在这一集中，我们将进行军队文职综合素质面试的实际面试，通过实际模拟培训帮助学员适应面试氛围。', 7, 123, 0, 0, '2024-01-14 20:25:36');
INSERT INTO `civil_video` VALUES (208, 20, '军队文职综合素质面试第8集', 'video/link/5.mp4', 'video/image/3-8.png', 'video/preview/5.mp4', '本集课程将分享军队文职综合素质面试的经验教训和心得体会，帮助学员在考前做好最后的面试准备，取得更好的成绩。', 8, 138, 0, 0, '2024-01-14 20:25:36');
INSERT INTO `civil_video` VALUES (209, 20, '军队文职综合素质面试第9集', 'video/link/6.mp4', 'video/image/3-9.png', 'video/preview/6.mp4', '在这一集中，我们将总结军队文职综合素质面试的方法和技巧，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 9, 162, 0, 0, '2024-01-14 20:25:36');
INSERT INTO `civil_video` VALUES (210, 20, '军队文职综合素质面试第10集', 'video/link/7.mp4', 'video/image/3-10.png', 'video/preview/7.mp4', '本集课程将总结军队文职综合素质面试的成功经验和心得体会，为学员提供最后的备考建议，取得优异成绩。', 10, 147, 0, 0, '2024-01-14 20:25:36');
INSERT INTO `civil_video` VALUES (211, 21, '公安招警心理测试训练第1集', 'video/link/1.mp4', 'video/image/4-1.png', 'video/preview/1.mp4', '在这一集中，我们将介绍公安招警心理测试的基本题型和解题技巧，帮助学员提高在心理测试环节的应试水平。', 1, 137, 0, 0, '2024-01-14 20:29:05');
INSERT INTO `civil_video` VALUES (212, 21, '公安招警心理测试训练第2集', 'video/link/2.mp4', 'video/image/4-2.png', 'video/preview/2.mp4', '这一集将继续深入探讨公安招警心理测试的各类题目，通过实例分析和解题练习，学员将更好地应对心理测试的挑战。', 2, 136, 0, 0, '2024-01-14 20:29:05');
INSERT INTO `civil_video` VALUES (213, 21, '公安招警心理测试训练第3集', 'video/link/3.mp4', 'video/image/4-3.png', 'video/preview/3.mp4', '在这一集中，我们将通过模拟测试，帮助学员在实际环境中练习心理测试，提高在考试中的应对水平。', 3, 166, 0, 0, '2024-01-14 20:29:05');
INSERT INTO `civil_video` VALUES (214, 21, '公安招警心理测试训练第4集', 'video/link/4.mp4', 'video/image/4-4.png', 'video/preview/4.mp4', '本集课程将围绕公安招警心理测试的难点展开，为学员提供更深入的解题技巧和应试建议。', 4, 123, 0, 0, '2024-01-14 20:29:05');
INSERT INTO `civil_video` VALUES (215, 21, '公安招警心理测试训练第5集', 'video/link/5.mp4', 'video/image/4-5.png', 'video/preview/5.mp4', '在这一集中，我们将通过学员的实际问题案例，进行现场解答和指导，帮助学员解决在心理测试中遇到的困难。', 5, 138, 0, 0, '2024-01-14 20:29:05');
INSERT INTO `civil_video` VALUES (216, 21, '公安招警心理测试训练第6集', 'video/link/6.mp4', 'video/image/4-6.png', 'video/preview/6.mp4', '本集课程将通过精选的心理测试题目，进行现场解答和分析，帮助学员更好地理解心理测试的出题思路。', 6, 162, 0, 0, '2024-01-14 20:29:05');
INSERT INTO `civil_video` VALUES (217, 21, '公安招警心理测试训练第7集', 'video/link/7.mp4', 'video/image/4-7.png', 'video/preview/7.mp4', '在这一集中，我们将针对学员反馈的问题，进行答疑解惑，确保学员对心理测试的各个方面有清晰的理解。', 7, 147, 0, 0, '2024-01-14 20:29:05');
INSERT INTO `civil_video` VALUES (218, 21, '公安招警心理测试训练第8集', 'video/link/1.mp4', 'video/image/4-8.png', 'video/preview/1.mp4', '本集课程将通过模拟考试环节，让学员在真实考试场景中练习心理测试，提高应试水平。', 8, 137, 0, 0, '2024-01-14 20:29:05');
INSERT INTO `civil_video` VALUES (219, 21, '公安招警心理测试训练第9集', 'video/link/2.mp4', 'video/image/4-9.png', 'video/preview/2.mp4', '在这一集中，我们将邀请心理测试领域的专家，为学员答疑解惑，分享心理测试的应试经验和技巧。', 9, 136, 0, 0, '2024-01-14 20:29:05');
INSERT INTO `civil_video` VALUES (220, 21, '公安招警心理测试训练第10集', 'video/link/3.mp4', 'video/image/4-10.png', 'video/preview/3.mp4', '本集课程将总结心理测试训练的重点，为学员提供备考建议，帮助他们在考试中取得优异成绩。', 10, 166, 0, 0, '2024-01-14 20:29:05');
INSERT INTO `civil_video` VALUES (221, 22, '事业单位招聘笔试技巧第1集', 'video/link/4.mp4', 'video/image/5-1.png', 'video/preview/4.mp4', '本集课程旨在帮助学员熟悉事业单位招聘笔试的常见题型，解析解题技巧，为备战笔试做好准备。', 1, 123, 0, 0, '2024-01-14 20:29:05');
INSERT INTO `civil_video` VALUES (222, 22, '事业单位招聘笔试技巧第2集', 'video/link/5.mp4', 'video/image/5-2.png', 'video/preview/5.mp4', '在这一集中，我们将深入讲解事业单位招聘笔试的各科目题型，为学员提供全面的笔试技巧培训。', 2, 138, 0, 0, '2024-01-14 20:29:05');
INSERT INTO `civil_video` VALUES (223, 22, '事业单位招聘笔试技巧第3集', 'video/link/6.mp4', 'video/image/5-3.png', 'video/preview/6.mp4', '在本集课程中，我们将通过实例分析和解题练习，帮助学员更好地掌握事业单位招聘笔试的解题技巧。', 3, 162, 0, 0, '2024-01-14 20:29:05');
INSERT INTO `civil_video` VALUES (224, 22, '事业单位招聘笔试技巧第4集', 'video/link/7.mp4', 'video/image/5-4.png', 'video/preview/7.mp4', '在这一集中，我们将针对学员反馈的问题，进行答疑解惑，确保学员能够理解和应用笔试技巧。', 4, 147, 0, 0, '2024-01-14 20:29:05');
INSERT INTO `civil_video` VALUES (225, 22, '事业单位招聘笔试技巧第5集', 'video/link/1.mp4', 'video/image/5-5.png', 'video/preview/1.mp4', '本集课程将通过模拟考试，让学员在真实考试环境中练习笔试技巧，提高应试水平。', 5, 137, 0, 0, '2024-01-14 20:29:05');
INSERT INTO `civil_video` VALUES (226, 22, '事业单位招聘笔试技巧第6集', 'video/link/2.mp4', 'video/image/5-6.png', 'video/preview/2.mp4', '在这一集中，我们将邀请拥有丰富招聘经验的专业人士，分享笔试技巧的实际应用经验。', 6, 136, 0, 0, '2024-01-14 20:29:05');
INSERT INTO `civil_video` VALUES (227, 22, '事业单位招聘笔试技巧第7集', 'video/link/3.mp4', 'video/image/5-7.png', 'video/preview/3.mp4', '本集课程将通过解析高分学员的答题过程，为学员提供学习笔试技巧的思路和方法。', 7, 166, 0, 0, '2024-01-14 20:29:05');
INSERT INTO `civil_video` VALUES (228, 22, '事业单位招聘笔试技巧第8集', 'video/link/4.mp4', 'video/image/5-8.png', 'video/preview/4.mp4', '在这一集中，我们将总结事业单位招聘笔试技巧的重点，为学员提供备考建议，帮助他们在考试中脱颖而出。', 8, 123, 0, 0, '2024-01-14 20:29:05');
INSERT INTO `civil_video` VALUES (229, 22, '事业单位招聘笔试技巧第9集', 'video/link/5.mp4', 'video/image/5-9.png', 'video/preview/5.mp4', '本集课程将通过模拟考试，检验学员对笔试技巧的掌握程度，帮助他们在实际考试中更加游刃有余。', 9, 138, 0, 0, '2024-01-14 20:29:05');
INSERT INTO `civil_video` VALUES (230, 22, '事业单位招聘笔试技巧第10集', 'video/link/6.mp4', 'video/image/5-10.png', 'video/preview/6.mp4', '在这一集中，我们将邀请事业单位笔试的考官，为学员揭示笔试评分的要点和标准，帮助他们更好地备考。', 10, 162, 0, 0, '2024-01-14 20:29:05');
INSERT INTO `civil_video` VALUES (231, 23, '三支一扶申论范文欣赏第1集', 'video/link/7.mp4', 'video/image/6-1.png', 'video/preview/7.mp4', '在这一集中，我们将为学员提供三支一扶申论范文的经典案例，通过深入解析，帮助学员理解申论写作的要求和技巧。', 1, 147, 0, 0, '2024-01-14 20:30:00');
INSERT INTO `civil_video` VALUES (232, 23, '三支一扶申论范文欣赏第2集', 'video/link/1.mp4', 'video/image/6-2.png', 'video/preview/1.mp4', '本集课程将通过学员的实际问题案例，进行现场解答和指导，帮助学员解决在申论写作中遇到的困难。', 2, 137, 0, 0, '2024-01-14 20:30:00');
INSERT INTO `civil_video` VALUES (233, 23, '三支一扶申论范文欣赏第3集', 'video/link/2.mp4', 'video/image/6-3.png', 'video/preview/2.mp4', '在这一集中，我们将通过模拟考试，让学员在真实考试环境中练习申论写作，提高应试水平。', 3, 136, 0, 0, '2024-01-14 20:30:00');
INSERT INTO `civil_video` VALUES (234, 23, '三支一扶申论范文欣赏第4集', 'video/link/3.mp4', 'video/image/6-4.png', 'video/preview/3.mp4', '本集课程将通过解析高分学员的申论写作过程，为学员提供学习写作技巧的思路和方法。', 4, 166, 0, 0, '2024-01-14 20:30:00');
INSERT INTO `civil_video` VALUES (235, 23, '三支一扶申论范文欣赏第5集', 'video/link/4.mp4', 'video/image/6-5.png', 'video/preview/4.mp4', '在这一集中，我们将邀请申论领域的专家，为学员答疑解惑，分享申论写作的应试经验和技巧。', 5, 123, 0, 0, '2024-01-14 20:30:00');
INSERT INTO `civil_video` VALUES (236, 23, '三支一扶申论范文欣赏第6集', 'video/link/5.mp4', 'video/image/6-6.png', 'video/preview/5.mp4', '本集课程将通过实例分析和写作练习，帮助学员更好地理解申论写作的出题思路，提高写作水平。', 6, 138, 0, 0, '2024-01-14 20:30:00');
INSERT INTO `civil_video` VALUES (237, 23, '三支一扶申论范文欣赏第7集', 'video/link/6.mp4', 'video/image/6-7.png', 'video/preview/6.mp4', '在这一集中，我们将总结申论范文欣赏的重点，为学员提供备考建议，帮助他们在考试中取得优异成绩。', 7, 162, 0, 0, '2024-01-14 20:30:00');
INSERT INTO `civil_video` VALUES (238, 23, '三支一扶申论范文欣赏第8集', 'video/link/7.mp4', 'video/image/6-8.png', 'video/preview/7.mp4', '本集课程将通过模拟考试，检验学员对申论写作技巧的掌握程度，帮助他们在实际考试中更加游刃有余。', 8, 147, 0, 0, '2024-01-14 20:30:00');
INSERT INTO `civil_video` VALUES (239, 23, '三支一扶申论范文欣赏第9集', 'video/link/1.mp4', 'video/image/6-9.png', 'video/preview/1.mp4', '在这一集中，我们将邀请申论考官，为学员揭示申论评分的要点和标准，帮助他们更好地备考。', 9, 137, 0, 0, '2024-01-14 20:30:00');
INSERT INTO `civil_video` VALUES (240, 23, '三支一扶申论范文欣赏第10集', 'video/link/2.mp4', 'video/image/6-10.png', 'video/preview/2.mp4', '本集课程将总结申论写作的经典范文，为学员提供最后的备考指导，确保他们在考试中发挥出色。', 10, 136, 0, 0, '2024-01-14 20:30:00');
INSERT INTO `civil_video` VALUES (241, 24, '公务员笔试模拟题库第1集', 'video/link/3.mp4', 'video/image/1-1.png', 'video/preview/3.mp4', '在这一集中，我们将为学员提供公务员笔试的模拟题目，通过详细解析，帮助学员理解解题思路和技巧。', 1, 166, 0, 0, '2024-01-14 20:30:47');
INSERT INTO `civil_video` VALUES (242, 24, '公务员笔试模拟题库第2集', 'video/link/4.mp4', 'video/image/1-2.png', 'video/preview/4.mp4', '本集课程将通过学员的实际问题案例，进行现场解答和指导，帮助学员解决在笔试过程中遇到的困难。', 2, 123, 0, 0, '2024-01-14 20:30:47');
INSERT INTO `civil_video` VALUES (243, 24, '公务员笔试模拟题库第3集', 'video/link/5.mp4', 'video/image/1-3.png', 'video/preview/5.mp4', '在这一集中，我们将通过模拟考试，让学员在真实考试环境中练习笔试，提高应试水平。', 3, 138, 0, 0, '2024-01-14 20:30:47');
INSERT INTO `civil_video` VALUES (244, 24, '公务员笔试模拟题库第4集', 'video/link/6.mp4', 'video/image/1-4.png', 'video/preview/6.mp4', '本集课程将通过解析高分学员的笔试过程，为学员提供学习解题技巧的思路和方法。', 4, 162, 0, 0, '2024-01-14 20:30:47');
INSERT INTO `civil_video` VALUES (245, 24, '公务员笔试模拟题库第5集', 'video/link/7.mp4', 'video/image/1-5.png', 'video/preview/7.mp4', '在这一集中，我们将邀请笔试领域的专家，为学员答疑解惑，分享笔试应试经验和技巧。', 5, 147, 0, 0, '2024-01-14 20:30:47');
INSERT INTO `civil_video` VALUES (246, 24, '公务员笔试模拟题库第6集', 'video/link/1.mp4', 'video/image/1-6.png', 'video/preview/1.mp4', '本集课程将通过实例分析和模拟练习，帮助学员更好地理解笔试解题思路，提高答题效率。', 6, 137, 0, 0, '2024-01-14 20:30:47');
INSERT INTO `civil_video` VALUES (247, 24, '公务员笔试模拟题库第7集', 'video/link/2.mp4', 'video/image/1-7.png', 'video/preview/2.mp4', '在这一集中，我们将总结笔试模拟题库的重点，为学员提供备考建议，帮助他们在考试中取得优异成绩。', 7, 136, 0, 0, '2024-01-14 20:30:47');
INSERT INTO `civil_video` VALUES (248, 24, '公务员笔试模拟题库第8集', 'video/link/3.mp4', 'video/image/1-8.png', 'video/preview/3.mp4', '本集课程将通过模拟考试，检验学员对笔试解题技巧的掌握程度，帮助他们在实际考试中更加游刃有余。', 8, 166, 0, 0, '2024-01-14 20:30:47');
INSERT INTO `civil_video` VALUES (249, 24, '公务员笔试模拟题库第9集', 'video/link/4.mp4', 'video/image/1-9.png', 'video/preview/4.mp4', '在这一集中，我们将邀请笔试考官，为学员揭示笔试评分的要点和标准，帮助他们更好地备考。', 9, 123, 0, 0, '2024-01-14 20:30:47');
INSERT INTO `civil_video` VALUES (250, 24, '公务员笔试模拟题库第10集', 'video/link/5.mp4', 'video/image/1-10.png', 'video/preview/5.mp4', '本集课程将总结笔试模拟题库的经典题目，为学员提供最后的备考指导，确保他们在考试中发挥出色。', 10, 138, 0, 0, '2024-01-14 20:30:47');
INSERT INTO `civil_video` VALUES (251, 25, '军队文职笔试考点梳理第1集', 'video/link/6.mp4', 'video/image/2-1.png', 'video/preview/6.mp4', '在这一集中，我们将带领学员系统梳理军队文职笔试的重点考点，帮助他们全面复习备考。', 1, 162, 0, 0, '2024-01-14 20:31:31');
INSERT INTO `civil_video` VALUES (252, 25, '军队文职笔试考点梳理第2集', 'video/link/7.mp4', 'video/image/2-2.png', 'video/preview/7.mp4', '本集课程将通过考点解析，深入剖析军队文职笔试中的难点，为学员提供有针对性的备考建议。', 2, 147, 0, 0, '2024-01-14 20:31:31');
INSERT INTO `civil_video` VALUES (253, 25, '军队文职笔试考点梳理第3集', 'video/link/1.mp4', 'video/image/2-3.png', 'video/preview/1.mp4', '在这一集中，我们将结合实际案例，分析军队文职笔试中常见的考点，帮助学员更好地理解和掌握。', 3, 137, 0, 0, '2024-01-14 20:31:31');
INSERT INTO `civil_video` VALUES (254, 25, '军队文职笔试考点梳理第4集', 'video/link/2.mp4', 'video/image/2-4.png', 'video/preview/2.mp4', '本集课程将邀请军队文职笔试的考官，为学员揭示考点的出题思路和特点，帮助他们有针对性地备考。', 4, 136, 0, 0, '2024-01-14 20:31:31');
INSERT INTO `civil_video` VALUES (255, 25, '军队文职笔试考点梳理第5集', 'video/link/3.mp4', 'video/image/2-5.png', 'video/preview/3.mp4', '在这一集中，我们将通过模拟考试，让学员在真实考试环境中练习笔试，检验考点掌握情况。', 5, 166, 0, 0, '2024-01-14 20:31:31');
INSERT INTO `civil_video` VALUES (256, 25, '军队文职笔试考点梳理第6集', 'video/link/4.mp4', 'video/image/2-6.png', 'video/preview/4.mp4', '本集课程将总结军队文职笔试的考点，为学员提供备考指导，确保他们在考试中有针对性地发挥优势。', 6, 123, 0, 0, '2024-01-14 20:31:31');
INSERT INTO `civil_video` VALUES (257, 25, '军队文职笔试考点梳理第7集', 'video/link/5.mp4', 'video/image/2-7.png', 'video/preview/5.mp4', '在这一集中，我们将为学员答疑解惑，解答他们在考点梳理过程中遇到的问题，确保他们理解透彻。', 7, 138, 0, 0, '2024-01-14 20:31:31');
INSERT INTO `civil_video` VALUES (258, 25, '军队文职笔试考点梳理第8集', 'video/link/6.mp4', 'video/image/2-8.png', 'video/preview/6.mp4', '本集课程将通过学员实际问题案例，进行现场解答和指导，帮助学员解决在考点梳理过程中的困惑。', 8, 162, 0, 0, '2024-01-14 20:31:31');
INSERT INTO `civil_video` VALUES (259, 25, '军队文职笔试考点梳理第9集', 'video/link/7.mp4', 'video/image/2-9.png', 'video/preview/7.mp4', '在这一集中，我们将邀请军队文职笔试的成功考生，分享他们备考过程中的经验和心得，为学员提供借鉴。', 9, 147, 0, 0, '2024-01-14 20:31:31');
INSERT INTO `civil_video` VALUES (260, 25, '军队文职笔试考点梳理第10集', 'video/link/1.mp4', 'video/image/2-10.png', 'video/preview/1.mp4', '本集课程将总结军队文职笔试的重难点，为学员提供最后的备考建议，确保他们在考试中取得优异成绩。', 10, 137, 0, 0, '2024-01-14 20:31:31');
INSERT INTO `civil_video` VALUES (261, 26, '公务员面试案例分析第1集', 'video/link/2.mp4', 'video/image/3-1.png', 'video/preview/2.mp4', '在这一集中，我们将通过实际案例，帮助学员更好地理解和应对公务员面试中的各种问题。', 1, 136, 0, 0, '2024-01-14 20:32:31');
INSERT INTO `civil_video` VALUES (262, 26, '公务员面试案例分析第2集', 'video/link/3.mp4', 'video/image/3-2.png', 'video/preview/3.mp4', '本集课程将深入解析公务员面试中的经典案例，为学员提供深入思考和回答的策略。', 2, 166, 0, 0, '2024-01-14 20:32:31');
INSERT INTO `civil_video` VALUES (263, 26, '公务员面试案例分析第3集', 'video/link/4.mp4', 'video/image/3-3.png', 'video/preview/4.mp4', '在这一集中，我们将结合面试评分标准，分析公务员面试中常见的问题和回答技巧。', 3, 123, 0, 0, '2024-01-14 20:32:31');
INSERT INTO `civil_video` VALUES (264, 26, '公务员面试案例分析第4集', 'video/link/5.mp4', 'video/image/3-4.png', 'video/preview/5.mp4', '本集课程将邀请公务员面试的考官，为学员揭示面试的评分要点，帮助他们更好地应对评审。', 4, 138, 0, 0, '2024-01-14 20:32:31');
INSERT INTO `civil_video` VALUES (265, 26, '公务员面试案例分析第5集', 'video/link/6.mp4', 'video/image/3-5.png', 'video/preview/6.mp4', '在这一集中，我们将通过模拟面试，让学员在真实面试环境中练习回答案例问题，提高应对能力。', 5, 162, 0, 0, '2024-01-14 20:32:31');
INSERT INTO `civil_video` VALUES (266, 26, '公务员面试案例分析第6集', 'video/link/7.mp4', 'video/image/3-6.png', 'video/preview/7.mp4', '本集课程将总结公务员面试中的常见问题和解答技巧，为学员提供备考指导，确保他们在面试中脱颖而出。', 6, 147, 0, 0, '2024-01-14 20:32:31');
INSERT INTO `civil_video` VALUES (267, 26, '公务员面试案例分析第7集', 'video/link/1.mp4', 'video/image/3-7.png', 'video/preview/1.mp4', '在这一集中，我们将为学员答疑解惑，解答他们在面试案例分析过程中遇到的问题，确保他们理解透彻。', 7, 137, 0, 0, '2024-01-14 20:32:31');
INSERT INTO `civil_video` VALUES (268, 26, '公务员面试案例分析第8集', 'video/link/2.mp4', 'video/image/3-8.png', 'video/preview/2.mp4', '本集课程将通过学员实际问题案例，进行现场解答和指导，帮助学员解决在案例分析过程中的困惑。', 8, 136, 0, 0, '2024-01-14 20:32:31');
INSERT INTO `civil_video` VALUES (269, 26, '公务员面试案例分析第9集', 'video/link/3.mp4', 'video/image/3-9.png', 'video/preview/3.mp4', '在这一集中，我们将邀请公务员面试的成功考生，分享他们面试的经验和心得，为学员提供借鉴。', 9, 166, 0, 0, '2024-01-14 20:32:31');
INSERT INTO `civil_video` VALUES (270, 26, '公务员面试案例分析第10集', 'video/link/4.mp4', 'video/image/3-10.png', 'video/preview/4.mp4', '本集课程将总结公务员面试案例分析的要点，为学员提供最后的备考建议，确保他们在面试中表现出色。', 10, 123, 0, 0, '2024-01-14 20:32:31');
INSERT INTO `civil_video` VALUES (271, 27, '事业单位招聘面试心得分享第1集', 'video/link/5.mp4', 'video/image/4-1.png', 'video/preview/5.mp4', '在这一集中，我们邀请了多位成功通过事业单位招聘面试的考生，分享他们的面试心得和经验。', 1, 138, 0, 0, '2024-01-14 20:33:17');
INSERT INTO `civil_video` VALUES (272, 27, '事业单位招聘面试心得分享第2集', 'video/link/6.mp4', 'video/image/4-2.png', 'video/preview/6.mp4', '本集课程将深入挖掘面试中的细节问题，为学员提供在事业单位招聘面试中的实用建议。', 2, 162, 0, 0, '2024-01-14 20:33:17');
INSERT INTO `civil_video` VALUES (273, 27, '事业单位招聘面试心得分享第3集', 'video/link/7.mp4', 'video/image/4-3.png', 'video/preview/7.mp4', '在这一集中，我们将分享成功考生的面试案例，为学员提供面试答题的技巧和方法。', 3, 147, 0, 0, '2024-01-14 20:33:17');
INSERT INTO `civil_video` VALUES (274, 27, '事业单位招聘面试心得分享第4集', 'video/link/1.mp4', 'video/image/4-4.png', 'video/preview/1.mp4', '本集课程将通过学员提问，进行现场解答和指导，帮助学员更好地理解和应对面试中的各种问题。', 4, 137, 0, 0, '2024-01-14 20:33:17');
INSERT INTO `civil_video` VALUES (275, 27, '事业单位招聘面试心得分享第5集', 'video/link/2.mp4', 'video/image/4-5.png', 'video/preview/2.mp4', '在这一集中，我们将解析面试中的经典问题和解答技巧，为学员提供面试备考的重要参考。', 5, 136, 0, 0, '2024-01-14 20:33:17');
INSERT INTO `civil_video` VALUES (276, 27, '事业单位招聘面试心得分享第6集', 'video/link/3.mp4', 'video/image/4-6.png', 'video/preview/3.mp4', '本集课程将通过模拟面试，让学员在真实面试环境中练习回答问题，提高应对能力。', 6, 166, 0, 0, '2024-01-14 20:33:17');
INSERT INTO `civil_video` VALUES (277, 27, '事业单位招聘面试心得分享第7集', 'video/link/4.mp4', 'video/image/4-7.png', 'video/preview/4.mp4', '在这一集中，我们将邀请成功考生分享他们在面试过程中的应对策略和技巧，为学员提供实用建议。', 7, 123, 0, 0, '2024-01-14 20:33:17');
INSERT INTO `civil_video` VALUES (278, 27, '事业单位招聘面试心得分享第8集', 'video/link/5.mp4', 'video/image/4-8.png', 'video/preview/5.mp4', '本集课程将总结事业单位招聘面试心得分享的要点，为学员提供最后的备考建议，确保他们在面试中取得好成绩。', 8, 138, 0, 0, '2024-01-14 20:33:17');
INSERT INTO `civil_video` VALUES (279, 27, '事业单位招聘面试心得分享第9集', 'video/link/6.mp4', 'video/image/4-9.png', 'video/preview/6.mp4', '在这一集中，我们将为学员答疑解惑，解答他们在面试心得分享过程中遇到的问题，确保他们理解透彻。', 9, 162, 0, 0, '2024-01-14 20:33:17');
INSERT INTO `civil_video` VALUES (280, 27, '事业单位招聘面试心得分享第10集', 'video/link/7.mp4', 'video/image/4-10.png', 'video/preview/7.mp4', '本集课程将通过成功考生的案例，进行现场点评和指导，帮助学员更好地理解和应对面试中的各种情况。', 10, 147, 0, 0, '2024-01-14 20:33:17');
INSERT INTO `civil_video` VALUES (281, 28, '三支一扶招聘考试技巧第1集', 'video/link/1.mp4', 'video/image/5-1.png', 'video/preview/1.mp4', '在这一集中，我们将介绍三支一扶招聘考试的一般情况和考试技巧，为学员提供全面的备考信息。', 1, 137, 0, 0, '2024-01-14 20:34:24');
INSERT INTO `civil_video` VALUES (282, 28, '三支一扶招聘考试技巧第2集', 'video/link/2.mp4', 'video/image/5-2.png', 'video/preview/2.mp4', '本集课程将深入解析三支一扶招聘考试的题型和解题技巧，为学员提供详细的备考指导。', 2, 136, 0, 0, '2024-01-14 20:34:24');
INSERT INTO `civil_video` VALUES (283, 28, '三支一扶招聘考试技巧第3集', 'video/link/3.mp4', 'video/image/5-3.png', 'video/preview/3.mp4', '在这一集中，我们将邀请成功考生分享他们的备考经验，为学员提供实用的备考建议。', 3, 166, 0, 0, '2024-01-14 20:34:24');
INSERT INTO `civil_video` VALUES (284, 28, '三支一扶招聘考试技巧第4集', 'video/link/4.mp4', 'video/image/5-4.png', 'video/preview/4.mp4', '本集课程将通过模拟考试，让学员在真实考试环境中练习解题，提高应试能力。', 4, 123, 0, 0, '2024-01-14 20:34:24');
INSERT INTO `civil_video` VALUES (285, 28, '三支一扶招聘考试技巧第5集', 'video/link/5.mp4', 'video/image/5-5.png', 'video/preview/5.mp4', '在这一集中，我们将解析三支一扶招聘考试的典型题目和解答技巧，为学员提供备考的重要参考。', 5, 138, 0, 0, '2024-01-14 20:34:24');
INSERT INTO `civil_video` VALUES (286, 28, '三支一扶招聘考试技巧第6集', 'video/link/6.mp4', 'video/image/5-6.png', 'video/preview/6.mp4', '本集课程将通过考生提问，进行现场解答和指导，帮助学员更好地理解和应对考试中的各种问题。', 6, 162, 0, 0, '2024-01-14 20:34:24');
INSERT INTO `civil_video` VALUES (287, 28, '三支一扶招聘考试技巧第7集', 'video/link/7.mp4', 'video/image/5-7.png', 'video/preview/7.mp4', '在这一集中，我们将分享成功考生的考试案例，为学员提供解题的技巧和方法。', 7, 147, 0, 0, '2024-01-14 20:34:24');
INSERT INTO `civil_video` VALUES (288, 28, '三支一扶招聘考试技巧第8集', 'video/link/1.mp4', 'video/image/5-8.png', 'video/preview/1.mp4', '本集课程将总结三支一扶招聘考试技巧的要点，为学员提供最后的备考建议，确保他们在考试中取得好成绩。', 8, 137, 0, 0, '2024-01-14 20:34:24');
INSERT INTO `civil_video` VALUES (289, 28, '三支一扶招聘考试技巧第9集', 'video/link/2.mp4', 'video/image/5-9.png', 'video/preview/2.mp4', '在这一集中，我们将为学员答疑解惑，解答他们在备考过程中遇到的问题，确保他们理解透彻。', 9, 136, 0, 0, '2024-01-14 20:34:24');
INSERT INTO `civil_video` VALUES (290, 28, '三支一扶招聘考试技巧第10集', 'video/link/3.mp4', 'video/image/5-10.png', 'video/preview/3.mp4', '本集课程将通过成功考生的案例，进行现场点评和指导，帮助学员更好地理解和应对考试中的各种情况。', 10, 166, 0, 0, '2024-01-14 20:34:24');
INSERT INTO `civil_video` VALUES (291, 29, '公务员笔试解题技巧第1集', 'video/link/4.mp4', 'video/image/6-1.png', 'video/preview/4.mp4', '在这一集中，我们将介绍公务员笔试中常见的题型和解题技巧，帮助学员更好地应对笔试考试。', 1, 123, 0, 0, '2024-01-14 20:35:15');
INSERT INTO `civil_video` VALUES (292, 29, '公务员笔试解题技巧第2集', 'video/link/5.mp4', 'video/image/6-2.png', 'video/preview/5.mp4', '本集课程将深入解析公务员笔试中的难点问题和解决方法，为学员提供实用的备考建议。', 2, 138, 0, 0, '2024-01-14 20:35:15');
INSERT INTO `civil_video` VALUES (293, 29, '公务员笔试解题技巧第3集', 'video/link/6.mp4', 'video/image/6-3.png', 'video/preview/6.mp4', '在这一集中，我们将通过模拟考试，让学员在真实考试环境中练习解题，提高应试能力。', 3, 162, 0, 0, '2024-01-14 20:35:15');
INSERT INTO `civil_video` VALUES (294, 29, '公务员笔试解题技巧第4集', 'video/link/7.mp4', 'video/image/6-4.png', 'video/preview/7.mp4', '本集课程将解析公务员笔试中的典型题目和解答技巧，为学员提供备考的重要参考。', 4, 147, 0, 0, '2024-01-14 20:35:15');
INSERT INTO `civil_video` VALUES (295, 29, '公务员笔试解题技巧第5集', 'video/link/1.mp4', 'video/image/6-5.png', 'video/preview/1.mp4', '在这一集中，我们将分享成功考生的经验，为学员提供解题的技巧和方法，帮助他们取得好成绩。', 5, 137, 0, 0, '2024-01-14 20:35:15');
INSERT INTO `civil_video` VALUES (296, 29, '公务员笔试解题技巧第6集', 'video/link/2.mp4', 'video/image/6-6.png', 'video/preview/2.mp4', '本集课程将通过考生提问，进行现场解答和指导，帮助学员更好地理解和应对考试中的各种问题。', 6, 136, 0, 0, '2024-01-14 20:35:15');
INSERT INTO `civil_video` VALUES (297, 29, '公务员笔试解题技巧第7集', 'video/link/3.mp4', 'video/image/6-7.png', 'video/preview/3.mp4', '在这一集中，我们将解析公务员笔试中的难点问题和解决方法，为学员提供详细的备考指导。', 7, 166, 0, 0, '2024-01-14 20:35:15');
INSERT INTO `civil_video` VALUES (298, 29, '公务员笔试解题技巧第8集', 'video/link/4.mp4', 'video/image/6-8.png', 'video/preview/4.mp4', '本集课程将总结公务员笔试解题技巧的要点，为学员提供最后的备考建议，确保他们在考试中取得好成绩。', 8, 123, 0, 0, '2024-01-14 20:35:15');
INSERT INTO `civil_video` VALUES (299, 29, '公务员笔试解题技巧第9集', 'video/link/5.mp4', 'video/image/6-9.png', 'video/preview/5.mp4', '在这一集中，我们将为学员答疑解惑，解答他们在备考过程中遇到的问题，确保他们理解透彻。', 9, 138, 0, 0, '2024-01-14 20:35:15');
INSERT INTO `civil_video` VALUES (300, 29, '公务员笔试解题技巧第10集', 'video/link/6.mp4', 'video/image/6-10.png', 'video/preview/6.mp4', '本集课程将通过成功考生的案例，进行现场点评和指导，帮助学员更好地理解和应对考试中的各种情况。', 10, 162, 0, 0, '2024-01-14 20:35:15');
INSERT INTO `civil_video` VALUES (301, 30, '军队文职笔试考点梳理第1集', 'video/link/7.mp4', 'video/image/1-1.png', 'video/preview/7.mp4', '在这一集中，我们将梳理军队文职笔试的重点考点，为学员提供备考的重要方向和指导。', 1, 147, 0, 0, '2024-01-14 20:36:05');
INSERT INTO `civil_video` VALUES (302, 30, '军队文职笔试考点梳理第2集', 'video/link/1.mp4', 'video/image/1-2.png', 'video/preview/1.mp4', '本集课程将深入解析军队文职笔试的难点问题和解决方法，为学员提供实用的备考建议。', 2, 137, 0, 0, '2024-01-14 20:36:05');
INSERT INTO `civil_video` VALUES (303, 30, '军队文职笔试考点梳理第3集', 'video/link/2.mp4', 'video/image/1-3.png', 'video/preview/2.mp4', '在这一集中，我们将通过模拟考试，让学员在真实考试环境中练习，提高应试能力。', 3, 136, 0, 0, '2024-01-14 20:36:05');
INSERT INTO `civil_video` VALUES (304, 30, '军队文职笔试考点梳理第4集', 'video/link/3.mp4', 'video/image/1-4.png', 'video/preview/3.mp4', '本集课程将解析军队文职笔试中的典型考点和解答技巧，为学员提供备考的重要参考。', 4, 166, 0, 0, '2024-01-14 20:36:05');
INSERT INTO `civil_video` VALUES (305, 30, '军队文职笔试考点梳理第5集', 'video/link/4.mp4', 'video/image/1-5.png', 'video/preview/4.mp4', '在这一集中，我们将分享成功考生的经验，为学员提供解题的技巧和方法，帮助他们取得好成绩。', 5, 123, 0, 0, '2024-01-14 20:36:05');
INSERT INTO `civil_video` VALUES (306, 30, '军队文职笔试考点梳理第6集', 'video/link/5.mp4', 'video/image/1-6.png', 'video/preview/5.mp4', '本集课程将通过考生提问，进行现场解答和指导，帮助学员更好地理解和应对考试中的各种问题。', 6, 138, 0, 0, '2024-01-14 20:36:05');
INSERT INTO `civil_video` VALUES (307, 30, '军队文职笔试考点梳理第7集', 'video/link/6.mp4', 'video/image/1-7.png', 'video/preview/6.mp4', '在这一集中，我们将解析军队文职笔试中的难点问题和解决方法，为学员提供详细的备考指导。', 7, 162, 0, 0, '2024-01-14 20:36:05');
INSERT INTO `civil_video` VALUES (308, 30, '军队文职笔试考点梳理第8集', 'video/link/7.mp4', 'video/image/1-8.png', 'video/preview/7.mp4', '本集课程将总结军队文职笔试考点梳理的要点，为学员提供最后的备考建议，确保他们在考试中取得好成绩。', 8, 147, 0, 0, '2024-01-14 20:36:05');
INSERT INTO `civil_video` VALUES (309, 30, '军队文职笔试考点梳理第9集', 'video/link/1.mp4', 'video/image/1-9.png', 'video/preview/1.mp4', '在这一集中，我们将为学员答疑解惑，解答他们在备考过程中遇到的问题，确保他们理解透彻。', 9, 137, 0, 0, '2024-01-14 20:36:05');
INSERT INTO `civil_video` VALUES (310, 30, '军队文职笔试考点梳理第10集', 'video/link/2.mp4', 'video/image/1-10.png', 'video/preview/2.mp4', '本集课程将通过成功考生的案例，进行现场点评和指导，帮助学员更好地理解和应对考试中的各种情况。', 10, 136, 0, 0, '2024-01-14 20:36:05');
INSERT INTO `civil_video` VALUES (311, 31, '公安招警面试技能训练第1集', 'video/link/3.mp4', 'video/image/2-1.png', 'video/preview/3.mp4', '在这一集中，我们将介绍公安招警面试中需要注意的技能训练，帮助学员提高面试表现水平。', 1, 166, 0, 0, '2024-01-14 20:36:34');
INSERT INTO `civil_video` VALUES (312, 31, '公安招警面试技能训练第2集', 'video/link/4.mp4', 'video/image/2-2.png', 'video/preview/4.mp4', '本集课程将深入解析公安招警面试的特点和技巧，为学员提供实用的面试准备建议。', 2, 123, 0, 0, '2024-01-14 20:36:34');
INSERT INTO `civil_video` VALUES (313, 31, '公安招警面试技能训练第3集', 'video/link/5.mp4', 'video/image/2-3.png', 'video/preview/5.mp4', '在这一集中，我们将通过模拟面试，让学员在真实考试环境中练习，提高应试能力。', 3, 138, 0, 0, '2024-01-14 20:36:34');
INSERT INTO `civil_video` VALUES (314, 31, '公安招警面试技能训练第4集', 'video/link/6.mp4', 'video/image/2-4.png', 'video/preview/6.mp4', '本集课程将解析公安招警面试中的典型问题和解答技巧，为学员提供备考的重要参考。', 4, 162, 0, 0, '2024-01-14 20:36:34');
INSERT INTO `civil_video` VALUES (315, 31, '公安招警面试技能训练第5集', 'video/link/7.mp4', 'video/image/2-5.png', 'video/preview/7.mp4', '在这一集中，我们将分享成功考生的经验，为学员提供解题的技巧和方法，帮助他们取得好成绩。', 5, 147, 0, 0, '2024-01-14 20:36:34');
INSERT INTO `civil_video` VALUES (316, 32, '事业单位招聘面试案例分析第1集', 'video/link/1.mp4', 'video/image/2-6.png', 'video/preview/1.mp4', '在本集中，我们将通过实际案例分析，帮助学员更好地理解事业单位招聘面试的评分标准和解答技巧。', 1, 137, 0, 0, '2024-01-14 20:37:18');
INSERT INTO `civil_video` VALUES (317, 32, '事业单位招聘面试案例分析第2集', 'video/link/2.mp4', 'video/image/2-7.png', 'video/preview/2.mp4', '本集课程将深入解析事业单位招聘面试的特点和技巧，为学员提供实用的面试准备建议。', 2, 136, 0, 0, '2024-01-14 20:37:18');
INSERT INTO `civil_video` VALUES (318, 32, '事业单位招聘面试案例分析第3集', 'video/link/3.mp4', 'video/image/2-8.png', 'video/preview/3.mp4', '在这一集中，我们将通过模拟面试，让学员在真实考试环境中练习，提高应试能力。', 3, 166, 0, 0, '2024-01-14 20:37:18');
INSERT INTO `civil_video` VALUES (319, 32, '事业单位招聘面试案例分析第4集', 'video/link/4.mp4', 'video/image/2-9.png', 'video/preview/4.mp4', '本集课程将解析事业单位招聘面试中的典型问题和解答技巧，为学员提供备考的重要参考。', 4, 123, 0, 0, '2024-01-14 20:37:18');
INSERT INTO `civil_video` VALUES (320, 32, '事业单位招聘面试案例分析第5集', 'video/link/5.mp4', 'video/image/2-10.png', 'video/preview/5.mp4', '在这一集中，我们将分享成功考生的经验，为学员提供解题的技巧和方法，帮助他们取得好成绩。', 5, 138, 0, 0, '2024-01-14 20:37:18');
INSERT INTO `civil_video` VALUES (321, 33, '三支一扶招聘面试技巧第1集', 'video/link/6.mp4', 'video/image/3-1.png', 'video/preview/6.mp4', '在这一集中，我们将介绍三支一扶招聘面试的基本技巧和常见问题，帮助学员更好地准备面试。', 1, 162, 0, 0, '2024-01-14 20:39:46');
INSERT INTO `civil_video` VALUES (322, 33, '三支一扶招聘面试技巧第2集', 'video/link/7.mp4', 'video/image/3-2.png', 'video/preview/7.mp4', '本集课程将深入解析三支一扶招聘面试的特点和技巧，为学员提供实用的面试准备建议。', 2, 147, 0, 0, '2024-01-14 20:39:46');
INSERT INTO `civil_video` VALUES (323, 33, '三支一扶招聘面试技巧第3集', 'video/link/1.mp4', 'video/image/3-3.png', 'video/preview/1.mp4', '在这一集中，我们将通过模拟面试，让学员在真实考试环境中练习，提高应试能力。', 3, 137, 0, 0, '2024-01-14 20:39:46');
INSERT INTO `civil_video` VALUES (324, 34, '公务员笔试综合知识讲解第1集', 'video/link/2.mp4', 'video/image/3-4.png', 'video/preview/2.mp4', '在本集中，我们将深入讲解公务员笔试中的综合知识，帮助学员系统掌握考点，提高应试水平。', 1, 136, 0, 0, '2024-01-14 20:39:46');
INSERT INTO `civil_video` VALUES (325, 34, '公务员笔试综合知识讲解第2集', 'video/link/3.mp4', 'video/image/3-5.png', 'video/preview/3.mp4', '本集课程将解析公务员笔试中的常见问题和解答技巧，为学员提供备考的重要参考。', 2, 166, 0, 0, '2024-01-14 20:39:46');
INSERT INTO `civil_video` VALUES (326, 34, '公务员笔试综合知识讲解第3集', 'video/link/4.mp4', 'video/image/3-6.png', 'video/preview/4.mp4', '在这一集中，我们将分享成功考生的经验，为学员提供解题的技巧和方法，帮助他们取得好成绩。', 3, 123, 0, 0, '2024-01-14 20:39:46');
INSERT INTO `civil_video` VALUES (327, 35, '军队文职招聘考试技巧第1集', 'video/link/5.mp4', 'video/image/3-7.png', 'video/preview/5.mp4', '在这一集中，我们将介绍军队文职招聘考试的基本技巧和常见问题，帮助学员更好地准备考试。', 1, 138, 0, 0, '2024-01-14 20:39:46');
INSERT INTO `civil_video` VALUES (328, 35, '军队文职招聘考试技巧第2集', 'video/link/6.mp4', 'video/image/3-8.png', 'video/preview/6.mp4', '本集课程将深入解析军队文职招聘考试的特点和技巧，为学员提供实用的考试准备建议。', 2, 162, 0, 0, '2024-01-14 20:39:46');
INSERT INTO `civil_video` VALUES (329, 35, '军队文职招聘考试技巧第3集', 'video/link/7.mp4', 'video/image/3-9.png', 'video/preview/7.mp4', '在这一集中，我们将通过模拟考试，让学员在真实考试环境中练习，提高应试能力。', 3, 147, 0, 0, '2024-01-14 20:39:46');
INSERT INTO `civil_video` VALUES (330, 36, '事业单位招聘面试技能培训第1集', 'video/link/1.mp4', 'video/image/3-10.png', 'video/preview/1.mp4', '在本集中，我们将通过实际技能培训，帮助学员提高在事业单位招聘面试中的表现水平。', 1, 137, 0, 0, '2024-01-14 20:39:46');
INSERT INTO `civil_video` VALUES (331, 36, '事业单位招聘面试技能培训第2集', 'video/link/2.mp4', 'video/image/4-1.png', 'video/preview/2.mp4', '本集课程将深入讲解事业单位招聘面试中需要注意的事项和技巧，为学员提供实用的面试准备建议。', 2, 136, 0, 0, '2024-01-14 20:39:46');
INSERT INTO `civil_video` VALUES (332, 36, '事业单位招聘面试技能培训第3集', 'video/link/3.mp4', 'video/image/4-2.png', 'video/preview/3.mp4', '在这一集中，我们将通过模拟面试，让学员在真实考试环境中练习，提高应试能力。', 3, 166, 0, 0, '2024-01-14 20:39:46');
INSERT INTO `civil_video` VALUES (333, 37, '公务员面试案例解析第1集', 'video/link/4.mp4', 'video/image/4-3.png', 'video/preview/4.mp4', '在这一集中，我们将通过实际案例，深入解析公务员面试的评分标准和解答技巧，为学员提供实用的面试准备建议。', 1, 123, 0, 0, '2024-01-14 20:39:46');
INSERT INTO `civil_video` VALUES (334, 37, '公务员面试案例解析第2集', 'video/link/5.mp4', 'video/image/4-4.png', 'video/preview/5.mp4', '本集课程将解析公务员面试中的常见问题和解答技巧，为学员提供备考的重要参考。', 2, 138, 0, 0, '2024-01-14 20:39:46');
INSERT INTO `civil_video` VALUES (335, 37, '公务员面试案例解析第3集', 'video/link/6.mp4', 'video/image/4-5.png', 'video/preview/6.mp4', '在这一集中，我们将分享成功考生的经验，为学员提供解题的技巧和方法，帮助他们取得好成绩。', 3, 162, 0, 0, '2024-01-14 20:39:46');
INSERT INTO `civil_video` VALUES (336, 38, '军队文职面试技巧培训第1集', 'video/link/7.mp4', 'video/image/4-6.png', 'video/preview/7.mp4', '在本集中，我们将通过实际技能培训，帮助学员提高在军队文职面试中的表现水平。', 1, 147, 0, 0, '2024-01-14 20:39:46');
INSERT INTO `civil_video` VALUES (337, 38, '军队文职面试技巧培训第2集', 'video/link/1.mp4', 'video/image/4-7.png', 'video/preview/1.mp4', '本集课程将深入讲解军队文职面试中需要注意的事项和技巧，为学员提供实用的面试准备建议。', 2, 137, 0, 0, '2024-01-14 20:39:46');
INSERT INTO `civil_video` VALUES (338, 38, '军队文职面试技巧培训第3集', 'video/link/2.mp4', 'video/image/4-8.png', 'video/preview/2.mp4', '在这一集中，我们将通过模拟面试，让学员在真实考试环境中练习，提高应试能力。', 3, 136, 0, 0, '2024-01-14 20:39:46');
INSERT INTO `civil_video` VALUES (339, 39, '三支一扶招聘笔试技巧第1集', 'video/link/3.mp4', 'video/image/4-9.png', 'video/preview/3.mp4', '在这一集中，我们将介绍三支一扶招聘笔试的基本技巧和常见问题，帮助学员更好地准备考试。', 1, 166, 0, 0, '2024-01-14 20:39:46');
INSERT INTO `civil_video` VALUES (340, 39, '三支一扶招聘笔试技巧第2集', 'video/link/4.mp4', 'video/image/4-10.png', 'video/preview/4.mp4', '在这一集中，我们将介绍三支一扶招聘笔试的基本技巧和常见问题，帮助学员更好地准备考试。', 1, 123, 0, 0, '2024-01-14 20:41:11');
INSERT INTO `civil_video` VALUES (341, 40, '公务员面试模拟培训第1集', 'video/link/5.mp4', 'video/image/5-1.png', 'video/preview/5.mp4', '在本集中，我们将通过实际模拟培训，帮助学员提高在公务员面试中的表现水平。', 1, 138, 0, 0, '2024-01-14 20:41:17');
INSERT INTO `civil_video` VALUES (342, 40, '公务员面试模拟培训第2集', 'video/link/6.mp4', 'video/image/5-2.png', 'video/preview/6.mp4', '本集课程将深入讲解公务员面试中需要注意的事项和技巧，为学员提供实用的面试准备建议。', 2, 162, 0, 0, '2024-01-14 20:41:17');
INSERT INTO `civil_video` VALUES (343, 40, '公务员面试模拟培训第3集', 'video/link/7.mp4', 'video/image/5-3.png', 'video/preview/7.mp4', '在这一集中，我们将通过模拟面试，让学员在真实考试环境中练习，提高应试能力。', 3, 147, 0, 0, '2024-01-14 20:41:17');
INSERT INTO `civil_video` VALUES (344, 41, '公务员面试模拟培训第1集', 'video/link/1.mp4', 'video/image/5-4.png', 'video/preview/1.mp4', '在这一集中，我们将通过模拟面试，让学员在真实考试环境中练习，提高应试能力。', 1, 137, 0, 0, '2024-01-14 20:49:58');
INSERT INTO `civil_video` VALUES (345, 41, '公务员面试模拟培训第2集', 'video/link/2.mp4', 'video/image/5-5.png', 'video/preview/2.mp4', '在这一集中，我们将通过模拟面试，让学员在真实考试环境中练习，提高应试能力。', 2, 136, 0, 0, '2024-01-14 20:49:58');
INSERT INTO `civil_video` VALUES (346, 41, '公务员面试模拟培训第3集', 'video/link/3.mp4', 'video/image/5-6.png', 'video/preview/3.mp4', '在这一集中，我们将通过模拟面试，让学员在真实考试环境中练习，提高应试能力。', 3, 166, 0, 0, '2024-01-14 20:49:58');
INSERT INTO `civil_video` VALUES (347, 41, '公务员面试心理准备第1集', 'video/link/4.mp4', 'video/image/5-7.png', 'video/preview/4.mp4', '在这一集中，我们将介绍公务员面试心理准备的基本知识和技巧，帮助学员建立良好的心理状态。', 1, 123, 0, 0, '2024-01-14 20:51:42');
INSERT INTO `civil_video` VALUES (348, 41, '公务员面试心理准备第2集', 'video/link/5.mp4', 'video/image/5-8.png', 'video/preview/5.mp4', '这一集将深入讨论公务员面试中可能遇到的心理压力和应对方法，帮助学员更好地面对各种情况。', 2, 138, 0, 0, '2024-01-14 20:51:42');
INSERT INTO `civil_video` VALUES (349, 41, '公务员面试心理准备第3集', 'video/link/6.mp4', 'video/image/5-9.png', 'video/preview/6.mp4', '在这一集中，我们将通过模拟情境演练，让学员在实际环境中提高应对面试的心理素质。', 3, 162, 0, 0, '2024-01-14 20:51:42');
INSERT INTO `civil_video` VALUES (350, 43, '军队文职申论写作指导第1集', 'video/link/7.mp4', 'video/image/5-10.png', 'video/preview/7.mp4', '在这一集中，我们将介绍军队文职申论写作的基本原则和结构，帮助学员建立写作的基础。', 1, 147, 0, 0, '2024-01-14 20:52:15');
INSERT INTO `civil_video` VALUES (351, 43, '军队文职申论写作指导第2集', 'video/link/1.mp4', 'video/image/6-1.png', 'video/preview/1.mp4', '这一集将深入讨论申论写作中常见的题材和写作技巧，为学员提供更多的写作灵感和方法。', 2, 137, 0, 0, '2024-01-14 20:52:15');
INSERT INTO `civil_video` VALUES (352, 43, '军队文职申论写作指导第3集', 'video/link/2.mp4', 'video/image/6-2.png', 'video/preview/2.mp4', '在这一集中，我们将通过实例分析和写作练习，让学员更好地掌握申论写作的技巧和方法。', 3, 136, 0, 0, '2024-01-14 20:52:15');
INSERT INTO `civil_video` VALUES (353, 44, '事业单位招聘笔试技巧第1集', 'video/link/3.mp4', 'video/image/6-3.png', 'video/preview/3.mp4', '在这一集中，我们将介绍事业单位招聘笔试的常见题型和解题技巧，帮助学员提高笔试的应试水平。', 1, 166, 0, 0, '2024-01-14 20:52:48');
INSERT INTO `civil_video` VALUES (354, 44, '事业单位招聘笔试技巧第2集', 'video/link/4.mp4', 'video/image/6-4.png', 'video/preview/4.mp4', '这一集将深入解析事业单位招聘笔试中的难点和疑难题目，为学员提供更多的应试经验和技巧。', 2, 123, 0, 0, '2024-01-14 20:52:48');
INSERT INTO `civil_video` VALUES (355, 44, '事业单位招聘笔试技巧第3集', 'video/link/5.mp4', 'video/image/6-5.png', 'video/preview/5.mp4', '在这一集中，我们将通过实际操作和模拟演练，让学员在实际考试中更好地应对各种笔试题目。', 3, 138, 0, 0, '2024-01-14 20:52:48');
INSERT INTO `civil_video` VALUES (356, 45, '三支一扶招聘面试技巧第1集', 'video/link/6.mp4', 'video/image/6-6.png', 'video/preview/6.mp4', '在这一集中，我们将介绍三支一扶招聘面试的常见问题和回答技巧，帮助学员在面试中更加从容自信。', 1, 162, 0, 0, '2024-01-14 20:53:26');
INSERT INTO `civil_video` VALUES (357, 45, '三支一扶招聘面试技巧第2集', 'video/link/7.mp4', 'video/image/6-7.png', 'video/preview/7.mp4', '这一集将深入分析三支一扶招聘面试中的挑战和解决方法，为学员提供更多应对面试的经验和技巧。', 2, 147, 0, 0, '2024-01-14 20:53:26');
INSERT INTO `civil_video` VALUES (358, 45, '三支一扶招聘面试技巧第3集', 'video/link/1.mp4', 'video/image/6-8.png', 'video/preview/1.mp4', '在这一集中，我们将通过模拟演练和实际操作，让学员在真实面试中更好地展现自己的能力和优势。', 3, 137, 0, 0, '2024-01-14 20:53:26');
INSERT INTO `civil_video` VALUES (359, 46, '公务员面试技能培训第1集', 'video/link/2.mp4', 'video/image/6-9.png', 'video/preview/2.mp4', '在这一集中，我们将介绍公务员面试中需要掌握的基本技能，帮助学员在面试中更具竞争力。', 1, 136, 0, 0, '2024-01-14 20:53:58');
INSERT INTO `civil_video` VALUES (360, 46, '公务员面试技能培训第2集', 'video/link/3.mp4', 'video/image/6-10.png', 'video/preview/3.mp4', '这一集将深入讨论公务员面试中常见问题的解决方法，并提供实用的技能培训，帮助学员应对各种情况。', 2, 166, 0, 0, '2024-01-14 20:53:58');
INSERT INTO `civil_video` VALUES (361, 46, '公务员面试技能培训第3集', 'video/link/4.mp4', 'video/image/1-1.png', 'video/preview/4.mp4', '在这一集中，我们将通过模拟面试和实际操作，让学员在真实面试环境中练习并提高面试技能水平。', 3, 123, 0, 0, '2024-01-14 20:53:58');
INSERT INTO `civil_video` VALUES (362, 47, '军队文职笔试技巧第1集', 'video/link/5.mp4', 'video/image/1-2.png', 'video/preview/5.mp4', '在这一集中，我们将介绍军队文职招聘笔试中常见题型的解题技巧，帮助学员高效备考。', 1, 138, 0, 0, '2024-01-14 20:54:38');
INSERT INTO `civil_video` VALUES (363, 47, '军队文职笔试技巧第2集', 'video/link/6.mp4', 'video/image/1-3.png', 'video/preview/6.mp4', '这一集将深入讨论军队文职笔试的难点，并提供实际案例分析，帮助学员更好地理解考试要点。', 2, 162, 0, 0, '2024-01-14 20:54:38');
INSERT INTO `civil_video` VALUES (364, 47, '军队文职笔试技巧第3集', 'video/link/7.mp4', 'video/image/1-4.png', 'video/preview/7.mp4', '在这一集中，我们将通过实操演练，让学员掌握军队文职笔试的解题方法，并提高应试水平。', 3, 147, 0, 0, '2024-01-14 20:54:38');
INSERT INTO `civil_video` VALUES (365, 48, '三支一扶申论写作指导第1集', 'video/link/1.mp4', 'video/image/1-5.png', 'video/preview/1.mp4', '在这一集中，我们将分享三支一扶申论写作的基本要求和写作技巧，帮助学员理清写作思路。', 1, 137, 0, 0, '2024-01-14 20:55:07');
INSERT INTO `civil_video` VALUES (366, 48, '三支一扶申论写作指导第2集', 'video/link/2.mp4', 'video/image/1-6.png', 'video/preview/2.mp4', '这一集将深入解析三支一扶申论写作的常见题材和论述结构，提供实用的写作建议。', 2, 136, 0, 0, '2024-01-14 20:55:07');
INSERT INTO `civil_video` VALUES (367, 48, '三支一扶申论写作指导第3集', 'video/link/3.mp4', 'video/image/1-7.png', 'video/preview/3.mp4', '在这一集中，我们将通过实例演练，帮助学员掌握三支一扶申论写作的技巧，提高论述水平。', 3, 166, 0, 0, '2024-01-14 20:55:07');
INSERT INTO `civil_video` VALUES (368, 49, '事业单位面试案例解析第1集', 'video/link/4.mp4', 'video/image/1-8.png', 'video/preview/4.mp4', '在这一集中，我们将深入解析事业单位面试的典型案例，帮助学员更好地理解面试评分标准。', 1, 123, 0, 0, '2024-01-14 20:55:52');
INSERT INTO `civil_video` VALUES (369, 49, '事业单位面试案例解析第2集', 'video/link/5.mp4', 'video/image/1-9.png', 'video/preview/5.mp4', '这一集将逐步分析不同类型的面试案例，为学员提供多角度、全方位的面试答题思路。', 2, 138, 0, 0, '2024-01-14 20:55:52');
INSERT INTO `civil_video` VALUES (370, 49, '事业单位面试案例解析第3集', 'video/link/6.mp4', 'video/image/1-10.png', 'video/preview/6.mp4', '在这一集中，我们将通过实际案例演练，让学员在模拟环境中提升解题能力，迎接面试的挑战。', 3, 162, 0, 0, '2024-01-14 20:55:52');
INSERT INTO `civil_video` VALUES (371, 50, '公安招警笔试技巧训练第1集', 'video/link/7.mp4', 'video/image/2-1.png', 'video/preview/7.mp4', '在这一集中，我们将介绍公安招警笔试的题型特点和解题技巧，帮助学员提高在笔试中的得分率。', 1, 147, 0, 0, '2024-01-14 20:56:28');
INSERT INTO `civil_video` VALUES (372, 50, '公安招警笔试技巧训练第2集', 'video/link/1.mp4', 'video/image/2-2.png', 'video/preview/1.mp4', '这一集将深入剖析公安招警笔试中常见题型，通过案例讲解和实际操作，提高学员的解题水平。', 2, 137, 0, 0, '2024-01-14 20:56:28');
INSERT INTO `civil_video` VALUES (373, 50, '公安招警笔试技巧训练第3集', 'video/link/2.mp4', 'video/image/2-3.png', 'video/preview/2.mp4', '在这一集中，我们将进行实际模拟笔试，让学员在考试环境中熟悉题型，增强应试能力。', 3, 136, 0, 0, '2024-01-14 20:56:28');
INSERT INTO `civil_video` VALUES (374, 51, '公考笔试备考全程指导第1集', 'video/link/3.mp4', 'video/image/2-4.png', 'video/preview/3.mp4', '这一集中介绍公考笔试备考的全程指导，为学员制定学习计划。', 1, 166, 0, 0, '2024-01-14 21:07:55');
INSERT INTO `civil_video` VALUES (375, 51, '公考笔试备考全程指导第2集', 'video/link/4.mp4', 'video/image/2-5.png', 'video/preview/4.mp4', '深入讲解公考笔试中的常见题型和解题技巧，提高学员的应试水平。', 2, 123, 0, 0, '2024-01-14 21:07:55');
INSERT INTO `civil_video` VALUES (376, 51, '公考笔试备考全程指导第3集', 'video/link/5.mp4', 'video/image/2-6.png', 'video/preview/5.mp4', '通过模拟考试，让学员在真实考试环境中检验备考效果，调整学习策略。', 3, 138, 0, 0, '2024-01-14 21:07:55');
INSERT INTO `civil_video` VALUES (377, 52, '公务员申论高分策略第1集', 'video/link/6.mp4', 'video/image/2-7.png', 'video/preview/6.mp4', '公务员申论高分策略课程旨在帮助学员制定科学的申论策略，争取更高的分数。内容包括命题趋势分析、高分答题思路等方面。通过实例分析和策略讲解，学员将更好地应对公务员申论考试。讲师团队由有丰富授课经验的专业人士组成，确保学员能够制定有效的策略。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (378, 52, '公务员申论高分策略第2集', 'video/link/7.mp4', 'video/image/2-8.png', 'video/preview/7.mp4', '继续介绍公务员申论高分策略的内容，包括案例分析和应对不同类型题目的技巧。', 2, 147, 0, 0, '2024-03-12 18:00:00');
INSERT INTO `civil_video` VALUES (379, 52, '公务员申论高分策略第3集', 'video/link/1.mp4', 'video/image/2-9.png', 'video/preview/1.mp4', '深入讲解公务员申论高分策略的要点，提供更多的解题思路和技巧。', 3, 137, 0, 0, '2024-03-13 10:30:00');
INSERT INTO `civil_video` VALUES (380, 53, '军队文职招聘面试技巧第1集', 'video/link/2.mp4', 'video/image/2-10.png', 'video/preview/2.mp4', '公务员笔试基础课程是为有志于公务员考试的学员打造的全面复习课程。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (381, 54, '事业单位笔试全程指导第1集', 'video/link/3.mp4', 'video/image/3-1.png', 'video/preview/3.mp4', '在本视频中，我们将深入剖析公务员笔试中常见题型，提供解题技巧和策略，帮助学员更加熟练地应对各种考题。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (382, 55, '公安招警面试案例解析第1集', 'video/link/4.mp4', 'video/image/3-2.png', 'video/preview/4.mp4', '通过大量实例演练，我们将全面解析各科目的典型题目，帮助学员理解解题思路和方法，为考试做好充分准备。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (383, 56, '三支一扶面试技巧培训第1集', 'video/link/5.mp4', 'video/image/3-3.png', 'video/preview/5.mp4', '在本集中，我们将深入研究常识判断题目，提供解题技巧和实例讲解，帮助学员提高答题准确率。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (384, 57, '公务员面试模拟训练第1集', 'video/link/6.mp4', 'video/image/3-4.png', 'video/preview/6.mp4', '在这一集中，我们将重点讨论言语理解与表达题目，为学员提供解题技巧和实例演练，确保应对考试时能够得心应手。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (385, 58, '军队文职招聘笔试辅导第1集', 'video/link/7.mp4', 'video/image/3-5.png', 'video/preview/7.mp4', '在本视频中，我们将深入探讨数量关系题目，提供解题技巧和大量实例演练，帮助学员掌握解题方法。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (386, 59, '事业单位申论高分策略第1集', 'video/link/1.mp4', 'video/image/3-6.png', 'video/preview/1.mp4', '在这一集中，我们将全面解析公务员笔试的难点，提供详细的解题思路和实例讲解，帮助学员攻克考试难关。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (387, 60, '公考面试心理辅导第1集', 'video/link/2.mp4', 'video/image/3-7.png', 'video/preview/2.mp4', '在本视频中，我们将通过实例演练讲解常见题型，为学员提供更多解题技巧，确保备战考试更有信心。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (388, 61, '公安招警笔试基础课第1集', 'video/link/3.mp4', 'video/image/3-8.png', 'video/preview/3.mp4', '在这一集中，我们将深入剖析笔试中的典型问题，提供解题技巧和实例分析，帮助学员更好地应对考试挑战。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (389, 62, '三支一扶招聘面试技巧第1集', 'video/link/4.mp4', 'video/image/3-9.png', 'video/preview/4.mp4', '在本视频中，我们将全面解析公务员笔试的典型题目，通过大量实例演练，帮助学员理解解题思路和方法，为考试做好充分准备。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (390, 63, '公务员申论高分攻略第1集', 'video/link/5.mp4', 'video/image/3-10.png', 'video/preview/5.mp4', '在本视频中，我们将进行公务员面试实战训练，模拟真实面试场景，帮助学员熟悉面试流程，提高面试技巧。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (391, 64, '事业单位面试心得分享第1集', 'video/link/6.mp4', 'video/image/4-1.png', 'video/preview/6.mp4', '在本视频中，我们将深入分析常见面试问题，提供解答技巧和实例演练，帮助学员更好地应对各种挑战。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (392, 65, '公考面试案例分析第1集', 'video/link/7.mp4', 'video/image/4-2.png', 'video/preview/7.mp4', '这一集将着重讨论面试中的沟通技巧，通过实例演示和讲解，帮助学员提高沟通表达能力，更好地展现自己。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (393, 66, '军队文职招聘面试技巧第1集', 'video/link/1.mp4', 'video/image/4-3.png', 'video/preview/1.mp4', '在本视频中，我们将详细解析面试中的案例分析题目，提供解答思路和实例讲解，帮助学员在面试中游刃有余。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (394, 67, '事业单位招聘笔试技巧第1集', 'video/link/2.mp4', 'video/image/4-4.png', 'video/preview/2.mp4', '在这一集中，我们将模拟实际面试场景，进行全程模拟，帮助学员在真实压力下提高应对能力，增加面试经验。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (395, 68, '三支一扶招聘面试心得第1集', 'video/link/3.mp4', 'video/image/4-5.png', 'video/preview/3.mp4', '在这一集中，我们将深入讨论面试中的综合素质评价题目，提供解答技巧和实例分析，帮助学员在评价中脱颖而出。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (396, 69, '公务员申论范文赏析第1集', 'video/link/4.mp4', 'video/image/4-6.png', 'video/preview/4.mp4', '在本视频中，我们将解析面试中的各类特殊问题，包括如何回答敏感问题和不确定性问题，帮助学员应对各种情况。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (397, 70, '公安招警体能训练第1集', 'video/link/5.mp4', 'video/image/4-7.png', 'video/preview/5.mp4', '这一集将聚焦于面试中的心理素质评价，通过实例演示和讲解，帮助学员理解评价标准，做好心理准备。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (398, 71, '公务员面试模拟训练第1集', 'video/link/6.mp4', 'video/image/4-8.png', 'video/preview/6.mp4', '在这一集中，我们将通过实例演示和模拟练习，帮助学员提高在面试中的仪态和形象，增加面试的整体分数。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (399, 72, '公安招警笔试模拟试题第1集', 'video/link/7.mp4', 'video/image/4-9.png', 'video/preview/7.mp4', '在本视频中，我们将总结面试中的要点，提供面试注意事项和建议，帮助学员做好最后的冲刺和准备。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (400, 73, '三支一扶招聘笔试技巧第1集', 'video/link/1.mp4', 'video/image/4-10.png', 'video/preview/1.mp4', '在本视频中，我们将全面解析军队文职考试要点，深入讲解军事理论、组织管理等知识，帮助学员备战考试。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (401, 74, '军队文职申论范文解析第1集', 'video/link/2.mp4', 'video/image/5-1.png', 'video/preview/2.mp4', '在这一集中，我们将重点关注文职考试中的重难点问题，提供详细解答和实例分析，帮助学员理清复习方向。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (402, 75, '事业单位面试技巧分享第1集', 'video/link/3.mp4', 'video/image/5-2.png', 'video/preview/3.mp4', '在本视频中，我们将详细解析军队文职考试中的组织管理和国防法规方面的考点，为考生提供备考重点。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (403, 76, '公考笔试数学基础课第1集', 'video/link/4.mp4', 'video/image/5-3.png', 'video/preview/4.mp4', '在这一集中，我们将通过实例分析，帮助学员深入了解文职考试中的军事理论，提高应试水平。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (404, 77, '公考面试心理辅导第1集', 'video/link/5.mp4', 'video/image/5-4.png', 'video/preview/5.mp4', '在本视频中，我们将解析军队文职考试的模拟题目，提供解答技巧和实例演练，帮助学员熟悉考试形式。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (405, 78, '军队文职招聘笔试模拟题库第1集', 'video/link/6.mp4', 'video/image/5-5.png', 'video/preview/6.mp4', '在这一集中，我们将聚焦于文职考试中的应用文写作，通过实例分析和写作练习，提高学员的写作水平。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (406, 79, '事业单位招聘面试案例解析第1集', 'video/link/7.mp4', 'video/image/5-6.png', 'video/preview/7.mp4', '在本视频中，我们将深入讲解军队文职考试的综合素质评价题目，提供解答技巧和实例演示，帮助学员备战。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (407, 80, '三支一扶招聘面试技巧培训第1集', 'video/link/1.mp4', 'video/image/5-7.png', 'video/preview/1.mp4', '这一集将聚焦于文职考试中的英语考点，通过实例分析和英语练习，提高学员在英语科目中的应试水平。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (408, 81, '公安招警面试技巧培训第1集', 'video/link/2.mp4', 'video/image/5-8.png', 'video/preview/2.mp4', '在本视频中，我们将解析军队文职考试中的模拟面试题目，提供解答技巧和实例演练，帮助学员熟悉面试流程。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (409, 82, '公务员申论写作技巧第1集', 'video/link/3.mp4', 'video/image/5-9.png', 'video/preview/3.mp4', '在这一集中，我们将总结军队文职考试的复习要点，提供备考建议和注意事项，帮助学员做好最后冲刺。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (410, 83, '事业单位招聘笔试数学解题第1集', 'video/link/4.mp4', 'video/image/5-10.png', 'video/preview/4.mp4', '事业单位考试全程指导课程旨在帮助考生全面备战招聘考试。在本视频中，我们将深入分析事业单位考试的综合素质面试，提供解答技巧和实例演示。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (411, 84, '军队文职招聘面试心理辅导第1集', 'video/link/5.mp4', 'video/image/6-1.png', 'video/preview/5.mp4', '在这一集中，我们将讲解事业单位考试的笔试技巧，通过实例分析和模拟练习，帮助学员提高应试能力。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (412, 85, '三支一扶招聘面试模拟场景第1集', 'video/link/6.mp4', 'video/image/6-2.png', 'video/preview/6.mp4', '在本视频中，我们将解析事业单位考试的面试模拟题目，提供解答技巧和实例演示，帮助学员熟悉面试流程。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (413, 86, '公考面试模拟场景演练第1集', 'video/link/7.mp4', 'video/image/6-3.png', 'video/preview/7.mp4', '在这一集中，我们将重点关注事业单位考试中的常见问题，提供解答技巧和实例演练，帮助学员更好地应对面试挑战。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (414, 87, '事业单位招聘面试心理辅导第1集', 'video/link/1.mp4', 'video/image/6-4.png', 'video/preview/1.mp4', '在本视频中，我们将深入分析事业单位考试的申论写作，提供写作结构和论述技巧，帮助学员提高写作水平。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (415, 88, '军队文职招聘笔试英语第1集', 'video/link/2.mp4', 'video/image/6-5.png', 'video/preview/2.mp4', '在这一集中，我们将讲解事业单位考试的面试技巧，包括沟通能力和形象表达，帮助学员在面试中脱颖而出。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (416, 89, '公考笔试逻辑思维训练第1集', 'video/link/3.mp4', 'video/image/6-6.png', 'video/preview/3.mp4', '在本视频中，我们将解析事业单位考试的模拟笔试题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (417, 90, '三支一扶申论写作技巧第1集', 'video/link/4.mp4', 'video/image/6-7.png', 'video/preview/4.mp4', '在这一集中，我们将重点关注事业单位考试的面试常见问题，提供解答技巧和实例演示，帮助学员做好面试准备。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (418, 91, '公务员行测考点精讲第1集', 'video/link/5.mp4', 'video/image/6-8.png', 'video/preview/5.mp4', '在本视频中，我们将深入分析事业单位考试的综合素质面试，提供解答技巧和实例演示，帮助学员备战考试。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (419, 92, '三支一扶招聘笔试常识综合第1集', 'video/link/6.mp4', 'video/image/6-9.png', 'video/preview/6.mp4', '在这一集中，我们将总结事业单位考试的复习要点，提供备考建议和注意事项，帮助学员做好最后冲刺。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (420, 93, '军队文职招聘面试形势与政策第1集', 'video/link/7.mp4', 'video/image/6-10.png', 'video/preview/7.mp4', '三支一扶招聘考试攻略课程帮助学员全面了解招聘考试的各个环节。在本视频中，我们将解析考试大纲，提供备考指导和注意事项。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (421, 94, '事业单位招聘面试实战演练第1集', 'video/link/1.mp4', 'video/image/1-1.png', 'video/preview/1.mp4', '在这一集中，我们将聚焦于招聘考试中的面试技巧，包括模拟面试和实际案例分析，帮助学员提高面试表现。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (422, 95, '公安招警笔试科目解析第1集', 'video/link/2.mp4', 'video/image/1-2.png', 'video/preview/2.mp4', '在本视频中，我们将详细解析三支一扶招聘考试的模拟题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (423, 96, '公考面试技巧培训第1集', 'video/link/3.mp4', 'video/image/1-3.png', 'video/preview/3.mp4', '在这一集中，我们将重点关注招聘考试中的申论写作，提供写作结构和论述技巧，帮助学员提高写作水平。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (424, 97, '事业单位笔试数学基础第1集', 'video/link/4.mp4', 'video/image/1-4.png', 'video/preview/4.mp4', '在本视频中，我们将深入分析三支一扶招聘考试的面试技巧，提供解答技巧和实例演示，帮助学员备战面试。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (425, 98, '军队文职招聘面试形势政策第1集', 'video/link/5.mp4', 'video/image/1-5.png', 'video/preview/5.mp4', '在这一集中，我们将解析招聘考试的模拟笔试题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (426, 99, '公考笔试言语理解训练第1集', 'video/link/6.mp4', 'video/image/1-6.png', 'video/preview/6.mp4', '在本视频中，我们将深入分析三支一扶招聘考试的综合素质评价题目，提供解答技巧和实例演示，帮助学员备战考试。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (427, 100, '三支一扶招聘面试技巧第1集', 'video/link/7.mp4', 'video/image/1-7.png', 'video/preview/7.mp4', '在这一集中，我们将重点关注招聘考试的面试常见问题，提供解答技巧和实例演示，帮助学员做好面试准备。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (428, 101, '公考面试心理测试技巧第1集', 'video/link/1.mp4', 'video/image/1-8.png', 'video/preview/1.mp4', '在本视频中，我们将详细解析三支一扶招聘考试的笔试技巧，通过实例分析和模拟练习，帮助学员提高应试能力。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (429, 102, '事业单位招聘笔试言语理解第1集', 'video/link/2.mp4', 'video/image/1-9.png', 'video/preview/2.mp4', '在这一集中，我们将总结招聘考试的复习要点，提供备考建议和注意事项，帮助学员做好最后冲刺。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (430, 103, '军队文职招聘笔试综合素质面试第1集', 'video/link/3.mp4', 'video/image/1-10.png', 'video/preview/3.mp4', '公安招警考试精讲课程旨在帮助考生全面备战公安招警考试。在本视频中，我们将深入分析考试的笔试重难点，提供解答技巧和实例演示。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (431, 104, '公安招警面试实战演练第1集', 'video/link/4.mp4', 'video/image/2-1.png', 'video/preview/4.mp4', '在这一集中，我们将聚焦于招警考试中的面试技巧，包括模拟面试和实际案例分析，帮助学员提高面试表现。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (432, 105, '三支一扶招聘笔试综合素质面试第1集', 'video/link/5.mp4', 'video/image/2-2.png', 'video/preview/5.mp4', '在本视频中，我们将详细解析公安招警考试的模拟题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (433, 106, '公考笔试行测技巧培训第1集', 'video/link/6.mp4', 'video/image/2-3.png', 'video/preview/6.mp4', '在这一集中，我们将重点关注招警考试中的常见问题，提供解答技巧和实例演示，帮助学员更好地应对面试挑战。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (434, 107, '军队文职招聘面试模拟演练第1集', 'video/link/7.mp4', 'video/image/2-4.png', 'video/preview/7.mp4', '在本视频中，我们将深入分析招警考试的申论写作，提供写作结构和论述技巧，帮助学员提高写作水平。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (435, 108, '公安招警笔试刑法知识点详解第1集', 'video/link/1.mp4', 'video/image/2-5.png', 'video/preview/1.mp4', '在这一集中，我们将讲解招警考试的面试技巧，包括沟通能力和形象表达，帮助学员在面试中脱颖而出。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (436, 109, '三支一扶招聘面试模拟演练第1集', 'video/link/2.mp4', 'video/image/2-6.png', 'video/preview/2.mp4', '在本视频中，我们将解析招警考试的模拟笔试题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (437, 110, '公考面试言语表达技巧第1集', 'video/link/3.mp4', 'video/image/2-7.png', 'video/preview/3.mp4', '在这一集中，我们将重点关注招警考试的面试常见问题，提供解答技巧和实例演示，帮助学员做好面试准备。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (438, 111, '军队文职招聘面试心理测试第1集', 'video/link/4.mp4', 'video/image/2-8.png', 'video/preview/4.mp4', '在本视频中，我们将详细解析招警考试的笔试技巧，通过实例分析和模拟练习，帮助学员提高应试能力。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (439, 112, '事业单位招聘面试模拟演练第1集', 'video/link/5.mp4', 'video/image/2-9.png', 'video/preview/5.mp4', '在这一集中，我们将总结招警考试的复习要点，提供备考建议和注意事项，帮助学员做好最后冲刺。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (440, 113, '三支一扶招聘笔试行测技巧第1集', 'video/link/6.mp4', 'video/image/2-10.png', 'video/preview/6.mp4', '事业单位面试技巧课程帮助学员更好地应对事业单位面试环节。在本视频中，我们将解析面试的常见问题，提供解答技巧和实例演示。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (441, 114, '公考面试形势政策解读第1集', 'video/link/7.mp4', 'video/image/3-1.png', 'video/preview/7.mp4', '在这一集中，我们将聚焦于事业单位面试中的沟通技巧，包括与考官的有效沟通和表达能力，帮助学员提高面试表现。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (442, 115, '公安招警笔试综合知识点讲解第1集', 'video/link/1.mp4', 'video/image/3-2.png', 'video/preview/1.mp4', '在本视频中，我们将详细解析事业单位面试的模拟题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (443, 116, '事业单位招聘笔试行测题库解析第1集', 'video/link/2.mp4', 'video/image/3-3.png', 'video/preview/2.mp4', '在这一集中，我们将重点关注事业单位面试中的形象表达，提供形象打造和仪态礼仪技巧，帮助学员塑造良好形象。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (444, 117, '三支一扶招聘面试心理测试第1集', 'video/link/3.mp4', 'video/image/3-4.png', 'video/preview/3.mp4', '在本视频中，我们将深入分析事业单位面试的申论写作，提供写作结构和论述技巧，帮助学员提高写作水平。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (445, 118, '公考笔试行测模拟考试第1集', 'video/link/4.mp4', 'video/image/3-5.png', 'video/preview/4.mp4', '在这一集中，我们将讲解事业单位面试的综合素质评价题目，提供解答技巧和实例演示，帮助学员备战考试。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (446, 119, '公安招警笔试常识科目精讲第1集', 'video/link/5.mp4', 'video/image/3-6.png', 'video/preview/5.mp4', '在本视频中，我们将解析事业单位面试的模拟笔试题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (447, 120, '军队文职招聘面试技巧第1集', 'video/link/6.mp4', 'video/image/3-7.png', 'video/preview/6.mp4', '在这一集中，我们将重点关注事业单位面试的面试常见问题，提供解答技巧和实例演示，帮助学员做好面试准备。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (448, 121, '公考笔试言语理解与表达第1集', 'video/link/7.mp4', 'video/image/3-8.png', 'video/preview/7.mp4', '在本视频中，我们将详细解析事业单位面试的笔试技巧，通过实例分析和模拟练习，帮助学员提高应试能力。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (449, 122, '公安招警面试形势政策解读第1集', 'video/link/1.mp4', 'video/image/3-9.png', 'video/preview/1.mp4', '在这一集中，我们将总结事业单位面试的复习要点，提供备考建议和注意事项，帮助学员做好最后冲刺。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (450, 123, '三支一扶招聘笔试言语理解与表达第1集', 'video/link/2.mp4', 'video/image/3-10.png', 'video/preview/2.mp4', '三支一扶申论写作课程致力于提高学员在招聘考试中的申论写作水平。在本视频中，我们将深入分析申论写作的基本结构和论述技巧，帮助学员提高写作水平。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (451, 124, '事业单位招聘面试形势政策解读第1集', 'video/link/3.mp4', 'video/image/4-1.png', 'video/preview/3.mp4', '在这一集中，我们将聚焦于申论写作中的论证方法，包括实例分析和写作练习，帮助学员熟悉各类论题的应对策略。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (452, 125, '公考面试心理测试技巧第1集', 'video/link/4.mp4', 'video/image/4-2.png', 'video/preview/4.mp4', '在本视频中，我们将详细解析申论写作的题材范围，提供实例演示和写作技巧，帮助学员在考试中更好地选择和应对论题。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (453, 126, '军队文职招聘面试形势政策解读第1集', 'video/link/5.mp4', 'video/image/4-3.png', 'video/preview/5.mp4', '在这一集中，我们将重点关注申论写作的语言表达，提供写作技巧和实例演示，帮助学员提高语言表达水平。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (454, 127, '公考笔试数学基础知识讲解第1集', 'video/link/6.mp4', 'video/image/4-4.png', 'video/preview/6.mp4', '在本视频中，我们将深入分析申论写作的实例题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (455, 128, '公安招警面试模拟演练第1集', 'video/link/7.mp4', 'video/image/4-5.png', 'video/preview/7.mp4', '在这一集中，我们将讲解申论写作的论题分析，包括如何理解和解答各类申论题目，帮助学员应对考试挑战。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (456, 129, '三支一扶招聘面试技巧第1集', 'video/link/1.mp4', 'video/image/4-6.png', 'video/preview/1.mp4', '在本视频中，我们将解析申论写作的模拟笔试题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (457, 130, '军队文职笔试行测技巧第1集', 'video/link/2.mp4', 'video/image/4-7.png', 'video/preview/2.mp4', '在这一集中，我们将重点关注申论写作的面试常见问题，提供解答技巧和实例演示，帮助学员做好面试准备。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (458, 131, '公考面试心理测试实战演练第1集', 'video/link/3.mp4', 'video/image/4-8.png', 'video/preview/3.mp4', '在本视频中，我们将详细解析申论写作的笔试技巧，通过实例分析和模拟练习，帮助学员提高应试能力。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (459, 132, '事业单位招聘面试技巧第1集', 'video/link/4.mp4', 'video/image/4-9.png', 'video/preview/4.mp4', '在这一集中，我们将总结申论写作的复习要点，提供备考建议和注意事项，帮助学员做好最后冲刺。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (460, 133, '三支一扶招聘笔试技巧第1集', 'video/link/5.mp4', 'video/image/4-10.png', 'video/preview/5.mp4', '公务员面试技能培训课程旨在提高考生在公务员面试中的表现水平。在本视频中，我们将介绍面试的基本流程和注意事项，帮助学员建立面试思维。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (461, 134, '公考笔试行测强化训练第1集', 'video/link/6.mp4', 'video/image/5-1.png', 'video/preview/6.mp4', '在这一集中，我们将聚焦于公务员面试中的形象塑造，包括仪容仪表和形象气质的打造，帮助学员在面试中留下良好印象。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (462, 135, '公安招警面试技巧培训第1集', 'video/link/7.mp4', 'video/image/5-2.png', 'video/preview/7.mp4', '在本视频中，我们将详细解析公务员面试的模拟题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (463, 136, '事业单位招聘面试实战演练第1集', 'video/link/1.mp4', 'video/image/5-3.png', 'video/preview/1.mp4', '在这一集中，我们将重点关注公务员面试中的沟通技巧，包括与考官的有效沟通和表达能力，帮助学员提高面试表现。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (464, 137, '三支一扶招聘面试技巧第1集', 'video/link/2.mp4', 'video/image/5-4.png', 'video/preview/2.mp4', '在本视频中，我们将深入分析公务员面试的申论写作，提供写作结构和论述技巧，帮助学员提高写作水平。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (465, 138, '公考面试心理测试第1集', 'video/link/3.mp4', 'video/image/5-5.png', 'video/preview/3.mp4', '在这一集中，我们将讲解公务员面试的论题分析，包括如何理解和解答各类面试题目，帮助学员应对考试挑战。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (466, 139, '军队文职招聘笔试常识科目第1集', 'video/link/4.mp4', 'video/image/5-6.png', 'video/preview/4.mp4', '在本视频中，我们将解析公务员面试的模拟笔试题目，提供解答技巧和实例演示，帮助学员熟悉考试形式。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (467, 140, '三支一扶面试模拟演练第1集', 'video/link/5.mp4', 'video/image/5-7.png', 'video/preview/5.mp4', '在这一集中，我们将重点关注公务员面试的面试常见问题，提供解答技巧和实例演示，帮助学员做好面试准备。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (468, 141, '公考面试实战演练第1集', 'video/link/6.mp4', 'video/image/5-8.png', 'video/preview/6.mp4', '在本视频中，我们将详细解析公务员面试的笔试技巧，通过实例分析和模拟练习，帮助学员提高应试能力。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (469, 142, '军队文职招聘面试模拟考核第1集', 'video/link/7.mp4', 'video/image/5-9.png', 'video/preview/7.mp4', '在这一集中，我们将总结公务员面试的复习要点，提供备考建议和注意事项，帮助学员做好最后冲刺。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (470, 143, '事业单位招聘笔试实战演练第1集', 'video/link/1.mp4', 'video/image/5-10.png', 'video/preview/1.mp4', '本集课程将从军队文职申论的基础知识入手，介绍申论的协作辅导策略，帮助学员理解申论的重要性和复习方法。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (471, 144, '公安招警笔试考点解析第1集', 'video/link/2.mp4', 'video/image/6-1.png', 'video/preview/2.mp4', '在这一集中，我们将深入解析军队文职申论的题型和题材，提供协作辅导的实例分析，帮助学员更好地应对不同类型的申论题目。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (472, 145, '公考笔试行测全程解析第1集', 'video/link/3.mp4', 'video/image/6-2.png', 'video/preview/3.mp4', '本集课程将重点讲解军队文职申论的写作技巧和表达方法，通过实例演练帮助学员提高申论写作水平。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (473, 146, '事业单位面试实战演练第1集', 'video/link/4.mp4', 'video/image/6-3.png', 'video/preview/4.mp4', '在这一集中，我们将分享军队文职申论的范文解析和评价标准，帮助学员了解申论的评分规则和注意事项。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (474, 147, '公考面试技巧培训第1集', 'video/link/5.mp4', 'video/image/6-4.png', 'video/preview/5.mp4', '本集课程将全面解析军队文职申论的协作辅导计划，包括复习计划和备考建议，助力学员更好地备战申论考试。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (475, 148, '三支一扶申论辅导第1集', 'video/link/6.mp4', 'video/image/6-5.png', 'video/preview/6.mp4', '在这一集中，我们将进行军队文职申论的实际案例分析和协作辅导演示，通过实例帮助学员理解申论的实际应用场景。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (476, 149, '军队文职面试实战演练第1集', 'video/link/7.mp4', 'video/image/6-6.png', 'video/preview/7.mp4', '本集课程将提供军队文职申论的协作辅导题目，通过实际操作帮助学员熟悉协作辅导环境，提高应试水平。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (477, 150, '公安招警心理测试辅导第1集', 'video/link/1.mp4', 'video/image/6-7.png', 'video/preview/1.mp4', '在这一集中，我们将进行军队文职申论的协作辅导模拟考场，通过实际模拟协作辅导帮助学员适应考场氛围，提高答题效率。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (478, 151, '事业单位招聘面试心得分享第1集', 'video/link/2.mp4', 'video/image/6-8.png', 'video/preview/2.mp4', '本集课程将分享军队文职申论协作辅导的心得体会和备考经验，帮助学员更好地制定协作辅导备考计划。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (479, 152, '公考面试模拟演练第1集', 'video/link/3.mp4', 'video/image/6-9.png', 'video/preview/3.mp4', '在这一集中，我们将总结军队文职申论协作辅导的重点，提供备考注意事项和最后的冲刺建议，助力学员在考前取得更好的成绩。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (480, 153, '公安招警面试技巧培训第1集', 'video/link/4.mp4', 'video/image/6-10.png', 'video/preview/4.mp4', '本集课程将从事业单位招聘笔试的重点知识入手，介绍笔试的突破策略，帮助学员理解笔试的难点和备考方法。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (481, 154, '三支一扶笔试全程解析第1集', 'video/link/5.mp4', 'video/image/1-1.png', 'video/preview/5.mp4', '在这一集中，我们将深入解析事业单位招聘笔试的题型和解题技巧，提供突破策略的实例分析，帮助学员更好地应对各科目的笔试题目。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (482, 155, '事业单位招聘笔试辅导第1集', 'video/link/6.mp4', 'video/image/1-2.png', 'video/preview/6.mp4', '本集课程将重点讲解事业单位招聘笔试的时间管理和答题技巧，通过实例演练帮助学员提高笔试效率。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (483, 156, '公考笔试模拟试题解析第1集', 'video/link/7.mp4', 'video/image/1-3.png', 'video/preview/7.mp4', '在这一集中，我们将分享事业单位招聘笔试的范文解析和评分标准，帮助学员了解笔试的评分规则和注意事项。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (484, 157, '军队文职面试技巧培训第1集', 'video/link/1.mp4', 'video/image/1-4.png', 'video/preview/1.mp4', '本集课程将全面解析事业单位招聘笔试的突破策略，包括复习计划和备考建议，助力学员更好地备战笔试环节。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (485, 158, '公安招警笔试全程解析第1集', 'video/link/2.mp4', 'video/image/1-5.png', 'video/preview/2.mp4', '在这一集中，我们将进行事业单位招聘笔试的实际案例分析和突破策略演示，通过实例帮助学员理解笔试的实际应用场景。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (486, 159, '公考面试心得分享第1集', 'video/link/3.mp4', 'video/image/1-6.png', 'video/preview/3.mp4', '本集课程将提供事业单位招聘笔试的突破策略题目，通过实际操作帮助学员熟悉突破策略环境，提高应试水平。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (487, 160, '三支一扶面试模拟演练第1集', 'video/link/4.mp4', 'video/image/1-7.png', 'video/preview/4.mp4', '在这一集中，我们将进行事业单位招聘笔试的突破策略模拟考场，通过实际模拟突破策略帮助学员适应考场氛围，提高答题效率。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (488, 161, '事业单位招聘面试技巧培训第1集', 'video/link/5.mp4', 'video/image/1-8.png', 'video/preview/5.mp4', '本集课程将分享事业单位招聘笔试的经验教训和考试注意事项，帮助学员在考前做好最后的冲刺准备，取得优异成绩。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (489, 162, '公安招警笔试技巧分享第1集', 'video/link/6.mp4', 'video/image/1-9.png', 'video/preview/6.mp4', '在这一集中，我们将总结事业单位招聘笔试的突破策略，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (490, 163, '军队文职笔试全程解析第1集', 'video/link/7.mp4', 'video/image/1-10.png', 'video/preview/7.mp4', '本集课程将从事业单位招聘笔试的重点知识入手，介绍笔试的突破策略，帮助学员理解笔试的难点和备考方法。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (491, 164, '公考笔试解题技巧第1集', 'video/link/1.mp4', 'video/image/2-1.png', 'video/preview/1.mp4', '在这一集中，我们将深入解析事业单位招聘笔试的题型和解题技巧，提供突破策略的实例分析，帮助学员更好地应对各科目的笔试题目。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (492, 165, '公安招警面试实战演练第1集', 'video/link/2.mp4', 'video/image/2-2.png', 'video/preview/2.mp4', '本集课程将重点讲解事业单位招聘笔试的时间管理和答题技巧，通过实例演练帮助学员提高笔试效率。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (493, 166, '三支一扶答题技巧培训第1集', 'video/link/3.mp4', 'video/image/2-3.png', 'video/preview/3.mp4', '在这一集中，我们将分享事业单位招聘笔试的范文解析和评分标准，帮助学员了解笔试的评分规则和注意事项。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (494, 167, '公考笔试模拟考试第1集', 'video/link/4.mp4', 'video/image/2-4.png', 'video/preview/4.mp4', '本集课程将全面解析事业单位招聘笔试的突破策略，包括复习计划和备考建议，助力学员更好地备战笔试环节。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (495, 168, '公安招警面试实战演练第1集', 'video/link/5.mp4', 'video/image/2-5.png', 'video/preview/5.mp4', '在这一集中，我们将进行事业单位招聘笔试的实际案例分析和突破策略演示，通过实例帮助学员理解笔试的实际应用场景。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (496, 169, '事业单位招聘笔试全程解析第1集', 'video/link/6.mp4', 'video/image/2-6.png', 'video/preview/6.mp4', '本集课程将提供事业单位招聘笔试的突破策略题目，通过实际操作帮助学员熟悉突破策略环境，提高应试水平。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (497, 170, '军队文职面试技巧培训第1集', 'video/link/7.mp4', 'video/image/2-7.png', 'video/preview/7.mp4', '在这一集中，我们将进行事业单位招聘笔试的突破策略模拟考场，通过实际模拟突破策略帮助学员适应考场氛围，提高答题效率。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (498, 171, '公考面试心理准备第1集', 'video/link/1.mp4', 'video/image/2-8.png', 'video/preview/1.mp4', '本集课程将分享事业单位招聘笔试的经验教训和考试注意事项，帮助学员在考前做好最后的冲刺准备，取得优异成绩。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (499, 172, '三支一扶招聘面试技巧第1集', 'video/link/2.mp4', 'video/image/2-9.png', 'video/preview/2.mp4', '在这一集中，我们将总结事业单位招聘笔试的突破策略，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (500, 173, '公安招警体能训练指导第1集', 'video/link/3.mp4', 'video/image/2-10.png', 'video/preview/3.mp4', '本集课程将从公务员申论范文解析的角度，介绍申论写作的基本要求和评分标准，帮助学员了解申论写作的重点和难点。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (501, 174, '事业单位面试技巧分享第1集', 'video/link/4.mp4', 'video/image/3-1.png', 'video/preview/4.mp4', '在这一集中，我们将深入解析公务员申论范文的写作结构和论述技巧，提供实例分析，帮助学员更好地理解范文解析的方法。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (502, 175, '军队文职招聘面试演练第1集', 'video/link/5.mp4', 'video/image/3-2.png', 'video/preview/5.mp4', '本集课程将重点讲解公务员申论范文的写作思路和逻辑展开，通过实例演练帮助学员提高申论写作水平。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (503, 176, '公考笔试答题技巧讲解第1集', 'video/link/6.mp4', 'video/image/3-3.png', 'video/preview/6.mp4', '在这一集中，我们将分享公务员申论范文的范文解析和评分标准，帮助学员了解申论范文的评分规则和注意事项。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (504, 177, '公考面试模拟考试第1集', 'video/link/7.mp4', 'video/image/3-4.png', 'video/preview/7.mp4', '本集课程将全面解析公务员申论范文解析的技巧，包括复习计划和备考建议，助力学员更好地备战申论写作环节。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (505, 178, '公考笔试答题技巧讲解第1集', 'video/link/1.mp4', 'video/image/3-5.png', 'video/preview/1.mp4', '在这一集中，我们将进行公务员申论范文解析的实际案例分析和演示，通过实例帮助学员理解申论范文解析的实际应用场景。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (506, 179, '事业单位招聘笔试突破第1集', 'video/link/2.mp4', 'video/image/3-6.png', 'video/preview/2.mp4', '本集课程将提供公务员申论范文解析的实例题目，通过实际操作帮助学员熟悉解析环境，提高应试水平。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (507, 180, '三支一扶招聘面试实战第1集', 'video/link/3.mp4', 'video/image/3-7.png', 'video/preview/3.mp4', '在这一集中，我们将进行公务员申论范文解析的模拟考场，通过实际模拟解析帮助学员适应考场氛围，提高解析效率。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (508, 181, '公考面试心理准备第1集', 'video/link/4.mp4', 'video/image/3-8.png', 'video/preview/4.mp4', '本集课程将分享公务员申论范文解析的经验教训和考试注意事项，帮助学员在考前做好最后的冲刺准备，取得优异成绩。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (509, 182, '事业单位招聘面试实战第1集', 'video/link/5.mp4', 'video/image/3-9.png', 'video/preview/5.mp4', '在这一集中，我们将总结公务员申论范文解析的方法和技巧，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (510, 183, '公安招警模拟考试第1集', 'video/link/6.mp4', 'video/image/3-10.png', 'video/preview/6.mp4', '本集课程将从三支一扶申论写作的基本要求入手，介绍写作的结构和论述技巧，帮助学员理解申论写作的难点。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (511, 184, '公考笔试冲刺班第1集', 'video/link/7.mp4', 'video/image/4-1.png', 'video/preview/7.mp4', '在这一集中，我们将深入解析三支一扶申论写作的写作思路和逻辑展开，提供实例分析，帮助学员更好地掌握写作指导的方法。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (512, 185, '三支一扶招聘笔试突破第1集', 'video/link/1.mp4', 'video/image/4-2.png', 'video/preview/1.mp4', '本集课程将重点讲解三支一扶申论写作的时间管理和答题技巧，通过实例演练帮助学员提高写作水平。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (513, 186, '公考面试模拟考场第1集', 'video/link/2.mp4', 'video/image/4-3.png', 'video/preview/2.mp4', '在这一集中，我们将分享三支一扶申论写作的范文解析和评分标准，帮助学员了解写作的评分规则和注意事项。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (514, 187, '事业单位招聘笔试全程解析第1集', 'video/link/3.mp4', 'video/image/4-4.png', 'video/preview/3.mp4', '本集课程将全面解析三支一扶申论写作的指导技巧，包括复习计划和备考建议，助力学员更好地备战写作环节。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (515, 188, '军队文职面试攻略第1集', 'video/link/4.mp4', 'video/image/4-5.png', 'video/preview/4.mp4', '在这一集中，我们将进行三支一扶申论写作的实际案例分析和演示，通过实例帮助学员理解写作指导的实际应用场景。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (516, 189, '三支一扶面试技巧第1集', 'video/link/5.mp4', 'video/image/4-6.png', 'video/preview/5.mp4', '本集课程将提供三支一扶申论写作的实例题目，通过实际操作帮助学员熟悉指导环境，提高应试水平。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (517, 190, '公安招警笔试全程解析第1集', 'video/link/6.mp4', 'video/image/4-7.png', 'video/preview/6.mp4', '在这一集中，我们将进行三支一扶申论写作的模拟考场，通过实际模拟指导帮助学员适应考场氛围，提高写作效率。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (518, 191, '事业单位招聘笔试模拟考场第1集', 'video/link/7.mp4', 'video/image/4-8.png', 'video/preview/7.mp4', '本集课程将分享三支一扶申论写作的经验教训和考试注意事项，帮助学员在考前做好最后的冲刺准备，取得优异成绩。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (519, 192, '公考面试技巧分享第1集', 'video/link/1.mp4', 'video/image/4-9.png', 'video/preview/1.mp4', '在这一集中，我们将总结三支一扶申论写作的指导方法和技巧，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (520, 193, '军队文职笔试冲刺班第1集', 'video/link/2.mp4', 'video/image/4-10.png', 'video/preview/2.mp4', '本集课程将从军队文职面试的面试流程入手，介绍面试的基本要求和形式，帮助学员理解面试的难点。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (521, 194, '三支一扶招聘面试模拟考场第1集', 'video/link/3.mp4', 'video/image/5-1.png', 'video/preview/3.mp4', '在这一集中，我们将深入解析军队文职面试的面试技巧和形体仪态，提供实例分析，帮助学员更好地应对面试环节。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (522, 195, '三支一扶招聘面试突破第1集', 'video/link/4.mp4', 'video/image/5-2.png', 'video/preview/4.mp4', '本集课程将重点讲解军队文职面试的模拟面试案例，通过实例演练帮助学员提高面试水平。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (523, 196, '公考笔试冲刺班第1集', 'video/link/5.mp4', 'video/image/5-3.png', 'video/preview/5.mp4', '在这一集中，我们将分享军队文职面试的面试注意事项和评分标准，帮助学员了解面试的评分规则和注意事项。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (524, 197, '事业单位招聘面试实战第1集', 'video/link/6.mp4', 'video/image/5-4.png', 'video/preview/6.mp4', '本集课程将全面解析军队文职面试的模拟面试技巧，包括形体仪态和应对问题的方法，助力学员更好地备战面试环节。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (525, 198, '公考面试心理准备第1集', 'video/link/7.mp4', 'video/image/5-5.png', 'video/preview/7.mp4', '在这一集中，我们将进行军队文职面试的实际案例分析和模拟面试，通过实例帮助学员理解面试的实际应用场景。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (526, 199, '公安招警模拟考试第1集', 'video/link/1.mp4', 'video/image/5-6.png', 'video/preview/1.mp4', '本集课程将提供军队文职面试的模拟面试题目，通过实际操作帮助学员熟悉模拟环境，提高应试水平。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (527, 200, '事业单位招聘笔试突破第1集', 'video/link/2.mp4', 'video/image/5-7.png', 'video/preview/2.mp4', '在这一集中，我们将进行军队文职面试的模拟考场，通过实际模拟面试帮助学员适应考场氛围，提高面试效率。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (528, 201, '公考笔试名师讲解第1集', 'video/link/3.mp4', 'video/image/5-8.png', 'video/preview/3.mp4', '本集课程将分享军队文职面试的经验教训和考试注意事项，帮助学员在考前做好最后的冲刺准备，取得优异成绩。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (529, 202, '三支一扶招聘面试技巧第1集', 'video/link/4.mp4', 'video/image/5-9.png', 'video/preview/4.mp4', '在这一集中，我们将总结军队文职面试的模拟方法和技巧，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (530, 203, '军队文职考试技巧第1集', 'video/link/5.mp4', 'video/image/5-10.png', 'video/preview/5.mp4', '本集课程将从公安招警面试的基本要求入手，介绍面试的技能培训内容，帮助学员理解面试的难点。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (531, 204, '公安招警笔试突破班第1集', 'video/link/6.mp4', 'video/image/6-1.png', 'video/preview/6.mp4', '在这一集中，我们将深入解析公安招警面试的技能培训重点和方法，提供实例分析，帮助学员更好地掌握面试技能。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (532, 205, '事业单位招聘面试心得分享第1集', 'video/link/7.mp4', 'video/image/6-2.png', 'video/preview/7.mp4', '本集课程将重点讲解公安招警面试的模拟培训案例，通过实例演练帮助学员提高面试水平。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (533, 206, '三支一扶招聘面试案例分析第1集', 'video/link/1.mp4', 'video/image/6-3.png', 'video/preview/1.mp4', '在这一集中，我们将分享公安招警面试的技能培训注意事项和评分标准，帮助学员了解技能培训的评分规则和注意事项。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (534, 207, '公安招警面试技巧培训第1集', 'video/link/2.mp4', 'video/image/6-4.png', 'video/preview/2.mp4', '本集课程将全面解析公安招警面试的模拟培训技巧，包括技能表现和应对问题的方法，助力学员更好地备战面试环节。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (535, 208, '军队文职模拟考试讲解第1集', 'video/link/3.mp4', 'video/image/6-5.png', 'video/preview/3.mp4', '在这一集中，我们将进行公安招警面试的实际技能培训案例分析和演示，通过实例帮助学员理解技能培训的实际应用场景。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (536, 209, '公考面试形势政策解读第1集', 'video/link/4.mp4', 'video/image/6-6.png', 'video/preview/4.mp4', '本集课程将提供公安招警面试的模拟培训题目，通过实际操作帮助学员熟悉培训环境，提高应试水平。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (537, 210, '公安招警心理测试第1集', 'video/link/5.mp4', 'video/image/6-7.png', 'video/preview/5.mp4', '在这一集中，我们将进行公安招警面试的模拟培训考场，通过实际模拟培训帮助学员适应考场氛围，提高面试效率。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (538, 211, '事业单位招聘笔试技巧第1集', 'video/link/6.mp4', 'video/image/6-8.png', 'video/preview/6.mp4', '本集课程将分享公安招警面试的经验教训和考试注意事项，帮助学员在考前做好最后的冲刺准备，取得优异成绩。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (539, 212, '公考笔试数学精讲第1集', 'video/link/7.mp4', 'video/image/6-9.png', 'video/preview/7.mp4', '在这一集中，我们将总结公安招警面试的技能培训方法和技巧，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (540, 213, '公考面试实战演练第1集', 'video/link/1.mp4', 'video/image/6-10.png', 'video/preview/1.mp4', '在这一集中，我们将介绍公务员面试心理辅导的基本概念和重要性，帮助学员认识并提高心理素质。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (541, 214, '军队文职面试技巧第1集', 'video/link/2.mp4', 'video/image/1-1.png', 'video/preview/2.mp4', '本集课程将深入解析公务员面试中可能遇到的心理压力和挑战，提供应对方法和心理调节建议。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (542, 215, '三支一扶实战演练第1集', 'video/link/3.mp4', 'video/image/1-2.png', 'video/preview/3.mp4', '在这一集中，我们将进行公务员面试心理辅导的模拟案例分析，通过实例演示帮助学员理解心理辅导的实际应用场景。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (543, 216, '事业单位面试技能培训第1集', 'video/link/4.mp4', 'video/image/1-3.png', 'video/preview/4.mp4', '本集课程将分享公务员面试心理辅导的成功经验和心得体会，提供学员宝贵的心理辅导经验。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (544, 217, '公安招警体能训练第1集', 'video/link/5.mp4', 'video/image/1-4.png', 'video/preview/5.mp4', '在这一集中，我们将进行公务员面试心理辅导的实际心理调训，通过实际操作帮助学员提高心理应对能力。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (545, 218, '公考笔试语文精讲第1集', 'video/link/6.mp4', 'video/image/1-5.png', 'video/preview/6.mp4', '本集课程将提供公务员面试心理辅导的模拟调训题目，通过实际操作帮助学员熟悉心理辅导环境，提高应试水平。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (546, 219, '公考面试形势政策解读第1集', 'video/link/7.mp4', 'video/image/1-6.png', 'video/preview/7.mp4', '在这一集中，我们将进行公务员面试心理辅导的实际心理辅导考场，通过实际模拟培训帮助学员适应考场氛围。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (547, 220, '军队文职招聘宣讲第1集', 'video/link/1.mp4', 'video/image/1-7.png', 'video/preview/1.mp4', '本集课程将分享公务员面试心理辅导的经验教训和心得体会，帮助学员在考前做好最后的心理调整，取得更好的成绩。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (548, 221, '事业单位招聘法律法规解读第1集', 'video/link/2.mp4', 'video/image/1-8.png', 'video/preview/2.mp4', '在这一集中，我们将总结公务员面试心理辅导的方法和技巧，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (549, 222, '三支一扶考试技巧分享第1集', 'video/link/3.mp4', 'video/image/1-9.png', 'video/preview/3.mp4', '本集课程将总结公务员面试心理辅导的成功经验和心得体会，为学员提供最后的备考建议，取得优异成绩。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (550, 223, '公安招警模拟面试第1集', 'video/link/4.mp4', 'video/image/1-10.png', 'video/preview/4.mp4', '在这一集中，我们将介绍事业单位招聘面试实战的基本概念和实施方法，帮助学员了解面试实战的要点。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (551, 224, '公考笔试数学突破第1集', 'video/link/5.mp4', 'video/image/2-1.png', 'video/preview/5.mp4', '本集课程将深入解析事业单位招聘面试实战的评分规则和注意事项，提供实例分析和解决方案。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (552, 225, '公考面试心理辅导第1集', 'video/link/6.mp4', 'video/image/2-2.png', 'video/preview/6.mp4', '在这一集中，我们将进行事业单位招聘面试实战的模拟案例分析，通过实例演示帮助学员理解实战的实际应用场景。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (553, 226, '军队文职招聘答题技巧第1集', 'video/link/7.mp4', 'video/image/2-3.png', 'video/preview/7.mp4', '本集课程将分享事业单位招聘面试实战的成功经验和心得体会，提供学员宝贵的实战经验。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (554, 227, '事业单位招聘实操指南第1集', 'video/link/1.mp4', 'video/image/2-4.png', 'video/preview/1.mp4', '在这一集中，我们将进行事业单位招聘面试实战的实际操作演示，通过实际操作帮助学员提高实战水平。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (555, 228, '三支一扶面试技巧分享第1集', 'video/link/2.mp4', 'video/image/2-5.png', 'video/preview/2.mp4', '本集课程将提供事业单位招聘面试实战的模拟实战题目，通过实际操作帮助学员熟悉实战环境，提高应试水平。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (556, 229, '公考笔试英语突破第1集', 'video/link/3.mp4', 'video/image/2-6.png', 'video/preview/3.mp4', '在这一集中，我们将进行事业单位招聘面试实战的实际考场，通过实际模拟培训帮助学员适应考场氛围。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (557, 230, '公考面试形势题解析第1集', 'video/link/4.mp4', 'video/image/2-7.png', 'video/preview/4.mp4', '本集课程将分享事业单位招聘面试实战的经验教训和心得体会，帮助学员在考前做好最后的实战准备，取得更好的成绩。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (558, 231, '军队文职面试实操第1集', 'video/link/5.mp4', 'video/image/2-8.png', 'video/preview/5.mp4', '在这一集中，我们将总结事业单位招聘面试实战的方法和技巧，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (559, 232, '事业单位招聘面试攻略第1集', 'video/link/6.mp4', 'video/image/2-9.png', 'video/preview/6.mp4', '本集课程将总结事业单位招聘面试实战的成功经验和心得体会，为学员提供最后的备考建议，取得优异成绩。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (560, 233, '三支一扶招聘政策解读第1集', 'video/link/7.mp4', 'video/image/2-10.png', 'video/preview/7.mp4', '在这一集中，我们将介绍三支一扶招聘考试解析的基本概念和解析方法，帮助学员了解解析的要点。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (561, 234, '公考笔试数学突破第1集', 'video/link/1.mp4', 'video/image/3-1.png', 'video/preview/1.mp4', '本集课程将深入解析三支一扶招聘考试解析的难点和注意事项，提供实例分析和解决方案。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (562, 235, '公考面试模拟演练第1集', 'video/link/2.mp4', 'video/image/3-2.png', 'video/preview/2.mp4', '在这一集中，我们将进行三支一扶招聘考试解析的模拟案例分析，通过实例演示帮助学员理解解析的实际应用场景。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (563, 236, '军队文职招聘政策解读第1集', 'video/link/3.mp4', 'video/image/3-3.png', 'video/preview/3.mp4', '本集课程将分享三支一扶招聘考试解析的成功经验和心得体会，提供学员宝贵的解析经验。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (564, 237, '事业单位招聘模拟面试第1集', 'video/link/4.mp4', 'video/image/3-4.png', 'video/preview/4.mp4', '在这一集中，我们将进行三支一扶招聘考试解析的实际操作演示，通过实际操作帮助学员提高解析水平。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (565, 238, '三支一扶招聘面试攻略第1集', 'video/link/5.mp4', 'video/image/3-5.png', 'video/preview/5.mp4', '本集课程将提供三支一扶招聘考试解析的模拟解析题目，通过实际操作帮助学员熟悉解析环境，提高应试水平。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (566, 239, '公安招警笔试突破第1集', 'video/link/6.mp4', 'video/image/3-6.png', 'video/preview/6.mp4', '在这一集中，我们将进行三支一扶招聘考试解析的实际考场，通过实际模拟培训帮助学员适应考场氛围。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (567, 240, '事业单位招聘笔试突破第1集', 'video/link/7.mp4', 'video/image/3-7.png', 'video/preview/7.mp4', '本集课程将分享三支一扶招聘考试解析的经验教训和心得体会，帮助学员在考前做好最后的解析准备，取得更好的成绩。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (568, 241, '公考面试心理准备第1集', 'video/link/1.mp4', 'video/image/3-8.png', 'video/preview/1.mp4', '在这一集中，我们将总结三支一扶招聘考试解析的方法和技巧，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (569, 242, '军队文职招聘模拟笔试第1集', 'video/link/2.mp4', 'video/image/3-9.png', 'video/preview/2.mp4', '本集课程将总结三支一扶招聘考试解析的成功经验和心得体会，为学员提供最后的备考建议，取得优异成绩。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (570, 243, '三支一扶申论答题技巧第1集', 'video/link/3.mp4', 'video/image/3-10.png', 'video/preview/3.mp4', '在这一集中，我们将介绍公务员笔试模拟考场的基本概念和考场规则，帮助学员了解模拟考场的要点。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (571, 244, '公考笔试数学高分攻略第1集', 'video/link/4.mp4', 'video/image/4-1.png', 'video/preview/4.mp4', '本集课程将深入解析公务员笔试模拟考场的题型和难度，提供实例分析和解决方案。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (572, 245, '军队文职英语口语训练第1集', 'video/link/5.mp4', 'video/image/4-2.png', 'video/preview/5.mp4', '在这一集中，我们将进行公务员笔试模拟考场的模拟案例分析，通过实例演示帮助学员理解模拟考场的实际应用场景。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (573, 246, '事业单位招聘面试实战演练第1集', 'video/link/6.mp4', 'video/image/4-3.png', 'video/preview/6.mp4', '本集课程将分享公务员笔试模拟考场的成功经验和心得体会，提供学员宝贵的模拟考场经验。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (574, 247, '公安招警体能训练指南第1集', 'video/link/7.mp4', 'video/image/4-4.png', 'video/preview/7.mp4', '在这一集中，我们将进行公务员笔试模拟考场的实际操作演示，通过实际操作帮助学员提高模拟考场水平。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (575, 248, '三支一扶面试心理准备第1集', 'video/link/1.mp4', 'video/image/4-5.png', 'video/preview/1.mp4', '本集课程将提供公务员笔试模拟考场的模拟考场题目，通过实际操作帮助学员熟悉模拟考场环境，提高应试水平。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (576, 249, '公考笔试法律知识讲解第1集', 'video/link/2.mp4', 'video/image/4-6.png', 'video/preview/2.mp4', '在这一集中，我们将进行公务员笔试模拟考场的实际考场，通过实际模拟培训帮助学员适应考场氛围。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (577, 250, '军队文职面试技巧分享第1集', 'video/link/3.mp4', 'video/image/4-7.png', 'video/preview/3.mp4', '本集课程将分享公务员笔试模拟考场的经验教训和心得体会，帮助学员在考前做好最后的模拟考场准备，取得更好的成绩。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (578, 251, '事业单位招聘笔试实战指南第1集', 'video/link/4.mp4', 'video/image/4-8.png', 'video/preview/4.mp4', '在这一集中，我们将总结公务员笔试模拟考场的方法和技巧，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (579, 252, '公安招警法律常识全解析第1集', 'video/link/5.mp4', 'video/image/4-9.png', 'video/preview/5.mp4', '本集课程将总结公务员笔试模拟考场的成功经验和心得体会，为学员提供最后的备考建议，取得优异成绩。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (580, 253, '公考面试实战演练第1集', 'video/link/6.mp4', 'video/image/4-10.png', 'video/preview/6.mp4', '在这一集中，我们将介绍军队文职综合素质面试的基本概念和面试流程，帮助学员了解面试的要点。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (581, 254, '军队文职面试案例分析第1集', 'video/link/7.mp4', 'video/image/5-1.png', 'video/preview/7.mp4', '本集课程将深入解析军队文职综合素质面试的各个环节和考察要点，提供实例分析和解决方案。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (582, 255, '事业单位招聘面试技巧第1集', 'video/link/1.mp4', 'video/image/5-2.png', 'video/preview/1.mp4', '在这一集中，我们将进行军队文职综合素质面试的模拟案例分析，通过实例演示帮助学员理解面试的实际应用场景。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (583, 256, '公安招警面试技巧全解析第1集', 'video/link/2.mp4', 'video/image/5-3.png', 'video/preview/2.mp4', '本集课程将分享军队文职综合素质面试的成功经验和心得体会，提供学员宝贵的面试经验。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (584, 257, '三支一扶招聘考察重点第1集', 'video/link/3.mp4', 'video/image/5-4.png', 'video/preview/3.mp4', '在这一集中，我们将进行军队文职综合素质面试的实际操作演示，通过实际操作帮助学员提高面试水平。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (585, 258, '事业单位招聘考试全程指导第1集', 'video/link/4.mp4', 'video/image/5-5.png', 'video/preview/4.mp4', '本集课程将提供军队文职综合素质面试的模拟面试题目，通过实际操作帮助学员熟悉面试环境，提高应试水平。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (586, 259, '公考笔试技巧与模拟第1集', 'video/link/5.mp4', 'video/image/5-6.png', 'video/preview/5.mp4', '在这一集中，我们将进行军队文职综合素质面试的实际面试，通过实际模拟培训帮助学员适应面试氛围。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (587, 260, '三支一扶招聘考试技巧第1集', 'video/link/6.mp4', 'video/image/5-7.png', 'video/preview/6.mp4', '本集课程将分享军队文职综合素质面试的经验教训和心得体会，帮助学员在考前做好最后的面试准备，取得更好的成绩。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (588, 261, '军队文职考试必备知识第1集', 'video/link/7.mp4', 'video/image/5-8.png', 'video/preview/7.mp4', '在这一集中，我们将总结军队文职综合素质面试的方法和技巧，提供备考建议和最后的冲刺指导，助力学员在考前取得更好的成绩。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (589, 262, '公安招警笔试解题技巧第1集', 'video/link/1.mp4', 'video/image/5-9.png', 'video/preview/1.mp4', '本集课程将总结军队文职综合素质面试的成功经验和心得体会，为学员提供最后的备考建议，取得优异成绩。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (590, 263, '事业单位招聘面试技巧第1集', 'video/link/2.mp4', 'video/image/5-10.png', 'video/preview/2.mp4', '在这一集中，我们将介绍公安招警心理测试的基本题型和解题技巧，帮助学员提高在心理测试环节的应试水平。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (591, 264, '公考面试心理准备第1集', 'video/link/3.mp4', 'video/image/6-1.png', 'video/preview/3.mp4', '这一集将继续深入探讨公安招警心理测试的各类题目，通过实例分析和解题练习，学员将更好地应对心理测试的挑战。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (592, 265, '三支一扶招聘面试技巧第1集', 'video/link/4.mp4', 'video/image/6-2.png', 'video/preview/4.mp4', '在这一集中，我们将通过模拟测试，帮助学员在实际环境中练习心理测试，提高在考试中的应对水平。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (593, 266, '军队文职招聘面试实操第1集', 'video/link/5.mp4', 'video/image/6-3.png', 'video/preview/5.mp4', '本集课程将围绕公安招警心理测试的难点展开，为学员提供更深入的解题技巧和应试建议。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (594, 267, '公安招警面试心理辅导第1集', 'video/link/6.mp4', 'video/image/6-4.png', 'video/preview/6.mp4', '在这一集中，我们将通过学员的实际问题案例，进行现场解答和指导，帮助学员解决在心理测试中遇到的困难。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (595, 268, '事业单位招聘笔试全程解析第1集', 'video/link/7.mp4', 'video/image/6-5.png', 'video/preview/7.mp4', '本集课程将通过精选的心理测试题目，进行现场解答和分析，帮助学员更好地理解心理测试的出题思路。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (596, 269, '公考笔试技巧讲解第1集', 'video/link/1.mp4', 'video/image/6-6.png', 'video/preview/1.mp4', '在这一集中，我们将针对学员反馈的问题，进行答疑解惑，确保学员对心理测试的各个方面有清晰的理解。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (597, 270, '三支一扶申论高分策略第1集', 'video/link/2.mp4', 'video/image/6-7.png', 'video/preview/2.mp4', '本集课程将通过模拟考试环节，让学员在真实考试场景中练习心理测试，提高应试水平。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (598, 271, '军队文职招聘考察技巧第1集', 'video/link/3.mp4', 'video/image/6-8.png', 'video/preview/3.mp4', '在这一集中，我们将邀请心理测试领域的专家，为学员答疑解惑，分享心理测试的应试经验和技巧。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (599, 272, '公安招警体能训练指导第1集', 'video/link/4.mp4', 'video/image/6-9.png', 'video/preview/4.mp4', '本集课程将总结心理测试训练的重点，为学员提供备考建议，帮助他们在考试中取得优异成绩。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (600, 273, '公考面试技巧培训第1集', 'video/link/5.mp4', 'video/image/6-10.png', 'video/preview/5.mp4', '本集课程旨在帮助学员熟悉事业单位招聘笔试的常见题型，解析解题技巧，为备战笔试做好准备。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (601, 274, '三支一扶招聘笔试突破第1集', 'video/link/6.mp4', 'video/image/1-1.png', 'video/preview/6.mp4', '在这一集中，我们将深入讲解事业单位招聘笔试的各科目题型，为学员提供全面的笔试技巧培训。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (602, 275, '事业单位面试经验分享第1集', 'video/link/7.mp4', 'video/image/1-2.png', 'video/preview/7.mp4', '在本集课程中，我们将通过实例分析和解题练习，帮助学员更好地掌握事业单位招聘笔试的解题技巧。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (603, 276, '公安招警面试实操指南第1集', 'video/link/1.mp4', 'video/image/1-3.png', 'video/preview/1.mp4', '在这一集中，我们将针对学员反馈的问题，进行答疑解惑，确保学员能够理解和应用笔试技巧。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (604, 277, '军队文职招聘模拟考察第1集', 'video/link/2.mp4', 'video/image/1-4.png', 'video/preview/2.mp4', '本集课程将通过模拟考试，让学员在真实考试环境中练习笔试技巧，提高应试水平。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (605, 278, '事业单位招聘策略解析第1集', 'video/link/3.mp4', 'video/image/1-5.png', 'video/preview/3.mp4', '在这一集中，我们将邀请拥有丰富招聘经验的专业人士，分享笔试技巧的实际应用经验。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (606, 279, '公考笔试全程解析第1集', 'video/link/4.mp4', 'video/image/1-6.png', 'video/preview/4.mp4', '本集课程将通过解析高分学员的答题过程，为学员提供学习笔试技巧的思路和方法。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (607, 280, '三支一扶面试技能提升第1集', 'video/link/5.mp4', 'video/image/1-7.png', 'video/preview/5.mp4', '在这一集中，我们将总结事业单位招聘笔试技巧的重点，为学员提供备考建议，帮助他们在考试中脱颖而出。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (608, 281, '公安招警模拟考察演练第1集', 'video/link/6.mp4', 'video/image/1-8.png', 'video/preview/6.mp4', '本集课程将通过模拟考试，检验学员对笔试技巧的掌握程度，帮助他们在实际考试中更加游刃有余。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (609, 282, '军队文职笔试突破攻略第1集', 'video/link/7.mp4', 'video/image/1-9.png', 'video/preview/7.mp4', '在这一集中，我们将邀请事业单位笔试的考官，为学员揭示笔试评分的要点和标准，帮助他们更好地备考。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (610, 283, '事业单位面试技巧培训第1集', 'video/link/1.mp4', 'video/image/1-10.png', 'video/preview/1.mp4', '在这一集中，我们将为学员提供三支一扶申论范文的经典案例，通过深入解析，帮助学员理解申论写作的要求和技巧。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (611, 284, '三支一扶招聘政策解读第1集', 'video/link/2.mp4', 'video/image/2-1.png', 'video/preview/2.mp4', '本集课程将通过学员的实际问题案例，进行现场解答和指导，帮助学员解决在申论写作中遇到的困难。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (612, 285, '公安招警面试实战演练第1集', 'video/link/3.mp4', 'video/image/2-2.png', 'video/preview/3.mp4', '在这一集中，我们将通过模拟考试，让学员在真实考试环境中练习申论写作，提高应试水平。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (613, 286, '公考面试精华分享第1集', 'video/link/4.mp4', 'video/image/2-3.png', 'video/preview/4.mp4', '本集课程将通过解析高分学员的申论写作过程，为学员提供学习写作技巧的思路和方法。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (614, 287, '公考笔试突破攻略第1集', 'video/link/5.mp4', 'video/image/2-4.png', 'video/preview/5.mp4', '在这一集中，我们将邀请申论领域的专家，为学员答疑解惑，分享申论写作的应试经验和技巧。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (615, 288, '三支一扶岗位知识详解第1集', 'video/link/6.mp4', 'video/image/2-5.png', 'video/preview/6.mp4', '本集课程将通过实例分析和写作练习，帮助学员更好地理解申论写作的出题思路，提高写作水平。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (616, 289, '公考面试心理应对第1集', 'video/link/7.mp4', 'video/image/2-6.png', 'video/preview/7.mp4', '在这一集中，我们将总结申论范文欣赏的重点，为学员提供备考建议，帮助他们在考试中取得优异成绩。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (617, 290, '事业单位面试技巧分享第1集', 'video/link/1.mp4', 'video/image/2-7.png', 'video/preview/1.mp4', '本集课程将通过模拟考试，检验学员对申论写作技巧的掌握程度，帮助他们在实际考试中更加游刃有余。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (618, 291, '公安招警体能训练指导第1集', 'video/link/2.mp4', 'video/image/2-8.png', 'video/preview/2.mp4', '在这一集中，我们将邀请申论考官，为学员揭示申论评分的要点和标准，帮助他们更好地备考。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (619, 292, '三支一扶招聘政策深度解析第1集', 'video/link/3.mp4', 'video/image/2-9.png', 'video/preview/3.mp4', '本集课程将总结申论写作的经典范文，为学员提供最后的备考指导，确保他们在考试中发挥出色。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (620, 293, '公考笔试数学强化训练第1集', 'video/link/4.mp4', 'video/image/2-10.png', 'video/preview/4.mp4', '在这一集中，我们将为学员提供公务员笔试的模拟题目，通过详细解析，帮助学员理解解题思路和技巧。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (621, 294, '公考面试模拟演练第1集', 'video/link/5.mp4', 'video/image/3-1.png', 'video/preview/5.mp4', '本集课程将通过学员的实际问题案例，进行现场解答和指导，帮助学员解决在笔试过程中遇到的困难。', 1, 138, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (622, 295, '军队文职招聘政策解读第1集', 'video/link/6.mp4', 'video/image/3-2.png', 'video/preview/6.mp4', '在这一集中，我们将通过模拟考试，让学员在真实考试环境中练习笔试，提高应试水平。', 1, 162, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (623, 296, '事业单位招聘考点分析第1集', 'video/link/7.mp4', 'video/image/3-3.png', 'video/preview/7.mp4', '本集课程将通过解析高分学员的笔试过程，为学员提供学习解题技巧的思路和方法。', 1, 147, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (624, 297, '三支一扶招聘经验分享第1集', 'video/link/1.mp4', 'video/image/3-4.png', 'video/preview/1.mp4', '在这一集中，我们将邀请笔试领域的专家，为学员答疑解惑，分享笔试应试经验和技巧。', 1, 137, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (625, 298, '公安招警面试技巧培训第1集', 'video/link/2.mp4', 'video/image/3-5.png', 'video/preview/2.mp4', '本集课程将通过实例分析和模拟练习，帮助学员更好地理解笔试解题思路，提高答题效率。', 1, 136, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (626, 299, '公考笔试英语强化训练第1集', 'video/link/3.mp4', 'video/image/3-6.png', 'video/preview/3.mp4', '在这一集中，我们将总结笔试模拟题库的重点，为学员提供备考建议，帮助他们在考试中取得优异成绩。', 1, 166, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (627, 300, '公考面试心理准备第1集', 'video/link/4.mp4', 'video/image/3-7.png', 'video/preview/4.mp4', '本集课程将通过模拟考试，检验学员对笔试解题技巧的掌握程度，帮助他们在实际考试中更加游刃有余。', 1, 123, 0, 0, '2024-03-11 16:45:00');
INSERT INTO `civil_video` VALUES (628, 301, '军队文职面试技能培训第1集', 'video/link/5.mp4', 'video/image/3-8.png', 'video/preview/5.mp4', '在这一集中，我们将邀请笔试考官，为学员揭示笔试评分的要点和标准，帮助他们更好地备考。', 1, 138, 0, 0, '2024-03-11 16:45:00');

-- ----------------------------
-- Table structure for course_collection
-- ----------------------------
DROP TABLE IF EXISTS `course_collection`;
CREATE TABLE `course_collection`  (
  `course_collection_id` bigint NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `course_id` bigint NOT NULL COMMENT '课程ID',
  PRIMARY KEY (`course_collection_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程收藏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_collection
-- ----------------------------
INSERT INTO `course_collection` VALUES (3, 1, 3);
INSERT INTO `course_collection` VALUES (4, 1, 4);
INSERT INTO `course_collection` VALUES (5, 1, 5);
INSERT INTO `course_collection` VALUES (6, 1, 6);
INSERT INTO `course_collection` VALUES (7, 1, 7);
INSERT INTO `course_collection` VALUES (8, 1, 8);
INSERT INTO `course_collection` VALUES (9, 1, 9);
INSERT INTO `course_collection` VALUES (10, 1, 10);
INSERT INTO `course_collection` VALUES (11, 1, 11);
INSERT INTO `course_collection` VALUES (12, 1, 12);
INSERT INTO `course_collection` VALUES (13, 1, 13);
INSERT INTO `course_collection` VALUES (14, 1, 14);
INSERT INTO `course_collection` VALUES (15, 1, 15);
INSERT INTO `course_collection` VALUES (16, 1, 1);

-- ----------------------------
-- Table structure for course_like
-- ----------------------------
DROP TABLE IF EXISTS `course_like`;
CREATE TABLE `course_like`  (
  `course_like_id` bigint NOT NULL AUTO_INCREMENT COMMENT '点赞ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `course_id` bigint NOT NULL COMMENT '课程ID',
  PRIMARY KEY (`course_like_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程点赞表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_like
-- ----------------------------
INSERT INTO `course_like` VALUES (2, 1, 2);
INSERT INTO `course_like` VALUES (3, 1, 3);
INSERT INTO `course_like` VALUES (4, 1, 4);
INSERT INTO `course_like` VALUES (5, 1, 5);
INSERT INTO `course_like` VALUES (6, 1, 6);
INSERT INTO `course_like` VALUES (7, 1, 7);
INSERT INTO `course_like` VALUES (8, 1, 8);
INSERT INTO `course_like` VALUES (9, 1, 9);
INSERT INTO `course_like` VALUES (10, 1, 10);
INSERT INTO `course_like` VALUES (11, 1, 11);
INSERT INTO `course_like` VALUES (12, 1, 12);
INSERT INTO `course_like` VALUES (13, 1, 13);
INSERT INTO `course_like` VALUES (14, 1, 14);
INSERT INTO `course_like` VALUES (15, 1, 15);
INSERT INTO `course_like` VALUES (16, 1, 1);

-- ----------------------------
-- Table structure for exam_time
-- ----------------------------
DROP TABLE IF EXISTS `exam_time`;
CREATE TABLE `exam_time`  (
  `exam_time_id` bigint NOT NULL AUTO_INCREMENT COMMENT '考试时间ID',
  `exam_year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '考试年份',
  `exam_province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '考试省份',
  `exam_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '考试类型(国考、省考)',
  `apply_time` timestamp NOT NULL COMMENT '报名时间',
  `exam_time` timestamp NOT NULL COMMENT '考试时间',
  PRIMARY KEY (`exam_time_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '考试时间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_time
-- ----------------------------
INSERT INTO `exam_time` VALUES (1, '2024', '江苏', '省考', '2023-11-07 15:15:04', '2023-12-10 15:15:24');
INSERT INTO `exam_time` VALUES (2, '2024', '上海', '省考', '2023-11-04 15:15:44', '2023-12-10 15:16:08');
INSERT INTO `exam_time` VALUES (3, '2024', '浙江', '省考', '2023-11-09 15:16:26', '2023-12-10 15:16:32');
INSERT INTO `exam_time` VALUES (4, '2024', '山东', '省考', '2023-11-10 15:16:48', '2023-12-10 15:16:53');
INSERT INTO `exam_time` VALUES (5, '2024', '北京', '省考', '2023-11-13 15:17:17', '2023-12-03 15:17:25');
INSERT INTO `exam_time` VALUES (6, '2024', '四川', '省考', '2023-12-07 15:17:39', '2024-01-06 15:17:46');
INSERT INTO `exam_time` VALUES (7, '2024', '深圳', '省考', '2023-12-06 15:18:02', '2024-01-06 15:18:06');
INSERT INTO `exam_time` VALUES (8, '2024', '福建', '省考', '2024-01-08 15:18:19', '2024-03-16 15:18:49');
INSERT INTO `exam_time` VALUES (9, '2024', '山西', '省考', '2024-01-08 15:18:19', '2024-03-16 15:18:49');
INSERT INTO `exam_time` VALUES (10, '2024', '广西', '省考', '2024-01-08 15:18:19', '2024-03-16 15:18:49');
INSERT INTO `exam_time` VALUES (11, '2024', '辽宁', '省考', '2024-01-16 15:18:19', '2024-03-16 15:18:49');
INSERT INTO `exam_time` VALUES (12, '2024', '广东', '省考', '2024-01-16 15:18:19', '2024-03-16 15:18:49');
INSERT INTO `exam_time` VALUES (13, '2024', '河南', '省考', '2024-01-18 15:18:19', '2024-03-16 15:18:49');
INSERT INTO `exam_time` VALUES (14, '2024', '湖北', '省考', '2024-01-17 15:18:19', '2024-03-16 15:18:49');
INSERT INTO `exam_time` VALUES (15, '2024', '贵州', '省考', '2024-01-22 15:18:19', '2024-03-16 15:18:49');
INSERT INTO `exam_time` VALUES (16, '2024', '海南', '省考', '2024-01-22 15:18:19', '2024-03-16 15:18:49');
INSERT INTO `exam_time` VALUES (17, '2024', '新疆', '省考', '2024-01-22 15:18:19', '2024-03-16 15:18:49');
INSERT INTO `exam_time` VALUES (18, '2024', '天津', '省考', '2024-01-23 15:18:19', '2024-03-16 15:18:49');
INSERT INTO `exam_time` VALUES (19, '2024', '安徽', '省考', '2024-01-29 15:18:19', '2024-03-16 15:18:49');
INSERT INTO `exam_time` VALUES (20, '2024', '江西', '省考', '2024-01-28 15:18:19', '2024-03-16 15:18:49');
INSERT INTO `exam_time` VALUES (21, '2024', '内蒙古', '省考', '2024-01-19 15:18:19', '2024-03-16 15:18:49');
INSERT INTO `exam_time` VALUES (22, '2024', '重庆', '省考', '2024-02-01 15:18:19', '2024-03-16 15:18:49');
INSERT INTO `exam_time` VALUES (23, '2024', '陕西', '省考', '2024-02-01 15:18:19', '2024-03-16 15:18:49');

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log`  (
  `login_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '登录日志ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录名称',
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录IP地址',
  `ip_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录的地区',
  `login_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录者(user、admin)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录的时间',
  PRIMARY KEY (`login_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 258 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '登录日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of login_log
-- ----------------------------
INSERT INTO `login_log` VALUES (224, 'lenzy', '222.76.49.156', '福建省 福州市', '超级管理员', '2024-03-24 17:36:25');
INSERT INTO `login_log` VALUES (225, 'lenzy', '222.76.49.156', '福建省 福州市', '超级管理员', '2024-03-24 19:10:57');
INSERT INTO `login_log` VALUES (226, 'lenzy', '222.76.49.156', '福建省 福州市', '超级管理员', '2024-03-25 11:22:03');
INSERT INTO `login_log` VALUES (227, 'lenzy', '222.76.49.156', '福建省 福州市', '超级管理员', '2024-03-26 11:33:17');
INSERT INTO `login_log` VALUES (228, 'Miss', '222.76.49.156', '福建省 福州市', '讲师', '2024-03-26 12:34:37');
INSERT INTO `login_log` VALUES (229, 'lenzy', '222.76.49.156', '福建省 福州市', '超级管理员', '2024-03-26 12:36:11');
INSERT INTO `login_log` VALUES (230, 'lenzy', '222.76.49.156', '福建省 福州市', '超级管理员', '2024-03-26 14:03:14');
INSERT INTO `login_log` VALUES (231, 'lenzy', '222.76.49.156', '福建省 福州市', '超级管理员', '2024-03-26 15:40:29');
INSERT INTO `login_log` VALUES (232, 'lenzy', '222.76.49.156', '福建省 福州市', '超级管理员', '2024-03-26 18:43:56');
INSERT INTO `login_log` VALUES (233, 'lenzy', '222.76.49.156', '福建省 福州市', '超级管理员', '2024-03-26 20:12:33');
INSERT INTO `login_log` VALUES (234, 'lenzy', '222.76.49.156', '福建省 福州市', '超级管理员', '2024-03-27 12:56:15');
INSERT INTO `login_log` VALUES (235, 'lenzy', '222.76.49.156', '福建省 福州市', '超级管理员', '2024-03-27 15:23:39');
INSERT INTO `login_log` VALUES (236, 'lenzy', '222.76.49.156', '福建省 福州市', '超级管理员', '2024-03-27 16:10:59');
INSERT INTO `login_log` VALUES (237, 'Miss', '222.76.49.156', '福建省 福州市', '讲师', '2024-03-27 18:22:01');
INSERT INTO `login_log` VALUES (238, 'lenzy', '222.76.49.156', '福建省 福州市', '超级管理员', '2024-03-27 18:24:22');
INSERT INTO `login_log` VALUES (239, 'Miss', '27.148.97.75', '福建省 福州市', '讲师', '2024-03-27 20:19:38');
INSERT INTO `login_log` VALUES (240, 'lenzy', '27.148.97.75', '福建省 福州市', '超级管理员', '2024-03-27 20:25:47');
INSERT INTO `login_log` VALUES (241, 'Lensy', '27.148.97.75', '福建省 福州市', '用户', '2024-03-27 20:26:16');
INSERT INTO `login_log` VALUES (242, 'Miss', '27.148.97.75', '福建省 福州市', '讲师', '2024-03-27 20:41:08');
INSERT INTO `login_log` VALUES (243, 'Lensy', '27.148.97.75', '福建省 福州市', '用户', '2024-03-27 20:45:28');
INSERT INTO `login_log` VALUES (244, 'Miss', '27.148.97.75', '福建省 福州市', '讲师', '2024-03-27 21:09:56');
INSERT INTO `login_log` VALUES (245, 'Miss', '36.251.4.66', '福建省 福州市', '讲师', '2024-04-01 16:36:31');
INSERT INTO `login_log` VALUES (246, 'Miss', '27.149.38.142', '福建省 福州市', '讲师', '2024-04-06 13:22:13');
INSERT INTO `login_log` VALUES (247, 'Lensy', '27.149.38.142', '福建省 福州市', '用户', '2024-04-06 13:23:07');
INSERT INTO `login_log` VALUES (248, 'Miss', '27.149.38.142', '福建省 福州市', '讲师', '2024-04-06 14:29:51');
INSERT INTO `login_log` VALUES (249, 'lenzy', '27.149.38.142', '福建省 福州市', '超级管理员', '2024-04-06 14:42:17');
INSERT INTO `login_log` VALUES (250, 'lenzy', '27.149.38.142', '福建省 福州市', '超级管理员', '2024-04-06 14:42:34');
INSERT INTO `login_log` VALUES (251, 'lenzy', '36.251.5.217', '福建省 福州市', '超级管理员', '2024-04-06 15:11:30');
INSERT INTO `login_log` VALUES (252, 'Lensy', '36.251.5.217', '福建省 福州市', '用户', '2024-04-06 15:25:08');
INSERT INTO `login_log` VALUES (253, 'lenzy', '36.251.5.217', '福建省 福州市', '超级管理员', '2024-04-06 15:28:12');
INSERT INTO `login_log` VALUES (254, 'lenzy', '36.251.5.217', '福建省 福州市', '超级管理员', '2024-04-15 17:26:24');
INSERT INTO `login_log` VALUES (255, 'admin11', '36.251.5.217', '福建省 福州市', '普通管理员', '2024-04-15 17:27:11');
INSERT INTO `login_log` VALUES (256, 'admin11', '36.251.5.217', '福建省 福州市', '普通管理员', '2024-04-15 17:35:50');
INSERT INTO `login_log` VALUES (257, 'lenzy', '36.251.5.217', '福建省 福州市', '超级管理员', '2024-04-15 17:49:08');
INSERT INTO `login_log` VALUES (258, 'lenzy', '36.251.5.217', '福建省 福州市', '超级管理员', '2024-04-15 18:31:22');

-- ----------------------------
-- Table structure for medal_authority
-- ----------------------------
DROP TABLE IF EXISTS `medal_authority`;
CREATE TABLE `medal_authority`  (
  `medal_id` bigint NOT NULL AUTO_INCREMENT COMMENT '勋章ID',
  `medal_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '勋章名称',
  `medal_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '勋章图标',
  `medal_level` int NOT NULL DEFAULT 0 COMMENT '勋章级别',
  `medal_explain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '勋章说明',
  `total_hold_number` bigint NOT NULL DEFAULT 0 COMMENT '总持有人数',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建者',
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '更新者',
  `view_video_number` int NULL DEFAULT NULL COMMENT '免费次数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除(0:正常、1:删除--有持有人数不能删除)',
  PRIMARY KEY (`medal_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '勋章权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medal_authority
-- ----------------------------
INSERT INTO `medal_authority` VALUES (1, '创作新秀', 'medal/write-start.png', 100, '首次发布文章', 1, 'lenzy', 'Miss_Lenzy', 1, '2023-12-13 07:37:36', '2024-03-27 21:15:43', 0);
INSERT INTO `medal_authority` VALUES (2, '持之以恒', 'medal/lasting-start.png', 100, '发布10篇文章以上', 1, 'lenzy', 'lenzy', 5, '2023-12-13 07:38:59', '2024-03-27 21:15:45', 0);
INSERT INTO `medal_authority` VALUES (3, '持之以恒', 'medal/lasting-end.png', 200, '发布20篇文章以上', 0, 'lenzy', 'lenzy', 10, '2023-12-13 07:42:46', '2024-03-27 21:15:46', 0);
INSERT INTO `medal_authority` VALUES (4, '博学多才', 'medal/study-start.png', 100, '发布5篇文章以上，被平台精选3次以上', 0, 'lenzy', 'lenzy', 5, '2023-12-13 07:43:24', '2024-03-27 21:15:46', 0);
INSERT INTO `medal_authority` VALUES (5, '博学多才', 'medal/study-end.png', 200, '发布10篇文章以上，被平台精选6次以上', 0, 'lenzy', 'lenzy', 10, '2023-12-13 07:43:37', '2024-03-27 21:15:47', 0);
INSERT INTO `medal_authority` VALUES (6, '建言献策', 'medal/chat-end.png', 200, '提交10条以上的建设性意见，被采纳6条以上', 0, 'lenzy', 'lenzy', 10, '2023-12-13 07:43:59', '2024-03-27 21:15:48', 0);

-- ----------------------------
-- Table structure for menu_authority
-- ----------------------------
DROP TABLE IF EXISTS `menu_authority`;
CREATE TABLE `menu_authority`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_parent_id` bigint NOT NULL COMMENT '父菜单ID',
  `menu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `show_sort` int NOT NULL DEFAULT 0 COMMENT '显示顺序',
  `router_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '路由路径',
  `menu_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建者',
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '更新者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除(0:正常、1:删除)',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 227 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu_authority
-- ----------------------------
INSERT INTO `menu_authority` VALUES (1, 0, '首页', 1, '/home', 'House', 'lenzy', 'lenzy', '2024-03-10 16:15:57', '2024-03-10 17:44:45', 0);
INSERT INTO `menu_authority` VALUES (2, 0, '人员管理', 2, '', 'User', 'lenzy', 'lenzy', '2023-12-18 05:52:32', '2024-03-10 17:45:00', 0);
INSERT INTO `menu_authority` VALUES (3, 0, '文章管理', 3, '', 'Document', 'lenzy', 'lenzy', '2023-12-18 05:53:09', '2024-03-10 17:45:01', 0);
INSERT INTO `menu_authority` VALUES (4, 0, '课程管理', 4, '', 'Folder', 'lenzy', 'lenzy', '2023-12-18 05:54:07', '2024-03-10 17:45:02', 0);
INSERT INTO `menu_authority` VALUES (5, 0, '权限管理', 5, '', 'Setting', 'lenzy', 'lenzy', '2023-12-18 05:55:18', '2024-03-26 14:05:14', 0);
INSERT INTO `menu_authority` VALUES (6, 0, '订单管理', 6, '/order', 'ShoppingTrolley', 'lenzy', 'lenzy', '2023-12-18 05:57:03', '2024-03-26 14:05:14', 0);
INSERT INTO `menu_authority` VALUES (7, 0, '通知管理', 7, '/message', 'ChatDotSquare', 'lenzy', 'lenzy', '2023-12-18 05:58:17', '2024-03-26 14:05:14', 0);
INSERT INTO `menu_authority` VALUES (8, 0, '反馈管理', 8, '/feedback', 'Message', 'lenzy', 'lenzy', '2023-12-18 06:03:47', '2024-03-10 17:45:30', 0);
INSERT INTO `menu_authority` VALUES (9, 0, '资讯管理', 9, '/technical', 'Memo', 'lenzy', 'lenzy', '2024-03-14 11:43:30', '2024-03-14 11:49:45', 0);
INSERT INTO `menu_authority` VALUES (10, 0, '在线客服', 10, '/onlineCustom', 'ChatLineRound', 'lenzy', 'lenzy', '2023-12-18 06:04:28', '2024-03-14 11:49:46', 0);
INSERT INTO `menu_authority` VALUES (11, 0, '轮播图管理', 11, '/carousel', 'PictureRounded', 'lenzy', 'lenzy', '2024-03-14 11:44:44', '2024-03-14 11:49:51', 0);
INSERT INTO `menu_authority` VALUES (12, 0, '考试时间管理', 0, '/exam', 'Timer', 'lenzy', 'lenzy', '2024-03-14 19:13:21', '2024-03-14 19:13:21', 0);
INSERT INTO `menu_authority` VALUES (13, 2, '用户管理', 1, '/person/user', 'User', 'lenzy', 'lenzy', '2023-12-18 06:05:25', '2024-03-14 11:49:20', 0);
INSERT INTO `menu_authority` VALUES (14, 2, '讲师管理', 2, '/person/teacher', 'User', 'lenzy', 'lenzy', '2023-12-18 06:05:25', '2024-03-14 11:49:21', 0);
INSERT INTO `menu_authority` VALUES (15, 2, '管理员管理', 3, '/person/admin', 'User', 'lenzy', 'lenzy', '2023-12-18 06:13:17', '2024-03-14 11:49:21', 0);
INSERT INTO `menu_authority` VALUES (16, 2, '讲师审批管理', 4, '/person/teacherApply', 'User', 'lenzy', 'lenzy', '2023-12-18 06:13:17', '2024-03-14 11:49:22', 0);
INSERT INTO `menu_authority` VALUES (17, 2, '登录日志管理', 5, '/person/loginLog', 'SetUp', 'lenzy', 'lenzy', '2023-12-18 06:14:47', '2024-03-14 11:49:23', 0);
INSERT INTO `menu_authority` VALUES (18, 3, '所有文章管理', 1, '/article/all', 'Document', 'lenzy', 'lenzy', '2023-12-18 06:15:54', '2024-03-14 11:49:24', 0);
INSERT INTO `menu_authority` VALUES (19, 3, '文章审批管理', 2, '/article/apply', 'Document', 'lenzy', 'lenzy', '2023-12-18 06:19:15', '2024-03-14 11:49:24', 0);
INSERT INTO `menu_authority` VALUES (20, 4, '所有课程管理', 1, '/course/all', 'Folder', 'lenzy', 'lenzy', '2023-12-18 06:20:20', '2024-03-14 11:49:25', 0);
INSERT INTO `menu_authority` VALUES (21, 4, '课程审核管理', 2, '/course/apply', 'Folder', 'lenzy', 'lenzy', '2023-12-18 06:21:03', '2024-03-14 11:49:25', 0);
INSERT INTO `menu_authority` VALUES (22, 5, '分类权限管理', 1, '/authority/zone', 'Setting', 'lenzy', 'lenzy', '2023-12-18 06:25:58', '2024-03-14 11:49:26', 0);
INSERT INTO `menu_authority` VALUES (23, 5, '菜单权限管理', 2, '/authority/menu', 'Setting', 'lenzy', 'lenzy', '2023-12-18 06:49:30', '2024-03-14 11:49:27', 0);
INSERT INTO `menu_authority` VALUES (24, 5, '角色权限管理', 3, '/authority/role', 'Setting', 'lenzy', 'lenzy', '2023-12-18 07:06:34', '2024-03-14 11:49:28', 0);
INSERT INTO `menu_authority` VALUES (25, 5, '勋章权限管理', 4, '/authority/medal', 'Setting', 'lenzy', 'lenzy', '2023-12-19 07:00:13', '2024-03-26 14:12:13', 0);

-- ----------------------------
-- Table structure for notice_user
-- ----------------------------
DROP TABLE IF EXISTS `notice_user`;
CREATE TABLE `notice_user`  (
  `notice_user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户通知ID',
  `notice_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '通知标题',
  `notice_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '通知类型(‘系统通知’、‘邮箱通知’)',
  `notice_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '通知内容',
  `sender_id` bigint NOT NULL COMMENT '通知者ID',
  `sender_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '通知者姓名',
  `sender_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '通知者头像',
  `accept_id` bigint NOT NULL COMMENT '接收者ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  `state` tinyint NOT NULL DEFAULT 0 COMMENT '状态(0:未读、1:已读)',
  PRIMARY KEY (`notice_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户通知表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice_user
-- ----------------------------
INSERT INTO `notice_user` VALUES (1, '公途新年活动', '系统通知', '迎接新年，公途特别推出限时活动！参与即有机会赢取丰厚学习奖励，助你在新的一年迈向更高峰！详情请查看平台首页。', 1, 'lenzy', 'avatar/1.jpeg', 1, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (2, '学霸挑战赛来袭', '系统通知', '参与公途学霸挑战赛，展示你的学科才华！高分者将获得特别奖励，快来挑战自己，赢取荣誉和奖品吧！', 1, 'lenzy', 'avatar/1.jpeg', 1, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (3, '邀请好友赢大奖', '系统通知', '与好友一起学习更有趣！邀请好友加入公途，您和好友都将获得额外奖励。赶快邀请更多小伙伴一同加入吧！', 1, 'lenzy', 'avatar/1.jpeg', 1, '2024-02-01 13:30:57', 1);
INSERT INTO `notice_user` VALUES (4, '公途直播系列', '系统通知', '专业导师在线授课，解疑答惑！参与直播互动，有机会获得导师的签名书籍，提升学习效果，不容错过！', 1, 'lenzy', 'avatar/1.jpeg', 1, '2024-02-01 13:30:57', 1);
INSERT INTO `notice_user` VALUES (5, '全球学霸分享会', '系统通知', '公途汇聚全球学霸，分享学习心得与经验！参与分享会，结交志同道合的学友，共同进步，一起加入这场学霸盛宴！', 1, 'lenzy', 'avatar/1.jpeg', 1, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (6, '荣誉榜单揭晓', '系统通知', '公途学霸榜单出炉！看看自己在学习中的排名，与优秀的学友们一较高下。前三名更有特别奖励等着你哦！', 1, 'lenzy', 'avatar/1.jpeg', 1, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (7, '新课程上线', '系统通知', '公途精心推出新课程，涵盖更多热门考试科目。快来体验全新学习内容，提升自己的考试水平，迎接更多挑战！', 1, 'lenzy', 'avatar/1.jpeg', 1, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (8, '志愿者招募', '系统通知', '公途志愿者计划启动！热爱分享，乐于助人的小伙伴快来加入我们，一起为平台打造更好的学习氛围。', 1, 'lenzy', 'avatar/1.jpeg', 1, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (9, '每日签到送好礼', '系统通知', '每日签到，即可获得丰富好礼！连续签到更有额外惊喜，不仅是学习的动力，更是每天的惊喜之旅。快来签到领奖吧！', 1, 'lenzy', 'avatar/1.jpeg', 1, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (10, '实习就业讲座', '系统通知', '公途携手企业，举办实习就业讲座！了解最新职业动态，聆听成功经验，为未来职场做好准备。详情请查看平台公告。', 1, 'lenzy', 'avatar/1.jpeg', 1, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (11, '公途新年活动', '系统通知', '迎接新年，公途特别推出限时活动！参与即有机会赢取丰厚学习奖励，助你在新的一年迈向更高峰！详情请查看平台首页。', 1, 'lenzy', 'avatar/1.jpeg', 2, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (12, '公途新年活动', '系统通知', '迎接新年，公途特别推出限时活动！参与即有机会赢取丰厚学习奖励，助你在新的一年迈向更高峰！详情请查看平台首页。', 1, 'lenzy', 'avatar/1.jpeg', 3, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (13, '公途新年活动', '系统通知', '迎接新年，公途特别推出限时活动！参与即有机会赢取丰厚学习奖励，助你在新的一年迈向更高峰！详情请查看平台首页。', 1, 'lenzy', 'avatar/1.jpeg', 4, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (14, '公途新年活动', '系统通知', '迎接新年，公途特别推出限时活动！参与即有机会赢取丰厚学习奖励，助你在新的一年迈向更高峰！详情请查看平台首页。', 1, 'lenzy', 'avatar/1.jpeg', 5, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (15, '公途新年活动', '系统通知', '迎接新年，公途特别推出限时活动！参与即有机会赢取丰厚学习奖励，助你在新的一年迈向更高峰！详情请查看平台首页。', 1, 'lenzy', 'avatar/1.jpeg', 6, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (16, '公途新年活动', '系统通知', '迎接新年，公途特别推出限时活动！参与即有机会赢取丰厚学习奖励，助你在新的一年迈向更高峰！详情请查看平台首页。', 1, 'lenzy', 'avatar/1.jpeg', 7, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (17, '公途新年活动', '系统通知', '迎接新年，公途特别推出限时活动！参与即有机会赢取丰厚学习奖励，助你在新的一年迈向更高峰！详情请查看平台首页。', 1, 'lenzy', 'avatar/1.jpeg', 8, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (18, '公途新年活动', '系统通知', '迎接新年，公途特别推出限时活动！参与即有机会赢取丰厚学习奖励，助你在新的一年迈向更高峰！详情请查看平台首页。', 1, 'lenzy', 'avatar/1.jpeg', 9, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (19, '公途新年活动', '系统通知', '迎接新年，公途特别推出限时活动！参与即有机会赢取丰厚学习奖励，助你在新的一年迈向更高峰！详情请查看平台首页。', 1, 'lenzy', 'avatar/1.jpeg', 10, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (20, '公途新年活动', '系统通知', '迎接新年，公途特别推出限时活动！参与即有机会赢取丰厚学习奖励，助你在新的一年迈向更高峰！详情请查看平台首页。', 1, 'lenzy', 'avatar/1.jpeg', 11, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (21, '公途新年活动', '系统通知', '迎接新年，公途特别推出限时活动！参与即有机会赢取丰厚学习奖励，助你在新的一年迈向更高峰！详情请查看平台首页。', 1, 'lenzy', 'avatar/1.jpeg', 12, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (22, '公途新年活动', '系统通知', '迎接新年，公途特别推出限时活动！参与即有机会赢取丰厚学习奖励，助你在新的一年迈向更高峰！详情请查看平台首页。', 1, 'lenzy', 'avatar/1.jpeg', 13, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (23, '公途新年活动', '系统通知', '迎接新年，公途特别推出限时活动！参与即有机会赢取丰厚学习奖励，助你在新的一年迈向更高峰！详情请查看平台首页。', 1, 'lenzy', 'avatar/1.jpeg', 14, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (24, '公途新年活动', '系统通知', '迎接新年，公途特别推出限时活动！参与即有机会赢取丰厚学习奖励，助你在新的一年迈向更高峰！详情请查看平台首页。', 1, 'lenzy', 'avatar/1.jpeg', 15, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (25, '公途新年活动', '系统通知', '迎接新年，公途特别推出限时活动！参与即有机会赢取丰厚学习奖励，助你在新的一年迈向更高峰！详情请查看平台首页。', 1, 'lenzy', 'avatar/1.jpeg', 16, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (26, '公途新年活动', '系统通知', '迎接新年，公途特别推出限时活动！参与即有机会赢取丰厚学习奖励，助你在新的一年迈向更高峰！详情请查看平台首页。', 1, 'lenzy', 'avatar/1.jpeg', 17, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (27, '公途新年活动', '系统通知', '迎接新年，公途特别推出限时活动！参与即有机会赢取丰厚学习奖励，助你在新的一年迈向更高峰！详情请查看平台首页。', 1, 'lenzy', 'avatar/1.jpeg', 18, '2024-02-01 13:30:57', 0);
INSERT INTO `notice_user` VALUES (28, '公途新年活动', '系统通知', '迎接新年，公途特别推出限时活动！参与即有机会赢取丰厚学习奖励，助你在新的一年迈向更高峰！详情请查看平台首页。', 1, 'lenzy', 'avatar/1.jpeg', 19, '2024-02-01 13:30:57', 0);

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `role_menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色菜单ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建者',
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '更新者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除(0:正常、1:删除)',
  PRIMARY KEY (`role_menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (1, 1, 1, 'lenzy', 'lenzy', '2023-12-18 06:30:20', '2023-12-18 06:30:20', 0);
INSERT INTO `role_menu` VALUES (2, 1, 2, 'lenzy', 'lenzy', '2023-12-18 06:30:29', '2023-12-18 06:31:28', 0);
INSERT INTO `role_menu` VALUES (3, 1, 3, 'lenzy', 'lenzy', '2023-12-18 06:30:33', '2023-12-18 06:31:29', 0);
INSERT INTO `role_menu` VALUES (4, 1, 4, 'lenzy', 'lenzy', '2023-12-18 06:30:38', '2023-12-18 06:31:30', 0);
INSERT INTO `role_menu` VALUES (5, 1, 5, 'lenzy', 'lenzy', '2023-12-18 06:30:41', '2023-12-18 06:31:31', 0);
INSERT INTO `role_menu` VALUES (6, 1, 6, 'lenzy', 'lenzy', '2023-12-18 06:30:44', '2023-12-18 06:31:31', 0);
INSERT INTO `role_menu` VALUES (7, 1, 7, 'lenzy', 'lenzy', '2023-12-18 06:30:47', '2023-12-18 06:31:32', 0);
INSERT INTO `role_menu` VALUES (8, 1, 8, 'lenzy', 'lenzy', '2023-12-18 06:30:50', '2024-03-10 16:45:09', 0);
INSERT INTO `role_menu` VALUES (9, 1, 9, 'lenzy', 'lenzy', '2023-12-18 06:30:54', '2024-03-10 16:45:10', 0);
INSERT INTO `role_menu` VALUES (10, 1, 10, 'lenzy', 'lenzy', '2023-12-18 06:30:56', '2024-03-10 16:45:11', 0);
INSERT INTO `role_menu` VALUES (11, 1, 11, 'lenzy', 'lenzy', '2023-12-18 06:30:59', '2024-03-10 16:45:11', 0);
INSERT INTO `role_menu` VALUES (12, 1, 12, 'lenzy', 'lenzy', '2023-12-18 06:31:02', '2024-03-10 16:45:12', 0);
INSERT INTO `role_menu` VALUES (13, 1, 13, 'lenzy', 'lenzy', '2023-12-18 06:31:05', '2024-03-10 16:45:12', 0);
INSERT INTO `role_menu` VALUES (14, 1, 14, 'lenzy', 'lenzy', '2023-12-18 06:31:08', '2024-03-10 16:45:13', 0);
INSERT INTO `role_menu` VALUES (15, 1, 15, 'lenzy', 'lenzy', '2023-12-18 06:31:11', '2024-03-10 16:45:13', 0);
INSERT INTO `role_menu` VALUES (16, 1, 16, 'lenzy', 'lenzy', '2023-12-18 06:31:13', '2024-03-10 16:45:14', 0);
INSERT INTO `role_menu` VALUES (17, 1, 17, 'lenzy', 'lenzy', '2023-12-18 06:31:16', '2024-03-10 16:45:15', 0);
INSERT INTO `role_menu` VALUES (18, 1, 18, 'lenzy', 'lenzy', '2023-12-18 06:31:19', '2024-03-10 16:45:15', 0);
INSERT INTO `role_menu` VALUES (19, 1, 19, 'lenzy', 'lenzy', '2023-12-18 06:31:22', '2024-03-10 16:45:16', 0);
INSERT INTO `role_menu` VALUES (20, 1, 20, 'lenzy', 'lenzy', '2023-12-18 06:43:57', '2024-03-10 16:45:17', 0);
INSERT INTO `role_menu` VALUES (21, 1, 21, 'lenzy', 'lenzy', '2023-12-18 07:07:54', '2024-03-10 16:45:29', 0);
INSERT INTO `role_menu` VALUES (22, 1, 22, 'lenzy', 'lenzy', '2023-12-18 07:07:57', '2024-03-10 16:45:29', 0);
INSERT INTO `role_menu` VALUES (24, 1, 23, 'lenzy', 'lenzy', '2023-12-19 07:01:34', '2024-03-14 11:50:42', 0);
INSERT INTO `role_menu` VALUES (25, 1, 24, 'lenzy', 'lenzy', '2023-12-19 07:01:34', '2024-03-14 11:50:44', 0);
INSERT INTO `role_menu` VALUES (26, 1, 25, 'lenzy', 'lenzy', '2023-12-19 07:01:34', '2024-03-14 19:14:28', 0);
INSERT INTO `role_menu` VALUES (27, 2, 7, 'lenzy', 'lenzy', '2023-12-19 07:01:34', '2024-03-14 19:14:37', 0);
INSERT INTO `role_menu` VALUES (28, 2, 8, 'lenzy', 'lenzy', '2023-12-19 07:01:34', '2024-03-14 19:14:38', 0);
INSERT INTO `role_menu` VALUES (29, 2, 9, 'lenzy', 'lenzy', '2023-12-19 07:01:34', '2024-03-14 19:14:38', 0);
INSERT INTO `role_menu` VALUES (30, 2, 10, 'lenzy', 'lenzy', '2023-12-19 07:01:34', '2024-03-14 19:14:40', 0);
INSERT INTO `role_menu` VALUES (31, 2, 11, 'lenzy', 'lenzy', '2023-12-19 07:01:34', '2024-03-14 19:14:48', 0);
INSERT INTO `role_menu` VALUES (32, 2, 12, 'lenzy', 'lenzy', '2023-12-19 07:01:34', '2024-03-14 19:14:49', 0);

-- ----------------------------
-- Table structure for teacher_audit
-- ----------------------------
DROP TABLE IF EXISTS `teacher_audit`;
CREATE TABLE `teacher_audit`  (
  `teacher_audit_id` bigint NOT NULL AUTO_INCREMENT COMMENT '讲师审核ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `certificate_photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '教资证书照片',
  `certificate_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '教资证书编号',
  `teacher_introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '讲师个人简介',
  `audit_failure_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核失败原因',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '审核状态(0:待审核、1:审核成功、2:审核失败)',
  PRIMARY KEY (`teacher_audit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '讲师审核表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teacher_audit
-- ----------------------------
INSERT INTO `teacher_audit` VALUES (1, 1, 'certificate/teacher/username: Lensy/1.jpg', 'JZ73928012345', '致力于培养优秀公务员考试指导老师，注重生动有趣的教学风格。课堂氛围轻松融洽，广受学员好评。教学重点突出，总结拓展得当，讲解通俗易懂。擅长引导学生自主思考，制定个性化教学计划，助力学员成功上岸。', NULL, 1);
INSERT INTO `teacher_audit` VALUES (2, 2, 'certificate/teacher/username: Lensy/1.jpg', 'JZ28501023456', '热衷于公务员考试指导，注重生动有趣的授课方式。课堂氛围轻松愉快，备受学员喜爱。重点突出，总结拓展得当，讲解通俗易懂。擅长引导学生自主思考，量身定制个性化教学计划，助力学员成功闯关。', NULL, 1);
INSERT INTO `teacher_audit` VALUES (3, 3, 'certificate/teacher/username: Lensy/1.jpg', 'JZ61479034567', '教学经验丰富的公务员考试指导老师，注重生动有趣的授课方式。课堂氛围轻松活泼，备受学员欢迎。重点突出，总结拓展得当，讲解通俗易懂。善于引导学生自主思考，制定个性化教学计划，助力学员成功攀登考试高峰。', NULL, 1);
INSERT INTO `teacher_audit` VALUES (4, 4, 'certificate/teacher/username: Lensy/1.jpg', 'JZ90236045678', '擅长公务员考试指导的老师，以生动有趣的教学风格著称。课堂氛围轻松愉悦，学员好评如潮。注重教学重点，总结拓展得当，讲解通俗易懂。引导学生独立思考，制定个性化教学计划，帮助学员成功登陆公务员岗位。', NULL, 1);
INSERT INTO `teacher_audit` VALUES (5, 5, 'certificate/teacher/username: Lensy/1.jpg', 'JZ14785056789', '公务员考试领域经验丰富的指导老师，教学风格生动有趣。轻松融洽的课堂氛围备受学员推崇。注重教学重点，总结拓展得当，讲解通俗易懂。擅长引导学生独立思考，制定个性化教学计划，为学员成功上岸提供坚实保障。', NULL, 1);
INSERT INTO `teacher_audit` VALUES (6, 6, 'certificate/teacher/username: Lensy/1.jpg', 'JZ69814067890', '深耕公务员考试领域的资深指导老师，以生动有趣的教学方式著称。课堂气氛轻松活泼，学员评价极高。教学重点明确，总结拓展得当，讲解通俗易懂。善于激发学生思维，制定个性化教学计划，助力学员轻松应对考试挑战。', NULL, 1);
INSERT INTO `teacher_audit` VALUES (7, 7, 'certificate/teacher/username: Lensy/1.jpg', 'JZ50123078901', '资深公务员考试指导专家，注重生动有趣的教学方式。轻松融洽的课堂氛围备受学员喜爱。教学重点突出，总结拓展得当，讲解通俗易懂。擅长引导学生独立思考，制定个性化教学计划，为学员成功上岸提供坚实支持。', NULL, 1);
INSERT INTO `teacher_audit` VALUES (8, 8, 'certificate/teacher/username: Lensy/1.jpg', 'JZ31894089012', '专业公务员考试辅导老师，以幽默风趣的教学风格深受学员欢迎。课堂氛围轻松愉快，学员评价极高。注重教学要点，总结拓展得当，讲解通俗易懂。善于引导学生自主思考，制定个性化教学计划，帮助学员轻松实现上岸梦想。', NULL, 1);
INSERT INTO `teacher_audit` VALUES (9, 9, 'certificate/teacher/username: Lensy/1.jpg', 'JZ46280090123', '公务员考试领域资深导师，以生动有趣的授课方式著称。轻松愉悦的课堂氛围，备受学员推崇。教学重点明确，总结拓展得当，讲解通俗易懂。擅长引导学生独立思考，制定个性化教学计划，为学员成功攀登考试高峰提供全方位支持。', '不合规', 2);
INSERT INTO `teacher_audit` VALUES (10, 10, 'certificate/teacher/username: Lensy/1.jpg', 'JZ57960101234', '公务员考试指导专业人士，以独特的教学风格深受学员喜爱。课堂气氛轻松愉快，学员评价极好。注重教学要点，总结拓展得当，讲解通俗易懂。善于引导学生自主思考，制定个性化教学计划，助力学员轻松备战考试。', NULL, 0);

-- ----------------------------
-- Table structure for user_medal
-- ----------------------------
DROP TABLE IF EXISTS `user_medal`;
CREATE TABLE `user_medal`  (
  `user_medal_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户勋章ID',
  `user_id` bigint NOT NULL COMMENT '用户ID(用户只能拥有一个勋章、按级别)',
  `medal_id` bigint NOT NULL COMMENT '勋章ID',
  `refresh_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '刷新时间(首次即为获取勋章的时间,刷新时的时间,每24小时重新刷新)',
  PRIMARY KEY (`user_medal_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户勋章关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_medal
-- ----------------------------
INSERT INTO `user_medal` VALUES (1, 1, 1, '2024-03-27 20:32:59');
INSERT INTO `user_medal` VALUES (2, 1, 2, '2024-03-27 20:32:59');
INSERT INTO `user_medal` VALUES (3, 1, 3, '2024-03-27 20:32:59');
INSERT INTO `user_medal` VALUES (4, 1, 4, '2024-03-27 20:32:59');
INSERT INTO `user_medal` VALUES (5, 1, 5, '2024-03-27 20:32:59');
INSERT INTO `user_medal` VALUES (23, 19, 1, '2024-03-27 20:32:59');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户角色ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 3);
INSERT INTO `user_role` VALUES (2, 2, 3);
INSERT INTO `user_role` VALUES (3, 3, 3);
INSERT INTO `user_role` VALUES (4, 4, 3);
INSERT INTO `user_role` VALUES (5, 5, 3);
INSERT INTO `user_role` VALUES (6, 6, 3);
INSERT INTO `user_role` VALUES (7, 7, 3);
INSERT INTO `user_role` VALUES (8, 8, 3);
INSERT INTO `user_role` VALUES (9, 9, 4);
INSERT INTO `user_role` VALUES (10, 10, 4);
INSERT INTO `user_role` VALUES (11, 11, 4);
INSERT INTO `user_role` VALUES (12, 12, 4);
INSERT INTO `user_role` VALUES (13, 13, 4);
INSERT INTO `user_role` VALUES (14, 14, 4);
INSERT INTO `user_role` VALUES (15, 15, 4);
INSERT INTO `user_role` VALUES (16, 16, 4);
INSERT INTO `user_role` VALUES (17, 17, 4);
INSERT INTO `user_role` VALUES (18, 18, 4);
INSERT INTO `user_role` VALUES (19, 19, 4);

-- ----------------------------
-- Table structure for video_comments
-- ----------------------------
DROP TABLE IF EXISTS `video_comments`;
CREATE TABLE `video_comments`  (
  `video_comment_id` bigint NOT NULL AUTO_INCREMENT COMMENT '视频评论ID',
  `video_id` bigint NOT NULL COMMENT '视频ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `commenter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论者',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `commenter_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论者头像',
  `comment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论日期',
  PRIMARY KEY (`video_comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of video_comments
-- ----------------------------
INSERT INTO `video_comments` VALUES (1, 11, 1, '王罗源', '这是一个评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试评论测试', 'avatar/1.png', '2024-03-04 21:31:46');
INSERT INTO `video_comments` VALUES (3, 2, 1, '王罗源', 'aaa', 'avatar/1.png', '2024-03-12 20:56:40');
INSERT INTO `video_comments` VALUES (4, 2, 1, '王罗源', 'aaa', 'avatar/1.png', '2024-03-26 12:34:48');

-- ----------------------------
-- Table structure for video_like
-- ----------------------------
DROP TABLE IF EXISTS `video_like`;
CREATE TABLE `video_like`  (
  `video_like_id` bigint NOT NULL AUTO_INCREMENT COMMENT '视频点赞ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `video_id` bigint NOT NULL COMMENT '视频ID',
  PRIMARY KEY (`video_like_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频点赞表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of video_like
-- ----------------------------
INSERT INTO `video_like` VALUES (3, 1, 1);

-- ----------------------------
-- Table structure for video_schedule
-- ----------------------------
DROP TABLE IF EXISTS `video_schedule`;
CREATE TABLE `video_schedule`  (
  `video_schedule_id` bigint NOT NULL AUTO_INCREMENT COMMENT '视频进度ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `video_id` bigint NOT NULL COMMENT '视频ID',
  `course_id` bigint NOT NULL COMMENT '课程ID',
  `video_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频名称',
  `video_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频封面',
  `watch_duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '观看时长',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`video_schedule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频进度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of video_schedule
-- ----------------------------
INSERT INTO `video_schedule` VALUES (1, 1, 1, 1, '公务员笔试基础课程第1集', 'video/image/1-1.png', '0', '2024-02-19 16:29:15', '2024-03-06 18:55:41');
INSERT INTO `video_schedule` VALUES (2, 1, 2, 1, '公务员笔试基础课程第2集', 'video/image/1-2.png', '4', '2024-02-19 16:29:22', '2024-03-12 20:56:33');
INSERT INTO `video_schedule` VALUES (3, 1, 3, 1, '公务员笔试基础课程第3集', 'video/image/1-3.png', '0', '2024-02-19 16:29:25', '2024-03-05 22:47:38');
INSERT INTO `video_schedule` VALUES (4, 1, 4, 1, '公务员笔试基础课程第4集', 'video/image/1-4.png', '120', '2024-02-19 16:29:29', '2024-03-05 20:17:48');
INSERT INTO `video_schedule` VALUES (5, 1, 5, 1, '公务员笔试基础课程第5集', 'video/image/1-5.png', '120', '2024-02-19 16:29:42', '2024-03-05 20:17:48');
INSERT INTO `video_schedule` VALUES (6, 1, 11, 2, '公务员面试实战训练第1集', 'video/image/2-1.png', '121', '2024-02-19 16:29:45', '2024-03-27 20:20:26');
INSERT INTO `video_schedule` VALUES (7, 1, 12, 2, '公务员面试实战训练第2集', 'video/image/2-2.png', '120', '2024-02-19 16:29:49', '2024-03-05 20:17:48');
INSERT INTO `video_schedule` VALUES (8, 1, 13, 2, '公务员面试实战训练第3集', 'video/image/2-3.png', '120', '2024-02-19 16:29:53', '2024-03-05 20:17:48');
INSERT INTO `video_schedule` VALUES (9, 1, 14, 2, '公务员面试实战训练第4集', 'video/image/2-4.png', '120', '2024-02-19 16:29:56', '2024-03-05 20:17:48');
INSERT INTO `video_schedule` VALUES (10, 1, 15, 2, '公务员面试实战训练第5集', 'video/image/2-5.png', '120', '2024-02-19 16:29:58', '2024-03-05 20:17:48');
INSERT INTO `video_schedule` VALUES (11, 1, 21, 3, '军队文职考试指南第1集', 'video/image/3-1.png', '120', '2024-02-19 16:30:01', '2024-03-05 20:17:48');
INSERT INTO `video_schedule` VALUES (12, 1, 22, 3, '军队文职考试指南第2集', 'video/image/3-2.png', '120', '2024-02-19 16:30:04', '2024-03-05 20:17:48');
INSERT INTO `video_schedule` VALUES (13, 1, 23, 3, '军队文职考试指南第3集', 'video/image/3-3.png', '120', '2024-02-19 16:30:07', '2024-03-05 20:17:48');
INSERT INTO `video_schedule` VALUES (14, 1, 24, 3, '军队文职考试指南第4集', 'video/image/3-4.png', '120', '2024-02-19 16:30:10', '2024-03-05 20:17:48');
INSERT INTO `video_schedule` VALUES (15, 1, 25, 3, '军队文职考试指南第5集', 'video/image/3-5.png', '120', '2024-02-19 16:30:12', '2024-03-05 20:17:48');
INSERT INTO `video_schedule` VALUES (16, 1, 61, 7, '事业单位面试技巧第1集', 'video/image/1-1.png', '1', '2024-03-05 21:50:26', '2024-03-05 21:50:43');
INSERT INTO `video_schedule` VALUES (17, 1, 16, 2, '公务员面试实战训练第6集', 'video/image/2-6.png', '136', '2024-03-06 19:11:29', '2024-03-06 19:11:29');
INSERT INTO `video_schedule` VALUES (18, 1, 101, 11, '事业单位招聘笔试突破第1集', 'video/image/5-1.png', '106', '2024-03-06 19:36:54', '2024-03-06 19:36:54');
INSERT INTO `video_schedule` VALUES (19, 19, 81, 9, '公务员面试技能培训第1集', 'video/image/3-1.png', '6', '2024-03-23 15:41:02', '2024-03-27 20:28:34');
INSERT INTO `video_schedule` VALUES (20, 19, 82, 9, '公务员面试技能培训第2集', 'video/image/3-2.png', '8', '2024-03-23 15:41:21', '2024-03-23 15:41:36');

SET FOREIGN_KEY_CHECKS = 1;
