DROP DATABASE IF EXISTS `webase-host`;

CREATE DATABASE  `webase-host` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

SET NAMES utf8mb4;

SET FOREIGN_KEY_CHECKS = 0;

USE `webase-host`;

-- ----------------------------
-- Table structure for host
-- ----------------------------
DROP TABLE IF EXISTS `host`;
CREATE TABLE `host`
(
    `id`          int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
    `root_dir`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '/opt/webase' COMMENT '主机存放节点配置文件的根目录，可能存放多个节点配置',
    `user`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL DEFAULT 'root' COMMENT '远程登录用户',
    `ip`          varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '主机IP',
    `port`        int                                                           NOT NULL DEFAULT '22' COMMENT '远程ssh端口',
    `status`      tinyint unsigned NOT NULL DEFAULT '0' COMMENT '主机状态：0，新建；1，初始化；2，运行等等',
    `remark`      text COMMENT 'remark',
    `create_time` datetime                                                      NOT NULL COMMENT '创建时间',
    `update_time` datetime                                                      NOT NULL COMMENT '最近一次更新时间',
    `create_by`   varchar(64)                                                            DEFAULT NULL COMMENT '创建者',
    `update_by`   varchar(64)                                                            DEFAULT NULL COMMENT '更新者',
    `dept_id` bigint DEFAULT NULL COMMENT '部门id',
    `user_id` bigint DEFAULT NULL COMMENT '用户id',
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_ip` (`ip`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='物理主机信息';

-- ----------------------------
-- Records of host
-- ----------------------------
BEGIN;
COMMIT;

SET
FOREIGN_KEY_CHECKS = 1;
