-- LiveAgent 在线客服聊天系统数据库表

-- 聊天会话表
CREATE TABLE IF NOT EXISTS `tw_chat_session` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '会话ID',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `ticket_id` varchar(50) NOT NULL DEFAULT '' COMMENT 'LiveAgent工单ID',
  `ticket_code` varchar(50) NOT NULL DEFAULT '' COMMENT '工单编号',
  `contact_id` varchar(50) NOT NULL DEFAULT '' COMMENT 'LiveAgent联系人ID',
  `status` varchar(20) NOT NULL DEFAULT 'active' COMMENT '会话状态：active-进行中, closed-已关闭',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_ticket_id` (`ticket_id`),
  KEY `idx_status` (`status`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='聊天会话表';

-- 聊天消息表
CREATE TABLE IF NOT EXISTS `tw_chat_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `session_id` int(11) unsigned NOT NULL COMMENT '会话ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID（客服消息为0）',
  `message` text NOT NULL COMMENT '消息内容',
  `sender_type` varchar(20) NOT NULL DEFAULT 'user' COMMENT '发送者类型：user-用户, agent-客服',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发送时间',
  PRIMARY KEY (`id`),
  KEY `idx_session_id` (`session_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='聊天消息表';

