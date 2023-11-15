CREATE TABLE `promotion_rule`
(
    `id`                   bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '促销规则编号',
    `rule_name`            varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '促销规则名称',
    `rule_description`     varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '促销规则描述',
    `start_time`           datetime                                                      DEFAULT NULL COMMENT '开始时间',
    `end_time`             datetime                                                      DEFAULT NULL COMMENT '结束时间',
    `promotion_type`       tinyint(4)                                                    DEFAULT NULL COMMENT '促销类别：1.满减，2.特价，3.满折，4.满赠，5.满返, 6.N元M件',
    `effective_times`      int(11)                                                       DEFAULT NULL COMMENT '生效次数',
    `target_member_type`   tinyint(4)                                                    DEFAULT NULL COMMENT '目标人群：1所有会员；2：指定等级  3:指定标签组;  4:指定促销标识',
    `max_discount_percent` decimal(8, 4)                                                 DEFAULT NULL COMMENT '最大优惠金额百分比',
    `max_discount_amount`  decimal(20, 2)                                                DEFAULT NULL COMMENT '最大优惠总金额',
    `order_source`         tinyint(4)                                                    DEFAULT NULL COMMENT '规则适用渠道：0:全渠道,1:线下,2:线上,3:无人零售机,4:线上电商',
    `include_sku_type`     tinyint(4)                                                    DEFAULT NULL COMMENT '参与商品类型(0:不限商品,1:部分商品,2:排除部分商品)',
    `sku_filter_type`      tinyint(4)                                                    DEFAULT NULL COMMENT '过滤商品类型(1:商品code,2:商品类目)',
    `include_store_type`   tinyint(4)                                                    DEFAULT NULL COMMENT '参与店铺类型（0全部，1，线下部分店铺，2排除线下部分店铺）',
    `tenant_code`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '租户号',
    `rule_status`          tinyint(4)                                                    DEFAULT NULL COMMENT '状态：0待启用，1启用，2禁用，3失效',
    `create_time`          datetime                                                      DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`          datetime            NOT NULL                                  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `create_by`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人',
    `update_by`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '启用人|禁用人',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2093
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='促销规则';



CREATE TABLE `promotion_rule_sku`
(
    `id`                bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `promotion_rule_id` bigint(20) unsigned NOT NULL COMMENT '促销规则编号',
    `sku_code`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '商品ID',
    `sku_name`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '商品名称',
    `original_price`    decimal(10, 2)                                                DEFAULT NULL COMMENT '商品原价',
    `sale_price`        decimal(10, 2)                                                DEFAULT NULL COMMENT '商品售价',
    `total_quantity`    int(11) unsigned zerofill                                     DEFAULT NULL COMMENT '总活动库存',
    `remain_quantity`   int(11)                                                       DEFAULT NULL COMMENT '剩余活动库存',
    `include_type`      tinyint(1)                                                    DEFAULT NULL COMMENT '类型(0:参与,1:排除)',
    `tenant_code`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '租户号',
    `create_time`       datetime                                                      DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`       datetime                                                      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `create_by`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `update_by`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最近更新人',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_promotionruleid_skuid_categoryid` (`promotion_rule_id`, `sku_code`) USING BTREE COMMENT '促销商品类目唯一索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 126400
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='促销规则适用商品';


CREATE TABLE `promotion_rule_sku_category`
(
    `id`                bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `promotion_rule_id` bigint(20) unsigned NOT NULL COMMENT '促销规则编号',
    `category_code`     varchar(64)         NOT NULL COMMENT '商品类目',
    `include_type`      tinyint(1)                                                    DEFAULT NULL COMMENT '类型(0:参与,1:排除)',
    `tenant_code`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '租户号',
    `create_time`       datetime                                                      DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`       datetime                                                      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `create_by`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `update_by`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最近更新人',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 126400
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='促销规则适用商品类目';


CREATE TABLE `promotion_rule_store`
(
    `id`                bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `promotion_rule_id` bigint(20) unsigned                                           DEFAULT NULL COMMENT '促销规则编号',
    `store_code`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '店铺ID',
    `tenant_code`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '租户号',
    `create_time`       datetime                                                      DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`       datetime                                                      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `create_by`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `update_by`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最近更新人',
    `store_name`        varchar(255) COLLATE utf8mb4_general_ci                       DEFAULT NULL COMMENT '店铺名称',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 195
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='促销规则适用店铺';


CREATE TABLE `promotion_rule_tag`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '促销规则标识id',
    `tag_code`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '促销规则标识code',
    `tag_name`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '促销规则标识名称',
    `tenant_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '租户号',
    `create_time` datetime                                                     DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime            NOT NULL                                 DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`     int(1)              NOT NULL                                 DEFAULT '0' COMMENT '逻辑删除，1已删除 0未删除',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 32
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='促销规则自定义标识';



CREATE TABLE `promotion_rule_member_rel`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '促销规则标识id',
    `member_group_id`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户群id',
    `member_level`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '们',
    `tenant_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '租户号',
    `create_time` datetime                                                     DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime            NOT NULL                                 DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`     int(1)              NOT NULL                                 DEFAULT '0' COMMENT '逻辑删除，1已删除 0未删除',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 32
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='促销规则自定义标识';



CREATE TABLE `promotion_rule_detail`
(
    `id`                     bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '促销规则明细编号',
    `promotion_rule_id`      bigint(20) unsigned                                          DEFAULT NULL COMMENT '促销规则编号',
    `effective_type`         tinyint(4)                                                   DEFAULT NULL COMMENT '促销规则明细类型：1阶梯，2每满',
    `threshold`              decimal(20, 4)                                               DEFAULT NULL COMMENT '促销条件数量',
    `unit`                   tinyint(4)                                                   DEFAULT NULL COMMENT '价格条件单位：1元，2件',
    `return_type`            tinyint(4)                                                   DEFAULT NULL COMMENT '返还类型：1积分，2券，3现金，4商品',
    `return_count`           decimal(20, 4)                                               DEFAULT NULL COMMENT '赠送数量/返还数量/折扣额度',
    `return_coupon_batch_id` int(11)                                                      DEFAULT NULL COMMENT '返还赠品-券批次ID',
    `return_gift_group_id`   bigint(20) unsigned                                          DEFAULT NULL COMMENT '返回赠品-赠品组ID',
    `tenant_code`            varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '租户号',
    `create_time`            datetime                                                     DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`            datetime                                                     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `create_by`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `update_by`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最近更新人',
    `deleted`                int(1)              NOT NULL                                 DEFAULT '0' COMMENT '逻辑删除，1已删除 0未删除',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `idx_promotionruleid` (`promotion_rule_id`) USING BTREE COMMENT '促销规则索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1759
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='促销规则明细';



CREATE TABLE `gift`
(
    `id`              bigint(20) unsigned                                           NOT NULL AUTO_INCREMENT,
    `gift_group_id`   bigint(20) unsigned                                           NOT NULL COMMENT '赠品组id',
    `sku_code`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT 'sku编码',
    `sku_name`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'sku名称',
    `quantity`        int(11)                                                                DEFAULT NULL COMMENT '赠送数量',
    `total_quantity`  int(11)                                                                DEFAULT NULL COMMENT '总活动库存',
    `remain_quantity` int(11)                                                                DEFAULT NULL COMMENT '剩余活动库存',
    `tenant_code`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '租户',
    `deleted`         int(1)                                                        NOT NULL DEFAULT '0' COMMENT '逻辑删除，1已删除 0未删除',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_groupid_skucode` (`gift_group_id`, `sku_code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 713
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='赠品列表';



CREATE TABLE `gift_group`
(
    `group_id`           bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `group_name`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
    `present_type`       tinyint(4)                                                   DEFAULT NULL COMMENT '赠送类型：1：从赠品池里随机取一个赠送，2：从赠品池里取一套赠送，3：从赠品池里随机取n个赠送',
    `quantity`           int(11)                                                      DEFAULT NULL COMMENT '总赠送次数',
    `presented_quantity` int(11)             NOT NULL                                 DEFAULT '0' COMMENT '已赠送次数',
    `create_time`        datetime                                                     DEFAULT NULL COMMENT '创建时间',
    `update_time`        datetime                                                     DEFAULT NULL COMMENT '更新时间',
    `update_by`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最近更新用户',
    `tenant_code`        varchar(64) COLLATE utf8mb4_general_ci                       DEFAULT NULL,
    `deleted`            int(1)              NOT NULL                                 DEFAULT '0' COMMENT '逻辑删除，1已删除 0未删除',
    `product_quantity`   int(11)                                                      DEFAULT NULL COMMENT '商品总数',
    `gift_quantity`      int(11)                                                      DEFAULT NULL COMMENT '随机送的赠品个数（赠送类型为3时使用）',
    PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 529
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='赠品组';