<?php
/**
 * LiveAgent 客服系统配置
 * API文档：https://168stone.ladesk.com/docs/api/v3/
 */
return array(
    // API基础配置
    'API_URL' => 'https://168stone.ladesk.com/api/v3',
    'API_KEY' => 'x6euzjxl010660h7moy243v5kaml4k06fmc08mpi04',
    
    // API超时设置
    'API_TIMEOUT' => 10,
    'API_CONNECT_TIMEOUT' => 5,
    
    // 聊天配置
    'CHAT_ENABLED' => true,
    'CHAT_WELCOME_MESSAGE' => '您好！有什么可以帮您的吗？',
    
    // 默认部门ID（需要从LiveAgent后台获取）
    'DEFAULT_DEPARTMENT_ID' => '',
    
    // 缓存配置
    'CACHE_ENABLED' => true,
    'CACHE_EXPIRE' => 300, // 5分钟
);

