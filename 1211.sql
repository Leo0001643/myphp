-- MySQL dump 10.13  Distrib 5.6.50, for Linux (x86_64)
--
-- Host: localhost    Database: okx123
-- ------------------------------------------------------
-- Server version	5.6.50-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tw_admin`
--

DROP TABLE IF EXISTS `tw_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL DEFAULT '',
  `username` char(16) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `moble` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `last_login_time` int(11) unsigned NOT NULL,
  `last_login_ip` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_admin`
--

LOCK TABLES `tw_admin` WRITE;
/*!40000 ALTER TABLE `tw_admin` DISABLE KEYS */;
INSERT INTO `tw_admin` VALUES (1,'admin@gmail.com','admin','超级管理员','','e10adc3949ba59abbe56e057f20f883e',0,0,1716608576,117,0,1),(105,'https://t.me/TK_Codes','TK_Codes','https://t.me/TK_Codes','','e10adc3949ba59abbe56e057f20f883e',0,0,1686102308,192,0,1);
/*!40000 ALTER TABLE `tw_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_adver`
--

DROP TABLE IF EXISTS `tw_adver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_adver` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) NOT NULL DEFAULT 'zh-cn',
  `name` varchar(20) NOT NULL DEFAULT '',
  `subhead` varchar(20) NOT NULL COMMENT '副标题描述',
  `url` varchar(100) NOT NULL DEFAULT '',
  `img` varchar(100) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT '',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `onlinetime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `look` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 电脑端 1手机端',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='广告图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_adver`
--

LOCK TABLES `tw_adver` WRITE;
/*!40000 ALTER TABLE `tw_adver` DISABLE KEYS */;
/*!40000 ALTER TABLE `tw_adver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_appc`
--

DROP TABLE IF EXISTS `tw_appc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_appc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `web_name` varchar(64) DEFAULT NULL,
  `web_title` varchar(64) DEFAULT NULL,
  `web_icp` varchar(64) DEFAULT NULL,
  `index_img` varchar(256) DEFAULT NULL,
  `pay` varchar(256) DEFAULT NULL,
  `withdraw_notice` varchar(256) DEFAULT NULL,
  `charge_notice` varchar(256) DEFAULT NULL,
  `show_coin` varchar(255) DEFAULT NULL,
  `show_market` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_appc`
--

LOCK TABLES `tw_appc` WRITE;
/*!40000 ALTER TABLE `tw_appc` DISABLE KEYS */;
INSERT INTO `tw_appc` VALUES (2,'数字资产交易平台','数字资产交易平台','','','{\"alipay\":{\"name\":\"\\u5f20\\u4e09\",\"value\":\"123456@163.com\"},\"bank\":{\"name\":\"\\u674e\\u56db\",\"value\":\"88888888666666\"}}','提现说明文字后台可配置','充值说明文字 后台可配置','[\"2\",\"39\",\"41\"]','[\"1\",\"31\",\"33\"]');
/*!40000 ALTER TABLE `tw_appc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_area`
--

DROP TABLE IF EXISTS `tw_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_zh` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `name_en` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `name_abbr` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `international_area_code` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_area`
--

LOCK TABLES `tw_area` WRITE;
/*!40000 ALTER TABLE `tw_area` DISABLE KEYS */;
INSERT INTO `tw_area` VALUES (1,'阿富汗','Afghanistan','AFG','93'),(2,'阿尔巴尼亚','Albania','ALB','355'),(3,'阿尔及利亚','Algeria','DZA','213'),(4,'安道尔','Andorra','AND','376'),(5,'安哥拉','Angola','AGO','244'),(6,'安提瓜和巴布达','Antigua and Barbuda','ATG','1268'),(7,'阿根廷','Argentina','ARG','54'),(8,'亚美尼亚','Armenia','ARM','374'),(9,'澳大利亚','Australia','AUS','61'),(10,'奥地利','Austria','AUT','43'),(11,'阿塞拜疆','Azerbaijan','AZE','994'),(12,'巴哈马','Bahamas','BHS','1242'),(13,'巴林','Bahrain','BHR','973'),(14,'孟加拉','Bangladesh','BGD','880'),(15,'巴巴多斯','Barbados','BRB','1246'),(16,'白俄罗斯','Belarus','BLR','375'),(17,'比利时','Belgium','BEL','32'),(18,'伯利兹','Belize','BLZ','501'),(19,'贝宁','Benin','BEN','229'),(20,'不丹','Bhutan','BTN','975'),(21,'玻利维亚','Bolivia','BOL','591'),(22,'波黑','Bosnia and Herzegovina','BIH','387'),(23,'博茨瓦纳','Botswana','BWA','267'),(24,'巴西','Brazil','BRA','55'),(25,'文莱','Brunei','BRN','673'),(26,'保加利亚','Bulgaria','BGR','359'),(27,'布基纳法索','Burkina Faso','BFA','226'),(28,'布隆迪','Burundi','BDI','257'),(29,'柬埔寨','Cambodia','KHM','855'),(30,'喀麦隆','Cameroon','CMR','237'),(31,'加拿大','Canada','CAN','1'),(32,'佛得角','Cape Verde','CPV','238'),(33,'中非','Central African Republic','CAF','236'),(34,'乍得','Chad','TCD','235'),(35,'智利','Chile','CHL','56'),(36,'中国','China','CHN','86'),(37,'哥伦比亚','Colombia','COL','57'),(38,'科摩罗','Comoros','COM','269'),(39,'刚果（布）','Congo (Brazzaville)','COG','242'),(40,'刚果（金）','Congo (Kinshasa)','COD','243'),(41,'库克群岛（新西兰）','Cook Islands','COK','682'),(42,'哥斯达黎加','Costa Rica','CRI','506'),(43,'科特迪瓦','Coate d\'Ivoire','CIV','225'),(44,'克罗地亚','Croatia','HRV','385'),(45,'古巴','Cuba','CUB','53'),(46,'塞浦路斯','Cyprus','CYP','357'),(47,'捷克','Czech Republic','CZE','420'),(48,'丹麦','Denmark','DNK','45'),(49,'吉布提','Djibouti','DJI','253'),(50,'多米尼克','Dominica','DMA','1767'),(51,'多米尼加','Dominican Republic','DOM','1809'),(52,'厄瓜多尔','Ecuador','ECU','593'),(53,'埃及','Egypt','EGY','20'),(54,'萨尔瓦多','El Salvador','SLV','503'),(55,'赤道几内亚','Equatorial Guinea','GNQ','240'),(56,'厄立特里亚','Eritrea','ERI','291'),(57,'爱沙尼亚','Estonia','EST','372'),(58,'埃塞俄比亚','Ethiopia','ETH','251'),(59,'斐济','Fiji','FJI','679'),(60,'芬兰','Finland','FIN','358'),(61,'法国','France','FRA','33'),(62,'加蓬','Gabon','GAB','241'),(63,'冈比亚','Gambia, The','GMB','220'),(64,'格鲁吉亚','Georgia','GEO','995'),(65,'德国','Germany','DEU','49'),(66,'加纳','Ghana','GHA','233'),(67,'希腊','Greece','GRC','30'),(68,'格林纳达','Grenada','GRD','1473'),(69,'危地马拉','Guatemala','GTM','502'),(70,'几内亚','Guinea','GIN','224'),(71,'几内亚比绍','Guinea-Bissau','GNB','245'),(72,'圭亚那','Guyana','GUY','592'),(73,'海地','Haiti','HTI','509'),(74,'洪都拉斯','Honduras','HND','504'),(75,'匈牙利','Hungary','HUN','36'),(76,'冰岛','Iceland','ISL','354'),(77,'印度','India','IND','91'),(78,'印尼','Indonesia','IDN','62'),(79,'伊朗','Iran','IRN','98'),(80,'伊拉克','Iraq','IRQ','964'),(81,'爱尔兰','Ireland','IRL','353'),(82,'以色列','Israel','ISR','972'),(83,'意大利','Italy','ITA','39'),(84,'牙买加','Jamaica','JAM','1876'),(85,'日本','Japan','JPN','81'),(86,'约旦','Jordan','JOR','962'),(87,'哈萨克斯坦','Kazakhstan','KAZ','7'),(88,'肯尼亚','Kenya','KEN','254'),(89,'基里巴斯','Kiribati','KIR','686'),(90,'科索沃','Kosovo',NULL,'384'),(91,'科威特','Kuwait','KWT','965'),(92,'吉尔吉斯斯坦','Kyrgyzstan','KGZ','996'),(93,'老挝','Laos','LAO','856'),(94,'拉脱维亚','Latvia','LVA','371'),(95,'黎巴嫩','Lebanon','LBN','961'),(96,'莱索托','Lesotho','LSO','266'),(97,'利比里亚','Liberia','LBR','231'),(98,'利比亚','Libya','LBY','218'),(99,'列支敦士登','Liechtenstein','LIE','423'),(100,'立陶宛','Lithuania','LTU','370'),(101,'卢森堡','Luxembourg','LUX','352'),(102,'马其顿','Macedonia','MKD','389'),(103,'马达加斯加','Madagascar','MDG','261'),(104,'马拉维','Malawi','MWI','265'),(105,'马来西亚','Malaysia','MYS','60'),(106,'马尔代夫','Maldives','MDV','960'),(107,'马里','Mali','MLI','223'),(108,'马耳他','Malta','MLT','356'),(109,'毛里塔尼亚','Mauritania','MRT','222'),(110,'毛里求斯','Mauritius','MUS','230'),(111,'墨西哥','Mexico','MEX','52'),(112,'摩尔多瓦','Moldova','MDA','373'),(113,'摩纳哥','Monaco','MCO','377'),(114,'蒙古','Mongolia','MNG','976'),(115,'黑山','Montenegro','MNE','382'),(116,'摩洛哥','Morocco','MAR','212'),(117,'莫桑比克','Mozambique','MOZ','258'),(118,'缅甸','Myanmar','MMR','95'),(119,'纳米比亚','Namibia','NAM','264'),(120,'尼泊尔','Nepal','NPL','977'),(121,'荷兰','Netherlands','NLD','31'),(122,'新西兰','New Zealand','NZL','64'),(123,'尼加拉瓜','Nicaragua','NIC','505'),(124,'尼日尔','Niger','NER','227'),(125,'尼日利亚','Nigeria','NGA','234'),(126,'纽埃（新西兰）','Niue','NIU','683'),(127,'朝鲜','Nouth Korea','PRK','850'),(128,'挪威','Norway','NOR','47'),(129,'阿曼','Oman','OMN','968'),(130,'巴基斯坦','Pakistan','PAK','92'),(131,'帕劳','Palau','PLW','680'),(132,'巴勒斯坦','Palestine','PSE','970'),(133,'巴拿马','Panama','PAN','507'),(134,'巴布亚新几内亚','Papua New Guinea','PNG','675'),(135,'巴拉圭','Paraguay','PRY','595'),(136,'秘鲁','Peru','PER','51'),(137,'菲律宾','Philippines','PHL','63'),(138,'波兰','Poland','POL','48'),(139,'葡萄牙','Portugal','PRT','351'),(140,'卡塔尔','Qatar','QAT','974'),(141,'罗马尼亚','Romania','ROU','40'),(142,'俄罗斯','Russia','RUS','7'),(143,'卢旺达','Rwanda','RWA','250'),(144,'圣基茨和尼维斯','Saint Christopher and Nevis','KNA','1869'),(145,'圣卢西亚','Saint Lucia','LCA','1758'),(146,'圣文森特和格林纳丁斯','Saint Vincent and the Grenadines','VCT','1784'),(147,'萨摩亚','Samoa','WSM','685'),(148,'圣马力诺','San Marino','SMR','378'),(149,'沙特阿拉伯','Saudi Arabia','SAU','966'),(150,'塞内加尔','Senegal','SEN','221'),(151,'塞尔维亚','Serbia','SRB','381'),(152,'塞舌尔','Seychelles','SYC','248'),(153,'塞拉利昂','Sierra Leone','SLE','232'),(154,'新加坡','Singapore','SGP','65'),(155,'斯洛伐克','Slovakia','SVK','421'),(156,'斯洛文尼亚','Slovenia','SVN','386'),(157,'所罗门群岛','Solomon Islands','SLB','677'),(158,'索马里','Somali','SOM','252'),(159,'南非','South Africa','ZAF','27'),(160,'韩国','South Korea','KOR','82'),(161,'南苏丹','South Sudan','SSD','211'),(162,'西班牙','Spain','ESP','34'),(163,'斯里兰卡','Sri Lanka','LKA','94'),(164,'苏丹','Sudan','SDN','249'),(165,'苏里南','Suriname','SUR','597'),(166,'斯威士兰','Swaziland','SWZ','268'),(167,'瑞典','Sweden','SWE','46'),(168,'瑞士','Switzerland','CHE','41'),(169,'叙利亚','Syria','SYR','963'),(170,'台湾','Taiwan','TWN','886'),(171,'塔吉克斯坦','Tajikistan','TJK','992'),(172,'坦桑尼亚','Tanzania','TZA','255'),(173,'泰国','Thailand','THA','66'),(174,'东帝汶','Timor-Leste','TLS','670'),(175,'多哥','Togo','TGO','228'),(176,'汤加','Tonga','TON','676'),(177,'特立尼达和多巴哥','Trinidad and Tobago','TTO','1868'),(178,'突尼斯','Tunisia','TUN','216'),(179,'土耳其','Turkey','TUR','90'),(180,'土库曼斯坦','Turkmenistan','TKM','993'),(181,'乌干达','Uganda','UGA','256'),(182,'乌克兰','Ukraine','UKR','380'),(183,'阿联酋','United Arab Emirates','ARE','971'),(184,'英国','United Kingdom','GBR','44'),(185,'美国','United States','USA','1'),(186,'乌拉圭','Uruguay','URY','598'),(187,'乌兹别克斯坦','Uzbekistan','UZB','998'),(188,'瓦努阿图','Vanuatu','VUT','678'),(189,'委内瑞拉','Venezuela','VEN','58'),(190,'越南','Vietnam','VNM','84'),(191,'也门','Yemen','YEM','967'),(192,'赞比亚','Zambia','ZMB','260'),(193,'津巴布韦','Zimbabwe','ZWE','263'),(194,'美属萨摩亚（美国）','American Samoa','ASM','1684'),(195,'安圭拉 （英国）','Anguilla','AIA','1264'),(196,'阿鲁巴（荷兰）','Aruba','ABW','297'),(197,'百慕大（英国）','Bermuda','BMU','1441'),(198,'开曼群岛（英国）','Cayman Islands','CYM','1345'),(199,'福克兰群岛（英国、阿根廷争议）','Falkland Islands (Islas Malvinas)','FLK','500'),(200,'法罗群岛（丹麦）','Faroe Islands','FRO','298'),(201,'直布罗陀（英国）','Gibraltar','GIB','350'),(202,'格陵兰（丹麦）','Greenland','GRL','299'),(203,'香港（中国）','Hong Kong','HKG','852'),(204,'澳门（中国）','Macao','MAC','853'),(205,'蒙特塞拉特（英国）','Montserrat','MSR','1664'),(206,'新喀里多尼亚（法国）','New Caledonia','NCL','687'),(207,'波多黎各（美国）','Puerto Rico','PRI','1787'),(208,'托克劳（新西兰）','Tokelau','TKL','690'),(209,'特克斯和凯科斯群岛（英国）','Turks and Caicos Islands','TCA','1649'),(210,'留尼旺和马约特（法国）',NULL,NULL,'262'),(211,'爱沙尼亚','Republic of Estonia',NULL,'372');
/*!40000 ALTER TABLE `tw_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_auth_extend`
--

DROP TABLE IF EXISTS `tw_auth_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`) USING BTREE,
  KEY `uid` (`group_id`) USING BTREE,
  KEY `group_id` (`extend_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_auth_extend`
--

LOCK TABLES `tw_auth_extend` WRITE;
/*!40000 ALTER TABLE `tw_auth_extend` DISABLE KEYS */;
INSERT INTO `tw_auth_extend` VALUES (1,1,1),(1,1,2),(1,2,1),(1,2,2),(1,3,1),(1,3,2),(1,4,1),(1,37,1);
/*!40000 ALTER TABLE `tw_auth_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_auth_group`
--

DROP TABLE IF EXISTS `tw_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(1000) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_auth_group`
--

LOCK TABLES `tw_auth_group` WRITE;
/*!40000 ALTER TABLE `tw_auth_group` DISABLE KEYS */;
INSERT INTO `tw_auth_group` VALUES (1,'admin',1,'superadmin','超级管理员组,拥有系统所有权限',1,'1519,1580,1581,1582,1624,1674,2268,2269,2275,2276,2277,2279,2281,2283,2284,2285,2286,2287,2288,2291,2292,2293,2300,2301,2302,2303,2304,2305,2306,2307,2308,2309,2310,2311,2312,2313,2314,2315,2316,2317,2318,2319,2320,2321,2322,2323,2324,2325,2326,2334,2335,2336,2339,2340,2341,2348,2349,2352,2356,2358,2359,2362,2365,2367,2370,2372,2373,2374,2375,2376,2379,2389,2390,2392,2393,2394,2397,2399,2406,2407,2408,2409,2410,2411,2412,2415,2416,2420,2422,2424,2425,2426,2427,2428,2429,2430,2431,2432,2434,2435,2438,2439,2440,2441,2443,2444,2445,2449,2451,2452,2453,2454,2455,2456,2457,2458,2459,2460,2461,2462,2463'),(16,'admin',1,'information','文档组管理员',1,'2275,2276,2285,2286,2287,2288,2289,2290,2318,2319,2321,2336,2339,2362,2375,2435,2438,2439,2440,2441'),(17,'admin',1,'kefu','客户服务',1,'2275,2276,2279,2285,2286,2287,2288,2289,2290,2310,2318,2319,2321,2336,2339,2349,2362,2375,2435,2438,2439,2440,2441'),(18,'admin',1,'shichang','市场组管理员',1,'1580,1581,1582,1624,1674,2268,2269,2275,2276,2277,2279,2285,2286,2287,2288,2289,2290,2291,2292,2300,2301,2302,2303,2304,2305,2306,2307,2308,2309,2310,2311,2312,2313,2314,2315,2316,2317,2318,2319,2321,2322,2323,2324,2325,2326,2334,2335,2336,2339,2340,2341,2348,2349,2356,2359,2362,2365,2367,2375,2376,2399,2420,2426,2432,2433,2434,2435,2438,2439,2440,2441,2451,2452,2456,2458,2461,2462,2463'),(19,'admin',1,'caiwu','财务管理员',1,'1519,2275,2279,2285,2293,2349,2422,2424,2427,2449,2453,2454,2455'),(22,'admin',1,'low','只有查看交易市场权限',1,'2275,2279,2285,2310,2349,2356,2359,2451,2452,2456,2458');
/*!40000 ALTER TABLE `tw_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_auth_group_access`
--

DROP TABLE IF EXISTS `tw_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_auth_group_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_auth_group_access`
--

LOCK TABLES `tw_auth_group_access` WRITE;
/*!40000 ALTER TABLE `tw_auth_group_access` DISABLE KEYS */;
INSERT INTO `tw_auth_group_access` VALUES (1,1,1);
/*!40000 ALTER TABLE `tw_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_auth_rule`
--

DROP TABLE IF EXISTS `tw_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `module` (`module`,`status`,`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2464 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_auth_rule`
--

LOCK TABLES `tw_auth_rule` WRITE;
/*!40000 ALTER TABLE `tw_auth_rule` DISABLE KEYS */;
INSERT INTO `tw_auth_rule` VALUES (425,'admin',1,'Admin/article/add','新增',-1,''),(427,'admin',1,'Admin/article/setStatus','改变状态',-1,''),(428,'admin',1,'Admin/article/update','保存',-1,''),(429,'admin',1,'Admin/article/autoSave','保存草稿',-1,''),(430,'admin',1,'Admin/article/move','移动',-1,''),(432,'admin',2,'Admin/Article/mydocument','内容',-1,''),(437,'admin',1,'Admin/Trade/config','交易配置',-1,''),(449,'admin',1,'Admin/Index/operate','市场统计',-1,''),(455,'admin',1,'Admin/Issue/config','认购配置',-1,''),(457,'admin',1,'Admin/Index/database/type/export','数据备份',-1,''),(461,'admin',1,'Admin/Article/chat','聊天列表',-1,''),(464,'admin',1,'Admin/Index/database/type/import','数据还原',-1,''),(471,'admin',1,'Admin/Mytx/config','提现配置',-1,''),(472,'admin',2,'Admin/Mytx/index','提现',-1,''),(473,'admin',1,'Admin/Config/market','市场配置',-1,''),(477,'admin',1,'Admin/User/myzr','转入虚拟币',-1,''),(479,'admin',1,'Admin/User/myzc','转出虚拟币',-1,''),(482,'admin',2,'Admin/ExtA/index','扩展',-1,''),(488,'admin',1,'Admin/Auth_manager/createGroup','新增用户组',-1,''),(499,'admin',1,'Admin/ExtA/index','扩展管理',-1,''),(509,'admin',1,'Admin/Article/adver_edit','编辑',-1,''),(510,'admin',1,'Admin/Article/adver_status','修改',-1,''),(513,'admin',1,'Admin/Issue/index_edit','认购编辑',-1,''),(514,'admin',1,'Admin/Issue/index_status','认购修改',-1,''),(515,'admin',1,'Admin/Article/chat_edit','编辑',-1,''),(516,'admin',1,'Admin/Article/chat_status','修改',-1,''),(517,'admin',1,'Admin/User/coin_edit','coin修改',-1,''),(519,'admin',1,'Admin/Mycz/type_status','状态修改',-1,''),(520,'admin',1,'Admin/Issue/log_status','认购状态',-1,''),(521,'admin',1,'Admin/Issue/log_jiedong','认购解冻',-1,''),(522,'admin',1,'Admin/Tools/database/type/export','数据备份',-1,''),(525,'admin',1,'Admin/Config/coin_edit','编辑',-1,''),(526,'admin',1,'Admin/Config/coin_add','编辑币种',-1,''),(527,'admin',1,'Admin/Config/coin_status','状态修改',-1,''),(528,'admin',1,'Admin/Config/market_edit','编辑',-1,''),(530,'admin',1,'Admin/Tools/database/type/import','数据还原',-1,''),(541,'admin',2,'Admin/Trade/config','交易',-1,''),(569,'admin',1,'Admin/ADVERstatus','修改',-1,''),(570,'admin',1,'Admin/Tradelog/index','交易记录',-1,''),(585,'admin',1,'Admin/Config/mycz','充值配置',-1,''),(590,'admin',1,'Admin/Mycztype/index','充值类型',-1,''),(600,'admin',1,'Admin/Usergoods/index','用户联系地址',-1,''),(1379,'admin',1,'Admin/Bazaar/index','集市管理',-1,''),(1405,'admin',1,'Admin/Bazaar/config','集市配置',-1,''),(1425,'admin',1,'Admin/Bazaar/log','集市记录',-1,''),(1451,'admin',1,'Admin/Bazaar/invit','集市推广',-1,''),(1519,'admin',2,'Admin/Finance/index','财务',1,''),(1575,'admin',1,'Admin/Shop/index','商品管理',-1,''),(1578,'admin',1,'Admin/Huafei/index','充值记录',-1,''),(1579,'admin',1,'Admin/Huafei/config','充值配置',-1,''),(1580,'admin',1,'Admin/Vote/index','投票记录',1,''),(1581,'admin',1,'Admin/Vote/type','投票配置',1,''),(1582,'admin',1,'Admin/Money/index','理财中心',1,''),(1599,'admin',1,'Admin/Config/moble','短信配置',-1,''),(1606,'admin',1,'Admin/Shop/config','商城配置',-1,''),(1607,'admin',1,'Admin/Money/log','理财记录',-1,''),(1623,'admin',1,'Admin/Shop/type','商品类型',-1,''),(1624,'admin',1,'Admin/Fenhong/index','分红配置',1,''),(1625,'admin',1,'Admin/Huafei/type','充值金额',-1,''),(1626,'admin',1,'Admin/Money/fee','理财明细',-1,''),(1651,'admin',1,'Admin/Shop/coin','付款方式',-1,''),(1652,'admin',1,'Admin/Huafei/coin','付款方式',-1,''),(1673,'admin',1,'Admin/Shop/log','购物记录',-1,''),(1674,'admin',1,'Admin/Fenhong/log','分红记录',1,''),(1681,'admin',1,'Admin/Shop/goods','收货地址',-1,''),(2092,'admin',2,'Admin/Game/index','应用',-1,''),(2168,'admin',1,'Admin/Config/mobile','短信配置',-1,''),(2251,'admin',1,'Admin/Ptpbc/list','点对点交易记录',-1,''),(2255,'admin',1,'Admin/AuthManager/createGroup','新增用户组',1,''),(2256,'admin',1,'Admin/AuthManager/editgroup','编辑用户组',1,''),(2257,'admin',1,'Admin/AuthManager/writeGroup','更新用户组',1,''),(2258,'admin',1,'Admin/AuthManager/changeStatus','改变状态',1,''),(2259,'admin',1,'Admin/AuthManager/access','访问授权',1,''),(2260,'admin',1,'Admin/AuthManager/category','分类授权',1,''),(2261,'admin',1,'Admin/AuthManager/user','成员授权',1,''),(2262,'admin',1,'Admin/AuthManager/tree','成员列表授权',1,''),(2263,'admin',1,'Admin/AuthManager/group','用户组',1,''),(2264,'admin',1,'Admin/AuthManager/addToGroup','添加到用户组',1,''),(2265,'admin',1,'Admin/AuthManager/removeFromGroup','用户组移除',1,''),(2266,'admin',1,'Admin/AuthManager/addToCategory','分类添加到用户组',1,''),(2267,'admin',1,'Admin/AuthManager/addToModel','模型添加到用户组',1,''),(2268,'admin',1,'Admin/Trade/status','修改状态',1,''),(2269,'admin',1,'Admin/Trade/chexiao','撤销挂单',1,''),(2270,'admin',1,'Admin/Shop/images','图片',1,''),(2271,'admin',1,'Admin/Login/index','用户登录',-1,''),(2272,'admin',1,'Admin/Login/loginout','用户退出',-1,''),(2273,'admin',1,'Admin/User/setpwd','修改管理员密码',-1,''),(2274,'admin',1,'Admin/Analog/console','行情调整',-1,''),(2275,'admin',2,'Admin/Index/index','首页',1,''),(2276,'admin',2,'Admin/Article/index','内容',1,''),(2277,'admin',2,'Admin/User/index','用户',1,''),(2278,'admin',2,'Admin/Finance/mycz','财务',-1,''),(2279,'admin',2,'Admin/Trade/index','交易',1,''),(2280,'admin',2,'Admin/Issue/index','应用',-1,''),(2281,'admin',2,'Admin/Config/index','系统',1,''),(2282,'admin',2,'Admin/Operate/index','运营',-1,''),(2283,'admin',2,'Admin/Tools/index','数据备份',1,''),(2284,'admin',2,'Admin/Cloud/index','扩展',1,''),(2285,'admin',1,'Admin/Index/index','后台首页',1,''),(2286,'admin',1,'Admin/Article/index','文章管理',1,''),(2287,'admin',1,'Admin/Article/edit','编辑添加',1,''),(2288,'admin',1,'Admin/Text/index','提示文字',1,''),(2289,'admin',1,'Admin/Text/edit','编辑',-1,''),(2290,'admin',1,'Admin/Text/status','修改',-1,''),(2291,'admin',1,'Admin/User/index','用户管理',1,''),(2292,'admin',1,'Admin/User/config','用户配置',1,''),(2293,'admin',1,'Admin/Finance/index','财务明细',1,''),(2294,'admin',1,'Admin/Finance/myczTypeEdit','编辑添加',1,''),(2295,'admin',1,'Admin/Cloud/index','扩展',-1,''),(2296,'admin',1,'Admin/Finance/config','配置',1,''),(2297,'admin',1,'Admin/Tools/index','清理缓存',-1,''),(2298,'admin',1,'Admin/Finance/type','类型',1,''),(2299,'admin',1,'Admin/Finance/type_status','状态修改',1,''),(2300,'admin',1,'Admin/User/edit','编辑添加',1,''),(2301,'admin',1,'Admin/User/status','修改状态',1,''),(2302,'admin',1,'Admin/User/adminEdit','编辑添加',1,''),(2303,'admin',1,'Admin/User/adminStatus','修改状态',1,''),(2304,'admin',1,'Admin/User/authEdit','编辑添加',1,''),(2305,'admin',1,'Admin/User/authStatus','修改状态',1,''),(2306,'admin',1,'Admin/User/authStart','重新初始化权限',1,''),(2307,'admin',1,'Admin/User/logEdit','编辑添加',1,''),(2308,'admin',1,'Admin/User/logStatus','修改状态',1,''),(2309,'admin',1,'Admin/User/qianbaoEdit','编辑添加',1,''),(2310,'admin',1,'Admin/Trade/index','委托管理',1,''),(2311,'admin',1,'Admin/User/qianbaoStatus','修改状态',1,''),(2312,'admin',1,'Admin/User/bankEdit','编辑添加',1,''),(2313,'admin',1,'Admin/User/bankStatus','修改状态',1,''),(2314,'admin',1,'Admin/User/coinEdit','编辑添加',1,''),(2315,'admin',1,'Admin/User/coinLog','财产统计',1,''),(2316,'admin',1,'Admin/User/goodsEdit','编辑添加',1,''),(2317,'admin',1,'Admin/User/goodsStatus','修改状态',1,''),(2318,'admin',1,'Admin/Article/typeEdit','编辑添加',1,''),(2319,'admin',1,'Admin/Article/youqingEdit','编辑添加',1,''),(2320,'admin',1,'Admin/Config/index','网站信息',1,''),(2321,'admin',1,'Admin/Article/adverEdit','编辑添加',1,''),(2322,'admin',1,'Admin/User/authAccess','访问授权',1,''),(2323,'admin',1,'Admin/User/authAccessUp','访问授权修改',1,''),(2324,'admin',1,'Admin/User/authUser','成员授权',1,''),(2325,'admin',1,'Admin/User/authUserAdd','成员授权增加',1,''),(2326,'admin',1,'Admin/User/authUserRemove','成员授权解除',1,''),(2327,'admin',1,'Admin/Operate/index','推广奖励',-1,''),(2328,'admin',1,'Admin/App/config','APP配置',-1,''),(2329,'admin',1,'AdminUser/detail','后台用户详情',-1,''),(2330,'admin',1,'AdminUser/status','后台用户状态',-1,''),(2331,'admin',1,'AdminUser/add','后台用户新增',-1,''),(2332,'admin',1,'AdminUser/edit','后台用户编辑',-1,''),(2333,'admin',1,'Admin/Articletype/edit','编辑',-1,''),(2334,'admin',1,'Admin/Issue/index','认购配置',1,''),(2335,'admin',1,'Admin/Issue/log','认购记录',1,''),(2336,'admin',1,'Admin/Article/images','上传图片',1,''),(2337,'admin',1,'Admin/Adver/edit','编辑',1,''),(2338,'admin',1,'Admin/Adver/status','修改',1,''),(2339,'admin',1,'Admin/Article/type','栏目类型',1,''),(2340,'admin',1,'Admin/User/index_edit','编辑',1,''),(2341,'admin',1,'Admin/User/index_status','修改',1,''),(2342,'admin',1,'Admin/Finance/mycz','人民币充值',-1,''),(2343,'admin',1,'Admin/Finance/myczTypeStatus','状态修改',1,''),(2344,'admin',1,'Admin/Finance/myczTypeImage','上传图片',1,''),(2345,'admin',1,'Admin/Finance/mytxStatus','修改状态',1,''),(2346,'admin',1,'Admin/Tools/dataExport','备份数据库',-1,''),(2347,'admin',1,'Admin/Tools/dataImport','还原数据库',-1,''),(2348,'admin',1,'Admin/User/admin','管理员管理',1,''),(2349,'admin',1,'Admin/Trade/log','成交记录',1,''),(2350,'admin',1,'Admin/Issue/edit','认购编辑',-1,''),(2351,'admin',1,'Admin/Issue/status','认购修改',-1,''),(2352,'admin',1,'Admin/Invit/config','推广配置',1,''),(2353,'admin',1,'Admin/App/vip_config_list','APP等级',-1,''),(2354,'admin',1,'Admin/Link/edit','编辑',1,''),(2355,'admin',1,'Admin/Link/status','修改',1,''),(2356,'admin',1,'Admin/Index/coin','币种统计',1,''),(2357,'admin',1,'Admin/Cloud/update','自动升级',-1,''),(2358,'admin',1,'Admin/Config/hq','行情配置',1,''),(2359,'admin',1,'Admin/Index/market','市场统计',1,''),(2360,'admin',1,'Admin/Chat/edit','编辑',1,''),(2361,'admin',1,'Admin/Chat/status','修改',1,''),(2362,'admin',1,'Admin/Article/adver','广告管理',1,''),(2363,'admin',1,'Admin/Trade/chat','交易聊天',-1,''),(2364,'admin',1,'Admin/Finance/myczType','人民币充值方式',-1,''),(2365,'admin',1,'Admin/Usercoin/edit','财产修改',1,''),(2366,'admin',1,'Admin/Finance/mytxExcel','导出选中',1,''),(2367,'admin',1,'Admin/User/auth','权限列表',1,''),(2368,'admin',1,'Admin/Mycz/status','修改',1,''),(2369,'admin',1,'Admin/Mycztype/status','状态修改',1,''),(2370,'admin',1,'Admin/Config/contact','客服配置',1,''),(2371,'admin',1,'Admin/App/adsblock_list','APP广告板块',-1,''),(2372,'admin',1,'Admin/Tools/queue','服务器队列',1,''),(2373,'admin',1,'Admin/Tools/qianbao','钱包检查',1,''),(2374,'admin',1,'Admin/Cloud/game','应用管理',1,''),(2375,'admin',1,'Admin/Article/youqing','友情链接',1,''),(2376,'admin',1,'Admin/User/log','登录日志',1,''),(2377,'admin',1,'Admin/Finance/mytx','人民币提现',-1,''),(2378,'admin',1,'Admin/Finance/mytxChuli','正在处理',1,''),(2379,'admin',1,'Admin/Config/bank','银行配置',1,''),(2380,'admin',1,'Admin/Config/bank_edit','编辑',1,''),(2381,'admin',1,'Admin/Coin/edit','编辑',1,''),(2382,'admin',1,'Admin/Coin/status','状态修改',1,''),(2383,'admin',1,'Admin/Market/edit','编辑市场',1,''),(2384,'admin',1,'Admin/Config/market_add','状态修改',1,''),(2385,'admin',1,'Admin/Tools/invoke','其他模块调用',-1,''),(2386,'admin',1,'Admin/Tools/optimize','优化表',-1,''),(2387,'admin',1,'Admin/Tools/repair','修复表',-1,''),(2388,'admin',1,'Admin/Tools/del','删除备份文件',-1,''),(2389,'admin',1,'Admin/Tools/export','数据备份',1,''),(2390,'admin',1,'Admin/Tools/import','数据恢复',1,''),(2391,'admin',1,'Admin/Tools/excel','导出数据库',-1,''),(2392,'admin',1,'Admin/Tools/exportExcel','导出Excel',1,''),(2393,'admin',1,'Admin/Tools/importExecl','导入Excel',1,''),(2394,'admin',1,'Admin/Config/coin','币种配置',1,''),(2395,'admin',1,'Admin/User/detail','用户详情',-1,''),(2396,'admin',1,'Admin/App/ads_user','APP广告用户',-1,''),(2397,'admin',1,'Admin/Cloud/theme','主题模板',1,''),(2398,'admin',1,'Admin/Trade/comment','币种评论',-1,''),(2399,'admin',1,'Admin/User/qianbao','用户钱包',1,''),(2400,'admin',1,'Admin/Trade/market','市场配置',-1,''),(2401,'admin',1,'Admin/Finance/mytxConfig','人民币提现配置',-1,''),(2402,'admin',1,'Admin/Finance/mytxChexiao','撤销提现',1,''),(2403,'admin',1,'Admin/Mytx/status','状态修改',1,''),(2404,'admin',1,'Admin/Mytx/excel','取消',1,''),(2405,'admin',1,'Admin/Mytx/exportExcel','导入excel',-1,''),(2406,'admin',1,'Admin/Menu/index','菜单管理',1,''),(2407,'admin',1,'Admin/Menu/sort','排序',1,''),(2408,'admin',1,'Admin/Menu/add','添加',1,''),(2409,'admin',1,'Admin/Menu/edit','编辑',1,''),(2410,'admin',1,'Admin/Cloud/kefu','客服代码',1,''),(2411,'admin',1,'Admin/Menu/del','删除',1,''),(2412,'admin',1,'Admin/Cloud/kefuUp','使用',1,''),(2413,'admin',1,'Admin/Menu/toogleHide','是否隐藏',-1,''),(2414,'admin',1,'Admin/Menu/toogleDev','是否开发',-1,''),(2415,'admin',1,'Admin/Menu/importFile','导入文件',1,''),(2416,'admin',1,'Admin/Menu/import','导入',1,''),(2417,'admin',1,'Admin/Config/text','提示文字',-1,''),(2418,'admin',1,'Admin/Ptpbc/log','点对点交易记录',-1,''),(2419,'admin',1,'Admin/Ptpbc/index','点对点交易',-1,''),(2420,'admin',1,'Admin/User/bank','提现地址',1,''),(2421,'admin',1,'Admin/Trade/invit','交易推荐',-1,''),(2422,'admin',1,'Admin/Finance/myzr','虚拟币转入',1,''),(2423,'admin',1,'Admin/Finance/mytxQueren','确认提现',1,''),(2424,'admin',1,'Admin/Finance/myzcQueren','确认转出',1,''),(2425,'admin',1,'Admin/Config/qita','系统配置',1,''),(2426,'admin',1,'Admin/User/coin','用户财产',1,''),(2427,'admin',1,'Admin/Finance/myzc','虚拟币转出',1,''),(2428,'admin',1,'Admin/Verify/code','图形验证码',1,''),(2429,'admin',1,'Admin/Verify/mobile','手机验证码',1,''),(2430,'admin',1,'Admin/Verify/email','邮件验证码',1,''),(2431,'admin',1,'Admin/Config/daohang','前端导航配置',1,''),(2432,'admin',1,'Admin/User/goods','联系地址',1,''),(2433,'admin',1,'Admin/User/myzc_qr','确认转出',1,''),(2434,'admin',1,'Admin/User/amountlog','资金变更日志',1,''),(2435,'admin',1,'Admin/Article/status','修改状态',1,''),(2436,'admin',1,'Admin/Finance/myczStatus','修改状态',1,''),(2437,'admin',1,'Admin/Finance/myczQueren','确认到账',1,''),(2438,'admin',1,'Admin/Article/typeStatus','修改状态',1,''),(2439,'admin',1,'Admin/Article/youqingStatus','修改状态',1,''),(2440,'admin',1,'Admin/Article/adverStatus','修改状态',1,''),(2441,'admin',1,'Admin/Article/adverImage','上传图片',1,''),(2442,'admin',2,'Admin/Finance/myzr','财务',-1,''),(2443,'admin',1,'Admin/Config/smss','短信群发',1,''),(2444,'admin',1,'Admin/Config/dhfooter','页脚导航配置',1,''),(2445,'admin',1,'Admin/Config/dhadmin','后端导航配置',1,''),(2446,'admin',2,'Admin/Issue/log','应用',-1,''),(2447,'admin',1,'Admin/Exchange/myzr','充值记录',-1,''),(2448,'admin',1,'Admin/Exchange/myzc','提现记录',-1,''),(2449,'admin',1,'Admin/Exchange/agent','C2C代理商',1,''),(2450,'admin',1,'Admin/Exchange/log','C2C配置',-1,''),(2451,'admin',2,'Admin/Invit/index','运营',1,''),(2452,'admin',1,'Admin/Invit/index','推广奖励',1,''),(2453,'admin',1,'Admin/Exchange/mycz','充值记录',1,''),(2454,'admin',1,'Admin/Exchange/mytx','提现记录',1,''),(2455,'admin',1,'Admin/Exchange/config','C2C配置',1,''),(2456,'admin',1,'Admin/Invit/mining','交易挖矿',1,''),(2457,'admin',1,'Admin/Config/marketo','市场配置',1,''),(2458,'admin',1,'Admin/Invit/recharge','充值挖矿',1,''),(2459,'admin',1,'Admin/Config/joggle','接口配置',1,''),(2460,'admin',1,'Admin/Tools/cache','清理缓存',1,''),(2461,'admin',1,'Admin/Apps/index','应用首页',1,''),(2462,'admin',1,'Admin/Config/mining','交易挖矿',1,''),(2463,'admin',2,'Admin/Apps/index','应用',1,'');
/*!40000 ALTER TABLE `tw_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_bborder`
--

DROP TABLE IF EXISTS `tw_bborder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_bborder` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `account` varchar(30) NOT NULL COMMENT '会员账号',
  `type` int(11) NOT NULL COMMENT '订单类型1买2卖',
  `ordertype` int(11) NOT NULL COMMENT '交易类别1限价2市价',
  `symbol` varchar(30) NOT NULL COMMENT '交易对',
  `coin` varchar(30) NOT NULL COMMENT '币名称',
  `coinnum` decimal(20,8) NOT NULL COMMENT '交易币数量',
  `usdtnum` decimal(20,8) NOT NULL COMMENT '交易USDT数量',
  `price` decimal(20,8) NOT NULL COMMENT '交易单价',
  `xjprice` decimal(20,8) NOT NULL COMMENT '限价单价',
  `addtime` datetime NOT NULL COMMENT '添加交易',
  `tradetime` datetime NOT NULL COMMENT '成交时间',
  `fee` decimal(20,8) NOT NULL COMMENT '手续费',
  `sxfbl` float(10,2) NOT NULL COMMENT '手续费比例',
  `status` int(11) NOT NULL COMMENT '1委托2交易完成3已撤消',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='币币交易记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_bborder`
--

LOCK TABLES `tw_bborder` WRITE;
/*!40000 ALTER TABLE `tw_bborder` DISABLE KEYS */;
INSERT INTO `tw_bborder` VALUES (115,190,'8e5xt8ib@idrrate.com',1,1,'BTC/USDT','BTC',0.00000000,1690.00000000,0.00000000,10.00000000,'2022-12-06 11:04:47','0000-00-00 00:00:00',0.00000000,1.00,3),(116,190,'8e5xt8ib@idrrate.com',1,1,'BTC/USDT','BTC',0.00000000,1690.00000000,0.00000000,17197.51000000,'2022-12-08 22:46:13','0000-00-00 00:00:00',0.00000000,1.00,3),(117,190,'8e5xt8ib@idrrate.com',1,1,'BTC/USDT','BTC',0.07395455,1285.06570000,17202.66000000,17203.02100000,'2022-12-08 22:46:27','2022-12-08 22:46:27',0.00074702,1.00,2),(118,190,'8e5xt8ib@idrrate.com',1,1,'BTC/USDT','BTC',0.15744259,2737.46710000,17213.21000000,17213.21000000,'2022-12-08 23:39:15','2022-12-08 23:39:16',0.00159033,1.00,2),(119,190,'8e5xt8ib@idrrate.com',1,1,'BTC/USDT','BTC',0.00057514,10.00000000,17213.14000000,17213.14000000,'2022-12-09 00:42:51','2022-12-09 00:42:52',0.00000581,1.00,2),(120,190,'8e5xt8ib@idrrate.com',1,1,'BTC/USDT','BTC',12.91646256,224643.11680000,17218.08000000,17219.62000000,'2022-12-09 02:44:41','2022-12-09 02:44:46',0.13046932,1.00,2),(121,176,'88888',1,1,'BTC/USDT','BTC',58.68611971,999771.40030000,16865.55000000,16866.15100000,'2023-01-04 19:26:51','2023-01-04 19:26:53',0.59278909,1.00,2),(122,176,'88888',1,1,'BTC/USDT','BTC',29.34209716,499869.29980000,16865.55000000,16865.55000000,'2023-01-04 19:27:04','2023-01-04 19:27:07',0.29638482,1.00,2),(123,176,'88888',1,1,'BTC/USDT','BTC',14.67105728,249934.64990000,16865.54000000,16865.54000000,'2023-01-04 19:27:15','2023-01-04 19:27:28',0.14819250,1.00,2),(124,191,'akcy2022@gmail.com',1,1,'BTC/USDT','BTC',0.39796947,10000.00000000,24876.28000000,24881.39000000,'2023-02-16 12:17:59','2023-02-16 12:18:01',0.00401989,1.00,2),(125,191,'akcy2022@gmail.com',1,1,'BTC/USDT','BTC',0.39863032,10000.00000000,24835.04000000,24850.00000000,'2023-02-16 12:18:24','2023-02-16 12:19:03',0.00402657,1.00,3),(126,213,'jtbrown64@gmail.com',1,1,'BTC/USDT','BTC',0.02601937,736.50000000,28022.78000000,28032.00000000,'2023-04-05 15:01:37','2023-04-05 15:01:42',0.00026282,1.00,3),(127,213,'jtbrown64@gmail.com',2,1,'BTC/USDT','BTC',0.02600000,721.20365460,28018.79000000,28018.64100000,'2023-04-05 15:05:10','2023-04-05 15:05:12',7.28488540,1.00,2),(128,191,'akcy2022@gmail.com',1,1,'BTC/USDT','BTC',0.35118214,10000.00000000,28190.50000000,28194.64000000,'2023-04-05 15:32:35','2023-04-05 15:32:36',0.00354729,1.00,2),(129,191,'akcy2022@gmail.com',2,1,'BTC/USDT','BTC',1.00000000,27900.09090000,28181.91000000,28180.51000000,'2023-04-05 15:33:07','2023-04-05 15:33:11',281.81910000,1.00,2),(130,191,'akcy2022@gmail.com',2,1,'BTC/USDT','BTC',0.14778100,4124.14354897,28189.02000000,28181.90000000,'2023-04-05 15:33:46','2023-04-05 15:33:47',41.65801565,1.00,2),(131,191,'akcy2022@gmail.com',1,1,'BTC/USDT','BTC',0.99038347,28280.51000000,28269.56000000,28280.51000000,'2023-04-05 15:43:01','2023-04-05 15:43:02',0.01000387,1.00,2),(132,191,'akcy2022@gmail.com',1,1,'BTC/USDT','BTC',0.00000000,28267.61100000,0.00000000,28267.61100000,'2023-04-05 15:43:57','0000-00-00 00:00:00',0.00000000,1.00,3),(133,191,'akcy2022@gmail.com',2,1,'BTC/USDT','BTC',0.99038400,27743.17636728,28295.50000000,28293.49000000,'2023-04-05 15:44:38','2023-04-05 15:44:43',280.23410472,1.00,2),(134,191,'akcy2022@gmail.com',1,1,'BTC/USDT','BTC',0.99042785,28311.00000000,28298.77000000,28311.00000000,'2023-04-05 15:45:26','2023-04-05 15:45:27',0.01000432,1.00,2),(135,191,'akcy2022@gmail.com',2,1,'BTC/USDT','BTC',0.99042800,27745.47769012,28296.59000000,28296.59000000,'2023-04-05 15:45:52','2023-04-05 15:45:57',280.25735041,1.00,2),(136,191,'akcy2022@gmail.com',1,1,'BTC/USDT','BTC',0.99062037,28279.62000000,28261.91000000,28279.62000000,'2023-04-05 15:47:19','2023-04-05 15:47:22',0.01000627,1.00,3),(137,207,'Yomi@gmail.com',1,1,'BTC/USDT','BTC',0.99081149,28265.50000000,28242.35000000,28265.50000000,'2023-04-05 15:55:56','2023-04-05 15:55:57',0.01000820,1.00,2),(138,207,'Yomi@gmail.com',2,1,'BTC/USDT','BTC',0.99081000,27710.96912595,28250.50000000,28250.50000000,'2023-04-05 15:56:29','2023-04-05 15:56:31',279.90877905,1.00,2),(139,207,'Yomi@gmail.com',1,1,'BTC/USDT','BTC',0.99168234,28288.51000000,28240.52000000,28288.51000000,'2023-04-05 15:57:02','2023-04-05 15:57:07',0.01001699,1.00,2),(140,207,'Yomi@gmail.com',2,1,'BTC/USDT','BTC',0.99168300,27738.71337290,28253.89000000,28246.78000000,'2023-04-05 15:58:04','2023-04-05 15:58:06',280.18902397,1.00,2),(141,207,'Yomi@gmail.com',1,1,'BTC/USDT','BTC',0.99105093,28290.49000000,28260.49000000,28290.49000000,'2023-04-05 15:58:30','2023-04-05 15:58:32',0.01001062,1.00,2),(142,207,'Yomi@gmail.com',1,1,'BTC/USDT','BTC',0.99872224,28500.93000000,28252.02000000,28500.93000000,'2023-04-05 15:59:06','2023-04-05 15:59:07',0.01008810,1.00,2),(143,207,'Yomi@gmail.com',2,1,'BTC/USDT','BTC',1.98977400,0.00000000,0.00000000,28254.99000000,'2023-04-05 15:59:36','0000-00-00 00:00:00',0.00000000,1.00,3),(144,207,'Yomi@gmail.com',2,1,'BTC/USDT','BTC',1.98977400,55630.27082177,28240.49000000,28237.23000000,'2023-04-05 16:00:14','2023-04-05 16:00:16',561.92192749,1.00,2),(145,207,'Yomi@gmail.com',1,1,'BTC/USDT','BTC',1.05117258,30000.89000000,28255.00000000,30000.89000000,'2023-04-05 16:00:43','2023-04-05 16:00:47',0.01061790,1.00,3),(146,196,'laola@163.com',1,1,'BTC/USDT','BTC',1.75101550,50000.00000000,28269.31000000,28285.84000000,'2023-04-20 18:04:17','2023-04-20 18:04:21',0.01768703,1.00,3),(147,196,'laola@163.com',1,1,'BTC/USDT','BTC',1.74753764,50000.00000000,28325.57000000,28350.52000000,'2023-04-20 18:12:26','2023-04-20 18:12:26',0.01765190,1.00,2),(148,196,'laola@163.com',2,1,'BTC/USDT','BTC',1.74753700,0.00000000,0.00000000,28326.95000000,'2023-04-20 18:13:23','0000-00-00 00:00:00',0.00000000,1.00,3),(149,196,'laola@163.com',2,1,'BTC/USDT','BTC',1.74753700,49004.13407468,28325.08000000,28325.08000000,'2023-04-20 18:13:53','2023-04-20 18:13:57',494.99125328,1.00,2),(150,195,'tianw@163.com',1,1,'BTC/USDT','BTC',1.74607671,50000.00000000,28349.27000000,28359.27000000,'2023-04-20 18:17:27','2023-04-20 18:17:31',0.01763714,1.00,3),(151,195,'tianw@163.com',2,1,'BTC/USDT','BTC',1.74607600,0.00000000,0.00000000,28351.76000000,'2023-04-20 18:18:07','0000-00-00 00:00:00',0.00000000,1.00,3),(152,195,'tianw@163.com',2,1,'BTC/USDT','BTC',1.74607600,48933.12162935,28307.70000000,28305.97000000,'2023-04-20 18:19:41','2023-04-20 18:20:12',494.27395585,1.00,2),(153,225,'1900553000@qq.com',1,1,'BTC/USDT','BTC',0.00136803,100.00000000,72366.95000000,72374.46000000,'2024-03-11 15:34:59','2024-03-11 15:35:02',0.00001382,1.00,2),(154,225,'1900553000@qq.com',1,1,'BTC/USDT','BTC',0.00990558,704.32100000,70392.40000000,70432.10000000,'2024-03-26 03:55:28','2024-03-26 04:01:02',0.00010006,1.00,2),(155,225,'1900553000@qq.com',1,1,'BTC/USDT','BTC',0.99001152,70475.87000000,70475.05000000,70475.87000000,'2024-03-26 03:58:04','2024-03-26 04:00:02',0.01000012,1.00,2),(156,225,'1900553000@qq.com',1,2,'BTC/USDT','BTC',0.01423050,1000.00000000,70271.60000000,70271.60000000,'2024-03-27 00:49:38','2024-03-27 00:49:38',0.00014231,1.00,2),(157,225,'1900553000@qq.com',1,1,'EOS/USDT','EOS',100.09262690,108.06000000,1.07960000,1.08060000,'2024-03-27 09:12:51','2024-03-27 09:35:01',0.00000000,0.00,2),(158,225,'1900553000@qq.com',1,1,'BTC/USDT','BTC',0.00000000,5133.93720000,0.00000000,68747.02000000,'2024-05-25 00:34:01','0000-00-00 00:00:00',0.00000000,1.00,1),(159,225,'1900553000@qq.com',1,1,'BTC/USDT','BTC',0.00000000,137.50440000,0.00000000,68752.19000000,'2024-05-25 00:34:10','0000-00-00 00:00:00',0.00000000,1.00,1),(160,225,'1900553000@qq.com',1,1,'BTC/USDT','BTC',0.00000000,137.50440000,0.00000000,68752.19000000,'2024-05-25 00:34:12','0000-00-00 00:00:00',0.00000000,1.00,1),(161,225,'1900553000@qq.com',1,1,'BTC/USDT','BTC',0.00000000,137.50440000,0.00000000,68752.19000000,'2024-05-25 00:34:13','0000-00-00 00:00:00',0.00000000,1.00,1);
/*!40000 ALTER TABLE `tw_bborder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_bbsetting`
--

DROP TABLE IF EXISTS `tw_bbsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_bbsetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `bb_kstime` varchar(30) NOT NULL COMMENT '开市时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='币币交易设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_bbsetting`
--

LOCK TABLES `tw_bbsetting` WRITE;
/*!40000 ALTER TABLE `tw_bbsetting` DISABLE KEYS */;
INSERT INTO `tw_bbsetting` VALUES (1,'00:00~24.00');
/*!40000 ALTER TABLE `tw_bbsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_bill`
--

DROP TABLE IF EXISTS `tw_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `username` varchar(60) NOT NULL COMMENT '会员账号',
  `num` decimal(10,4) NOT NULL COMMENT '操作金额',
  `coinname` varchar(30) NOT NULL COMMENT '币名称',
  `afternum` decimal(10,4) NOT NULL COMMENT '操作后余额',
  `type` int(11) NOT NULL COMMENT '1充币2提币3购买合约4出售合约5购买矿机6购机奖励7矿机收益冻结8释放冻结收益9币币交易USDT10币币交易币种11认购扣除12认购增加13一代认购奖励14二代认购奖励15三代认购奖励16提币退回17充币成功',
  `addtime` datetime NOT NULL COMMENT '操作时间',
  `st` int(11) NOT NULL COMMENT '1增加2减少',
  `remark` varchar(225) NOT NULL COMMENT '操作说明',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3866 DEFAULT CHARSET=utf8 COMMENT='操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_bill`
--

LOCK TABLES `tw_bill` WRITE;
/*!40000 ALTER TABLE `tw_bill` DISABLE KEYS */;
INSERT INTO `tw_bill` VALUES (3422,176,'88888',999999.9999,'usdt',999999.9999,17,'2022-11-24 02:55:33',1,'充币到账'),(3423,176,'88888',999999.9999,'usdt',999999.9999,17,'2022-11-24 02:55:36',1,'充币到账'),(3424,178,'wang123899@yahoo.com',300.0000,'usdt',1200.0000,17,'0000-00-00 00:00:00',1,'充币'),(3425,183,'shenwansan168@163.com',3000.0000,'usdt',3000.0000,17,'0000-00-00 00:00:00',1,'充币'),(3426,183,'shenwansan168@163.com',0.1000,'usdt',3000.1000,17,'0000-00-00 00:00:00',1,'充币'),(3427,187,'zhangweini19595@yahoo.com',100000.0000,'eos',100000.0000,17,'0000-00-00 00:00:00',1,'充币'),(3428,187,'zhangweini19595@yahoo.com',100000.0000,'usdt',100000.0000,17,'0000-00-00 00:00:00',1,'充币'),(3429,187,'zhangweini19595@yahoo.com',10000.0000,'usdt',90000.0000,3,'2022-12-04 21:39:07',2,'BuyBTC/USDTQuick Margin'),(3430,187,'zhangweini19595@yahoo.com',10000.0000,'usdt',79900.0000,3,'2022-12-04 21:39:25',2,'购买BTC/USDT秒合约'),(3431,187,'zhangweini19595@yahoo.com',2000.0000,'usdt',77800.0000,3,'2022-12-04 21:55:06',2,'BuyBTC/USDTQuick Margin'),(3432,190,'8e5xt8ib@idrrate.com',100.0000,'eth',100.0000,17,'0000-00-00 00:00:00',1,'充币'),(3433,190,'8e5xt8ib@idrrate.com',8000.0000,'usdt',8000.0000,17,'0000-00-00 00:00:00',1,'充币'),(3434,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',7500.0000,3,'2022-12-04 22:12:06',2,'BuyETH/USDTQuick Margin'),(3435,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',6995.0000,3,'2022-12-04 22:14:58',2,'BuyETH/USDTQuick Margin'),(3436,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',6490.0000,3,'2022-12-05 21:02:19',2,'BuyBTC/USDTQuick Margin'),(3437,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',5985.0000,3,'2022-12-05 21:12:15',2,'BuyBTC/USDTQuick Margin'),(3438,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',5480.0000,3,'2022-12-05 21:14:52',2,'BuyBTC/USDTQuick Margin'),(3439,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',4975.0000,3,'2022-12-05 21:48:06',2,'BuyBTC/USDTQuick Margin'),(3440,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',4470.0000,3,'2022-12-05 09:14:20',2,'BuyBTC/USDTQuick Margin'),(3441,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',3965.0000,3,'2022-12-06 06:35:20',2,'BuyBTC/USDTQuick Margin'),(3442,187,'zhangweini19595@yahoo.com',18000.0000,'usdt',113780.0000,4,'2022-12-06 07:24:42',1,'Contract sale'),(3443,187,'zhangweini19595@yahoo.com',17000.0000,'usdt',129780.0000,4,'2022-12-06 07:24:42',1,'Contract sale'),(3444,187,'zhangweini19595@yahoo.com',2800.0000,'usdt',118380.0000,4,'2022-12-06 07:24:42',1,'Contract sale'),(3445,190,'8e5xt8ib@idrrate.com',700.0000,'usdt',5360.0000,4,'2022-12-06 07:24:43',1,'Contract sale'),(3446,190,'8e5xt8ib@idrrate.com',700.0000,'usdt',6060.0000,4,'2022-12-06 07:35:49',1,'Contract sale'),(3447,190,'8e5xt8ib@idrrate.com',700.0000,'usdt',6760.0000,4,'2022-12-06 07:35:50',1,'Contract sale'),(3448,190,'8e5xt8ib@idrrate.com',700.0000,'usdt',7460.0000,4,'2022-12-06 07:35:50',1,'Contract sale'),(3449,191,'akcy2022@gmail.com',100000.0000,'usdt',100000.0000,17,'0000-00-00 00:00:00',1,'充币'),(3450,191,'akcy2022@gmail.com',10000.0000,'usdt',90000.0000,3,'2022-12-06 07:47:38',2,'BuyBTC/USDTQuick Margin'),(3451,191,'akcy2022@gmail.com',14000.0000,'usdt',117900.0000,4,'2022-12-06 07:49:02',1,'Contract sale'),(3452,191,'akcy2022@gmail.com',1000.0000,'usdt',102900.0000,3,'2022-12-06 07:49:38',2,'BuyBTC/USDTQuick Margin'),(3453,191,'akcy2022@gmail.com',1500.0000,'usdt',105890.0000,4,'2022-12-06 07:52:02',1,'Contract sale'),(3454,191,'akcy2022@gmail.com',1000.0000,'usdt',103390.0000,3,'2022-12-06 07:52:50',2,'BuyBTC/USDTQuick Margin'),(3455,191,'akcy2022@gmail.com',1700.0000,'usdt',106780.0000,4,'2022-12-06 07:56:02',1,'Contract sale'),(3456,191,'akcy2022@gmail.com',1000.0000,'usdt',104080.0000,3,'2022-12-06 07:57:12',2,'BuyBTC/USDTQuick Margin'),(3457,191,'akcy2022@gmail.com',2000.0000,'usdt',108070.0000,4,'2022-12-06 08:03:01',1,'Contract sale'),(3458,191,'akcy2022@gmail.com',1000.0000,'usdt',105070.0000,3,'2022-12-06 08:06:16',2,'BuyBTC/USDTQuick Margin'),(3459,191,'akcy2022@gmail.com',3000.0000,'usdt',111060.0000,4,'2022-12-06 08:15:07',1,'Contract sale'),(3460,191,'akcy2022@gmail.com',1000.0000,'usdt',107060.0000,3,'2022-12-06 08:21:20',2,'BuyBTC/USDTQuick Margin'),(3461,190,'8e5xt8ib@idrrate.com',0.0740,'btc',0.0740,10,'2022-12-08 22:46:27',1,'Currency transaction price limit purchase entrustment transaction'),(3462,190,'8e5xt8ib@idrrate.com',1285.0657,'usdt',2499.8686,9,'2022-12-08 22:46:28',2,'Currency transaction price limit purchase entrustment transaction'),(3463,190,'8e5xt8ib@idrrate.com',0.1574,'btc',0.2314,10,'2022-12-08 23:39:16',1,'Currency transaction price limit purchase entrustment transaction'),(3464,190,'8e5xt8ib@idrrate.com',2737.4671,'usdt',0.0001,9,'2022-12-08 23:39:17',2,'Currency transaction price limit purchase entrustment transaction'),(3465,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',2237.4672,3,'2022-12-08 23:39:58',2,'BuyBTC/USDTQuick Margin'),(3466,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',1732.4672,3,'2022-12-08 23:42:02',2,'BuyBTC/USDTQuick Margin'),(3467,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',1227.4672,3,'2022-12-08 23:42:06',2,'BuyBTC/USDTQuick Margin'),(3468,190,'8e5xt8ib@idrrate.com',700.0000,'usdt',2622.4672,4,'2022-12-08 23:44:01',1,'Contract sale'),(3469,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',1422.4672,3,'2022-12-09 00:31:25',2,'BuyBTC/USDTQuick Margin'),(3470,190,'8e5xt8ib@idrrate.com',0.0006,'btc',0.2320,10,'2022-12-09 00:42:52',1,'Currency transaction price limit purchase entrustment transaction'),(3471,190,'8e5xt8ib@idrrate.com',10.0000,'usdt',1397.4672,9,'2022-12-09 00:42:52',2,'Currency transaction price limit purchase entrustment transaction'),(3472,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',907.4672,3,'2022-12-09 02:11:53',2,'BuyBTC/USDTQuick Margin'),(3473,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',402.4672,3,'2022-12-09 02:25:24',2,'BuyBTC/USDTQuick Margin'),(3474,190,'8e5xt8ib@idrrate.com',900000.0000,'usdt',900397.4672,17,'0000-00-00 00:00:00',1,'充币'),(3475,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',899897.4672,3,'2022-12-09 02:37:52',2,'BuyBTC/USDTQuick Margin'),(3476,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',899392.4672,3,'2022-12-09 02:37:53',2,'BuyBTC/USDTQuick Margin'),(3477,190,'8e5xt8ib@idrrate.com',700.0000,'usdt',900787.4672,4,'2022-12-09 02:39:01',1,'Contract sale'),(3478,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',899587.4672,3,'2022-12-09 02:40:37',2,'BuyBTC/USDTQuick Margin'),(3479,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',899082.4672,3,'2022-12-09 02:42:24',2,'BuyBTC/USDTQuick Margin'),(3480,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',898577.4672,3,'2022-12-09 02:44:34',2,'BuyBTC/USDTQuick Margin'),(3481,190,'8e5xt8ib@idrrate.com',12.9165,'btc',13.1484,10,'2022-12-09 02:44:46',1,'Currency transaction price limit purchase entrustment transaction'),(3482,190,'8e5xt8ib@idrrate.com',224643.1168,'usdt',449286.2336,9,'2022-12-09 02:44:46',2,'Currency transaction price limit purchase entrustment transaction'),(3483,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',673429.3504,3,'2022-12-09 02:47:22',2,'BuyBTC/USDTQuick Margin'),(3484,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',672924.3504,3,'2022-12-09 02:47:22',2,'BuyBTC/USDTQuick Margin'),(3485,190,'8e5xt8ib@idrrate.com',500.0000,'usdt',672419.3504,3,'2022-12-09 02:48:58',2,'BuyBTC/USDTQuick Margin'),(3486,191,'akcy2022@gmail.com',12588.0000,'usdt',94462.0000,3,'2022-12-09 06:10:26',2,'BuyBTC/USDTQuick Margin'),(3487,191,'akcy2022@gmail.com',1.0000,'usdt',94335.1200,5,'2022-12-11 13:29:01',2,'购买矿机'),(3488,191,'akcy2022@gmail.com',500.0000,'usdt',93835.1200,5,'2022-12-11 13:30:45',2,'购买矿机'),(3489,191,'akcy2022@gmail.com',500.0000,'usdt',93335.1200,5,'2022-12-11 13:45:39',2,'购买矿机'),(3490,191,'akcy2022@gmail.com',3000.0000,'usdt',90335.1200,5,'2022-12-11 13:45:45',2,'购买矿机'),(3491,191,'akcy2022@gmail.com',10000.0000,'usdt',80335.1200,5,'2022-12-11 13:45:52',2,'购买矿机'),(3492,191,'akcy2022@gmail.com',50000.0000,'usdt',30335.1200,5,'2022-12-11 13:45:59',2,'购买矿机'),(3493,191,'akcy2022@gmail.com',50000.0000,'usdt',80335.1200,17,'0000-00-00 00:00:00',1,'充币'),(3494,191,'akcy2022@gmail.com',34588.0000,'usdt',45747.1200,3,'2022-12-13 11:38:03',2,'BuyBTC/USDTQuick Margin'),(3495,191,'akcy2022@gmail.com',48423.2000,'usdt',142247.6400,4,'2022-12-13 11:40:02',1,'Contract sale'),(3496,191,'akcy2022@gmail.com',46750.0000,'usdt',47074.4400,3,'2022-12-13 11:40:31',2,'BuyBTC/USDTQuick Margin'),(3497,191,'akcy2022@gmail.com',70125.0000,'usdt',186856.9400,4,'2022-12-13 11:43:02',1,'Contract sale'),(3498,191,'akcy2022@gmail.com',66758.0000,'usdt',49973.9400,3,'2022-12-13 11:43:33',2,'BuyBTC/USDTQuick Margin'),(3499,191,'akcy2022@gmail.com',93461.2000,'usdt',236228.7600,4,'2022-12-13 11:45:01',1,'Contract sale'),(3500,191,'akcy2022@gmail.com',87650.0000,'usdt',55117.5600,3,'2022-12-13 11:45:42',2,'BuyBTC/USDTQuick Margin'),(3501,191,'akcy2022@gmail.com',122710.0000,'usdt',299661.0600,4,'2022-12-13 11:47:01',1,'Contract sale'),(3502,196,'laola@163.com',100000.0000,'usdt',100000.0000,17,'0000-00-00 00:00:00',1,'充币'),(3503,195,'tianw@163.com',87564.0000,'usdt',87564.0000,17,'0000-00-00 00:00:00',1,'充币'),(3504,194,'haizi@163.com',89877.0000,'usdt',89877.0000,17,'0000-00-00 00:00:00',1,'充币'),(3505,193,'pangzi@163.com',91152.0000,'usdt',91152.0000,17,'0000-00-00 00:00:00',1,'充币'),(3506,176,'88888',500.0000,'usdt',999999.9999,3,'2022-12-13 17:54:43',2,'BuyBTC/USDTQuick Margin'),(3507,191,'akcy2022@gmail.com',25888.0000,'usdt',151063.0600,3,'2022-12-14 10:01:39',2,'BuyBTC/USDTQuick Margin'),(3508,191,'akcy2022@gmail.com',36243.2000,'usdt',223290.5800,4,'2022-12-14 10:03:02',1,'Contract sale'),(3509,191,'akcy2022@gmail.com',2588.0000,'usdt',184459.3800,3,'2022-12-14 10:03:36',2,'BuyBTC/USDTQuick Margin'),(3510,191,'akcy2022@gmail.com',3623.2000,'usdt',191679.9000,4,'2022-12-14 10:05:01',1,'Contract sale'),(3511,191,'akcy2022@gmail.com',2588.0000,'usdt',185468.7000,3,'2022-12-14 10:05:27',2,'BuyBTC/USDTQuick Margin'),(3512,191,'akcy2022@gmail.com',2588.0000,'usdt',182854.8200,3,'2022-12-14 10:07:11',2,'BuyBTC/USDTQuick Margin'),(3513,191,'akcy2022@gmail.com',2588.0000,'usdt',180240.9400,3,'2022-12-14 10:10:59',2,'BuyBTC/USDTQuick Margin'),(3514,191,'akcy2022@gmail.com',2588.0000,'usdt',177627.0600,3,'2022-12-14 10:12:42',2,'BuyBTC/USDTQuick Margin'),(3515,191,'akcy2022@gmail.com',2588.0000,'usdt',175013.1800,3,'2022-12-14 10:21:14',2,'BuyBTC/USDTQuick Margin'),(3516,194,'haizi@163.com',63885.0000,'usdt',25992.0000,3,'2022-12-17 14:32:06',2,'BuyBTC/USDTQuick Margin'),(3517,194,'haizi@163.com',95827.5000,'usdt',217008.1500,4,'2022-12-17 14:35:01',1,'Contract sale'),(3518,191,'akcy2022@gmail.com',50000.0000,'usdt',124987.3000,3,'2022-12-21 10:46:14',2,'BuyBTC/USDTQuick Margin'),(3519,194,'haizi@163.com',1000.0000,'usdt',120180.6500,3,'2022-12-21 16:31:28',2,'BuyBTC/USDTQuick Margin'),(3520,194,'haizi@163.com',1000.0000,'usdt',119170.6500,3,'2022-12-21 16:31:28',2,'BuyBTC/USDTQuick Margin'),(3521,194,'haizi@163.com',1400.0000,'usdt',121960.6500,4,'2022-12-21 16:32:32',1,'Contract sale'),(3522,199,'germangarcia199078@gmail.com',1060.0000,'usdt',1060.0000,17,'2023-01-02 18:32:09',1,'充币到账'),(3523,191,'akcy2022@gmail.com',5000.0000,'usdt',119487.3000,3,'2023-01-04 18:01:20',2,'BuyBTC/USDTQuick Margin'),(3524,191,'akcy2022@gmail.com',7000.0000,'usdt',133437.3000,4,'2023-01-04 18:02:22',1,'Contract sale'),(3525,191,'akcy2022@gmail.com',62558.0000,'usdt',63879.3000,3,'2023-01-04 18:05:28',2,'BuyBTC/USDTQuick Margin'),(3526,191,'akcy2022@gmail.com',62558.0000,'usdt',695.7200,3,'2023-01-04 18:05:34',2,'BuyBTC/USDTQuick Margin'),(3527,199,'germangarcia199078@gmail.com',1022.0000,'usdt',38.0000,3,'2023-01-04 18:05:40',2,'BuyBTC/USDTQuick Margin'),(3528,191,'akcy2022@gmail.com',87581.2000,'usdt',175232.5400,4,'2023-01-04 18:06:32',1,'Contract sale'),(3529,191,'akcy2022@gmail.com',87581.2000,'usdt',262813.7400,4,'2023-01-04 18:06:38',1,'Contract sale'),(3530,199,'germangarcia199078@gmail.com',1430.8000,'usdt',2889.3800,4,'2023-01-04 18:06:48',1,'Contract sale'),(3531,176,'88888',58.6861,'btc',58.6861,10,'2023-01-04 19:26:53',1,'Currency transaction price limit purchase entrustment transaction'),(3532,176,'88888',999771.4003,'usdt',-32.8006,9,'2023-01-04 19:26:53',2,'Currency transaction price limit purchase entrustment transaction'),(3533,176,'88888',29.3421,'btc',88.0282,10,'2023-01-04 19:27:07',1,'Currency transaction price limit purchase entrustment transaction'),(3534,176,'88888',499869.2998,'usdt',0.0001,9,'2023-01-04 19:27:07',2,'Currency transaction price limit purchase entrustment transaction'),(3535,176,'88888',14.6711,'btc',102.6993,10,'2023-01-04 19:27:28',1,'Currency transaction price limit purchase entrustment transaction'),(3536,176,'88888',249934.6499,'usdt',0.0001,9,'2023-01-04 19:27:28',2,'Currency transaction price limit purchase entrustment transaction'),(3537,176,'88888',5800.0000,'usdt',244134.6500,3,'2023-01-04 19:27:32',2,'购买BTC/USDT秒合约'),(3538,176,'88888',5000.0000,'usdt',239076.6500,3,'2023-01-05 09:49:18',2,'BuyBTC/USDTQuick Margin'),(3539,176,'88888',5000.0000,'usdt',234026.6500,3,'2023-01-05 11:45:21',2,'BuyBTC/USDTQuick Margin'),(3540,191,'akcy2022@gmail.com',66680.0000,'usdt',108552.5400,3,'2023-01-06 18:00:02',2,'BuyBTC/USDTQuick Margin'),(3541,199,'germangarcia199078@gmail.com',1408.0000,'usdt',50.5800,3,'2023-01-06 18:00:14',2,'BuyBTC/USDTQuick Margin'),(3542,191,'akcy2022@gmail.com',66680.0000,'usdt',41205.7400,3,'2023-01-06 18:02:49',2,'BuyBTC/USDTQuick Margin'),(3543,191,'akcy2022@gmail.com',93352.0000,'usdt',227242.9400,4,'2023-01-06 18:03:52',1,'Contract sale'),(3544,191,'akcy2022@gmail.com',0.3980,'btc',0.3980,10,'2023-02-16 12:18:01',1,'Currency transaction price limit purchase entrustment transaction'),(3545,191,'akcy2022@gmail.com',10000.0000,'usdt',113890.9400,9,'2023-02-16 12:18:01',2,'Currency transaction price limit purchase entrustment transaction'),(3546,191,'akcy2022@gmail.com',0.3986,'btc',0.7966,10,'2023-02-16 12:18:26',1,'Currency transaction price limit purchase entrustment transaction'),(3547,191,'akcy2022@gmail.com',10000.0000,'usdt',103890.9400,9,'2023-02-16 12:18:26',2,'Currency transaction price limit purchase entrustment transaction'),(3548,191,'akcy2022@gmail.com',10000.0000,'usdt',133890.9400,3,'2023-02-16 12:19:55',2,'购买BTC/USDT秒合约'),(3549,191,'akcy2022@gmail.com',14000.0000,'usdt',161790.9400,4,'2023-02-16 12:20:57',1,'Contract sale'),(3550,208,'nora@gmail.com',343223.0000,'usdt',343223.0000,17,'0000-00-00 00:00:00',1,'充币'),(3551,207,'Yomi@gmail.com',424446.0000,'usdt',424446.0000,17,'0000-00-00 00:00:00',1,'充币'),(3552,206,'laura@gmail.com',356433.0000,'usdt',356433.0000,17,'0000-00-00 00:00:00',1,'充币'),(3553,204,'namin@gmail.com',232215.0000,'usdt',232215.0000,17,'0000-00-00 00:00:00',1,'充币'),(3554,202,'laola@gmail.com',435554.0000,'usdt',435554.0000,17,'0000-00-00 00:00:00',1,'充币'),(3555,207,'Yomi@gmail.com',500.0000,'usdt',423946.0000,3,'2023-02-19 20:50:52',2,'购买BTC/USDT秒合约'),(3556,207,'Yomi@gmail.com',500.0000,'usdt',423441.0000,3,'2023-02-19 20:51:03',2,'购买BTC/USDT秒合约'),(3557,207,'Yomi@gmail.com',5000.0000,'usdt',418436.0000,3,'2023-02-19 20:51:15',2,'购买BTC/USDT秒合约'),(3558,207,'Yomi@gmail.com',750.0000,'usdt',419886.0000,4,'2023-02-19 20:53:06',1,'Contract sale'),(3559,207,'Yomi@gmail.com',8500.0000,'usdt',436136.0000,4,'2023-02-19 20:54:17',1,'Contract sale'),(3560,206,'laura@gmail.com',1000.0000,'usdt',355433.0000,3,'2023-02-19 21:17:38',2,'购买BTC/USDT秒合约'),(3561,206,'laura@gmail.com',2000.0000,'usdt',353423.0000,3,'2023-02-19 21:20:15',2,'购买BTC/USDT秒合约'),(3562,191,'akcy2022@gmail.com',58600.0000,'usdt',89190.9400,3,'2023-02-21 16:55:57',2,'BuyBTC/USDTQuick Margin'),(3563,191,'akcy2022@gmail.com',82040.0000,'usdt',252684.9400,4,'2023-02-21 16:56:57',1,'Contract sale'),(3564,206,'laura@gmail.com',1000.0000,'usdt',352403.0000,3,'2023-02-21 20:56:20',2,'BuyBTC/USDTQuick Margin'),(3565,206,'laura@gmail.com',1000.0000,'usdt',351393.0000,3,'2023-02-21 21:01:32',2,'BuyBTC/USDTQuick Margin'),(3566,206,'laura@gmail.com',1400.0000,'usdt',354183.0000,4,'2023-02-21 21:02:37',1,'Contract sale'),(3567,206,'laura@gmail.com',1000.0000,'usdt',351783.0000,3,'2023-02-21 21:03:35',2,'BuyBTC/USDTQuick Margin'),(3568,207,'Yomi@gmail.com',1000.0000,'usdt',426636.0000,3,'2023-02-21 21:03:35',2,'BuyBTC/USDTQuick Margin'),(3569,207,'Yomi@gmail.com',1000.0000,'usdt',425626.0000,3,'2023-02-24 16:00:07',2,'购买BTC/USDT秒合约'),(3570,202,'laola@gmail.com',1000.0000,'usdt',434554.0000,3,'2023-02-24 16:00:40',2,'购买BTC/USDT秒合约'),(3571,191,'akcy2022@gmail.com',1000.0000,'usdt',169644.9400,3,'2023-02-24 16:02:22',2,'购买BTC/USDT秒合约'),(3572,207,'Yomi@gmail.com',2000.0000,'usdt',423616.0000,3,'2023-02-24 16:02:37',2,'购买BTC/USDT秒合约'),(3573,202,'laola@gmail.com',5000.0000,'usdt',429544.0000,3,'2023-02-24 16:03:00',2,'购买BTC/USDT秒合约'),(3574,206,'laura@gmail.com',1000.0000,'usdt',350773.0000,3,'2023-02-24 16:03:09',2,'购买BTC/USDT秒合约'),(3575,207,'Yomi@gmail.com',2800.0000,'usdt',429196.0000,4,'2023-02-24 16:03:42',1,'Contract sale'),(3576,202,'laola@gmail.com',7000.0000,'usdt',443494.0000,4,'2023-02-24 16:04:01',1,'Contract sale'),(3577,206,'laura@gmail.com',1400.0000,'usdt',353563.0000,4,'2023-02-24 16:04:12',1,'Contract sale'),(3578,202,'laola@gmail.com',5000.0000,'usdt',431494.0000,3,'2023-02-24 16:04:52',2,'购买BTC/USDT秒合约'),(3579,202,'laola@gmail.com',7000.0000,'usdt',445444.0000,4,'2023-02-24 16:05:56',1,'Contract sale'),(3580,207,'Yomi@gmail.com',58000.0000,'usdt',368396.0000,3,'2023-02-24 17:49:20',2,'BuyBTC/USDTQuick Margin'),(3581,207,'Yomi@gmail.com',58837.0000,'usdt',308979.0000,3,'2023-02-24 17:49:51',2,'BuyBTC/USDTQuick Margin'),(3582,207,'Yomi@gmail.com',81200.0000,'usdt',470790.6300,4,'2023-02-24 17:50:21',1,'Contract sale'),(3583,207,'Yomi@gmail.com',82371.8000,'usdt',554334.2300,4,'2023-02-24 17:50:52',1,'Contract sale'),(3584,206,'laura@gmail.com',58500.0000,'usdt',293663.0000,3,'2023-02-26 14:44:13',2,'KaufBTC/USDTVertrag'),(3585,206,'laura@gmail.com',81900.0000,'usdt',456878.0000,4,'2023-02-26 14:45:16',1,'Contract sale'),(3586,207,'Yomi@gmail.com',2000.0000,'usdt',469962.4300,3,'2023-02-27 11:50:19',2,'BuyBTC/USDTQuick Margin'),(3587,207,'Yomi@gmail.com',2800.0000,'usdt',475542.4300,4,'2023-02-27 11:51:21',1,'Contract sale'),(3588,207,'Yomi@gmail.com',58500.0000,'usdt',414242.4300,3,'2023-02-27 18:00:01',2,'BuyBTC/USDTQuick Margin'),(3589,207,'Yomi@gmail.com',81900.0000,'usdt',577457.4300,4,'2023-02-27 18:01:01',1,'Contract sale'),(3590,206,'laura@gmail.com',58000.0000,'usdt',316978.0000,3,'2023-02-27 18:55:03',2,'BuyBTC/USDTQuick Margin'),(3591,206,'laura@gmail.com',81200.0000,'usdt',478798.0000,4,'2023-02-27 18:56:06',1,'Contract sale'),(3592,207,'Yomi@gmail.com',999999.9999,'usdt',999999.9999,17,'2023-03-03 14:19:55',1,'充币到账'),(3593,206,'laura@gmail.com',60000.0000,'usdt',337598.0000,3,'2023-03-06 13:58:30',2,'BuyBTC/USDTQuick Margin'),(3594,206,'laura@gmail.com',60000.0000,'usdt',276998.0000,3,'2023-03-06 13:58:30',2,'BuyBTC/USDTQuick Margin'),(3595,206,'laura@gmail.com',84000.0000,'usdt',444398.0000,4,'2023-03-06 13:59:31',1,'Contract sale'),(3596,207,'Yomi@gmail.com',58000.0000,'usdt',999999.9999,3,'2023-03-06 16:30:01',2,'BuyBTC/USDTQuick Margin'),(3597,207,'Yomi@gmail.com',81200.0000,'usdt',999999.9999,4,'2023-03-06 16:31:01',1,'Contract sale'),(3598,191,'akcy2022@gmail.com',125820.0000,'usdt',43814.9400,3,'2023-03-10 13:31:46',2,'BuyBTC/USDTQuick Margin'),(3599,191,'akcy2022@gmail.com',188730.0000,'usdt',420016.7400,4,'2023-03-10 13:33:47',1,'Contract sale'),(3600,199,'germangarcia199078@gmail.com',5221.2900,'usdt',5257.7900,17,'2023-03-13 12:57:07',1,'充币到账'),(3610,199,'germangarcia199078@gmail.com',1000.0000,'usdt',6242.1100,3,'2023-03-14 16:47:38',2,'购买BTC/USDT秒合约'),(3602,191,'akcy2022@gmail.com',66580.0000,'usdt',164706.7400,3,'2023-03-14 16:01:22',2,'BuyBTC/USDTQuick Margin'),(3603,191,'akcy2022@gmail.com',93212.0000,'usdt',350464.9400,4,'2023-03-14 16:02:22',1,'Contract sale'),(3604,199,'germangarcia199078@gmail.com',7123.2000,'usdt',7242.1100,17,'0000-00-00 00:00:00',1,'充币'),(3605,207,'Yomi@gmail.com',999999.9999,'usdt',318177.4300,2,'2023-03-14 16:07:35',2,'提币申请'),(3606,191,'akcy2022@gmail.com',66580.0000,'usdt',190672.9400,3,'2023-03-14 16:10:02',2,'BuyBTC/USDTQuick Margin'),(3607,191,'akcy2022@gmail.com',93212.0000,'usdt',376431.1400,4,'2023-03-14 16:11:06',1,'Contract sale'),(3608,207,'Yomi@gmail.com',58000.0000,'usdt',260177.4300,3,'2023-03-14 16:29:49',2,'BuyBTC/USDTQuick Margin'),(3609,207,'Yomi@gmail.com',81200.0000,'usdt',421997.4300,4,'2023-03-14 16:30:52',1,'Contract sale'),(3611,199,'germangarcia199078@gmail.com',1400.0000,'usdt',9032.1100,4,'2023-03-14 16:48:42',1,'Contract sale'),(3612,199,'germangarcia199078@gmail.com',190.0000,'usdt',7442.1100,2,'2023-03-14 16:50:56',2,'提币申请'),(3613,199,'germangarcia199078@gmail.com',200.0000,'usdt',7242.1100,2,'2023-03-14 16:51:29',2,'提币申请'),(3614,191,'akcy2022@gmail.com',68580.0000,'usdt',214639.1400,3,'2023-03-17 14:59:41',2,'BuyBTC/USDTQuick Margin'),(3615,199,'germangarcia199078@gmail.com',7120.0000,'usdt',122.1100,3,'2023-03-17 15:00:33',2,'BuyBTC/USDTQuick Margin'),(3616,191,'akcy2022@gmail.com',96012.0000,'usdt',405977.3400,4,'2023-03-17 15:00:44',1,'Contract sale'),(3617,199,'germangarcia199078@gmail.com',9968.0000,'usdt',19986.9100,4,'2023-03-17 15:01:37',1,'Contract sale'),(3618,191,'akcy2022@gmail.com',65888.0000,'usdt',244077.3400,3,'2023-03-21 13:59:42',2,'BuyBTC/USDTQuick Margin'),(3619,199,'germangarcia199078@gmail.com',9900.0000,'usdt',118.9100,3,'2023-03-21 14:00:04',2,'BuyBTC/USDTQuick Margin'),(3620,191,'akcy2022@gmail.com',92243.2000,'usdt',427904.8600,4,'2023-03-21 14:00:42',1,'Contract sale'),(3621,199,'germangarcia199078@gmail.com',13860.0000,'usdt',27739.9100,4,'2023-03-21 14:01:06',1,'Contract sale'),(3622,199,'germangarcia199078@gmail.com',3976.0000,'usdt',17855.9100,17,'2023-03-22 18:02:01',1,'充币到账'),(3623,199,'germangarcia199078@gmail.com',16890.0000,'usdt',34745.9100,17,'2023-03-23 19:39:00',1,'充币到账'),(3624,176,'88888',2000.0000,'usdt',231976.6500,3,'2023-03-25 10:03:41',2,'BuyBTC/USDTQuick Margin'),(3625,211,'gchil207@yahoo.com',2000.6700,'usdt',2000.6700,17,'2023-03-28 14:59:12',1,'充币到账'),(3626,199,'germangarcia199078@gmail.com',34200.0000,'usdt',545.9100,3,'2023-03-28 16:21:11',2,'BuyBTC/USDTQuick Margin'),(3627,199,'germangarcia199078@gmail.com',47880.0000,'usdt',95963.9100,4,'2023-03-28 16:22:11',1,'Contract sale'),(3628,199,'germangarcia199078@gmail.com',2512.0000,'usdt',50595.9100,17,'2023-03-31 14:29:54',1,'充币到账'),(3629,199,'germangarcia199078@gmail.com',50001.0000,'usdt',594.9100,3,'2023-03-31 16:01:25',2,'BuyBTC/USDTQuick Margin'),(3630,199,'germangarcia199078@gmail.com',85001.7000,'usdt',170098.3000,4,'2023-03-31 16:04:26',1,'Contract sale'),(3631,211,'gchil207@yahoo.com',1950.0000,'usdt',50.6700,3,'2023-03-31 16:05:07',2,'BuyBTC/USDTQuick Margin'),(3632,211,'gchil207@yahoo.com',2730.0000,'usdt',5491.1700,4,'2023-03-31 16:06:07',1,'Contract sale'),(3633,211,'gchil207@yahoo.com',2700.0000,'usdt',61.1700,3,'2023-04-04 18:00:01',2,'BuyBTC/USDTQuick Margin'),(3634,199,'germangarcia199078@gmail.com',84000.0000,'usdt',1096.6000,3,'2023-04-04 18:00:04',2,'BuyBTC/USDTQuick Margin'),(3635,211,'gchil207@yahoo.com',3780.0000,'usdt',7594.1700,4,'2023-04-04 18:01:01',1,'Contract sale'),(3636,199,'germangarcia199078@gmail.com',117600.0000,'usdt',235456.6000,4,'2023-04-04 18:01:06',1,'Contract sale'),(3637,213,'jtbrown64@gmail.com',982.0000,'usdt',982.0000,17,'0000-00-00 00:00:00',1,'充币'),(3638,213,'jtbrown64@gmail.com',0.0260,'btc',0.0260,10,'2023-04-05 15:01:42',1,'Currency transaction price limit purchase entrustment transaction'),(3639,213,'jtbrown64@gmail.com',736.5000,'usdt',-491.0000,9,'2023-04-05 15:01:42',2,'Currency transaction price limit purchase entrustment transaction'),(3640,213,'jtbrown64@gmail.com',721.2037,'usdt',1703.2037,9,'2023-04-05 15:05:12',1,'Currency trading limit sale entrustment transaction'),(3641,213,'jtbrown64@gmail.com',0.0260,'btc',-0.0260,10,'2023-04-05 15:05:12',2,'Currency trading limit sale entrustment transaction'),(3642,206,'laura@gmail.com',100000.0000,'usdt',260398.0000,3,'2023-04-05 15:06:27',2,'BuyBTC/USDTQuick Margin'),(3643,206,'laura@gmail.com',150000.0000,'usdt',559398.0000,4,'2023-04-05 15:08:32',1,'Contract sale'),(3644,213,'jtbrown64@gmail.com',1000.0000,'usdt',703.2037,3,'2023-04-05 15:12:03',2,'BuyBTC/USDTQuick Margin'),(3645,213,'jtbrown64@gmail.com',1400.0000,'usdt',3493.2037,4,'2023-04-05 15:13:08',1,'Contract sale'),(3646,213,'jtbrown64@gmail.com',1400.0000,'usdt',4893.2037,4,'2023-04-05 15:13:09',1,'Contract sale'),(3647,213,'jtbrown64@gmail.com',1000.0000,'usdt',2493.2037,3,'2023-04-05 15:15:19',2,'BuyBTC/USDTQuick Margin'),(3648,191,'akcy2022@gmail.com',0.3512,'btc',1.1478,10,'2023-04-05 15:32:36',1,'Currency transaction price limit purchase entrustment transaction'),(3649,191,'akcy2022@gmail.com',10000.0000,'usdt',315661.6600,9,'2023-04-05 15:32:36',2,'Currency transaction price limit purchase entrustment transaction'),(3650,191,'akcy2022@gmail.com',27900.0909,'usdt',353561.7509,9,'2023-04-05 15:33:11',1,'Currency trading limit sale entrustment transaction'),(3651,191,'akcy2022@gmail.com',1.0000,'btc',-0.8522,10,'2023-04-05 15:33:11',2,'Currency trading limit sale entrustment transaction'),(3652,191,'akcy2022@gmail.com',4124.1435,'usdt',357685.8944,9,'2023-04-05 15:33:47',1,'Currency trading limit sale entrustment transaction'),(3653,191,'akcy2022@gmail.com',0.1478,'btc',-0.1478,10,'2023-04-05 15:33:47',2,'Currency trading limit sale entrustment transaction'),(3654,191,'akcy2022@gmail.com',0.9904,'btc',0.9904,10,'2023-04-05 15:43:02',1,'Currency transaction price limit purchase entrustment transaction'),(3655,191,'akcy2022@gmail.com',28280.5100,'usdt',301124.8744,9,'2023-04-05 15:43:02',2,'Currency transaction price limit purchase entrustment transaction'),(3656,191,'akcy2022@gmail.com',27743.1764,'usdt',357148.5608,9,'2023-04-05 15:44:43',1,'Currency trading limit sale entrustment transaction'),(3657,191,'akcy2022@gmail.com',0.9904,'btc',-0.9904,10,'2023-04-05 15:44:43',2,'Currency trading limit sale entrustment transaction'),(3658,191,'akcy2022@gmail.com',0.9904,'btc',0.9904,10,'2023-04-05 15:45:27',1,'Currency transaction price limit purchase entrustment transaction'),(3659,191,'akcy2022@gmail.com',28311.0000,'usdt',300526.5608,9,'2023-04-05 15:45:27',2,'Currency transaction price limit purchase entrustment transaction'),(3660,191,'akcy2022@gmail.com',27745.4777,'usdt',356583.0385,9,'2023-04-05 15:45:57',1,'Currency trading limit sale entrustment transaction'),(3661,191,'akcy2022@gmail.com',0.9904,'btc',-0.9904,10,'2023-04-05 15:45:57',2,'Currency trading limit sale entrustment transaction'),(3662,191,'akcy2022@gmail.com',0.9906,'btc',0.9906,10,'2023-04-05 15:47:22',1,'Currency transaction price limit purchase entrustment transaction'),(3663,191,'akcy2022@gmail.com',28279.6200,'usdt',300023.7985,9,'2023-04-05 15:47:22',2,'Currency transaction price limit purchase entrustment transaction'),(3664,191,'akcy2022@gmail.com',1000.0000,'usdt',383862.6585,3,'2023-04-05 15:49:24',2,'购买BTC/USDT秒合约'),(3665,191,'akcy2022@gmail.com',1400.0000,'usdt',386652.6585,4,'2023-04-05 15:50:27',1,'Contract sale'),(3666,207,'Yomi@gmail.com',0.9908,'btc',0.9908,10,'2023-04-05 15:55:57',1,'Currency transaction price limit purchase entrustment transaction'),(3667,207,'Yomi@gmail.com',28265.5000,'usdt',284266.4300,9,'2023-04-05 15:55:57',2,'Currency transaction price limit purchase entrustment transaction'),(3668,207,'Yomi@gmail.com',27710.9691,'usdt',340242.8991,9,'2023-04-05 15:56:31',1,'Currency trading limit sale entrustment transaction'),(3669,207,'Yomi@gmail.com',0.9908,'btc',-0.9908,10,'2023-04-05 15:56:31',2,'Currency trading limit sale entrustment transaction'),(3670,207,'Yomi@gmail.com',0.9917,'btc',0.9917,10,'2023-04-05 15:57:07',1,'Currency transaction price limit purchase entrustment transaction'),(3671,207,'Yomi@gmail.com',28288.5100,'usdt',283665.8791,9,'2023-04-05 15:57:07',2,'Currency transaction price limit purchase entrustment transaction'),(3672,207,'Yomi@gmail.com',27738.7134,'usdt',339693.1025,9,'2023-04-05 15:58:06',1,'Currency trading limit sale entrustment transaction'),(3673,207,'Yomi@gmail.com',0.9917,'btc',-0.9917,10,'2023-04-05 15:58:06',2,'Currency trading limit sale entrustment transaction'),(3674,207,'Yomi@gmail.com',0.9911,'btc',0.9911,10,'2023-04-05 15:58:32',1,'Currency transaction price limit purchase entrustment transaction'),(3675,207,'Yomi@gmail.com',28290.4900,'usdt',283112.1225,9,'2023-04-05 15:58:32',2,'Currency transaction price limit purchase entrustment transaction'),(3676,207,'Yomi@gmail.com',0.9987,'btc',1.9898,10,'2023-04-05 15:59:07',1,'Currency transaction price limit purchase entrustment transaction'),(3677,207,'Yomi@gmail.com',28500.9300,'usdt',254400.7525,9,'2023-04-05 15:59:07',2,'Currency transaction price limit purchase entrustment transaction'),(3678,207,'Yomi@gmail.com',55630.2708,'usdt',338531.9533,9,'2023-04-05 16:00:16',1,'Currency trading limit sale entrustment transaction'),(3679,207,'Yomi@gmail.com',1.9898,'btc',-1.9898,10,'2023-04-05 16:00:16',2,'Currency trading limit sale entrustment transaction'),(3680,207,'Yomi@gmail.com',1.0512,'btc',1.0512,10,'2023-04-05 16:00:47',1,'Currency transaction price limit purchase entrustment transaction'),(3681,207,'Yomi@gmail.com',30000.8900,'usdt',278530.1733,9,'2023-04-05 16:00:47',2,'Currency transaction price limit purchase entrustment transaction'),(3682,213,'jtbrown64@gmail.com',2350.0000,'usdt',133.2037,3,'2023-04-06 12:29:59',2,'BuyBTC/USDTQuick Margin'),(3683,206,'laura@gmail.com',50000.0000,'usdt',359398.0000,3,'2023-04-06 12:30:13',2,'BuyBTC/USDTQuick Margin'),(3684,213,'jtbrown64@gmail.com',3290.0000,'usdt',3399.7037,17,'0000-00-00 00:00:00',1,'充币'),(3685,206,'laura@gmail.com',2000.0000,'usdt',356898.0000,3,'2023-04-06 15:37:12',2,'BuyBTC/USDTQuick Margin'),(3686,206,'laura@gmail.com',2800.0000,'usdt',362478.0000,4,'2023-04-06 15:38:16',1,'Contract sale'),(3687,206,'laura@gmail.com',200000.0000,'usdt',159678.0000,3,'2023-04-06 15:39:00',2,'BuyBTC/USDTQuick Margin'),(3692,213,'jtbrown64@gmail.com',0.0022,'btc',0.0200,17,'0000-00-00 00:00:00',1,'充币'),(3689,213,'jtbrown64@gmail.com',494.0000,'usdt',3893.7037,17,'0000-00-00 00:00:00',1,'充币'),(3690,213,'jtbrown64@gmail.com',3700.0000,'usdt',193.7037,3,'2023-04-07 15:15:04',2,'BuyBTC/USDTQuick Margin'),(3691,213,'jtbrown64@gmail.com',5180.0000,'usdt',10516.7037,4,'2023-04-07 15:16:06',1,'Contract sale'),(3693,213,'jtbrown64@gmail.com',0.0200,'btc',0.0000,2,'2023-04-07 15:31:45',2,'提币申请'),(3694,211,'gchil207@yahoo.com',3700.0000,'usdt',114.1700,3,'2023-04-07 18:00:03',2,'BuyBTC/USDTQuick Margin'),(3695,207,'Yomi@gmail.com',60000.0000,'usdt',338533.7333,3,'2023-04-07 18:00:27',2,'BuyBTC/USDTQuick Margin'),(3696,211,'gchil207@yahoo.com',5180.0000,'usdt',10437.1700,4,'2023-04-07 18:01:06',1,'Contract sale'),(3697,207,'Yomi@gmail.com',84000.0000,'usdt',505933.7333,4,'2023-04-07 18:01:31',1,'Contract sale'),(3698,199,'germangarcia199078@gmail.com',115000.0000,'usdt',2856.6000,3,'2023-04-07 18:03:03',2,'BuyBTC/USDTQuick Margin'),(3699,199,'germangarcia199078@gmail.com',161000.0000,'usdt',323706.6000,4,'2023-04-07 18:04:07',1,'Contract sale'),(3700,176,'88888',500.0000,'usdt',231456.6500,3,'2023-04-08 04:42:10',2,'BuyBTC/USDTQuick Margin'),(3701,176,'88888',700.0000,'usdt',232851.6500,4,'2023-04-08 04:43:12',1,'Contract sale'),(3702,176,'88888',5000.0000,'usdt',227151.6500,3,'2023-04-08 04:45:14',2,'BuyBTC/USDTQuick Margin'),(3703,176,'88888',7000.0000,'usdt',241101.6500,4,'2023-04-08 04:46:16',1,'Contract sale'),(3704,207,'Yomi@gmail.com',300000.0000,'usdt',121933.7333,2,'2023-04-08 17:45:19',2,'提币申请'),(3705,213,'jtbrown64@gmail.com',5000.0000,'usdt',336.7037,3,'2023-04-11 12:00:55',2,'BuyBTC/USDTQuick Margin'),(3706,213,'jtbrown64@gmail.com',7500.0000,'usdt',15286.7037,4,'2023-04-11 12:02:57',1,'Contract sale'),(3707,206,'laura@gmail.com',150000.0000,'usdt',7678.0000,3,'2023-04-11 12:04:26',2,'BuyBTC/USDTQuick Margin'),(3708,206,'laura@gmail.com',225000.0000,'usdt',456178.0000,4,'2023-04-11 12:06:27',1,'Contract sale'),(3709,213,'jtbrown64@gmail.com',500.0000,'usdt',7286.7037,2,'2023-04-11 12:25:12',2,'提币申请'),(3710,213,'jtbrown64@gmail.com',500.0000,'usdt',7786.7037,16,'2023-04-11 15:02:19',1,'Withdrawal rejected, return of funds'),(3711,213,'jtbrown64@gmail.com',7400.0000,'usdt',386.7037,3,'2023-04-20 13:30:21',2,'BuyBTC/USDTQuick Margin'),(3712,213,'jtbrown64@gmail.com',10360.0000,'usdt',21032.7037,4,'2023-04-20 13:31:22',1,'Contract sale'),(3713,206,'laura@gmail.com',200000.0000,'usdt',31178.0000,3,'2023-04-20 13:38:50',2,'BuyBTC/USDTQuick Margin'),(3714,206,'laura@gmail.com',280000.0000,'usdt',589178.0000,4,'2023-04-20 13:39:52',1,'Contract sale'),(3715,196,'laola@163.com',1.7510,'btc',1.7510,10,'2023-04-20 18:04:21',1,'Currency transaction price limit purchase entrustment transaction'),(3716,196,'laola@163.com',50000.0000,'usdt',0.0000,9,'2023-04-20 18:04:21',2,'Currency transaction price limit purchase entrustment transaction'),(3717,196,'laola@163.com',1.7510,'btc',0.0000,2,'2023-04-20 18:10:57',2,'提币申请'),(3718,196,'laola@163.com',1.7475,'btc',1.7475,10,'2023-04-20 18:12:26',1,'Currency transaction price limit purchase entrustment transaction'),(3719,196,'laola@163.com',50000.0000,'usdt',0.0000,9,'2023-04-20 18:12:26',2,'Currency transaction price limit purchase entrustment transaction'),(3720,196,'laola@163.com',49004.1341,'usdt',99004.1341,9,'2023-04-20 18:13:57',1,'Currency trading limit sale entrustment transaction'),(3721,196,'laola@163.com',1.7475,'btc',-1.7475,10,'2023-04-20 18:13:57',2,'Currency trading limit sale entrustment transaction'),(3722,195,'tianw@163.com',12436.0000,'usdt',100000.0000,17,'2023-04-20 18:16:48',1,'充币到账'),(3723,195,'tianw@163.com',1.7461,'btc',1.7461,10,'2023-04-20 18:17:31',1,'Currency transaction price limit purchase entrustment transaction'),(3724,195,'tianw@163.com',50000.0000,'usdt',0.0000,9,'2023-04-20 18:17:31',2,'Currency transaction price limit purchase entrustment transaction'),(3725,195,'tianw@163.com',48933.1216,'usdt',148933.1216,9,'2023-04-20 18:20:12',1,'Currency trading limit sale entrustment transaction'),(3726,195,'tianw@163.com',1.7461,'btc',-1.7461,10,'2023-04-20 18:20:12',2,'Currency trading limit sale entrustment transaction'),(3727,213,'jtbrown64@gmail.com',10000.0000,'usdt',672.7037,3,'2023-04-21 12:30:15',2,'BuyBTC/USDTQuick Margin'),(3728,213,'jtbrown64@gmail.com',15000.0000,'usdt',30572.7037,4,'2023-04-21 12:32:17',1,'Contract sale'),(3729,213,'jtbrown64@gmail.com',15000.0000,'usdt',572.7037,3,'2023-04-22 14:31:21',2,'BuyBTC/USDTQuick Margin'),(3730,213,'jtbrown64@gmail.com',21000.0000,'usdt',42422.7037,4,'2023-04-22 14:32:21',1,'Contract sale'),(3731,213,'jtbrown64@gmail.com',21000.0000,'usdt',422.7037,3,'2023-04-24 12:00:04',2,'BuyBTC/USDTQuick Margin'),(3732,213,'jtbrown64@gmail.com',29400.0000,'usdt',59012.7037,4,'2023-04-24 12:01:06',1,'Contract sale'),(3733,176,'88888',88888.0000,'usdt',145213.6500,2,'2023-04-24 12:25:36',2,'提币申请'),(3734,176,'88888',999999.9999,'btc',999999.9999,17,'0000-00-00 00:00:00',1,'充币'),(3735,176,'88888',200000.0000,'usdt',345213.6500,17,'0000-00-00 00:00:00',1,'充币'),(3736,176,'88888',200000.0000,'usdt',145213.6500,2,'2023-04-24 12:28:50',2,'提币申请'),(3737,213,'jtbrown64@gmail.com',5000.0000,'usdt',24612.7037,2,'2023-04-24 14:12:57',2,'提币申请'),(3738,213,'jtbrown64@gmail.com',5000.0000,'usdt',29612.7037,16,'2023-04-26 10:44:35',1,'Withdrawal rejected, return of funds'),(3739,213,'jtbrown64@gmail.com',24000.0000,'usdt',5612.7037,3,'2023-04-26 12:00:27',2,'BuyBTC/USDTQuick Margin'),(3740,213,'jtbrown64@gmail.com',33600.0000,'usdt',72572.7037,4,'2023-04-26 12:01:28',1,'Contract sale'),(3741,176,'88888',100000.0000,'usdt',45213.6500,2,'2023-04-26 12:20:15',2,'提币申请'),(3742,218,'Suharni158598@gmail.com',100000.0000,'usdt',100000.0000,17,'0000-00-00 00:00:00',1,'充币'),(3743,209,'zxjdbq1219@gmail.com',135566.0000,'usdt',135566.0000,17,'0000-00-00 00:00:00',1,'充币'),(3744,209,'zxjdbq1219@gmail.com',2626.0000,'usdt',132940.0000,2,'2023-05-27 06:02:33',2,'提币申请'),(3745,209,'zxjdbq1219@gmail.com',2626.0000,'usdt',135566.0000,16,'2023-05-27 06:06:43',1,'提币驳回，退回资金'),(3746,209,'zxjdbq1219@gmail.com',500.0000,'usdt',135066.0000,3,'2023-05-27 06:57:34',2,'购买BTC/USDT秒合约'),(3747,209,'zxjdbq1219@gmail.com',500.0000,'usdt',134561.0000,5,'2023-05-27 09:05:29',2,'购买矿机'),(3748,209,'zxjdbq1219@gmail.com',700.0000,'usdt',135961.0000,4,'2023-05-28 10:10:02',1,'Contract sale'),(3749,222,'iqv0bd6m@besttempmail.com',1000.0000,'usdt',1000.0000,17,'0000-00-00 00:00:00',1,'充币'),(3750,222,'iqv0bd6m@besttempmail.com',500.0000,'usdt',500.0000,3,'2023-05-30 23:01:47',2,'购买BTC/USDT秒合约'),(3751,222,'iqv0bd6m@besttempmail.com',1000.0000,'usdt',1495.0000,17,'0000-00-00 00:00:00',1,'充币'),(3752,222,'iqv0bd6m@besttempmail.com',500.0000,'usdt',995.0000,3,'2023-05-30 23:05:12',2,'购买BTC/USDT秒合约'),(3753,222,'iqv0bd6m@besttempmail.com',500.0000,'usdt',490.0000,3,'2023-05-30 23:07:27',2,'购买BTC/USDT秒合约'),(3754,223,'baofu8618@gmail.com',10000.0000,'usdt',10000.0000,17,'2023-06-01 10:36:52',1,'充币到账'),(3755,209,'zxjdbq1219@gmail.com',2000.0000,'usdt',133261.0000,3,'2023-06-01 11:05:56',2,'购买BTC/USDT秒合约'),(3756,223,'baofu8618@gmail.com',500.0000,'usdt',9500.0000,5,'2023-06-02 04:02:24',2,'购买矿机'),(3757,223,'baofu8618@gmail.com',1500.0000,'usdt',8000.0000,3,'2023-06-02 04:04:03',2,'购买BTC/USDT秒合约'),(3758,223,'baofu8618@gmail.com',500.0000,'usdt',7485.0000,3,'2023-06-02 04:07:47',2,'购买BTC/USDT秒合约'),(3759,223,'baofu8618@gmail.com',500.0000,'usdt',6980.0000,3,'2023-06-02 04:07:47',2,'购买BTC/USDT秒合约'),(3760,223,'baofu8618@gmail.com',500.0000,'usdt',6475.0000,3,'2023-06-02 04:07:47',2,'购买BTC/USDT秒合约'),(3761,223,'baofu8618@gmail.com',500.0000,'usdt',5970.0000,3,'2023-06-02 04:07:47',2,'购买BTC/USDT秒合约'),(3762,223,'baofu8618@gmail.com',500.0000,'usdt',5465.0000,3,'2023-06-02 04:07:47',2,'购买BTC/USDT秒合约'),(3763,223,'baofu8618@gmail.com',500.0000,'usdt',4960.0000,3,'2023-06-02 04:07:48',2,'购买BTC/USDT秒合约'),(3764,223,'baofu8618@gmail.com',700.0000,'usdt',6355.0000,4,'2023-06-02 04:08:47',1,'Contract sale'),(3765,223,'baofu8618@gmail.com',700.0000,'usdt',7055.0000,4,'2023-06-02 04:08:47',1,'Contract sale'),(3766,209,'zxjdbq1219@gmail.com',100.0000,'usdt',133341.0000,17,'0000-00-00 00:00:00',1,'充币'),(3767,209,'zxjdbq1219@gmail.com',500.0000,'usdt',132841.0000,3,'2024-03-11 13:33:54',2,'BuyBTC/USDTQuick Margin'),(3768,223,'baofu8618@gmail.com',500.0000,'usdt',5855.0000,3,'2024-03-11 14:30:59',2,'BuyBTC/USDTQuick Margin'),(3769,223,'baofu8618@gmail.com',100.0000,'usdt',5950.0000,17,'0000-00-00 00:00:00',1,'充币'),(3770,209,'zxjdbq1219@gmail.com',700.0000,'usdt',134236.0000,4,'2024-03-11 14:32:39',1,'Contract sale'),(3771,218,'Suharni158598@gmail.com',1.0000,'btc',1.0000,17,'2017-10-18 20:08:00',1,'充币'),(3772,225,'1900553000@qq.com',99999.0000,'usdt',99999.0000,17,'0000-00-00 00:00:00',1,'充币'),(3773,225,'1900553000@qq.com',500.0000,'usdt',99499.0000,3,'2024-03-11 15:03:05',2,'购买BTC/USDT秒合约'),(3774,190,'8e5xt8ib@idrrate.com',2.0000,'usdt',672416.3504,8,'2024-03-11 15:07:56',1,'矿机收益释放'),(3775,191,'akcy2022@gmail.com',0.0200,'usdt',385252.6785,8,'2024-03-11 15:07:56',1,'矿机收益释放'),(3776,191,'akcy2022@gmail.com',28.0000,'usdt',385280.6785,8,'2024-03-11 15:07:56',1,'矿机收益释放'),(3777,191,'akcy2022@gmail.com',0.0000,'usdt',385280.6785,8,'2024-03-11 15:07:56',1,'矿机收益释放'),(3778,191,'akcy2022@gmail.com',188.0000,'usdt',385468.6785,8,'2024-03-11 15:07:56',1,'矿机收益释放'),(3779,191,'akcy2022@gmail.com',688.0000,'usdt',386156.6785,8,'2024-03-11 15:07:56',1,'矿机收益释放'),(3780,191,'akcy2022@gmail.com',3888.0000,'usdt',390044.6785,8,'2024-03-11 15:07:56',1,'矿机收益释放'),(3781,209,'zxjdbq1219@gmail.com',0.0000,'usdt',133536.0000,8,'2024-03-11 15:07:56',1,'矿机收益释放'),(3782,223,'baofu8618@gmail.com',0.0000,'usdt',5950.0000,8,'2024-03-11 15:07:56',1,'矿机收益释放'),(3783,225,'1900553000@qq.com',100.0000,'usdt',99594.0000,17,'2024-03-11 15:28:15',1,'充币到账'),(3784,225,'1900553000@qq.com',100.0000,'usdt',99494.0000,2,'2024-03-11 15:29:05',2,'提币申请'),(3785,225,'1900553000@qq.com',0.0014,'btc',0.0014,10,'2024-03-11 15:35:02',1,'Currency transaction price limit purchase entrustment transaction'),(3786,225,'1900553000@qq.com',100.0000,'usdt',99294.0000,9,'2024-03-11 15:35:02',2,'Currency transaction price limit purchase entrustment transaction'),(3787,190,'8e5xt8ib@idrrate.com',2.0000,'usdt',672418.3504,8,'2024-03-25 13:01:02',1,'Mining machine revenue release'),(3788,191,'akcy2022@gmail.com',0.0000,'usdt',390044.6785,8,'2024-03-25 13:01:02',1,'Mining machine revenue release'),(3789,191,'akcy2022@gmail.com',188.0000,'usdt',390232.6785,8,'2024-03-25 13:01:02',1,'Mining machine revenue release'),(3790,191,'akcy2022@gmail.com',688.0000,'usdt',390920.6785,8,'2024-03-25 13:01:02',1,'Mining machine revenue release'),(3791,191,'akcy2022@gmail.com',3888.0000,'usdt',394808.6785,8,'2024-03-25 13:01:02',1,'Mining machine revenue release'),(3792,209,'zxjdbq1219@gmail.com',0.0000,'usdt',133536.0000,8,'2024-03-25 13:01:02',1,'Mining machine revenue release'),(3793,223,'baofu8618@gmail.com',0.0000,'usdt',5950.0000,8,'2024-03-25 13:01:02',1,'Mining machine revenue release'),(3794,223,'baofu8618@gmail.com',0.0000,'usdt',5950.0000,8,'2024-03-25 13:01:02',1,'Mining machine revenue release'),(3795,225,'1900553000@qq.com',500.0000,'usdt',98894.0000,3,'2024-03-26 01:20:07',2,'BuyBTC/USDTQuick Margin'),(3796,225,'1900553000@qq.com',1000.0000,'usdt',97889.0000,3,'2024-03-26 02:11:54',2,'购买BTC/USDT秒合约'),(3797,225,'1900553000@qq.com',0.9900,'btc',0.9914,10,'2024-03-26 04:00:02',1,'Currency transaction price limit purchase entrustment transaction'),(3798,225,'1900553000@qq.com',70475.8700,'usdt',-43777.0610,9,'2024-03-26 04:00:02',2,'Currency transaction price limit purchase entrustment transaction'),(3799,225,'1900553000@qq.com',0.9900,'btc',1.9814,10,'2024-03-26 04:00:02',1,'Currency transaction price limit purchase entrustment transaction'),(3800,225,'1900553000@qq.com',70475.8700,'usdt',-43777.0610,9,'2024-03-26 04:00:02',2,'Currency transaction price limit purchase entrustment transaction'),(3801,225,'1900553000@qq.com',0.9900,'btc',2.9714,10,'2024-03-26 04:00:02',1,'Currency transaction price limit purchase entrustment transaction'),(3802,225,'1900553000@qq.com',70475.8700,'usdt',-43777.0610,9,'2024-03-26 04:00:02',2,'Currency transaction price limit purchase entrustment transaction'),(3803,225,'1900553000@qq.com',0.0099,'btc',2.9813,10,'2024-03-26 04:01:02',1,'Currency transaction price limit purchase entrustment transaction'),(3804,225,'1900553000@qq.com',0.0099,'btc',2.9813,10,'2024-03-26 04:01:02',1,'Currency transaction price limit purchase entrustment transaction'),(3805,225,'1900553000@qq.com',704.3210,'usdt',25994.4880,9,'2024-03-26 04:01:02',2,'Currency transaction price limit purchase entrustment transaction'),(3806,225,'1900553000@qq.com',704.3210,'usdt',25994.4880,9,'2024-03-26 04:01:02',2,'Currency transaction price limit purchase entrustment transaction'),(3807,190,'8e5xt8ib@idrrate.com',2.0000,'usdt',672420.3504,8,'2024-03-26 13:01:01',1,'Mining machine revenue release'),(3808,191,'akcy2022@gmail.com',0.0000,'usdt',394808.6785,8,'2024-03-26 13:01:01',1,'Mining machine revenue release'),(3809,191,'akcy2022@gmail.com',188.0000,'usdt',394996.6785,8,'2024-03-26 13:01:01',1,'Mining machine revenue release'),(3810,191,'akcy2022@gmail.com',688.0000,'usdt',395684.6785,8,'2024-03-26 13:01:01',1,'Mining machine revenue release'),(3811,191,'akcy2022@gmail.com',3888.0000,'usdt',399572.6785,8,'2024-03-26 13:01:01',1,'Mining machine revenue release'),(3812,209,'zxjdbq1219@gmail.com',0.0000,'usdt',133536.0000,8,'2024-03-26 13:01:02',1,'Mining machine revenue release'),(3813,223,'baofu8618@gmail.com',0.0000,'usdt',5950.0000,8,'2024-03-26 13:01:02',1,'Mining machine revenue release'),(3814,223,'baofu8618@gmail.com',0.0000,'usdt',5950.0000,8,'2024-03-26 13:01:02',1,'Mining machine revenue release'),(3815,225,'1900553000@qq.com',1000.0000,'usdt',25698.8090,9,'2024-03-27 00:49:38',2,'币币交易购买BTC'),(3816,225,'1900553000@qq.com',0.0142,'btc',3.0054,10,'2024-03-27 00:49:38',1,'币币交易购买BTC'),(3817,225,'1900553000@qq.com',2000.0000,'usdt',23698.8090,3,'2024-03-27 01:13:26',2,'BuyBTC/USDTQuick Margin'),(3818,225,'1900553000@qq.com',500.0000,'btc',503.0053,17,'0000-00-00 00:00:00',1,'充币'),(3819,225,'1900553000@qq.com',500.0000,'usdt',24178.8090,17,'0000-00-00 00:00:00',1,'充币'),(3820,225,'1900553000@qq.com',100.0926,'eos',100.0926,10,'2024-03-27 09:35:01',1,'Currency transaction price limit purchase entrustment transaction'),(3821,225,'1900553000@qq.com',108.0600,'usdt',23962.6890,9,'2024-03-27 09:35:01',2,'Currency transaction price limit purchase entrustment transaction'),(3822,225,'1900553000@qq.com',100.0926,'eos',100.0926,10,'2024-03-27 09:35:01',1,'Currency transaction price limit purchase entrustment transaction'),(3823,225,'1900553000@qq.com',108.0600,'usdt',23962.6890,9,'2024-03-27 09:35:01',2,'Currency transaction price limit purchase entrustment transaction'),(3824,190,'8e5xt8ib@idrrate.com',2.0000,'usdt',672422.3504,8,'2024-03-27 13:01:01',1,'Mining machine revenue release'),(3825,191,'akcy2022@gmail.com',0.0000,'usdt',399572.6785,8,'2024-03-27 13:01:01',1,'Mining machine revenue release'),(3826,191,'akcy2022@gmail.com',188.0000,'usdt',399760.6785,8,'2024-03-27 13:01:01',1,'Mining machine revenue release'),(3827,191,'akcy2022@gmail.com',688.0000,'usdt',400448.6785,8,'2024-03-27 13:01:01',1,'Mining machine revenue release'),(3828,191,'akcy2022@gmail.com',3888.0000,'usdt',404336.6785,8,'2024-03-27 13:01:01',1,'Mining machine revenue release'),(3829,191,'akcy2022@gmail.com',0.0000,'usdt',399572.6785,8,'2024-03-27 13:01:02',1,'Mining machine revenue release'),(3830,209,'zxjdbq1219@gmail.com',0.0000,'usdt',133536.0000,8,'2024-03-27 13:01:02',1,'Mining machine revenue release'),(3831,209,'zxjdbq1219@gmail.com',0.0000,'usdt',133536.0000,8,'2024-03-27 13:01:02',1,'Mining machine revenue release'),(3832,209,'zxjdbq1219@gmail.com',0.0000,'usdt',133536.0000,8,'2024-03-27 13:01:02',1,'Mining machine revenue release'),(3833,223,'baofu8618@gmail.com',0.0000,'usdt',5950.0000,8,'2024-03-27 13:01:02',1,'Mining machine revenue release'),(3834,223,'baofu8618@gmail.com',0.0000,'usdt',5950.0000,8,'2024-03-27 13:01:02',1,'Mining machine revenue release'),(3835,223,'baofu8618@gmail.com',0.0000,'usdt',5950.0000,8,'2024-03-27 13:01:02',1,'Mining machine revenue release'),(3836,190,'8e5xt8ib@idrrate.com',2.0000,'usdt',672424.3504,8,'2024-03-28 13:01:02',1,'Mining machine revenue release'),(3837,191,'akcy2022@gmail.com',0.0000,'usdt',404336.6785,8,'2024-03-28 13:01:02',1,'Mining machine revenue release'),(3838,191,'akcy2022@gmail.com',188.0000,'usdt',404524.6785,8,'2024-03-28 13:01:02',1,'Mining machine revenue release'),(3839,191,'akcy2022@gmail.com',688.0000,'usdt',405212.6785,8,'2024-03-28 13:01:02',1,'Mining machine revenue release'),(3840,191,'akcy2022@gmail.com',3888.0000,'usdt',409100.6785,8,'2024-03-28 13:01:02',1,'Mining machine revenue release'),(3841,191,'akcy2022@gmail.com',0.0000,'usdt',404336.6785,8,'2024-03-28 13:01:02',1,'Mining machine revenue release'),(3842,209,'zxjdbq1219@gmail.com',0.0000,'usdt',133536.0000,8,'2024-03-28 13:01:02',1,'Mining machine revenue release'),(3843,209,'zxjdbq1219@gmail.com',0.0000,'usdt',133536.0000,8,'2024-03-28 13:01:02',1,'Mining machine revenue release'),(3844,209,'zxjdbq1219@gmail.com',0.0000,'usdt',133536.0000,8,'2024-03-28 13:01:02',1,'Mining machine revenue release'),(3845,225,'1900553000@qq.com',11.0000,'btc',514.0053,17,'0000-00-00 00:00:00',1,'充币'),(3846,225,'1900553000@qq.com',11.0000,'btc',525.0053,17,'0000-00-00 00:00:00',1,'充币'),(3847,225,'1900553000@qq.com',11.0000,'eth',11.0000,17,'0000-00-00 00:00:00',1,'充币'),(3848,225,'1900553000@qq.com',11.0000,'btc',536.0053,17,'0000-00-00 00:00:00',1,'充币'),(3849,225,'1900553000@qq.com',500.0000,'usdt',23570.7490,3,'2024-05-25 00:17:02',2,'购买ETH/USDT秒合约'),(3850,225,'1900553000@qq.com',122.0000,'btc',658.0053,17,'0000-00-00 00:00:00',1,'充币'),(3851,225,'1900553000@qq.com',122.0000,'btc',780.0053,17,'0000-00-00 00:00:00',1,'充币'),(3852,225,'1900553000@qq.com',122.0000,'btc',902.0053,17,'0000-00-00 00:00:00',1,'充币'),(3853,225,'1900553000@qq.com',122.0000,'btc',1024.0053,17,'0000-00-00 00:00:00',1,'充币'),(3854,225,'1900553000@qq.com',122.0000,'btc',1146.0053,17,'0000-00-00 00:00:00',1,'充币'),(3855,225,'1900553000@qq.com',122.0000,'btc',1268.0053,17,'0000-00-00 00:00:00',1,'充币'),(3856,225,'1900553000@qq.com',122.0000,'btc',1390.0053,17,'0000-00-00 00:00:00',1,'充币'),(3857,225,'1900553000@qq.com',122.0000,'btc',1512.0053,17,'0000-00-00 00:00:00',1,'充币'),(3858,225,'1900553000@qq.com',122.0000,'btc',1634.0053,17,'0000-00-00 00:00:00',1,'充币'),(3859,225,'1900553000@qq.com',122.0000,'btc',1756.0053,17,'0000-00-00 00:00:00',1,'充币'),(3860,225,'1900553000@qq.com',500.0000,'usdt',23065.7490,3,'2024-05-25 00:19:17',2,'购买BTC/USDT秒合约'),(3861,225,'1900553000@qq.com',500.0000,'usdt',22560.7490,3,'2024-05-25 00:19:43',2,'购买BTC/USDT秒合约'),(3862,225,'1900553000@qq.com',2000.0000,'usdt',20555.7490,3,'2024-05-25 00:20:28',2,'购买BTC/USDT秒合约'),(3863,225,'1900553000@qq.com',2000.0000,'usdt',12989.2986,3,'2024-05-25 00:36:47',2,'购买BTC/USDT秒合约'),(3864,225,'1900553000@qq.com',700.0000,'usdt',14369.2986,4,'2024-05-25 04:37:06',1,'Contract sale'),(3865,225,'1900553000@qq.com',1000.0000,'usdt',15669.2986,4,'2024-05-25 04:37:06',1,'Contract sale');
/*!40000 ALTER TABLE `tw_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_coin`
--

DROP TABLE IF EXISTS `tw_coin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_coin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) NOT NULL COMMENT '币种代码',
  `czline` varchar(50) NOT NULL COMMENT '充值网络',
  `type` int(11) NOT NULL COMMENT '币类型：1钱包币2平台币3认购币',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '币种名称',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `addtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `status` int(11) unsigned NOT NULL COMMENT '状态：1可用2禁用',
  `czstatus` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '充值状态：1正常2禁止',
  `czaddress` varchar(225) NOT NULL COMMENT '充值地址',
  `czminnum` float(10,2) NOT NULL COMMENT '最小充值数量',
  `txstatus` int(11) unsigned NOT NULL COMMENT '提币状态：1正常2禁止',
  `sxftype` int(11) unsigned NOT NULL COMMENT '1按比例，2按数量',
  `txsxf` float(10,2) NOT NULL COMMENT '提币手续费比例',
  `txsxf_n` float(10,2) NOT NULL COMMENT '提币手续费数量',
  `txminnum` float(10,2) NOT NULL COMMENT '最小提币数量',
  `txmaxnum` float(10,2) NOT NULL COMMENT '最大提币数量',
  `bbsxf` float(10,2) NOT NULL COMMENT '币币手续费',
  `hysxf` float(10,2) NOT NULL COMMENT '合约手续费',
  `czline2` varchar(255) DEFAULT NULL COMMENT '充值网络2',
  `czaddress2` varchar(255) DEFAULT NULL COMMENT '充值地址2',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='币种配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_coin`
--

LOCK TABLES `tw_coin` WRITE;
/*!40000 ALTER TABLE `tw_coin` DISABLE KEYS */;
INSERT INTO `tw_coin` VALUES (4,'usdt','TRC-20',1,'USDT',4,'2024-03-11 18:20:02',1,1,'TF8CRMo8MNqewUXPa7kQukyJhpX8CqsE22',100.00,1,1,1.00,0.00,30.00,10000000.00,1.00,1.00,'TRC20','TF8CRMo8MNqewUXPa7kQukyJhpX8CqsE22'),(6,'btc','Bitcoin',1,'BTC',2,'2023-06-01 12:06:27',1,1,'3KYvuNb8cUtSTsfqwi1d1pu4umAHbGoS63',0.01,1,1,0.10,0.00,0.01,10.00,1.00,1.00,'',''),(7,'eth','Ethereum',1,'ETH',3,'2023-06-01 12:07:34',1,1,'0x835522140Ab2d51Eb286B97d47954938C69316a2',0.00,1,1,0.00,0.00,100.00,10000.00,1.00,1.00,'',''),(12,'eos','Etherum',1,'eos',5,'2023-06-01 12:09:58',1,2,'',1.00,2,2,10.00,0.00,100.00,10000000.00,0.00,1.00,'TRC20',''),(13,'doge','DOGE',1,'DOGE',6,'2021-10-15 17:02:16',0,2,'',10.00,1,1,10.00,0.00,100.00,10000.00,0.00,1.00,NULL,NULL),(14,'bch','BCH',1,'BCH',7,'2023-06-01 12:10:20',1,2,'',0.10,1,1,1.00,0.00,1.00,100.00,0.00,1.00,'',''),(15,'ltc','LTC',1,'LTC',8,'2023-06-01 12:10:32',1,2,'',1.00,1,1,1.00,0.00,10.00,1000.00,0.00,1.00,'',''),(16,'trx','TRC20',1,'TRX',10,'2024-03-11 18:20:07',1,1,'TF8CRMo8MNqewUXPa7kQukyJhpX8CqsE22',100.00,1,1,10.00,0.00,100.00,10000.00,1.00,1.00,'',''),(17,'xrp','XRP',1,'XRP',12,'2021-10-15 17:04:51',0,2,'',100.00,1,1,1.00,0.00,100.00,1000.00,1.00,1.00,NULL,NULL),(18,'iotx','',1,'IOTX',13,'2021-09-22 15:56:54',0,2,'',0.00,2,0,10.00,0.00,100.00,100000.00,1.00,1.00,NULL,NULL),(19,'fil','FIL',1,'FIL币',14,'2023-06-01 12:10:46',1,2,'',0.10,1,1,1.00,0.00,10.00,10000.00,0.00,1.00,'',''),(20,'shib','ERC20',1,'SHIB',15,'2021-10-15 17:06:30',0,2,'',1000.00,1,1,5.00,0.00,100000.00,100000000.00,0.00,1.00,NULL,NULL),(21,'flow','FLOW',1,'FLOW币',16,'2021-10-15 17:06:51',0,2,'',10.00,1,1,10.00,0.00,100.00,10000.00,1.00,1.00,NULL,NULL),(22,'jst','TRC20',1,'JST币',17,'2021-10-15 17:08:33',0,2,'',10.00,1,1,10.00,0.00,100.00,100000.00,1.00,1.00,NULL,NULL),(23,'itc','ITC1',1,'ITC',18,'2021-10-15 17:07:59',0,2,'',10.00,1,1,10.00,0.00,100.00,10000.00,1.00,1.00,NULL,NULL),(24,'ht','ERC20',1,'HT',19,'2021-10-15 17:07:39',0,2,'',1.00,1,1,1.00,0.00,10.00,10000.00,0.00,1.00,NULL,NULL),(25,'ogo','ERC20',1,'OGO币',20,'2021-10-15 17:07:26',0,2,'',100.00,1,1,0.00,0.00,100.00,10000.00,0.00,1.00,NULL,NULL),(26,'usdc','Ethereum',1,'USDC',1,'2024-03-11 18:19:03',1,1,'TF8CRMo8MNqewUXPa7kQukyJhpX8CqsE22',100.00,1,2,5.00,0.00,100.00,10000000.00,1.00,1.00,'TRC20','TF8CRMo8MNqewUXPa7kQukyJhpX8CqsE22');
/*!40000 ALTER TABLE `tw_coin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_coin_comment`
--

DROP TABLE IF EXISTS `tw_coin_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_coin_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `coinname` varchar(50) NOT NULL,
  `content` varchar(500) NOT NULL,
  `cjz` int(11) unsigned NOT NULL,
  `tzy` int(11) unsigned NOT NULL,
  `xcd` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `userid` (`userid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_coin_comment`
--

LOCK TABLES `tw_coin_comment` WRITE;
/*!40000 ALTER TABLE `tw_coin_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tw_coin_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_coin_json`
--

DROP TABLE IF EXISTS `tw_coin_json`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_coin_json` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `data` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_coin_json`
--

LOCK TABLES `tw_coin_json` WRITE;
/*!40000 ALTER TABLE `tw_coin_json` DISABLE KEYS */;
/*!40000 ALTER TABLE `tw_coin_json` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_config`
--

DROP TABLE IF EXISTS `tw_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `webname` varchar(225) NOT NULL COMMENT '网站名称',
  `webtitle` varchar(225) NOT NULL COMMENT '网络标题',
  `weblogo` varchar(225) NOT NULL COMMENT '手机端网站logo',
  `waplogo` varchar(225) NOT NULL COMMENT 'PC端网站logo',
  `webswitch` int(11) NOT NULL COMMENT '网站开关1开2关',
  `websildea` varchar(225) NOT NULL COMMENT '手机端轮播图1',
  `websildeb` varchar(225) NOT NULL COMMENT '手机端轮播图2',
  `websildec` varchar(225) NOT NULL COMMENT '手机端轮播图2',
  `wapsilded` varchar(255) DEFAULT NULL,
  `webissue` varchar(225) NOT NULL COMMENT '手机端新币认购图片',
  `webkj` varchar(225) NOT NULL COMMENT '手机端矿机首页图片',
  `wapsildea` varchar(225) NOT NULL COMMENT 'PC端轮播图1',
  `wapsildeb` varchar(225) NOT NULL COMMENT 'PC端轮播图2',
  `wapsildec` varchar(225) NOT NULL COMMENT 'PC端轮播图3',
  `wapissue` varchar(225) NOT NULL COMMENT 'PC端新币认购图片',
  `wapkj` varchar(225) NOT NULL COMMENT 'PC端矿机首页图片',
  `webtjimgs` varchar(225) NOT NULL COMMENT '手机端推荐页面logo图片',
  `waptjimgs` varchar(225) NOT NULL COMMENT 'PC端推荐页面logo图片',
  `smsemail` varchar(60) NOT NULL COMMENT '短信发送邮箱',
  `emailcode` varchar(60) NOT NULL COMMENT '邮箱授权码',
  `smstemple` varchar(225) NOT NULL COMMENT '短信验证码模板',
  `tgtext` varchar(225) NOT NULL COMMENT '推荐页面推广语',
  `gfemail` varchar(100) NOT NULL COMMENT '官方客服邮箱',
  `footertext` varchar(225) NOT NULL COMMENT 'PC端下方文字',
  `regswitch` int(11) NOT NULL COMMENT '注册开关',
  `tbswitch` int(11) NOT NULL COMMENT '提币开关',
  `regjl` int(11) NOT NULL COMMENT '注册是赠送体验矿机',
  `tymoney` decimal(20,8) NOT NULL COMMENT '注册赠送的体验金',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='网站配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_config`
--

LOCK TABLES `tw_config` WRITE;
/*!40000 ALTER TABLE `tw_config` DISABLE KEYS */;
INSERT INTO `tw_config` VALUES (1,'OKX','OKX:Buy Bitcoin, ETH, Crypto','637c960da5231.png','637c96115477c.png',1,'62ac7f6a64120.png','62ac7f72d5c2d.png','62ac7f79b3703.png','629c72e4af37b.png','629733ae57b0f.png','629734cf34b70.png','629c72d268234.jpeg','629c72d72bea1.jpeg','629c72dbe18e2.jpeg','61517780a59b2.jpg','62973219c958a.png','637c895d5d596.png','637c8963731d7.png','txnservice007@gmail.com','666888ok','【Finam】Your Verification code is','xx','11@gmail.com','',1,1,1,5000.00000000);
/*!40000 ALTER TABLE `tw_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_content`
--

DROP TABLE IF EXISTS `tw_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(225) NOT NULL COMMENT '标题',
  `img` varchar(225) NOT NULL COMMENT '公告图片',
  `content` text NOT NULL COMMENT '内容',
  `addtime` datetime NOT NULL COMMENT '添加时间',
  `status` int(11) NOT NULL COMMENT '状态1显示2隐藏',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='公告内容';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_content`
--

LOCK TABLES `tw_content` WRITE;
/*!40000 ALTER TABLE `tw_content` DISABLE KEYS */;
INSERT INTO `tw_content` VALUES (18,'','638c965f2a583.png','<strong>Hello, dear customer! For a better user experience, on August 24, 2022, the exchange completed a major upgrade. Customer service is now upgraded to Telegram customer support specialists. Telegram customer support is available for inquiries between 09:00am and 11:00pm NYT, leave a message in the evening and we\'ll take care of it the next day! Please confirm Customer Support Telegram:&nbsp;</strong>','2022-11-22 17:32:15',1);
/*!40000 ALTER TABLE `tw_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_ctmarket`
--

DROP TABLE IF EXISTS `tw_ctmarket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_ctmarket` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `coinname` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '市场名称',
  `symbol` varchar(50) NOT NULL COMMENT '交易对',
  `title` varchar(50) NOT NULL COMMENT 'BTC/USDT格式',
  `status` int(11) NOT NULL COMMENT '状态1正常2禁用',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '交易状态1正常2禁止',
  `sort` int(11) NOT NULL COMMENT '排序',
  `addtime` datetime NOT NULL COMMENT '添加时间',
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='合约交易对配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_ctmarket`
--

LOCK TABLES `tw_ctmarket` WRITE;
/*!40000 ALTER TABLE `tw_ctmarket` DISABLE KEYS */;
INSERT INTO `tw_ctmarket` VALUES (1,'btc','btc_usdt','btcusdt','BTC/USDT',1,1,1,'2021-08-06 22:09:16','/xm/1613786496962262.png'),(2,'eth','eth_usdt','ethusdt','ETH/USDT',1,1,2,'2021-08-31 17:08:45','/xm/1613786513998262.png'),(3,'eos','eos_usdt','eosusdt','EOS/USDT',1,1,3,'2021-08-31 17:08:58','/xm/5f8738fd439bc57.png'),(4,'doge','doge_usdt','dogeusdt','DOGE/USDT',1,1,4,'2021-08-31 17:19:10','/xm/doge.png'),(5,'bch','bch_usdt','bchusdt','BCH/USDT',1,1,5,'2021-09-20 23:51:59','/xm/5fc.png'),(6,'ltc','ltc_usdt','ltcusdt','LTC/USDT',1,1,6,'2021-08-31 17:20:08','/xm/5f87397132a8b02.png'),(7,'trx','trx_usdt','trxusdt','TRX/USDT',2,2,7,'2022-06-17 05:42:29','/xm/trx.png'),(8,'xrp','xrp_usdt','xrpusdt','XRP/USDT',2,2,8,'2022-06-17 05:42:49','/xm/5f87391dce40926.png'),(9,'iota','iota_usdt','iotausdt','IOTA/USDT',1,1,9,'2021-09-20 23:52:08','/xm/1594057379245582.png'),(10,'fil','fil_usdt','filusdt','FIL/USDT',1,1,10,'2021-08-31 17:21:45','/xm/fil.png'),(11,'shib','shib_usdt','shibusdt','SHIB/USDT',2,2,11,'2022-06-17 05:43:08',NULL),(12,'flow','flow_usdt','flowusdt','FLOW/USDT',1,1,12,'2021-08-31 17:22:25','/xm/4558.png'),(13,'jst','jst_usdt','jstusdt','JST/USDT',1,1,13,'2021-09-20 23:52:18','/xm/jst.svg'),(14,'itc','itc_usdt','itcusdt','ITC/USDT',2,2,14,'2024-03-11 15:34:38','/xm/2251.png'),(17,'ht','ht_usdt','htusdt','HT/USDT',2,2,15,'2024-03-11 15:34:48','/xm/1613791952263794.png'),(16,'ogo','ogo_usdt','ogousdt','OGO/USDT',2,2,16,'2022-06-17 05:43:22',NULL);
/*!40000 ALTER TABLE `tw_ctmarket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_daohang`
--

DROP TABLE IF EXISTS `tw_daohang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_daohang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `lang` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT 'zh-cn',
  `name` varchar(30) CHARACTER SET utf8 NOT NULL COMMENT '名称',
  `title` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '名称',
  `url` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'url',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '编辑时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `get_login` tinyint(1) NOT NULL DEFAULT '0',
  `access` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_daohang`
--

LOCK TABLES `tw_daohang` WRITE;
/*!40000 ALTER TABLE `tw_daohang` DISABLE KEYS */;
INSERT INTO `tw_daohang` VALUES (1,'zh-cn','Trade_cn','现货交易','/Trade',1,1532772516,0,1,0,0),(2,'en-us','Trade_cn','TRADE','/Trade',1,1532772535,0,1,0,0),(3,'zh-cn','C2C_cn','C2C交易','/Exchange',2,1532772558,0,1,0,0),(4,'en-us','C2C_en','C2C','/Exchange',2,1532772569,0,1,0,0),(5,'en-us','ICO_en','ICO','/Issue',9,1532772585,0,1,0,0),(6,'zh-cn','ICO_cn','新币预热','/Issue',9,1532772596,0,1,0,0),(7,'zh-cn','VOTE_cn','投票上币','/Vote',7,1532772649,0,0,0,0),(8,'en-us','VOTE_en','VOTE','/Vote',7,1532772675,0,0,0,0),(11,'zh-cn','Help_cn','帮助中心','/Support',99,1532772738,0,1,0,0),(12,'en-us','Help_en','HELP','/Support',99,1532772753,0,1,0,0),(15,'zh-cn','Financing_cn','币生币','/Financing',5,1541438000,0,1,0,0),(16,'en-us','Financing_en','DEPOSIT REWARD','/Financing',5,1541472739,0,1,0,0),(17,'zh-cn','OTC交易','OTC交易','/Markethouse',3,1597053925,0,1,0,0),(18,'en-us','OTC','OTC','/Markethouse',3,1597054768,0,1,0,0),(19,'zh-cn','矿池挖矿','矿池挖矿','/Orepool',6,1597540099,0,1,0,0),(20,'en-us','Orepool','Orepool','/Orepool',6,1597540154,0,1,0,0);
/*!40000 ALTER TABLE `tw_daohang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_djprofit`
--

DROP TABLE IF EXISTS `tw_djprofit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_djprofit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `username` varchar(30) NOT NULL COMMENT '会员账号',
  `num` decimal(12,6) NOT NULL COMMENT '冻结额度',
  `coin` varchar(30) NOT NULL COMMENT '币名称',
  `status` int(11) NOT NULL COMMENT '状态1冻结中2已释放',
  `addtime` datetime NOT NULL COMMENT '冻结时间',
  `addday` date NOT NULL COMMENT '冻结日期',
  `thawtime` datetime NOT NULL COMMENT '解冻结时间',
  `thawday` date NOT NULL COMMENT '解冻日期',
  `remark` varchar(225) NOT NULL COMMENT '冻结说明',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='数字币冻结记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_djprofit`
--

LOCK TABLES `tw_djprofit` WRITE;
/*!40000 ALTER TABLE `tw_djprofit` DISABLE KEYS */;
/*!40000 ALTER TABLE `tw_djprofit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_footer`
--

DROP TABLE IF EXISTS `tw_footer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_footer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) NOT NULL DEFAULT 'zh-cn',
  `name` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL DEFAULT '',
  `url` varchar(200) NOT NULL DEFAULT '',
  `img` varchar(200) NOT NULL DEFAULT '',
  `type` varchar(200) NOT NULL DEFAULT '',
  `remark` varchar(50) NOT NULL DEFAULT '',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` int(4) NOT NULL DEFAULT '0',
  `get_login` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_footer`
--

LOCK TABLES `tw_footer` WRITE;
/*!40000 ALTER TABLE `tw_footer` DISABLE KEYS */;
INSERT INTO `tw_footer` VALUES (1,'zh-cn','About_cn','关于我们','/Support/index/articles/cid/6/id/15.html','','','',0,1532768022,0,1,0),(2,'en-us','About_en','About us','/Support/index/articles/cid/6/id/15.html','','','',0,1532768090,0,1,0),(3,'zh-cn','Help_cn','帮助中心','/Support/index.html','','','',0,1532768213,0,1,0),(4,'en-us','Help_en','Help center','/Support/index.html','','','',0,1532768248,0,1,0),(5,'zh-cn','Fees_cn','交易费率','/Support/Pages/fee.html','','','',0,1532768275,0,1,0),(6,'en-us','Fees_en','Fees','/Support/Pages/fee.html','','','',0,1532768435,0,1,0),(7,'zh-cn','Token_cn','上币申请','/Support/index/articles/cid/6/id/22.html','','','',0,1532768722,0,1,0),(8,'en-us','Token_en','Business cooperation','/Support/index/articles/cid/6/id/22.html','','','',0,1532768911,0,1,0),(9,'zh-cn','Legal_cn','用户协议','/Support/index/articles/cid/7/id/18.html','','','',0,1532769282,0,1,0),(10,'en-us','Legal_en','User Agreement','/Support/index/articles/cid/7/id/18.html','','','',0,1532769307,0,1,0),(11,'zh-cn','Contact_cn','联系我们','/Support/index/articles/cid/6/id/16.html','','','',0,1532769356,0,1,0),(12,'en-us','Contact_en','Contact Us','/Support/index/articles/cid/6/id/16.html','','','',0,1532769373,0,1,0);
/*!40000 ALTER TABLE `tw_footer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_hyorder`
--

DROP TABLE IF EXISTS `tw_hyorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_hyorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `username` varchar(60) NOT NULL COMMENT '会员账号',
  `num` float(10,2) NOT NULL COMMENT '投资金额',
  `hybl` float(10,2) NOT NULL COMMENT '盈亏比例',
  `hyzd` int(11) NOT NULL COMMENT '合约涨跌1买涨2买跌',
  `coinname` varchar(30) NOT NULL COMMENT '交易对',
  `status` int(11) NOT NULL COMMENT '状态：1待结算2已结算3无效结算',
  `is_win` int(11) NOT NULL COMMENT '盈亏状态：1盈利2亏损',
  `buytime` datetime NOT NULL COMMENT '购买时间',
  `selltime` datetime NOT NULL COMMENT '结算时间',
  `intselltime` int(11) NOT NULL COMMENT '结算时间戳',
  `buyprice` decimal(12,6) NOT NULL COMMENT '建仓单价',
  `sellprice` decimal(12,6) NOT NULL COMMENT '结算单价',
  `ploss` decimal(12,6) NOT NULL COMMENT '盈亏金额',
  `time` int(11) NOT NULL COMMENT '结算分钟数',
  `kongyk` int(11) NOT NULL COMMENT '控制盈亏1盈利2亏损0未指定',
  `invit` varchar(60) NOT NULL COMMENT '邀请码(上级)',
  `tznum` int(11) NOT NULL DEFAULT '0' COMMENT '0未通知，1已通知',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1104 DEFAULT CHARSET=utf8 COMMENT='合约订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_hyorder`
--

LOCK TABLES `tw_hyorder` WRITE;
/*!40000 ALTER TABLE `tw_hyorder` DISABLE KEYS */;
INSERT INTO `tw_hyorder` VALUES (958,187,'zhangweini19595@yahoo.com',10000.00,80.00,1,'BTC/USDT',2,1,'2022-12-04 21:39:06','2022-12-04 21:43:06',1670161386,16935.900000,16981.540000,8000.000000,4,1,'UqGvB',1),(959,187,'zhangweini19595@yahoo.com',10000.00,70.00,1,'BTC/USDT',2,1,'2022-12-04 21:39:24','2022-12-04 21:42:24',1670161344,16935.310000,16981.540000,7000.000000,3,1,'UqGvB',1),(960,187,'zhangweini19595@yahoo.com',2000.00,40.00,1,'BTC/USDT',2,1,'2022-12-04 21:55:06','2022-12-04 21:56:06',1670162166,16932.260000,16981.540000,800.000000,1,1,'UqGvB',1),(961,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'ETH/USDT',2,2,'2022-12-04 22:12:06','2022-12-04 22:13:06',1670163186,1254.060000,1253.388000,500.000000,1,2,'0',1),(962,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'ETH/USDT',2,1,'2022-12-04 22:14:58','2022-12-04 22:15:58',1670163358,1253.700000,1256.180000,200.000000,1,1,'0',1),(963,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'BTC/USDT',2,1,'2022-12-05 21:02:19','2022-12-05 21:03:19',1670245399,17254.000000,17254.981200,200.000000,1,1,'0',1),(964,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'BTC/USDT',2,1,'2022-12-05 21:12:15','2022-12-05 21:13:15',1670245995,17243.730000,17243.898000,200.000000,1,1,'0',1),(965,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'BTC/USDT',2,2,'2022-12-05 21:14:51','2022-12-05 21:15:51',1670246151,17246.740000,17009.740000,500.000000,1,2,'0',1),(966,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'BTC/USDT',2,2,'2022-12-05 21:48:05','2022-12-05 21:49:05',1670248145,17256.550000,17009.740000,500.000000,1,2,'0',1),(967,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'BTC/USDT',2,2,'2022-12-05 09:14:20','2022-12-05 09:15:20',1670249720,17227.880000,17009.740000,500.000000,1,2,'0',1),(968,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'BTC/USDT',2,1,'2022-12-06 06:35:20','2022-12-06 06:36:20',1670326580,16984.470000,17009.740000,200.000000,1,1,'0',0),(969,191,'akcy2022@gmail.com',10000.00,40.00,1,'BTC/USDT',2,1,'2022-12-06 07:47:38','2022-12-06 07:48:38',1670330918,17003.080000,17003.299100,4000.000000,1,1,'0',1),(970,191,'akcy2022@gmail.com',1000.00,50.00,1,'BTC/USDT',2,1,'2022-12-06 07:49:38','2022-12-06 07:51:38',1670331098,16993.750000,16994.246600,500.000000,2,1,'0',1),(971,191,'akcy2022@gmail.com',1000.00,70.00,1,'BTC/USDT',2,1,'2022-12-06 07:52:50','2022-12-06 07:55:50',1670331350,16990.850000,16997.800000,700.000000,3,1,'0',1),(972,191,'akcy2022@gmail.com',1000.00,100.00,1,'BTC/USDT',2,1,'2022-12-06 07:57:12','2022-12-06 08:02:12',1670331732,16995.860000,16998.080000,1000.000000,5,1,'0',1),(973,191,'akcy2022@gmail.com',1000.00,200.00,1,'BTC/USDT',2,1,'2022-12-06 08:06:16','2022-12-06 08:14:16',1670332456,17005.630000,17014.020000,2000.000000,8,1,'0',1),(974,191,'akcy2022@gmail.com',1000.00,40.00,1,'BTC/USDT',2,2,'2022-12-06 08:21:20','2022-12-06 08:22:20',1670332940,17020.390000,17019.650700,1000.000000,1,2,'0',1),(975,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'BTC/USDT',2,2,'2022-12-08 23:39:58','2022-12-08 23:40:58',1670560858,17212.280000,17212.150500,500.000000,1,2,'0',0),(976,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'BTC/USDT',2,1,'2022-12-08 23:42:02','2022-12-08 23:43:02',1670560982,17217.620000,17220.400000,200.000000,1,1,'0',0),(977,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'BTC/USDT',2,2,'2022-12-08 23:42:06','2022-12-08 23:43:06',1670560986,17217.620000,17217.303800,500.000000,1,2,'0',0),(978,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'BTC/USDT',2,2,'2022-12-09 00:31:24','2022-12-09 00:32:24',1670563944,17202.980000,17202.120000,500.000000,1,2,'0',0),(979,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'BTC/USDT',2,2,'2022-12-09 02:11:53','2022-12-09 02:12:53',1670569973,17223.990000,17221.530000,500.000000,1,2,'0',0),(980,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'BTC/USDT',2,2,'2022-12-09 02:25:23','2022-12-09 02:26:23',1670570783,17220.210000,17219.731700,500.000000,1,2,'0',0),(981,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'BTC/USDT',2,1,'2022-12-09 02:37:52','2022-12-09 02:38:52',1670571532,17221.540000,17223.220000,200.000000,1,1,'0',0),(982,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'BTC/USDT',2,2,'2022-12-09 02:37:53','2022-12-09 02:38:53',1670571533,17221.540000,17220.713400,500.000000,1,2,'0',0),(983,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'BTC/USDT',2,2,'2022-12-09 02:40:37','2022-12-09 02:41:37',1670571697,17221.210000,17220.744400,500.000000,1,2,'0',0),(984,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'BTC/USDT',2,2,'2022-12-09 02:42:24','2022-12-09 02:43:24',1670571804,17222.850000,17219.910000,500.000000,1,2,'0',0),(985,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'BTC/USDT',2,2,'2022-12-09 02:44:34','2022-12-09 02:45:34',1670571934,17219.620000,17217.740000,500.000000,1,2,'0',0),(986,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'BTC/USDT',2,2,'2022-12-09 02:47:21','2022-12-09 02:48:21',1670572101,17222.090000,17221.621300,500.000000,1,2,'0',0),(987,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'BTC/USDT',2,2,'2022-12-09 02:47:22','2022-12-09 02:48:22',1670572102,17222.090000,17221.236000,500.000000,1,2,'0',0),(988,190,'8e5xt8ib@idrrate.com',500.00,40.00,1,'BTC/USDT',2,2,'2022-12-09 02:48:58','2022-12-09 02:49:58',1670572198,17223.320000,17220.940000,500.000000,1,2,'0',0),(989,191,'akcy2022@gmail.com',12588.00,40.00,1,'BTC/USDT',2,2,'2022-12-09 06:10:26','2022-12-09 06:11:26',1670584286,17210.560000,17209.690000,12588.000000,1,2,'0',0),(990,191,'akcy2022@gmail.com',34588.00,40.00,1,'BTC/USDT',2,1,'2022-12-13 11:38:03','2022-12-13 11:39:03',1670949543,17806.360000,17815.700000,13835.200000,1,1,'0',1),(991,191,'akcy2022@gmail.com',46750.00,50.00,1,'BTC/USDT',2,1,'2022-12-13 11:40:31','2022-12-13 11:42:31',1670949751,17810.390000,17810.440000,23375.000000,2,1,'0',1),(992,191,'akcy2022@gmail.com',66758.00,40.00,1,'BTC/USDT',2,1,'2022-12-13 11:43:33','2022-12-13 11:44:33',1670949873,17815.860000,17816.453100,26703.200000,1,1,'0',1),(993,191,'akcy2022@gmail.com',87650.00,40.00,1,'BTC/USDT',2,1,'2022-12-13 11:45:41','2022-12-13 11:46:41',1670950001,17802.430000,17803.034000,35060.000000,1,1,'0',1),(994,176,'88888',500.00,50.00,1,'BTC/USDT',2,2,'2022-12-13 17:54:43','2022-12-13 17:56:43',1670972203,17770.910000,17765.890000,500.000000,2,2,'0',1),(995,191,'akcy2022@gmail.com',25888.00,40.00,1,'BTC/USDT',2,1,'2022-12-14 10:01:39','2022-12-14 10:02:39',1671030159,18037.980000,18043.050000,10355.200000,1,1,'0',1),(996,191,'akcy2022@gmail.com',2588.00,40.00,1,'BTC/USDT',2,1,'2022-12-14 10:03:36','2022-12-14 10:04:36',1671030276,18032.100000,18034.750000,1035.200000,1,2,'0',1),(997,191,'akcy2022@gmail.com',2588.00,40.00,1,'BTC/USDT',2,2,'2022-12-14 10:05:27','2022-12-14 10:06:27',1671030387,18033.110000,18032.573400,2588.000000,1,2,'0',1),(998,191,'akcy2022@gmail.com',2588.00,40.00,1,'BTC/USDT',2,2,'2022-12-14 10:07:10','2022-12-14 10:08:10',1671030490,18044.460000,18043.823500,2588.000000,1,2,'0',0),(999,191,'akcy2022@gmail.com',2588.00,40.00,1,'BTC/USDT',2,2,'2022-12-14 10:10:59','2022-12-14 10:11:59',1671030719,18040.570000,18038.840000,2588.000000,1,2,'0',1),(1000,191,'akcy2022@gmail.com',2588.00,40.00,1,'BTC/USDT',2,2,'2022-12-14 10:12:42','2022-12-14 10:13:42',1671030822,18037.820000,18032.810000,2588.000000,1,2,'0',1),(1001,191,'akcy2022@gmail.com',2588.00,40.00,1,'BTC/USDT',2,2,'2022-12-14 10:21:14','2022-12-14 10:22:14',1671031334,18067.920000,18066.961600,2588.000000,1,2,'0',1),(1002,194,'haizi@163.com',63885.00,50.00,1,'BTC/USDT',2,1,'2022-12-17 14:32:06','2022-12-17 14:34:06',1671305646,16692.840000,16693.146000,31942.500000,2,1,'0',1),(1003,191,'akcy2022@gmail.com',50000.00,40.00,1,'BTC/USDT',2,2,'2022-12-21 10:46:14','2022-12-21 10:47:14',1671637634,16858.520000,16855.640000,50000.000000,1,2,'0',0),(1004,194,'haizi@163.com',1000.00,40.00,2,'BTC/USDT',2,1,'2022-12-21 16:31:28','2022-12-21 16:32:28',1671658348,16792.920000,16791.230000,400.000000,1,1,'0',0),(1005,194,'haizi@163.com',1000.00,40.00,2,'BTC/USDT',2,2,'2022-12-21 16:31:28','2022-12-21 16:32:28',1671658348,16792.920000,16793.715800,1000.000000,1,2,'0',0),(1006,191,'akcy2022@gmail.com',5000.00,40.00,1,'BTC/USDT',2,1,'2023-01-04 18:01:20','2023-01-04 18:02:20',1672873340,16817.890000,16826.950000,2000.000000,1,1,'0',1),(1007,191,'akcy2022@gmail.com',62558.00,40.00,2,'BTC/USDT',2,1,'2023-01-04 18:05:28','2023-01-04 18:06:28',1672873588,16825.100000,16824.384600,25023.200000,1,1,'0',1),(1008,191,'akcy2022@gmail.com',62558.00,40.00,2,'BTC/USDT',2,1,'2023-01-04 18:05:34','2023-01-04 18:06:34',1672873594,16825.100000,16824.486100,25023.200000,1,1,'0',1),(1009,199,'germangarcia199078@gmail.com',1022.00,40.00,2,'BTC/USDT',2,1,'2023-01-04 18:05:40','2023-01-04 18:06:40',1672873600,16825.100000,16824.730900,408.800000,1,1,'0',1),(1010,176,'88888',5800.00,40.00,1,'BTC/USDT',2,2,'2023-01-04 19:27:32','2023-01-04 19:28:32',1672878512,16865.540000,16864.440000,5800.000000,1,2,'0',0),(1011,176,'88888',5000.00,100.00,1,'BTC/USDT',2,2,'2023-01-05 09:49:18','2023-01-05 09:54:18',1672930458,16775.410000,16775.198400,5000.000000,5,2,'0',0),(1012,176,'88888',5000.00,40.00,2,'BTC/USDT',2,2,'2023-01-05 11:45:21','2023-01-05 11:46:21',1672937181,16830.000000,16830.528300,5000.000000,1,2,'0',0),(1013,191,'akcy2022@gmail.com',66680.00,40.00,1,'BTC/USDT',2,2,'2023-01-06 18:00:02','2023-01-06 18:01:02',1673046062,16954.600000,16953.718700,66680.000000,1,2,'0',0),(1014,199,'germangarcia199078@gmail.com',1408.00,40.00,1,'BTC/USDT',2,2,'2023-01-06 18:00:14','2023-01-06 18:01:14',1673046074,16957.640000,16957.334900,1408.000000,1,2,'0',0),(1015,191,'akcy2022@gmail.com',66680.00,40.00,1,'BTC/USDT',2,1,'2023-01-06 18:02:49','2023-01-06 18:03:49',1673046229,16957.010000,16958.250000,26672.000000,1,1,'0',1),(1016,191,'akcy2022@gmail.com',10000.00,40.00,1,'BTC/USDT',2,1,'2023-02-16 12:19:55','2023-02-16 12:20:55',1676568055,24767.990000,24801.380000,4000.000000,1,1,'0',1),(1017,207,'Yomi@gmail.com',500.00,40.00,1,'BTC/USDT',2,2,'2023-02-19 20:50:52','2023-02-19 20:51:52',1676857912,24284.970000,24261.920000,500.000000,1,2,'0',1),(1018,207,'Yomi@gmail.com',500.00,50.00,2,'BTC/USDT',2,1,'2023-02-19 20:51:03','2023-02-19 20:53:03',1676857983,24287.640000,24260.930000,250.000000,2,1,'0',1),(1019,207,'Yomi@gmail.com',5000.00,70.00,1,'BTC/USDT',2,1,'2023-02-19 20:51:15','2023-02-19 20:54:15',1676858055,24288.080000,24288.391800,3500.000000,3,1,'0',1),(1020,206,'laura@gmail.com',1000.00,40.00,1,'BTC/USDT',2,2,'2023-02-19 21:17:38','2023-02-19 21:18:38',1676859518,24287.960000,24287.772800,1000.000000,1,2,'0',0),(1021,206,'laura@gmail.com',2000.00,50.00,2,'BTC/USDT',2,2,'2023-02-19 21:20:15','2023-02-19 21:22:15',1676859735,24308.010000,24315.480000,2000.000000,2,2,'0',0),(1022,191,'akcy2022@gmail.com',58600.00,40.00,2,'BTC/USDT',2,1,'2023-02-21 16:55:57','2023-02-21 16:56:57',1677016617,24212.720000,24173.910000,23440.000000,1,1,'0',1),(1023,206,'laura@gmail.com',1000.00,40.00,1,'BTC/USDT',2,2,'2023-02-21 20:56:20','2023-02-21 20:57:20',1677031040,24182.740000,24160.010000,1000.000000,1,2,'0',0),(1024,206,'laura@gmail.com',1000.00,40.00,2,'BTC/USDT',2,1,'2023-02-21 21:01:32','2023-02-21 21:02:32',1677031352,24040.870000,24028.250000,400.000000,1,1,'0',1),(1025,206,'laura@gmail.com',1000.00,40.00,2,'BTC/USDT',2,2,'2023-02-21 21:03:35','2023-02-21 21:04:35',1677031475,24037.450000,24064.590000,1000.000000,1,2,'0',1),(1026,207,'Yomi@gmail.com',1000.00,40.00,1,'BTC/USDT',2,2,'2023-02-21 21:03:35','2023-02-21 21:04:35',1677031475,24034.830000,24034.230900,1000.000000,1,2,'0',1),(1027,207,'Yomi@gmail.com',1000.00,40.00,2,'BTC/USDT',2,2,'2023-02-24 16:00:07','2023-02-24 16:01:07',1677272467,23216.490000,23216.793900,1000.000000,1,2,'0',0),(1028,202,'laola@gmail.com',1000.00,40.00,2,'BTC/USDT',2,2,'2023-02-24 16:00:40','2023-02-24 16:01:40',1677272500,23191.980000,23212.220000,1000.000000,1,2,'0',0),(1029,191,'akcy2022@gmail.com',1000.00,40.00,2,'BTC/USDT',2,2,'2023-02-24 16:02:22','2023-02-24 16:03:22',1677272602,23186.360000,23224.280000,1000.000000,1,2,'0',1),(1030,207,'Yomi@gmail.com',2000.00,40.00,2,'BTC/USDT',2,1,'2023-02-24 16:02:37','2023-02-24 16:03:37',1677272617,23181.160000,23180.924800,800.000000,1,1,'0',1),(1031,202,'laola@gmail.com',5000.00,40.00,1,'BTC/USDT',2,1,'2023-02-24 16:03:00','2023-02-24 16:04:00',1677272640,23227.190000,23230.420000,2000.000000,1,1,'0',1),(1032,206,'laura@gmail.com',1000.00,40.00,2,'BTC/USDT',2,1,'2023-02-24 16:03:09','2023-02-24 16:04:09',1677272649,23239.470000,23216.900000,400.000000,1,1,'0',1),(1033,202,'laola@gmail.com',5000.00,40.00,1,'BTC/USDT',2,1,'2023-02-24 16:04:52','2023-02-24 16:05:52',1677272752,23206.360000,23224.290000,2000.000000,1,1,'0',1),(1034,207,'Yomi@gmail.com',58000.00,40.00,1,'BTC/USDT',2,1,'2023-02-24 17:49:20','2023-02-24 17:50:20',1677279020,23093.900000,23094.217500,23200.000000,1,1,'0',1),(1035,207,'Yomi@gmail.com',58837.00,40.00,1,'BTC/USDT',2,1,'2023-02-24 17:49:51','2023-02-24 17:50:51',1677279051,23098.490000,23098.831200,23534.800000,1,1,'0',1),(1036,206,'laura@gmail.com',58500.00,40.00,1,'BTC/USDT',2,1,'2023-02-26 14:44:13','2023-02-26 14:45:13',1677440713,23487.600000,23488.222200,23400.000000,1,1,'0',1),(1037,207,'Yomi@gmail.com',2000.00,40.00,1,'BTC/USDT',2,1,'2023-02-27 11:50:19','2023-02-27 11:51:19',1677516679,23363.470000,23399.970000,800.000000,1,1,'0',1),(1038,207,'Yomi@gmail.com',58500.00,40.00,2,'BTC/USDT',2,1,'2023-02-27 18:00:01','2023-02-27 18:01:01',1677538861,23481.980000,23481.853800,23400.000000,1,1,'0',1),(1039,206,'laura@gmail.com',58000.00,40.00,2,'BTC/USDT',2,1,'2023-02-27 18:55:03','2023-02-27 18:56:03',1677542163,23499.870000,23499.763500,23200.000000,1,1,'0',1),(1040,206,'laura@gmail.com',60000.00,40.00,1,'BTC/USDT',2,1,'2023-03-06 13:58:30','2023-03-06 13:59:30',1678129170,22500.660000,22501.297600,24000.000000,1,1,'0',0),(1041,206,'laura@gmail.com',60000.00,40.00,1,'BTC/USDT',2,2,'2023-03-06 13:58:30','2023-03-06 13:59:30',1678129170,22500.660000,22497.870000,60000.000000,1,2,'0',0),(1042,207,'Yomi@gmail.com',58000.00,40.00,2,'BTC/USDT',2,1,'2023-03-06 16:30:01','2023-03-06 16:31:01',1678138261,22383.680000,22383.542500,23200.000000,1,1,'0',1),(1043,191,'akcy2022@gmail.com',125820.00,50.00,2,'BTC/USDT',2,1,'2023-03-10 13:31:46','2023-03-10 13:33:46',1678473226,19914.000000,19896.810000,62910.000000,2,1,'0',1),(1044,199,'germangarcia199078@gmail.com',5088.00,40.00,2,'BTC/USDT',2,2,'2023-03-14 16:01:09','2023-03-14 16:02:09',1678824129,24991.190000,25044.280000,5088.000000,1,2,'0',1),(1045,191,'akcy2022@gmail.com',66580.00,40.00,2,'BTC/USDT',2,1,'2023-03-14 16:01:22','2023-03-14 16:02:22',1678824142,24993.030000,24992.034500,26632.000000,1,1,'0',1),(1046,191,'akcy2022@gmail.com',66580.00,40.00,2,'BTC/USDT',2,1,'2023-03-14 16:10:02','2023-03-14 16:11:02',1678824662,24980.340000,24970.000000,26632.000000,1,1,'0',1),(1047,207,'Yomi@gmail.com',58000.00,40.00,2,'BTC/USDT',2,1,'2023-03-14 16:29:49','2023-03-14 16:30:49',1678825849,24887.810000,24886.889700,23200.000000,1,1,'0',1),(1048,199,'germangarcia199078@gmail.com',1000.00,40.00,2,'BTC/USDT',2,1,'2023-03-14 16:47:38','2023-03-14 16:48:38',1678826918,24687.030000,24682.580000,400.000000,1,1,'0',1),(1049,191,'akcy2022@gmail.com',68580.00,40.00,1,'BTC/USDT',2,1,'2023-03-17 14:59:41','2023-03-17 15:00:41',1679079641,26599.580000,26600.493000,27432.000000,1,1,'0',1),(1050,199,'germangarcia199078@gmail.com',7120.00,40.00,1,'BTC/USDT',2,1,'2023-03-17 15:00:33','2023-03-17 15:01:33',1679079693,26600.000000,26600.251900,2848.000000,1,1,'0',1),(1051,191,'akcy2022@gmail.com',65888.00,40.00,1,'BTC/USDT',2,1,'2023-03-21 13:59:42','2023-03-21 14:00:42',1679421642,28006.750000,28007.220100,26355.200000,1,1,'0',1),(1052,199,'germangarcia199078@gmail.com',9900.00,40.00,1,'BTC/USDT',2,1,'2023-03-21 14:00:04','2023-03-21 14:01:04',1679421664,27988.970000,27989.834800,3960.000000,1,1,'0',1),(1053,176,'88888',2000.00,70.00,1,'BTC/USDT',2,2,'2023-03-25 10:03:41','2023-03-25 10:06:41',1679753201,27581.990000,27581.472200,2000.000000,3,2,'0',0),(1054,199,'germangarcia199078@gmail.com',34200.00,40.00,1,'BTC/USDT',2,1,'2023-03-28 16:21:11','2023-03-28 16:22:11',1680034931,27323.590000,27324.060700,13680.000000,1,1,'0',1),(1055,199,'germangarcia199078@gmail.com',50001.00,70.00,2,'BTC/USDT',2,1,'2023-03-31 16:01:25','2023-03-31 16:04:25',1680293065,28435.500000,28422.220000,35000.700000,3,1,'0',1),(1056,211,'gchil207@yahoo.com',1950.00,40.00,2,'BTC/USDT',2,1,'2023-03-31 16:05:07','2023-03-31 16:06:07',1680293167,28415.500000,28397.560000,780.000000,1,1,'0',1),(1057,211,'gchil207@yahoo.com',2700.00,40.00,1,'BTC/USDT',2,1,'2023-04-04 18:00:01','2023-04-04 18:01:01',1680645661,28226.810000,28227.241800,1080.000000,1,1,'0',1),(1058,199,'germangarcia199078@gmail.com',84000.00,40.00,1,'BTC/USDT',2,1,'2023-04-04 18:00:04','2023-04-04 18:01:04',1680645664,28226.810000,28227.324800,33600.000000,1,1,'0',1),(1059,206,'laura@gmail.com',100000.00,50.00,1,'BTC/USDT',2,1,'2023-04-05 15:06:27','2023-04-05 15:08:27',1680721707,28042.370000,28043.171900,50000.000000,2,1,'0',1),(1060,213,'jtbrown64@gmail.com',1000.00,40.00,1,'BTC/USDT',2,1,'2023-04-05 15:12:03','2023-04-05 15:13:03',1680721983,27972.530000,27990.000000,400.000000,1,1,'0',1),(1061,213,'jtbrown64@gmail.com',1000.00,40.00,1,'BTC/USDT',2,2,'2023-04-05 15:15:19','2023-04-05 15:16:19',1680722179,28113.450000,28079.900000,1000.000000,1,2,'0',1),(1062,191,'akcy2022@gmail.com',1000.00,40.00,2,'BTC/USDT',2,1,'2023-04-05 15:49:24','2023-04-05 15:50:24',1680724224,28270.500000,28270.131300,400.000000,1,1,'0',1),(1063,213,'jtbrown64@gmail.com',2350.00,40.00,1,'BTC/USDT',2,2,'2023-04-06 12:29:59','2023-04-06 12:30:59',1680798659,28100.000000,28099.596100,2350.000000,1,2,'0',0),(1064,206,'laura@gmail.com',50000.00,40.00,1,'BTC/USDT',2,2,'2023-04-06 12:30:13','2023-04-06 12:31:13',1680798673,28102.000000,28101.075900,50000.000000,1,2,'0',0),(1065,206,'laura@gmail.com',2000.00,40.00,1,'BTC/USDT',2,1,'2023-04-06 15:37:12','2023-04-06 15:38:12',1680809892,28032.350000,28033.231900,800.000000,1,1,'0',1),(1066,206,'laura@gmail.com',200000.00,40.00,1,'BTC/USDT',2,2,'2023-04-06 15:39:00','2023-04-06 15:40:00',1680810000,28012.310000,28002.470000,200000.000000,1,2,'0',1),(1067,213,'jtbrown64@gmail.com',3700.00,40.00,1,'BTC/USDT',2,1,'2023-04-07 15:15:04','2023-04-07 15:16:04',1680894964,27873.440000,27874.328600,1480.000000,1,1,'0',1),(1068,211,'gchil207@yahoo.com',3700.00,40.00,2,'BTC/USDT',2,1,'2023-04-07 18:00:03','2023-04-07 18:01:03',1680904863,27890.780000,27889.340000,1480.000000,1,1,'0',1),(1069,207,'Yomi@gmail.com',60000.00,40.00,2,'BTC/USDT',2,1,'2023-04-07 18:00:27','2023-04-07 18:01:27',1680904887,27889.330000,27888.891700,24000.000000,1,1,'0',1),(1070,199,'germangarcia199078@gmail.com',115000.00,40.00,2,'BTC/USDT',2,1,'2023-04-07 18:03:03','2023-04-07 18:04:03',1680905043,27889.330000,27888.610500,46000.000000,1,1,'0',1),(1071,176,'88888',500.00,40.00,1,'BTC/USDT',2,1,'2023-04-08 04:42:10','2023-04-08 04:43:10',1680943390,28087.310000,28087.726800,200.000000,1,1,'0',1),(1072,176,'88888',5000.00,40.00,1,'BTC/USDT',2,1,'2023-04-08 04:45:14','2023-04-08 04:46:14',1680943574,28089.340000,28089.582800,2000.000000,1,1,'0',1),(1073,213,'jtbrown64@gmail.com',5000.00,50.00,1,'BTC/USDT',2,1,'2023-04-11 12:00:55','2023-04-11 12:02:55',1681228975,30185.990000,30203.990000,2500.000000,2,1,'0',1),(1074,206,'laura@gmail.com',150000.00,50.00,1,'BTC/USDT',2,1,'2023-04-11 12:04:26','2023-04-11 12:06:26',1681229186,30205.990000,30206.145500,75000.000000,2,1,'0',1),(1075,213,'jtbrown64@gmail.com',7400.00,40.00,1,'BTC/USDT',2,1,'2023-04-20 13:30:21','2023-04-20 13:31:21',1682011881,28588.580000,28589.244100,2960.000000,1,1,'0',1),(1076,206,'laura@gmail.com',200000.00,40.00,1,'BTC/USDT',2,1,'2023-04-20 13:38:50','2023-04-20 13:39:50',1682012390,28516.510000,28516.726200,80000.000000,1,1,'0',1),(1077,213,'jtbrown64@gmail.com',10000.00,50.00,1,'BTC/USDT',2,1,'2023-04-21 12:30:15','2023-04-21 12:32:15',1682094735,27985.420000,28001.990000,5000.000000,2,1,'0',1),(1078,213,'jtbrown64@gmail.com',15000.00,40.00,1,'BTC/USDT',2,1,'2023-04-22 14:31:21','2023-04-22 14:32:21',1682188341,27583.130000,27585.020000,6000.000000,1,1,'0',1),(1079,213,'jtbrown64@gmail.com',21000.00,40.00,1,'BTC/USDT',2,1,'2023-04-24 12:00:04','2023-04-24 12:01:04',1682352064,27255.500000,27257.670000,8400.000000,1,1,'0',1),(1080,213,'jtbrown64@gmail.com',24000.00,40.00,1,'BTC/USDT',2,1,'2023-04-26 12:00:27','2023-04-26 12:01:27',1682524887,29824.990000,29834.340000,9600.000000,1,1,'0',1),(1081,209,'zxjdbq1219@gmail.com',500.00,40.00,2,'BTC/USDT',2,1,'2023-05-27 06:57:34','2023-05-27 06:58:34',1685185114,26675.000000,26674.079500,200.000000,1,1,'0',1),(1082,222,'iqv0bd6m@besttempmail.com',500.00,40.00,1,'BTC/USDT',2,2,'2023-05-30 23:01:47','2023-05-30 23:02:47',1685502167,27653.180000,27649.750000,500.000000,1,2,'0',1),(1083,222,'iqv0bd6m@besttempmail.com',500.00,40.00,1,'BTC/USDT',2,2,'2023-05-30 23:05:12','2023-05-30 23:06:12',1685502372,27640.100000,27635.660000,500.000000,1,2,'0',1),(1084,222,'iqv0bd6m@besttempmail.com',500.00,40.00,1,'BTC/USDT',2,2,'2023-05-30 23:07:27','2023-05-30 23:08:27',1685502507,27631.000000,27619.500000,500.000000,1,2,'0',1),(1085,209,'zxjdbq1219@gmail.com',2000.00,50.00,1,'BTC/USDT',2,2,'2023-06-01 11:05:56','2023-06-01 11:07:56',1685632076,26881.950000,26869.800000,2000.000000,2,2,'0',0),(1086,223,'baofu8618@gmail.com',1500.00,40.00,1,'BTC/USDT',2,2,'2023-06-02 04:04:03','2023-06-02 04:05:03',1685693103,27077.990000,27077.470000,1500.000000,1,2,'0',0),(1087,223,'baofu8618@gmail.com',500.00,40.00,1,'BTC/USDT',2,2,'2023-06-02 04:07:47','2023-06-02 04:08:47',1685693327,27081.960000,27081.420000,500.000000,1,2,'0',0),(1088,223,'baofu8618@gmail.com',500.00,40.00,1,'BTC/USDT',2,1,'2023-06-02 04:07:47','2023-06-02 04:08:47',1685693327,27081.960000,27082.902700,200.000000,1,1,'0',0),(1089,223,'baofu8618@gmail.com',500.00,40.00,1,'BTC/USDT',2,2,'2023-06-02 04:07:47','2023-06-02 04:08:47',1685693327,27081.960000,27081.420000,500.000000,1,2,'0',0),(1090,223,'baofu8618@gmail.com',500.00,40.00,1,'BTC/USDT',2,2,'2023-06-02 04:07:47','2023-06-02 04:08:47',1685693327,27081.960000,27081.420000,500.000000,1,2,'0',0),(1091,223,'baofu8618@gmail.com',500.00,40.00,1,'BTC/USDT',2,1,'2023-06-02 04:07:47','2023-06-02 04:08:47',1685693327,27081.960000,27082.252200,200.000000,1,1,'0',0),(1092,223,'baofu8618@gmail.com',500.00,40.00,1,'BTC/USDT',2,2,'2023-06-02 04:07:48','2023-06-02 04:08:48',1685693328,27081.960000,27081.420000,500.000000,1,2,'0',0),(1093,209,'zxjdbq1219@gmail.com',500.00,40.00,1,'BTC/USDT',2,1,'2024-03-11 13:33:54','2024-03-11 13:34:54',1710178494,72455.840000,72456.079200,200.000000,1,1,'0',1),(1094,223,'baofu8618@gmail.com',500.00,40.00,1,'BTC/USDT',2,2,'2024-03-11 14:30:59','2024-03-11 14:31:59',1710181919,72425.590000,72425.393900,500.000000,1,2,'0',1),(1095,225,'1900553000@qq.com',500.00,40.00,1,'BTC/USDT',2,2,'2024-03-11 15:03:05','2024-03-11 15:04:05',1710183845,72443.120000,72442.500400,500.000000,1,2,'iWflz',0),(1096,225,'1900553000@qq.com',500.00,40.00,1,'BTC/USDT',2,2,'2024-03-26 01:20:07','2024-03-26 01:21:07',1711430467,70509.830000,70292.880000,500.000000,1,2,'iWflz',1),(1097,225,'1900553000@qq.com',1000.00,40.00,1,'BTC/USDT',2,2,'2024-03-26 02:11:54','2024-03-26 02:12:54',1711433574,70328.330000,70320.740000,1000.000000,1,2,'iWflz',1),(1098,225,'1900553000@qq.com',2000.00,40.00,1,'BTC/USDT',2,2,'2024-03-27 01:13:26','2024-03-27 01:14:26',1711516466,70346.470000,70345.592400,2000.000000,1,2,'iWflz',0),(1099,225,'1900553000@qq.com',500.00,40.00,1,'ETH/USDT',2,2,'2024-05-25 00:17:02','2024-05-25 00:18:02',1716610682,3762.340000,3749.840000,500.000000,1,2,'iWflz',1),(1100,225,'1900553000@qq.com',500.00,40.00,1,'BTC/USDT',2,1,'2024-05-25 00:19:17','2024-05-25 00:20:17',1716610817,68776.540000,68993.090000,200.000000,1,1,'iWflz',1),(1101,225,'1900553000@qq.com',500.00,100.00,1,'BTC/USDT',2,1,'2024-05-25 00:19:43','2024-05-25 00:24:43',1716611083,68776.540000,68993.090000,500.000000,5,1,'iWflz',1),(1102,225,'1900553000@qq.com',2000.00,125.00,2,'BTC/USDT',2,2,'2024-05-25 00:20:28','2024-05-25 00:27:28',1716611248,68775.830000,68993.090000,2000.000000,7,2,'iWflz',1),(1103,225,'1900553000@qq.com',2000.00,70.00,1,'BTC/USDT',2,2,'2024-05-25 00:36:47','2024-05-25 00:39:47',1716611987,68770.300000,68769.898500,2000.000000,3,2,'iWflz',1);
/*!40000 ALTER TABLE `tw_hyorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_hysetting`
--

DROP TABLE IF EXISTS `tw_hysetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_hysetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `hy_sxf` float(10,2) NOT NULL COMMENT '交易手续费',
  `hy_time` varchar(225) NOT NULL COMMENT '合约时间组',
  `hy_ykbl` varchar(225) NOT NULL COMMENT '盈亏比例组',
  `hy_tzed` varchar(225) NOT NULL COMMENT '投资额度组',
  `hy_kstime` varchar(225) NOT NULL COMMENT '开市时间',
  `hy_ksid` varchar(225) NOT NULL COMMENT '亏损ID组',
  `hy_ylid` varchar(225) NOT NULL COMMENT '盈利ID组',
  `hy_fkgl` varchar(225) NOT NULL COMMENT '风控概率组',
  `hy_min` float(10,2) NOT NULL COMMENT '合约最低投资额',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='合约参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_hysetting`
--

LOCK TABLES `tw_hysetting` WRITE;
/*!40000 ALTER TABLE `tw_hysetting` DISABLE KEYS */;
INSERT INTO `tw_hysetting` VALUES (1,1.00,'1,2,3,5,7','40,50,70,100,125','500,1000,2000,5000,10000,20000,50000','00:00~24:00','','zxjdbq1219@gmail.com','50',300.00);
/*!40000 ALTER TABLE `tw_hysetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_issue`
--

DROP TABLE IF EXISTS `tw_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_issue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `name` varchar(255) NOT NULL COMMENT '认购项目标题',
  `coinname` varchar(50) NOT NULL COMMENT '认购币名称',
  `buycoin` varchar(50) NOT NULL COMMENT '购买币名称',
  `num` decimal(20,6) unsigned NOT NULL COMMENT '发行数量',
  `price` decimal(20,6) unsigned NOT NULL COMMENT '发行单价',
  `sellnum` decimal(20,6) unsigned NOT NULL COMMENT '已售数量',
  `ysnum` decimal(20,6) unsigned NOT NULL COMMENT '预设已售数量',
  `allmax` decimal(20,6) unsigned NOT NULL COMMENT '个人认购量上限',
  `min` decimal(20,6) unsigned NOT NULL COMMENT '最小购买值',
  `max` decimal(20,6) unsigned NOT NULL COMMENT '最大购买值',
  `lockday` int(11) unsigned NOT NULL COMMENT '锁仓周期',
  `tian` int(11) unsigned NOT NULL COMMENT '认购周期',
  `imgs` varchar(225) NOT NULL COMMENT '币图片',
  `content` text NOT NULL COMMENT '币说明',
  `addtime` datetime NOT NULL COMMENT '发布日期',
  `starttime` datetime NOT NULL COMMENT '开始认购时间',
  `finishtime` datetime NOT NULL COMMENT '结束认购时间',
  `status` int(11) NOT NULL COMMENT '状态1正常2隐藏',
  `state` int(11) NOT NULL COMMENT '状态1启用认购2禁止认购',
  `jlcoin` varchar(30) NOT NULL COMMENT '奖励币种名称',
  `one_jl` float(10,2) NOT NULL COMMENT '一代奖励比例',
  `two_jl` float(10,2) NOT NULL COMMENT '二代奖励比例',
  `three_jl` float(10,2) NOT NULL COMMENT '三代奖励比例',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `coinname` (`coinname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='认购发行表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_issue`
--

LOCK TABLES `tw_issue` WRITE;
/*!40000 ALTER TABLE `tw_issue` DISABLE KEYS */;
INSERT INTO `tw_issue` VALUES (1,'TCC币第一期认购','ttc','usdt',20000000.000000,0.100000,172200.000000,1000000.000000,10000.000000,100.000000,10000.000000,90,15,'6141abda8365f.png','<span>TCC币是由华尔街华人风控联合发起，限量发行1亿个</span><span>，2021年9月18日向全球起发起第一期认购，第一期发行量20000000，为期15天，认购币冻结90天自动释放，释放后</span><span>币币市场开放TCC/USDT交易对</span><span>，合约市场开放TCC/USDT交易对进行交易，价格预计是认购单价的10倍.<span>TCC币是由华尔街华人风控联合发起，限量发行1亿个</span><span>，2021年9月18日向全球起发起第一期认购，第一期发行量20000000，为期15天，认购币冻结90天自动释放，释放后</span><span>币币市场开放TCC/USDT交易对</span><span>，合约市场开放TCC/USDT交易对进行交易，价格预计是认购单价的10倍.</span><span>TCC币是由华尔街华人风控联合发起，限量发行1亿个</span><span>，2021年9月18日向全球起发起第一期认购，第一期发行量20000000，为期15天，认购币冻结90天自动释放，释放后</span><span>币币市场开放TCC/USDT交易对</span><span>，合约市场开放TCC/USDT交易对进行交易，价格预计是认购单价的10倍.</span><span>TCC币是由华尔街华人风控联合发起，限量发行1亿个</span><span>，2021年9月18日向全球起发起第一期认购，第一期发行量20000000，为期15天，认购币冻结90天自动释放，释放后</span><span>币币市场开放TCC/USDT交易对</span><span>，合约市场开放TCC/USDT交易对进行交易，价格预计是认购单价的10倍.</span></span>','2021-09-24 11:19:50','2021-09-15 00:00:00','2021-09-30 00:00:00',2,1,'usdz',1.00,0.50,0.30),(2,'TTC币第二期认购','ttc','usdt',30000000.000000,1.200000,0.000000,0.000000,50000.000000,100.000000,10000.000000,120,20,'6141b93748061.png','TCC币是由华尔街华人风控联合发起，限量发行1亿个，2021年9月18日向全球起发起第一期认购，第一期发行量20000000，为期15天，认购币冻结90天自动释放，释放后币币市场开放TCC/USDT交易对，合约市场开放TCC/USDT交易对进行交易，价格预计是认购单价的10倍.','2021-09-24 11:19:22','2021-10-05 00:00:00','2021-10-25 00:00:00',2,1,'usdz',1.00,0.50,0.30),(3,'Subscribe','usdz','usdt',999999999.000000,0.100000,57146608.381968,15000000.000000,9999999.000000,10000.000000,9999999999999.000000,30,90,'629a22523fe41.png','<h2 style=\"color:#74777A;text-indent:0pt;background-color:#FFFFFF;font-family:\"\">\r\n	Industry background<br />\r\n</h2>\r\n<div style=\"margin:0px;padding:0px;color:#74777A;font-size:14px;background-color:#FFFFFF;font-family:\"\">\r\n	The birth of the blockchain marked the beginning of the construction of a truly trustworthy Internet. By combing through the rise and development of the blockchain, it can be found that the focus of the blockchain is that it can establish a reliable peerto-peer trust in the network, so that the value transfer process removes the interference of the intermediary, which not only discloses information but also protects privacy , Both making joint decision-making and protecting individual rights and interests. This mechanism improves the efficiency of value interaction and reduces costs. From an economic point of view, the new value interaction paradigm created by the blockchain is based on \"weak centralization\", but this does not mean the complete disappearance of various \"centers\" in the traditional society, and a large number of blockchains will appear in the future. The “multi-center” system is based on alliance chains, private chains or hybrid chains. Blockchain will further improve the operating efficiency of the “center” and reduce a considerable part of its cost. From a technical point of view, we believe that blockchain is a technology system that is jointly maintained by multiple parties, stores data in a blockchain structure, uses cryptography to ensure transmission and access security, and can achieve consistent data storage, non-tampering, and non-repudiation. This technology has brought unlimited space for imagination to the world. The global interest in blockchain continues to heat up. Major global economies have begun to study blockchain technology and development trends from the national strategic level.\r\n</div>','2022-06-03 23:01:40','2022-03-24 11:02:32','2022-06-22 11:02:32',1,1,'usdz',5.00,3.00,2.00);
/*!40000 ALTER TABLE `tw_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_issue_log`
--

DROP TABLE IF EXISTS `tw_issue_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_issue_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '认购项目ID',
  `uid` int(11) unsigned NOT NULL COMMENT '会员ID',
  `account` varchar(60) NOT NULL COMMENT '会员账号',
  `name` varchar(255) NOT NULL COMMENT '项目名称',
  `coinname` varchar(50) NOT NULL COMMENT '认购币名称',
  `buycoin` varchar(50) NOT NULL COMMENT '支付币名称',
  `price` decimal(20,6) unsigned NOT NULL COMMENT '认购单价',
  `num` decimal(20,6) unsigned NOT NULL COMMENT '认购数量',
  `mum` decimal(20,6) unsigned NOT NULL COMMENT '支付金额',
  `lockday` int(11) unsigned NOT NULL COMMENT '冻结数量',
  `addtime` datetime NOT NULL COMMENT '认购时间',
  `endtime` datetime NOT NULL COMMENT '释放时间',
  `endday` date NOT NULL COMMENT '释放日期',
  `status` int(4) NOT NULL COMMENT '状态1冻结中2已解冻',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid` (`uid`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='认购记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_issue_log`
--

LOCK TABLES `tw_issue_log` WRITE;
/*!40000 ALTER TABLE `tw_issue_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tw_issue_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_kjorder`
--

DROP TABLE IF EXISTS `tw_kjorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_kjorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `kid` int(11) NOT NULL COMMENT '矿机ID',
  `sharbltxt` int(11) NOT NULL COMMENT '共享矿机识别号',
  `type` int(11) NOT NULL COMMENT '矿机类型1独资2共享',
  `sharebl` float(10,2) NOT NULL COMMENT '共享的占有比例',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `username` varchar(30) NOT NULL COMMENT '会员账号',
  `kjtitle` varchar(225) NOT NULL COMMENT '矿机名称',
  `imgs` varchar(225) NOT NULL COMMENT '矿机图片',
  `status` int(11) NOT NULL COMMENT '矿机状态1正常2停止产币3过期',
  `cycle` int(11) NOT NULL COMMENT '矿机周期',
  `synum` int(11) NOT NULL COMMENT '收益次数',
  `outtype` int(11) NOT NULL COMMENT '产出类型1按产值2按币',
  `outcoin` varchar(30) NOT NULL COMMENT '产出币种',
  `outnum` decimal(12,6) NOT NULL COMMENT '产出的币量',
  `outusdt` decimal(12,6) NOT NULL COMMENT '按产币的量',
  `djout` int(11) NOT NULL COMMENT '产币冻结1否2是',
  `djnum` int(11) NOT NULL COMMENT '产币冻结天数',
  `addtime` datetime NOT NULL COMMENT '购买日期',
  `endtime` datetime NOT NULL COMMENT '过期时间',
  `intaddtime` int(11) NOT NULL COMMENT '购买时间戳',
  `intendtime` int(11) NOT NULL COMMENT '到期时间戳',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='矿机订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_kjorder`
--

LOCK TABLES `tw_kjorder` WRITE;
/*!40000 ALTER TABLE `tw_kjorder` DISABLE KEYS */;
INSERT INTO `tw_kjorder` VALUES (101,19,0,1,0.00,190,'8e5xt8ib@idrrate.com','Free mining machine','629a2098a5cc5.png',1,14,9,2,'usdt',2.000000,0.000000,1,0,'2022-12-04 21:09:46','2022-12-18 21:09:46',1670159386,1671368986),(102,26,0,1,0.00,191,'akcy2022@gmail.com','Invite  friend miner','629a2043e3c21.png',3,1,0,2,'usdt',0.020000,0.000000,1,0,'2022-12-11 13:29:00','2022-12-12 13:29:00',1670783340,1670869740),(103,26,0,1,0.00,191,'akcy2022@gmail.com','Invite  friend miner','629a2043e3c21.png',3,1,0,2,'usdt',28.000000,0.000000,1,0,'2022-12-11 13:30:45','2022-12-12 13:30:45',1670783445,1670869845),(104,21,0,1,0.00,191,'akcy2022@gmail.com','USDT mining machine','629a2076c2787.png',3,7,0,1,'usdt',0.000000,28.000000,1,0,'2022-12-11 13:45:39','2022-12-18 13:45:39',1670784339,1671389139),(105,22,0,1,0.00,191,'akcy2022@gmail.com','USDT mining machine','629a20684467a.png',1,14,9,2,'usdt',188.000000,0.000000,1,0,'2022-12-11 13:45:44','2022-12-25 13:45:44',1670784344,1671993944),(106,25,0,1,0.00,191,'akcy2022@gmail.com','USDT mining machine','629a2056be6a3.png',1,30,25,2,'usdt',688.000000,0.000000,1,0,'2022-12-11 13:45:51','2023-01-10 13:45:51',1670784351,1673376351),(107,26,0,1,0.00,191,'akcy2022@gmail.com','USDT mining machine','629a2043e3c21.png',1,60,55,2,'usdt',3888.000000,0.000000,1,0,'2022-12-11 13:45:59','2023-02-09 13:45:59',1670784359,1675968359),(108,21,0,1,0.00,209,'zxjdbq1219@gmail.com','USDT mining machine','629a2076c2787.png',3,7,-2,1,'usdt',0.000000,28.000000,1,0,'2023-05-27 09:05:29','2023-06-03 09:05:29',1685192729,1685797529),(109,21,0,1,0.00,223,'baofu8618@gmail.com','USDT mining machine','629a2076c2787.png',3,7,-1,1,'usdt',0.000000,28.000000,1,0,'2023-06-02 04:02:24','2023-06-09 04:02:24',1685692944,1686297744);
/*!40000 ALTER TABLE `tw_kjorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_kjprofit`
--

DROP TABLE IF EXISTS `tw_kjprofit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_kjprofit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `username` varchar(30) NOT NULL COMMENT '会员账号',
  `kid` int(11) NOT NULL COMMENT '矿机ID',
  `ktitle` varchar(225) NOT NULL COMMENT '矿机名称',
  `num` decimal(12,6) NOT NULL COMMENT '收益金额',
  `coin` varchar(30) NOT NULL COMMENT '收益币种',
  `addtime` datetime NOT NULL COMMENT '收益时间',
  `day` date NOT NULL COMMENT '收益日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1580 DEFAULT CHARSET=utf8 COMMENT='矿机收益表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_kjprofit`
--

LOCK TABLES `tw_kjprofit` WRITE;
/*!40000 ALTER TABLE `tw_kjprofit` DISABLE KEYS */;
INSERT INTO `tw_kjprofit` VALUES (1534,190,'8e5xt8ib@idrrate.com',101,'Free mining machine',2.000000,'usdt','2024-03-11 15:07:56','2024-03-11'),(1535,191,'akcy2022@gmail.com',102,'Invite  friend miner',0.020000,'usdt','2024-03-11 15:07:56','2024-03-11'),(1536,191,'akcy2022@gmail.com',103,'Invite  friend miner',28.000000,'usdt','2024-03-11 15:07:56','2024-03-11'),(1537,191,'akcy2022@gmail.com',104,'USDT mining machine',0.000000,'usdt','2024-03-11 15:07:56','2024-03-11'),(1538,191,'akcy2022@gmail.com',105,'USDT mining machine',188.000000,'usdt','2024-03-11 15:07:56','2024-03-11'),(1539,191,'akcy2022@gmail.com',106,'USDT mining machine',688.000000,'usdt','2024-03-11 15:07:56','2024-03-11'),(1540,191,'akcy2022@gmail.com',107,'USDT mining machine',3888.000000,'usdt','2024-03-11 15:07:56','2024-03-11'),(1541,209,'zxjdbq1219@gmail.com',108,'USDT mining machine',0.000000,'usdt','2024-03-11 15:07:56','2024-03-11'),(1542,223,'baofu8618@gmail.com',109,'USDT mining machine',0.000000,'usdt','2024-03-11 15:07:56','2024-03-11'),(1543,190,'8e5xt8ib@idrrate.com',101,'Free mining machine',2.000000,'usdt','2024-03-25 13:01:02','2024-03-25'),(1544,191,'akcy2022@gmail.com',104,'USDT mining machine',0.000000,'usdt','2024-03-25 13:01:02','2024-03-25'),(1545,191,'akcy2022@gmail.com',105,'USDT mining machine',188.000000,'usdt','2024-03-25 13:01:02','2024-03-25'),(1546,191,'akcy2022@gmail.com',106,'USDT mining machine',688.000000,'usdt','2024-03-25 13:01:02','2024-03-25'),(1547,191,'akcy2022@gmail.com',107,'USDT mining machine',3888.000000,'usdt','2024-03-25 13:01:02','2024-03-25'),(1548,209,'zxjdbq1219@gmail.com',108,'USDT mining machine',0.000000,'usdt','2024-03-25 13:01:02','2024-03-25'),(1549,223,'baofu8618@gmail.com',109,'USDT mining machine',0.000000,'usdt','2024-03-25 13:01:02','2024-03-25'),(1550,223,'baofu8618@gmail.com',109,'USDT mining machine',0.000000,'usdt','2024-03-25 13:01:02','2024-03-25'),(1551,190,'8e5xt8ib@idrrate.com',101,'Free mining machine',2.000000,'usdt','2024-03-26 13:01:01','2024-03-26'),(1552,191,'akcy2022@gmail.com',104,'USDT mining machine',0.000000,'usdt','2024-03-26 13:01:01','2024-03-26'),(1553,191,'akcy2022@gmail.com',105,'USDT mining machine',188.000000,'usdt','2024-03-26 13:01:01','2024-03-26'),(1554,191,'akcy2022@gmail.com',106,'USDT mining machine',688.000000,'usdt','2024-03-26 13:01:01','2024-03-26'),(1555,191,'akcy2022@gmail.com',107,'USDT mining machine',3888.000000,'usdt','2024-03-26 13:01:01','2024-03-26'),(1556,209,'zxjdbq1219@gmail.com',108,'USDT mining machine',0.000000,'usdt','2024-03-26 13:01:02','2024-03-26'),(1557,223,'baofu8618@gmail.com',109,'USDT mining machine',0.000000,'usdt','2024-03-26 13:01:02','2024-03-26'),(1558,223,'baofu8618@gmail.com',109,'USDT mining machine',0.000000,'usdt','2024-03-26 13:01:02','2024-03-26'),(1559,190,'8e5xt8ib@idrrate.com',101,'Free mining machine',2.000000,'usdt','2024-03-27 13:01:01','2024-03-27'),(1560,191,'akcy2022@gmail.com',104,'USDT mining machine',0.000000,'usdt','2024-03-27 13:01:01','2024-03-27'),(1561,191,'akcy2022@gmail.com',105,'USDT mining machine',188.000000,'usdt','2024-03-27 13:01:01','2024-03-27'),(1562,191,'akcy2022@gmail.com',106,'USDT mining machine',688.000000,'usdt','2024-03-27 13:01:01','2024-03-27'),(1563,191,'akcy2022@gmail.com',107,'USDT mining machine',3888.000000,'usdt','2024-03-27 13:01:01','2024-03-27'),(1564,191,'akcy2022@gmail.com',104,'USDT mining machine',0.000000,'usdt','2024-03-27 13:01:02','2024-03-27'),(1565,209,'zxjdbq1219@gmail.com',108,'USDT mining machine',0.000000,'usdt','2024-03-27 13:01:02','2024-03-27'),(1566,209,'zxjdbq1219@gmail.com',108,'USDT mining machine',0.000000,'usdt','2024-03-27 13:01:02','2024-03-27'),(1567,209,'zxjdbq1219@gmail.com',108,'USDT mining machine',0.000000,'usdt','2024-03-27 13:01:02','2024-03-27'),(1568,223,'baofu8618@gmail.com',109,'USDT mining machine',0.000000,'usdt','2024-03-27 13:01:02','2024-03-27'),(1569,223,'baofu8618@gmail.com',109,'USDT mining machine',0.000000,'usdt','2024-03-27 13:01:02','2024-03-27'),(1570,223,'baofu8618@gmail.com',109,'USDT mining machine',0.000000,'usdt','2024-03-27 13:01:02','2024-03-27'),(1571,190,'8e5xt8ib@idrrate.com',101,'Free mining machine',2.000000,'usdt','2024-03-28 13:01:02','2024-03-28'),(1572,191,'akcy2022@gmail.com',104,'USDT mining machine',0.000000,'usdt','2024-03-28 13:01:02','2024-03-28'),(1573,191,'akcy2022@gmail.com',105,'USDT mining machine',188.000000,'usdt','2024-03-28 13:01:02','2024-03-28'),(1574,191,'akcy2022@gmail.com',106,'USDT mining machine',688.000000,'usdt','2024-03-28 13:01:02','2024-03-28'),(1575,191,'akcy2022@gmail.com',107,'USDT mining machine',3888.000000,'usdt','2024-03-28 13:01:02','2024-03-28'),(1576,191,'akcy2022@gmail.com',104,'USDT mining machine',0.000000,'usdt','2024-03-28 13:01:02','2024-03-28'),(1577,209,'zxjdbq1219@gmail.com',108,'USDT mining machine',0.000000,'usdt','2024-03-28 13:01:02','2024-03-28'),(1578,209,'zxjdbq1219@gmail.com',108,'USDT mining machine',0.000000,'usdt','2024-03-28 13:01:02','2024-03-28'),(1579,209,'zxjdbq1219@gmail.com',108,'USDT mining machine',0.000000,'usdt','2024-03-28 13:01:02','2024-03-28');
/*!40000 ALTER TABLE `tw_kjprofit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_kuangji`
--

DROP TABLE IF EXISTS `tw_kuangji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_kuangji` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` int(11) NOT NULL COMMENT '矿机类型1独资2共享',
  `rtype` int(11) NOT NULL COMMENT '类型1购买2赠送',
  `sharebl` varchar(30) NOT NULL COMMENT '共享矿机分享比例',
  `sharecode` varchar(30) NOT NULL COMMENT '共享识别码',
  `title` varchar(225) NOT NULL COMMENT '矿机标题',
  `content` text NOT NULL COMMENT '矿机内容',
  `imgs` varchar(225) NOT NULL COMMENT '矿机图片',
  `outtype` int(11) NOT NULL COMMENT '产出类型1按产值2按币量',
  `dayoutnum` decimal(12,6) NOT NULL COMMENT '日产币量',
  `outcoin` varchar(30) NOT NULL COMMENT '日产出币种',
  `pricenum` decimal(12,6) NOT NULL COMMENT '矿机单价额度',
  `pricecoin` varchar(30) NOT NULL COMMENT '矿机单价币种',
  `cycle` int(11) NOT NULL COMMENT '周期',
  `suanl` float(10,2) NOT NULL COMMENT '矿机算力',
  `allnum` int(11) NOT NULL COMMENT '库机库存总量',
  `ycnum` int(11) NOT NULL COMMENT '预计出售量',
  `sellnum` int(11) NOT NULL COMMENT '已售数量',
  `jlnum` decimal(12,6) NOT NULL COMMENT '奖励币量',
  `jlcoin` varchar(30) NOT NULL COMMENT '奖励币种',
  `buyask` int(11) NOT NULL COMMENT '申购要求类型1按币量2按团队',
  `asknum` int(11) NOT NULL COMMENT '要求数量',
  `djout` int(11) NOT NULL COMMENT '产币冻结状态：1否2是',
  `djday` int(11) NOT NULL COMMENT '产币冻结天数',
  `status` int(11) NOT NULL COMMENT '状态1正常2禁用',
  `buymax` int(11) NOT NULL COMMENT '购买上限',
  `addtime` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='矿机列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_kuangji`
--

LOCK TABLES `tw_kuangji` WRITE;
/*!40000 ALTER TABLE `tw_kuangji` DISABLE KEYS */;
INSERT INTO `tw_kuangji` VALUES (25,1,1,'0','','USDT mining machine','$688 worth of USDT is produced every day','629a2056be6a3.png',2,688.000000,'usdt',10000.000000,'usdt',30,78.00,8000,7400,0,0.000000,'usdt',2,0,1,0,1,100000,'2022-12-11 13:44:59'),(22,1,1,'0','','USDT mining machine','$188 worth of USDT is produced every day','629a20684467a.png',2,188.000000,'usdt',3000.000000,'usdt',14,624.00,100000,99999,0,0.000000,'usdt',1,0,1,0,1,100000,'2022-12-11 13:45:25'),(21,1,1,'0','','USDT mining machine','$28 worth of USDT is produced every day','629a2076c2787.png',2,28.000000,'usdt',500.000000,'usdt',7,312.00,100000,88958,0,0.000000,'usdt',1,0,1,0,1,100000,'2024-03-25 09:44:20'),(26,1,1,'0','','USDT mining machine','$3888 worth of USDT is produced every day','629a2043e3c21.png',2,3888.000000,'usdt',50000.000000,'usdt',60,0.00,100000,85000,0,0.000000,'usdt',2,0,1,0,1,100000,'2022-12-11 13:43:54'),(27,1,1,'0','','USDT mining machine','$3 worth of USDT is produced every day','6471b975b6213.png',2,2.670000,'usdt',100.000000,'usdt',3,1.00,1000,1000,0,3.000000,'usdt',1,100,1,0,1,99,'2023-06-01 11:12:17');
/*!40000 ALTER TABLE `tw_kuangji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_market`
--

DROP TABLE IF EXISTS `tw_market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_market` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '市场名称',
  `round` varchar(2) NOT NULL DEFAULT '0',
  `round_mum` varchar(2) NOT NULL DEFAULT '0',
  `buy_min` varchar(20) NOT NULL DEFAULT '' COMMENT '买入最小交易价',
  `buy_max` varchar(20) NOT NULL DEFAULT '' COMMENT '买入最大交易价',
  `sell_min` varchar(20) NOT NULL DEFAULT '' COMMENT '卖出最小交易价',
  `sell_max` varchar(20) NOT NULL DEFAULT '' COMMENT '卖出最大交易价',
  `trade_min` varchar(50) NOT NULL DEFAULT '' COMMENT '单笔最小交易额',
  `trade_max` varchar(50) NOT NULL DEFAULT '' COMMENT '单笔最大交易额',
  `zhang` varchar(10) NOT NULL DEFAULT '' COMMENT '涨幅限制',
  `die` varchar(10) NOT NULL DEFAULT '' COMMENT '跌幅限制',
  `hou_price` varchar(50) NOT NULL DEFAULT '1' COMMENT '昨日收盘价',
  `tendency` text,
  `trade` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开启交易',
  `new_price` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '最新成交价',
  `buy_price` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '买一价',
  `sell_price` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '卖一价',
  `min_price` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '最低价',
  `max_price` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '最高价',
  `volume` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '交易量',
  `change` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '涨跌幅',
  `api_min` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000',
  `api_max` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `trade_buy_num_min` varchar(200) NOT NULL DEFAULT '0.001' COMMENT '单笔买入最小交易数量',
  `trade_buy_num_max` varchar(200) NOT NULL DEFAULT '1000' COMMENT '单笔买入最大交易数量',
  `trade_sell_num_min` varchar(200) NOT NULL DEFAULT '0.001' COMMENT '单笔卖出最小交易数量:',
  `trade_sell_num_max` varchar(200) NOT NULL DEFAULT '1000' COMMENT '单笔卖出最大交易数量',
  `fshow` tinyint(1) NOT NULL DEFAULT '0',
  `shuadan` tinyint(1) DEFAULT NULL COMMENT '刷单开关',
  `faxingjia` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '发行价',
  `sdhigh` varchar(50) DEFAULT '0' COMMENT '刷单最高价格',
  `sdlow` varchar(50) DEFAULT '0' COMMENT '刷单最低价格',
  `sdhigh_num` varchar(50) DEFAULT '0' COMMENT '刷单最高数量',
  `sdlow_num` varchar(50) DEFAULT '0' COMMENT '刷单最低数量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='行情配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_market`
--

LOCK TABLES `tw_market` WRITE;
/*!40000 ALTER TABLE `tw_market` DISABLE KEYS */;
/*!40000 ALTER TABLE `tw_market` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_market_json`
--

DROP TABLE IF EXISTS `tw_market_json`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_market_json` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `data` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_market_json`
--

LOCK TABLES `tw_market_json` WRITE;
/*!40000 ALTER TABLE `tw_market_json` DISABLE KEYS */;
/*!40000 ALTER TABLE `tw_market_json` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_menu`
--

DROP TABLE IF EXISTS `tw_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `ico_name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=498 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_menu`
--

LOCK TABLES `tw_menu` WRITE;
/*!40000 ALTER TABLE `tw_menu` DISABLE KEYS */;
INSERT INTO `tw_menu` VALUES (1,'首页',0,0,'Index/index',0,'','',0,'home'),(2,'内容管理',0,9,'Article/index',0,'','',0,'list-alt'),(3,'用户管理',0,1,'User/index',0,'','',0,'user'),(4,'财务记录',0,2,'Finance/index',0,'','',0,'th-list'),(5,'交易中心',0,3,'Trade/index',0,'','',0,'stats'),(6,'新币认购',0,6,'Issue/index',0,'','',0,'th-large'),(7,'系统设置',0,0,'Config/index',0,'','',0,'cog'),(8,'矿机管理',0,5,'Kuangm/index',0,'','',0,'list-alt'),(11,'后台首页',1,1,'Index/index',0,'','快捷操作',0,'home'),(13,'公告中心',2,1,'Article/index',0,'','内容',0,'list-alt'),(26,'会员管理',3,1,'User/index',0,'','用户管理',0,'user'),(68,'合约订单',5,1,'Trade/index',0,'','快速合约',0,'list-alt'),(69,'合约设置',5,2,'Trade/sethy',0,'','快速合约',0,'cog'),(79,'网站信息',7,1,'Config/index',0,'','系统',0,'cog'),(85,'编辑',84,4,'Coin/edit',0,'','网站配置',0,'0'),(89,'编辑市场',88,4,'Market/edit',0,'','',0,'0'),(92,'图形验证码',95,7,'Verify/code',0,'','网站配置',0,'0'),(95,'系统配置',7,1,'Config/qita',0,'','系统',0,'cog'),(117,'排序',116,5,'Menu/sort',0,'','开发组',0,'0'),(118,'添加',116,5,'Menu/add',0,'','开发组',0,'0'),(119,'编辑',116,5,'Menu/edit',0,'','开发组',0,'0'),(120,'删除',116,5,'Menu/del',0,'','开发组',0,'0'),(282,'登录日志',3,4,'User/log',0,'','用户管理',0,'list-alt'),(283,'用户钱包',3,5,'User/qianbao',0,'','用户管理',0,'list-alt'),(285,'用户财产',3,7,'User/coin',0,'','用户管理',0,'list-alt'),(288,'平台市场',7,5,'Config/marketo',0,'','系统',0,'stats'),(290,'财务明细',4,1,'Finance/index',0,'','财务管理',0,'th-list'),(295,'充币记录',4,1,'Finance/myzr',0,'','财务管理',0,'log-in'),(296,'提币记录',4,1,'Finance/myzc',0,'','财务管理',0,'log-out'),(312,'管理员管理',3,2,'User/admin',0,'','用户管理',0,'user'),(382,'币种配置',7,4,'Config/coin',0,'','系统',0,'record'),(388,'前端导航配置',7,8,'Config/daohang',1,'','导航',0,'cog'),(446,'资金流水',3,9,'User/amountlog',0,'','用户管理',0,'list-alt'),(451,'页脚导航配置',7,8,'Config/dhfooter',1,'','导航',0,'cog'),(452,'后端导航配置',7,8,'Config/dhadmin',1,'','导航',0,'cog'),(468,'认购配置',6,1,'Issue/index',0,'','认购管理',0,'cog'),(471,'认购记录',6,1,'Issue/log',0,'','认购管理',0,'globe'),(474,'限价委托记录',5,2,'Trade/bbxjlist',0,'','币币交易',0,'list-alt'),(479,'市场配置',7,5,'Config/ctmarket',0,'','系统',0,'stats'),(481,'平仓记录',5,2,'Trade/hylog',0,'','快速合约',0,'list-alt'),(484,'刷单设置',5,2,'Trade/market',0,'','机器人设置',0,'cog'),(485,'矿机列表',8,1,'Kuangm/index',0,'','矿机管理',0,'list-alt'),(486,'运行中矿机',8,2,'Kuangm/kjlist',0,'','矿机管理',0,'list-alt'),(487,'过期的矿机',8,3,'Kuangm/overlist',0,'','矿机管理',0,'list-alt'),(488,'矿机收益列表',8,3,'Kuangm/kjsylist',0,'','矿机管理',0,'list-alt'),(489,'冻结的收益',8,3,'Kuangm/djprofit',0,'','矿机管理',0,'list-alt'),(490,'市价交易记录',5,2,'Trade/bbsjlist',0,'','币币交易',0,'list-alt'),(491,'币币交易设置',5,2,'Trade/bbsetting',0,'','币币交易',0,'cog'),(492,'通知管理',3,9,'User/noticelist',0,'','用户管理',0,'list-alt'),(493,'在线客服',3,9,'User/online',0,'','用户管理',0,'list-alt'),(494,'代理管理',3,1,'User/agent',0,'','用户管理',0,'user'),(495,'权限',312,0,'User/role',0,'','用户管理',0,'0'),(496,'充币',26,0,'User/coin',0,'','用户管理',0,'0'),(497,'设为代理',26,0,'User/setagent',0,'','用户管理',0,'0');
/*!40000 ALTER TABLE `tw_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_myzc`
--

DROP TABLE IF EXISTS `tw_myzc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_myzc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userid` int(11) unsigned NOT NULL COMMENT '会员ID',
  `username` varchar(200) NOT NULL DEFAULT '' COMMENT '会员账号',
  `coinname` varchar(200) NOT NULL DEFAULT '' COMMENT '提币币种',
  `txid` varchar(200) NOT NULL DEFAULT '',
  `num` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '提币数量',
  `fee` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '手续费',
  `mum` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '实际到账',
  `address` varchar(225) NOT NULL COMMENT '提币地址',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `addtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '申请时间',
  `endtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '1待审核2完成3未通过',
  `to_user` int(2) NOT NULL DEFAULT '0' COMMENT '会员转币',
  `czline` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid` (`userid`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `coinname` (`coinname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='提币表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_myzc`
--

LOCK TABLES `tw_myzc` WRITE;
/*!40000 ALTER TABLE `tw_myzc` DISABLE KEYS */;
INSERT INTO `tw_myzc` VALUES (1,207,'Yomi@gmail.com','usdt','',1200000.00000000,12000.00000000,1188000.00000000,'0x464jfidien64346djdiokwqn',1,'2023-03-14 16:07:35','2023-03-14 16:08:01',2,0,'Ethereum'),(2,199,'germangarcia199078@gmail.com','usdt','',190.00000000,1.90000000,188.10000000,'1025 瑞士完美大道',1,'2023-03-14 16:50:56','2023-03-14 16:51:45',2,0,NULL),(3,199,'germangarcia199078@gmail.com','usdt','',200.00000000,2.00000000,198.00000000,'1025 瑞士完美大道',1,'2023-03-14 16:51:29','2023-03-14 16:51:49',2,0,NULL),(4,213,'jtbrown64@gmail.com','btc','',0.02000000,0.00002000,0.01998000,'Backtrack',1,'2023-04-07 15:31:45','2023-04-07 15:31:59',2,0,NULL),(5,207,'Yomi@gmail.com','usdt','',300000.00000000,3000.00000000,297000.00000000,'0×fjutc435fhjDj217Gjdrbn4ejnse5ffF',1,'2023-04-08 17:45:19','2023-04-08 17:47:06',2,0,'Ethereum'),(6,213,'jtbrown64@gmail.com','usdt','',500.00000000,5.00000000,495.00000000,'0x6C8a46b745a1f2DB1C15343f77B43e650A2C19Ed',1,'2023-04-11 12:25:12','2023-04-11 15:02:19',3,0,'Ethereum'),(7,196,'laola@163.com','btc','',1.75101550,0.00175102,1.74926448,'12358888',1,'2023-04-20 18:10:57','2023-04-20 18:11:27',2,0,'Bitcoin'),(8,176,'88888','usdt','',88888.00000000,888.88000000,87999.12000000,'TXAwAZNi6oB4hJ6KwM1f5o5zHMtXjKxduW',1,'2023-04-24 12:25:36','2023-04-24 12:25:57',2,0,'Ethereum'),(9,176,'88888','usdt','',200000.00000000,2000.00000000,198000.00000000,'TXAwAZNi6oB4hJ6KwM1f5o5zHMtXjKxduW',1,'2023-04-24 12:28:50','2023-04-24 12:29:09',2,0,'Ethereum'),(10,213,'jtbrown64@gmail.com','usdt','',5000.00000000,50.00000000,4950.00000000,'0x4B5F4575b91B8A0726B9Ae3d51f987AF5e8C10b2',1,'2023-04-24 14:12:57','2023-04-26 10:44:35',3,0,'Ethereum'),(11,176,'88888','usdt','',100000.00000000,1000.00000000,99000.00000000,'qzkf2fxnq9pnygkkdhqhj6ue0895rq0lry83zgz90m',1,'2023-04-26 12:20:15','2023-04-26 12:20:53',2,0,'Ethereum'),(12,209,'zxjdbq1219@gmail.com','usdt','',2626.00000000,26.26000000,2599.74000000,'TVvLA2in8jJfpygi3kqkfUHRhjNVdcQbiM',1,'2023-05-27 06:02:33','2023-05-27 06:06:43',3,0,NULL),(13,225,'1900553000@qq.com','usdt','',100.00000000,1.00000000,99.00000000,'TLosaQC6iWoEdtARcDbXiX3paJCf6P4VTK',1,'2024-03-11 15:29:05','2024-03-11 15:29:13',2,0,'TRC-20');
/*!40000 ALTER TABLE `tw_myzc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_notice`
--

DROP TABLE IF EXISTS `tw_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `account` varchar(60) NOT NULL COMMENT '会员账号',
  `title` varchar(225) NOT NULL COMMENT '通知标题',
  `content` text NOT NULL COMMENT '通知内容',
  `imgs` varchar(225) NOT NULL COMMENT '通知图片 ',
  `addtime` datetime NOT NULL COMMENT '发送时间',
  `status` int(11) NOT NULL COMMENT '1未读2已读',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1202 DEFAULT CHARSET=utf8 COMMENT='通知表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_notice`
--

LOCK TABLES `tw_notice` WRITE;
/*!40000 ALTER TABLE `tw_notice` DISABLE KEYS */;
INSERT INTO `tw_notice` VALUES (1041,176,'88888','Currency charging approval','Your recharge amount has arrived. Please check it','','2022-11-24 02:55:33',1),(1044,190,'8e5xt8ib@idrrate.com','认证资料提交成功','实名资料提成功，耐心等待管理员审核','','2022-12-04 21:08:59',1),(1045,190,'8e5xt8ib@idrrate.com','Certification audit successful','Your certification application has been approved successfully','','2022-12-04 21:09:46',1),(1046,187,'zhangweini19595@yahoo.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-06 07:24:42',1),(1047,187,'zhangweini19595@yahoo.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-06 07:24:42',1),(1048,187,'zhangweini19595@yahoo.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-06 07:24:42',1),(1049,190,'8e5xt8ib@idrrate.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-06 07:24:43',1),(1050,190,'8e5xt8ib@idrrate.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-06 07:35:49',1),(1051,190,'8e5xt8ib@idrrate.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-06 07:35:50',1),(1052,190,'8e5xt8ib@idrrate.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-06 07:35:50',1),(1053,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-06 07:49:02',1),(1054,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-06 07:52:02',1),(1055,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-06 07:56:02',1),(1056,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-06 08:03:01',1),(1057,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-06 08:15:07',1),(1058,190,'8e5xt8ib@idrrate.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2022-12-08 22:46:28',1),(1059,190,'8e5xt8ib@idrrate.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2022-12-08 23:39:17',1),(1060,190,'8e5xt8ib@idrrate.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-08 23:44:01',1),(1061,190,'8e5xt8ib@idrrate.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2022-12-09 00:42:52',1),(1062,190,'8e5xt8ib@idrrate.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-09 02:39:01',1),(1063,190,'8e5xt8ib@idrrate.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2022-12-09 02:44:46',1),(1064,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-13 11:40:02',1),(1065,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-13 11:43:02',1),(1066,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-13 11:45:01',1),(1067,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-13 11:47:01',1),(1068,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-14 10:03:02',1),(1069,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-14 10:05:01',1),(1070,194,'haizi@163.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-17 14:35:01',1),(1071,194,'haizi@163.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2022-12-21 16:32:32',1),(1072,199,'germangarcia199078@gmail.com','Currency charging approval','Your recharge amount has arrived. Please check it','','2023-01-02 18:32:09',2),(1073,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-01-04 18:02:22',1),(1074,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-01-04 18:06:32',1),(1075,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-01-04 18:06:38',1),(1076,199,'germangarcia199078@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-01-04 18:06:48',2),(1077,176,'88888','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2023-01-04 19:26:53',1),(1078,176,'88888','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2023-01-04 19:27:07',1),(1079,176,'88888','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2023-01-04 19:27:28',1),(1080,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-01-06 18:03:52',1),(1081,201,'mistaraba@gmail.com','Certification data submitted successfully','The real name data is successfully submitted. Wait patiently for the administrator to review','','2023-01-11 15:57:55',1),(1082,191,'akcy2022@gmail.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2023-02-16 12:18:01',1),(1083,191,'akcy2022@gmail.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2023-02-16 12:18:26',1),(1084,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-02-16 12:20:57',1),(1085,207,'Yomi@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-02-19 20:53:06',1),(1086,207,'Yomi@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-02-19 20:54:17',1),(1087,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-02-21 16:56:57',1),(1088,206,'laura@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-02-21 21:02:37',1),(1089,207,'Yomi@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-02-24 16:03:42',1),(1090,202,'laola@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-02-24 16:04:01',1),(1091,206,'laura@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-02-24 16:04:12',1),(1092,202,'laola@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-02-24 16:05:56',1),(1093,207,'Yomi@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-02-24 17:50:21',1),(1094,207,'Yomi@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-02-24 17:50:52',1),(1095,206,'laura@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-02-26 14:45:16',1),(1096,207,'Yomi@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-02-27 11:51:21',1),(1097,207,'Yomi@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-02-27 18:01:01',1),(1098,206,'laura@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-02-27 18:56:06',1),(1099,207,'Yomi@gmail.com','Currency charging approval','Your recharge amount has arrived. Please check it','','2023-03-03 14:19:55',1),(1100,206,'laura@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-03-06 13:59:31',1),(1101,207,'Yomi@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-03-06 16:31:01',1),(1102,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-03-10 13:33:47',1),(1105,207,'Yomi@gmail.com','Withdrawal review','Your currency withdrawal application has passed. Please check it in time','','2023-03-14 16:08:01',1),(1104,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-03-14 16:02:22',1),(1106,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-03-14 16:11:06',1),(1107,207,'Yomi@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-03-14 16:30:52',1),(1111,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-03-17 15:00:44',1),(1112,199,'germangarcia199078@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-03-17 15:01:37',1),(1113,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-03-21 14:00:42',1),(1114,199,'germangarcia199078@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-03-21 14:01:06',1),(1115,199,'germangarcia199078@gmail.com','Currency charging approval','Your recharge amount has arrived. Please check it','','2023-03-22 18:02:01',1),(1116,199,'germangarcia199078@gmail.com','充币审核','您的充值金额已到账，请注意查收','','2023-03-23 19:39:00',1),(1117,211,'gchil207@yahoo.com','Currency charging approval','Your recharge amount has arrived. Please check it','','2023-03-28 14:59:12',2),(1118,199,'germangarcia199078@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-03-28 16:22:11',1),(1119,211,'gchil207@yahoo.com','Certification data submitted successfully','The real name data is successfully submitted. Wait patiently for the administrator to review','','2023-03-28 16:31:44',2),(1120,199,'germangarcia199078@gmail.com','Currency charging approval','Your recharge amount has arrived. Please check it','','2023-03-31 14:29:54',1),(1121,199,'germangarcia199078@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-03-31 16:04:26',1),(1122,211,'gchil207@yahoo.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-03-31 16:06:07',1),(1123,211,'gchil207@yahoo.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-04-04 18:01:01',1),(1124,199,'germangarcia199078@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-04-04 18:01:06',1),(1125,213,'jtbrown64@gmail.com','Currency charging approval','Your charging record has been rejected by the system. Please contact customer service','','2023-04-04 21:21:11',1),(1126,213,'jtbrown64@gmail.com','BTC','Dear user: Your voucher is wrong, please provide the correct recharge voucher, thank you','','2023-04-04 21:24:30',1),(1127,213,'jtbrown64@gmail.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2023-04-05 15:01:42',1),(1128,213,'jtbrown64@gmail.com','Currency limit transaction','Currency transaction price limit purchase entrustment order sold successfully','','2023-04-05 15:05:12',1),(1129,206,'laura@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-04-05 15:08:32',1),(1130,213,'jtbrown64@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-04-05 15:13:08',1),(1131,213,'jtbrown64@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-04-05 15:13:09',1),(1132,191,'akcy2022@gmail.com','充币审核','您的充币记录被系统驳回，请联系客服','','2023-04-05 15:25:26',1),(1133,191,'akcy2022@gmail.com','充币审核','您的充币记录被系统驳回，请联系客服','','2023-04-05 15:27:54',1),(1134,191,'akcy2022@gmail.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2023-04-05 15:32:36',1),(1135,191,'akcy2022@gmail.com','Currency limit transaction','Currency transaction price limit purchase entrustment order sold successfully','','2023-04-05 15:33:11',1),(1136,191,'akcy2022@gmail.com','Currency limit transaction','Currency transaction price limit purchase entrustment order sold successfully','','2023-04-05 15:33:47',1),(1137,191,'akcy2022@gmail.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2023-04-05 15:43:02',1),(1138,191,'akcy2022@gmail.com','Currency limit transaction','Currency transaction price limit purchase entrustment order sold successfully','','2023-04-05 15:44:43',1),(1139,191,'akcy2022@gmail.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2023-04-05 15:45:27',1),(1140,191,'akcy2022@gmail.com','Currency limit transaction','Currency transaction price limit purchase entrustment order sold successfully','','2023-04-05 15:45:57',1),(1141,191,'akcy2022@gmail.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2023-04-05 15:47:22',1),(1142,191,'akcy2022@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-04-05 15:50:27',1),(1143,207,'Yomi@gmail.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2023-04-05 15:55:57',1),(1144,207,'Yomi@gmail.com','Currency limit transaction','Currency transaction price limit purchase entrustment order sold successfully','','2023-04-05 15:56:31',1),(1145,207,'Yomi@gmail.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2023-04-05 15:57:07',1),(1146,207,'Yomi@gmail.com','Currency limit transaction','Currency transaction price limit purchase entrustment order sold successfully','','2023-04-05 15:58:06',1),(1147,207,'Yomi@gmail.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2023-04-05 15:58:32',1),(1148,207,'Yomi@gmail.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2023-04-05 15:59:07',1),(1149,207,'Yomi@gmail.com','Currency limit transaction','Currency transaction price limit purchase entrustment order sold successfully','','2023-04-05 16:00:16',1),(1150,207,'Yomi@gmail.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2023-04-05 16:00:47',1),(1151,206,'laura@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-04-06 15:38:16',1),(1152,213,'jtbrown64@gmail.com','Currency charging approval','Your recharge amount has arrived. Please check it','','2023-04-07 12:51:07',1),(1153,213,'jtbrown64@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-04-07 15:16:06',1),(1155,211,'gchil207@yahoo.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-04-07 18:01:06',1),(1156,207,'Yomi@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-04-07 18:01:31',1),(1157,199,'germangarcia199078@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-04-07 18:04:07',1),(1158,176,'88888','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-04-08 04:43:12',1),(1159,176,'88888','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-04-08 04:46:16',1),(1160,207,'Yomi@gmail.com','Withdrawal review','Your currency withdrawal application has passed. Please check it in time','','2023-04-08 17:47:06',1),(1161,213,'jtbrown64@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-04-11 12:02:57',1),(1162,206,'laura@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-04-11 12:06:27',1),(1163,213,'jtbrown64@gmail.com','Withdrawal review','Your withdrawal application has been rejected. Please contact the administrator','','2023-04-11 15:02:19',1),(1164,213,'jtbrown64@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-04-20 13:31:22',1),(1165,206,'laura@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-04-20 13:39:52',1),(1166,196,'laola@163.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2023-04-20 18:04:21',1),(1167,196,'laola@163.com','提币审核','您的提币申请已通过，请及时查询','','2023-04-20 18:11:27',1),(1168,196,'laola@163.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2023-04-20 18:12:26',1),(1169,196,'laola@163.com','Currency limit transaction','Currency transaction price limit purchase entrustment order sold successfully','','2023-04-20 18:13:57',1),(1170,195,'tianw@163.com','充币审核','您的充值金额已到账，请注意查收','','2023-04-20 18:16:48',1),(1171,195,'tianw@163.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2023-04-20 18:17:31',1),(1172,195,'tianw@163.com','Currency limit transaction','Currency transaction price limit purchase entrustment order sold successfully','','2023-04-20 18:20:12',1),(1173,213,'jtbrown64@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-04-21 12:32:17',1),(1174,213,'jtbrown64@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-04-22 14:32:21',1),(1175,213,'jtbrown64@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-04-24 12:01:06',1),(1176,176,'88888','Withdrawal review','Your currency withdrawal application has passed. Please check it in time','','2023-04-24 12:25:57',1),(1177,176,'88888','Withdrawal review','Your currency withdrawal application has passed. Please check it in time','','2023-04-24 12:29:09',1),(1178,176,'88888','Currency charging approval','Your charging record has been rejected by the system. Please contact customer service','','2023-04-24 15:00:57',1),(1179,176,'88888','Currency charging approval','Your charging record has been rejected by the system. Please contact customer service','','2023-04-24 15:01:02',1),(1180,213,'jtbrown64@gmail.com','Withdrawal review','Your withdrawal application has been rejected. Please contact the administrator','','2023-04-26 10:44:35',1),(1181,213,'jtbrown64@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-04-26 12:01:28',1),(1182,176,'88888','Currency charging approval','Your charging record has been rejected by the system. Please contact customer service','','2023-04-26 12:18:24',1),(1183,176,'88888','Currency charging approval','Your charging record has been rejected by the system. Please contact customer service','','2023-04-26 12:18:33',1),(1184,176,'88888','Withdrawal review','Your currency withdrawal application has passed. Please check it in time','','2023-04-26 12:20:53',1),(1185,209,'zxjdbq1219@gmail.com','TRON','888','6471b71a1280e.jpg','2023-05-27 03:54:03',2),(1186,209,'zxjdbq1219@gmail.com','提币审核','您的提币申请被驳回，请联系管理员','','2023-05-27 06:06:43',2),(1190,223,'baofu8618@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-06-02 04:08:47',1),(1188,223,'baofu8618@gmail.com','Currency charging approval','Your recharge amount has arrived. Please check it','','2023-06-01 10:36:52',1),(1189,223,'baofu8618@gmail.com','认证资料提交成功','实名资料提成功，耐心等待管理员审核','','2023-06-01 11:14:55',1),(1191,223,'baofu8618@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2023-06-02 04:08:47',1),(1192,209,'zxjdbq1219@gmail.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2024-03-11 14:32:39',1),(1193,225,'1900553000@qq.com','认证资料提交成功','实名资料提成功，耐心等待管理员审核','','2024-03-11 15:01:22',1),(1194,225,'1900553000@qq.com','充币审核','您的充值金额已到账，请注意查收','','2024-03-11 15:28:15',1),(1195,225,'1900553000@qq.com','提币审核','您的提币申请已通过，请及时查询','','2024-03-11 15:29:13',1),(1196,225,'1900553000@qq.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2024-03-11 15:35:02',1),(1197,225,'1900553000@qq.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2024-03-26 04:00:02',1),(1198,225,'1900553000@qq.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2024-03-26 04:01:02',1),(1199,225,'1900553000@qq.com','Currency limit transaction','Purchase of the consignment order for limited price purchase in currency transaction succeeded','','2024-03-27 09:35:01',1),(1200,225,'1900553000@qq.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2024-05-25 04:37:06',1),(1201,225,'1900553000@qq.com','Express contract transaction','The express contract has been closed. Please increase your position in time','','2024-05-25 04:37:06',1);
/*!40000 ALTER TABLE `tw_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_online`
--

DROP TABLE IF EXISTS `tw_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_online` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `username` varchar(225) NOT NULL COMMENT '会员账号',
  `type` int(11) NOT NULL COMMENT '类型：1客服2会员',
  `content` text NOT NULL COMMENT '内容',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发送时间',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '后台查看状态0未查看2已查看',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_online`
--

LOCK TABLES `tw_online` WRITE;
/*!40000 ALTER TABLE `tw_online` DISABLE KEYS */;
INSERT INTO `tw_online` VALUES (56,176,'88888',2,'我要入金','2023-03-14 20:46:46',1),(57,176,'88888',2,'？','2023-03-14 20:46:38',1),(58,176,'88888',2,'怎么入金','2022-11-23 18:46:23',1),(59,176,'88888',1,'你好','2022-11-24 02:46:23',1),(60,176,'88888',1,'要入多少','2022-11-24 02:47:00',1),(61,176,'88888',1,'?','2023-03-14 16:46:38',1),(62,176,'88888',1,'?','2023-03-14 16:46:46',1),(63,191,'akcy2022@gmail.com',2,'嗨，你好','2023-03-22 13:32:39',1),(64,191,'akcy2022@gmail.com',1,'请添加客服电报，谢谢','2023-03-22 09:32:39',1),(65,191,'akcy2022@gmail.com',2,'好的','2023-03-22 13:33:25',1),(66,191,'akcy2022@gmail.com',1,'1','2023-03-22 09:33:25',1),(67,213,'jtbrown64@gmail.com',2,'Where do I send a deposit notification to?','2023-04-05 19:06:42',1),(68,213,'jtbrown64@gmail.com',2,'???????','2023-04-05 19:05:40',1),(69,213,'jtbrown64@gmail.com',2,'Why are you not responding?','2023-04-05 03:24:04',1),(70,213,'jtbrown64@gmail.com',1,'Dear user, how can I help you','2023-04-04 23:24:04',1),(71,213,'jtbrown64@gmail.com',2,'Why can’t I send a message?','2023-04-05 03:45:22',1),(72,213,'jtbrown64@gmail.com',2,'Now you’re not responding again','2023-04-05 19:02:57',1),(73,213,'jtbrown64@gmail.com',1,'Dear user; please contact our customer service number @OKX989 directly','2023-04-04 23:45:22',1),(74,213,'jtbrown64@gmail.com',1,'https://t.me/OKX989','2023-04-05 15:02:57',1),(75,213,'jtbrown64@gmail.com',1,'Hello, dear customer!','2023-04-05 15:03:19',1),(76,213,'jtbrown64@gmail.com',1,'Hello, dear customer!','2023-04-05 15:05:40',1),(77,213,'jtbrown64@gmail.com',1,'Telegram: https://t.me/OKX989','2023-04-05 15:06:42',1),(78,199,'germangarcia199078@gmail.com',2,'Hello,Mr Josn','2023-04-09 21:36:37',1),(79,199,'germangarcia199078@gmail.com',1,'Hello, please contact Telegram customer service https://t.me/tlp989','2023-04-09 17:36:37',1),(80,209,'zxjdbq1219@gmail.com',2,'NIHAO','2023-05-27 07:56:55',1),(81,209,'zxjdbq1219@gmail.com',1,'haod ','2023-05-27 03:56:55',1),(82,225,'1900553000@qq.com',2,'123','2024-03-11 07:35:33',0);
/*!40000 ALTER TABLE `tw_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_permission`
--

DROP TABLE IF EXISTS `tw_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_permission`
--

LOCK TABLES `tw_permission` WRITE;
/*!40000 ALTER TABLE `tw_permission` DISABLE KEYS */;
INSERT INTO `tw_permission` VALUES (22,1,1),(23,1,11),(24,1,2),(25,1,13),(81,105,1),(82,105,11),(83,105,4),(84,105,290),(85,105,295),(86,105,296);
/*!40000 ALTER TABLE `tw_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_recharge`
--

DROP TABLE IF EXISTS `tw_recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `username` varchar(225) NOT NULL COMMENT '会员账号',
  `coin` varchar(60) NOT NULL COMMENT '币名称',
  `num` decimal(12,6) NOT NULL COMMENT '名称',
  `addtime` datetime NOT NULL COMMENT '添加时间',
  `updatetime` datetime NOT NULL COMMENT '处理时间',
  `status` int(11) NOT NULL COMMENT '状态: 待审核 1 - 审核通过 2 - 不通过3',
  `payimg` varchar(225) NOT NULL COMMENT '付款凭证',
  `msg` varchar(225) NOT NULL COMMENT '不通过说明',
  `czline` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='充值记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_recharge`
--

LOCK TABLES `tw_recharge` WRITE;
/*!40000 ALTER TABLE `tw_recharge` DISABLE KEYS */;
INSERT INTO `tw_recharge` VALUES (52,176,'88888','USDT',999999.999999,'2022-11-24 02:45:03','2022-11-24 02:55:33',2,'637e6a2d3207c.jpeg','','TRC20'),(51,176,'88888','USDT',999999.999999,'2022-11-24 02:43:33','2022-11-24 02:55:36',2,'637e69d479598.jpeg','','TRC20'),(53,199,'germangarcia199078@gmail.com','USDT',1060.000000,'2023-01-02 18:31:26','2023-01-02 18:32:09',2,'63b3690b5b7dc.jpg','','Ethereum'),(54,207,'Yomi@gmail.com','USDT',999999.999999,'2023-02-24 15:59:29','2023-03-03 14:19:55',2,'63f92530229a3.jpeg','','Ethereum'),(55,199,'germangarcia199078@gmail.com','USDT',5221.290000,'2023-03-13 12:54:56','2023-03-13 12:57:07',2,'640f551612fce.jpg','','Ethereum'),(56,199,'germangarcia199078@gmail.com','USDT',3976.000000,'2023-03-22 17:57:54','2023-03-22 18:02:01',2,'641b799f32835.jpg','','Ethereum'),(57,199,'germangarcia199078@gmail.com','USDT',16890.000000,'2023-03-23 19:35:58','2023-03-23 19:39:00',2,'641ce25bce6d0.jpg','',NULL),(58,211,'gchil207@yahoo.com','USDT',2000.670000,'2023-03-28 14:58:26','2023-03-28 14:59:12',2,'642338cdec731.jpg','',NULL),(59,199,'germangarcia199078@gmail.com','USDT',2512.000000,'2023-03-31 14:29:31','2023-03-31 14:29:54',2,'64272687e361f.jpeg','',NULL),(60,213,'jtbrown64@gmail.com','BTC',0.031294,'2023-04-04 20:46:21','2023-04-04 21:21:11',3,'642cc4417feed.png','','Bitcoin'),(61,191,'akcy2022@gmail.com','BTC',0.032500,'2023-04-05 15:24:58','2023-04-05 15:25:26',3,'642dcb08a24df.jpeg','','Bitcoin'),(62,191,'akcy2022@gmail.com','BTC',1.300000,'2023-04-05 15:27:35','2023-04-05 15:27:54',3,'642dcba357038.jpeg','','Bitcoin'),(63,213,'jtbrown64@gmail.com','BTC',0.017785,'2023-04-07 12:50:31','2023-04-07 12:51:07',2,'643049cf6f92a.png','','Bitcoin'),(64,195,'tianw@163.com','USDT',12436.000000,'2023-04-20 18:16:34','2023-04-20 18:16:48',2,'6441b9c04a6d9.png','','Ethereum'),(65,176,'88888','USDT',4442.000000,'2023-04-24 15:00:12','2023-04-24 15:01:02',3,'6446d1b9d4df1.png','','Ethereum'),(66,176,'88888','USDT',4442.000000,'2023-04-24 15:00:40','2023-04-24 15:00:57',3,'6446d1d671769.png','','Ethereum'),(67,176,'88888','USDT',22000.000000,'2023-04-26 12:17:01','2023-04-26 12:18:33',3,'64494e7c86de7.png','','Ethereum'),(68,176,'88888','USDT',22000.000000,'2023-04-26 12:17:50','2023-04-26 12:18:24',3,'64494ea83dfa6.png','','Ethereum'),(69,223,'baofu8618@gmail.com','USDT',10000.000000,'2023-06-01 10:35:11','2023-06-01 10:36:52',2,'6478ac9c6d302.jpeg','','TRC-20'),(70,225,'1900553000@qq.com','USDT',100.000000,'2024-03-11 15:28:04','2024-03-11 15:28:14',2,'65ef5b4390100.png','','TRC-20'),(71,221,'ceshi888','USDT',1200.000000,'2024-03-27 02:42:53','0000-00-00 00:00:00',1,'6603bfeb293d7.jpg','','TRC-20');
/*!40000 ALTER TABLE `tw_recharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_trade`
--

DROP TABLE IF EXISTS `tw_trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_trade` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `market` varchar(50) NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000',
  `num` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000',
  `deal` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000',
  `mum` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid` (`userid`) USING BTREE,
  KEY `market` (`market`,`type`,`status`) USING BTREE,
  KEY `num` (`num`,`deal`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `market_2` (`market`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='交易下单表'
/*!50100 PARTITION BY RANGE (id)
(PARTITION p1 VALUES LESS THAN (500000) ENGINE = MyISAM,
 PARTITION p2 VALUES LESS THAN (1000000) ENGINE = MyISAM,
 PARTITION p3 VALUES LESS THAN (1500000) ENGINE = MyISAM,
 PARTITION p4 VALUES LESS THAN (2000000) ENGINE = MyISAM,
 PARTITION p5 VALUES LESS THAN (2500000) ENGINE = MyISAM,
 PARTITION p6 VALUES LESS THAN (3000000) ENGINE = MyISAM,
 PARTITION p7 VALUES LESS THAN (3500000) ENGINE = MyISAM,
 PARTITION p8 VALUES LESS THAN (4000000) ENGINE = MyISAM,
 PARTITION p9 VALUES LESS THAN (4500000) ENGINE = MyISAM,
 PARTITION p10 VALUES LESS THAN (5000000) ENGINE = MyISAM,
 PARTITION p11 VALUES LESS THAN (5500000) ENGINE = MyISAM,
 PARTITION p12 VALUES LESS THAN (6000000) ENGINE = MyISAM,
 PARTITION p13 VALUES LESS THAN (6500000) ENGINE = MyISAM,
 PARTITION p14 VALUES LESS THAN (7000000) ENGINE = MyISAM,
 PARTITION p15 VALUES LESS THAN (7500000) ENGINE = MyISAM,
 PARTITION p16 VALUES LESS THAN (8000000) ENGINE = MyISAM,
 PARTITION p17 VALUES LESS THAN (8500000) ENGINE = MyISAM,
 PARTITION p18 VALUES LESS THAN (9000000) ENGINE = MyISAM,
 PARTITION p19 VALUES LESS THAN (9500000) ENGINE = MyISAM,
 PARTITION p20 VALUES LESS THAN (10000000) ENGINE = MyISAM,
 PARTITION p21 VALUES LESS THAN (10500000) ENGINE = MyISAM,
 PARTITION p22 VALUES LESS THAN (11000000) ENGINE = MyISAM,
 PARTITION p23 VALUES LESS THAN (11500000) ENGINE = MyISAM,
 PARTITION p24 VALUES LESS THAN (12000000) ENGINE = MyISAM,
 PARTITION p25 VALUES LESS THAN (12500000) ENGINE = MyISAM,
 PARTITION p26 VALUES LESS THAN (13000000) ENGINE = MyISAM,
 PARTITION p27 VALUES LESS THAN (13500000) ENGINE = MyISAM,
 PARTITION p28 VALUES LESS THAN (14000000) ENGINE = MyISAM,
 PARTITION p29 VALUES LESS THAN (14500000) ENGINE = MyISAM,
 PARTITION p30 VALUES LESS THAN (15000000) ENGINE = MyISAM,
 PARTITION p31 VALUES LESS THAN (15500000) ENGINE = MyISAM,
 PARTITION p32 VALUES LESS THAN (16000000) ENGINE = MyISAM,
 PARTITION p33 VALUES LESS THAN (16500000) ENGINE = MyISAM,
 PARTITION p34 VALUES LESS THAN (17000000) ENGINE = MyISAM,
 PARTITION p35 VALUES LESS THAN (17500000) ENGINE = MyISAM,
 PARTITION p36 VALUES LESS THAN (18000000) ENGINE = MyISAM,
 PARTITION p37 VALUES LESS THAN (18500000) ENGINE = MyISAM,
 PARTITION p38 VALUES LESS THAN (19000000) ENGINE = MyISAM,
 PARTITION p39 VALUES LESS THAN (19500000) ENGINE = MyISAM,
 PARTITION p40 VALUES LESS THAN (20000000) ENGINE = MyISAM,
 PARTITION p41 VALUES LESS THAN (20500000) ENGINE = MyISAM,
 PARTITION p42 VALUES LESS THAN (21000000) ENGINE = MyISAM,
 PARTITION p43 VALUES LESS THAN (21500000) ENGINE = MyISAM,
 PARTITION p44 VALUES LESS THAN (22000000) ENGINE = MyISAM,
 PARTITION p45 VALUES LESS THAN (22500000) ENGINE = MyISAM,
 PARTITION p46 VALUES LESS THAN (23000000) ENGINE = MyISAM,
 PARTITION p47 VALUES LESS THAN (23500000) ENGINE = MyISAM,
 PARTITION p48 VALUES LESS THAN (24000000) ENGINE = MyISAM,
 PARTITION p49 VALUES LESS THAN (24500000) ENGINE = MyISAM,
 PARTITION p50 VALUES LESS THAN (25000000) ENGINE = MyISAM,
 PARTITION p51 VALUES LESS THAN (25500000) ENGINE = MyISAM,
 PARTITION p52 VALUES LESS THAN (26000000) ENGINE = MyISAM,
 PARTITION p53 VALUES LESS THAN (26500000) ENGINE = MyISAM,
 PARTITION p54 VALUES LESS THAN (27000000) ENGINE = MyISAM,
 PARTITION p55 VALUES LESS THAN (27500000) ENGINE = MyISAM,
 PARTITION p56 VALUES LESS THAN (28000000) ENGINE = MyISAM,
 PARTITION p57 VALUES LESS THAN (28500000) ENGINE = MyISAM,
 PARTITION p58 VALUES LESS THAN (29000000) ENGINE = MyISAM,
 PARTITION p59 VALUES LESS THAN (30000000) ENGINE = MyISAM,
 PARTITION p60 VALUES LESS THAN (30500000) ENGINE = MyISAM,
 PARTITION p61 VALUES LESS THAN (31000000) ENGINE = MyISAM,
 PARTITION p62 VALUES LESS THAN (31500000) ENGINE = MyISAM,
 PARTITION p63 VALUES LESS THAN (32000000) ENGINE = MyISAM,
 PARTITION p64 VALUES LESS THAN (32500000) ENGINE = MyISAM,
 PARTITION p65 VALUES LESS THAN (33000000) ENGINE = MyISAM,
 PARTITION p66 VALUES LESS THAN (33500000) ENGINE = MyISAM,
 PARTITION p67 VALUES LESS THAN (34000000) ENGINE = MyISAM,
 PARTITION p68 VALUES LESS THAN (34500000) ENGINE = MyISAM,
 PARTITION p69 VALUES LESS THAN (35000000) ENGINE = MyISAM,
 PARTITION p70 VALUES LESS THAN (35500000) ENGINE = MyISAM,
 PARTITION p71 VALUES LESS THAN (36000000) ENGINE = MyISAM,
 PARTITION p72 VALUES LESS THAN (36500000) ENGINE = MyISAM,
 PARTITION p73 VALUES LESS THAN (37000000) ENGINE = MyISAM,
 PARTITION p74 VALUES LESS THAN (37500000) ENGINE = MyISAM,
 PARTITION p75 VALUES LESS THAN (38000000) ENGINE = MyISAM,
 PARTITION p76 VALUES LESS THAN (38500000) ENGINE = MyISAM,
 PARTITION p77 VALUES LESS THAN (39000000) ENGINE = MyISAM,
 PARTITION p78 VALUES LESS THAN (39500000) ENGINE = MyISAM,
 PARTITION p79 VALUES LESS THAN (40000000) ENGINE = MyISAM,
 PARTITION p80 VALUES LESS THAN (40500000) ENGINE = MyISAM,
 PARTITION p81 VALUES LESS THAN (41000000) ENGINE = MyISAM,
 PARTITION p82 VALUES LESS THAN (41500000) ENGINE = MyISAM,
 PARTITION p83 VALUES LESS THAN (42000000) ENGINE = MyISAM,
 PARTITION p84 VALUES LESS THAN (42500000) ENGINE = MyISAM,
 PARTITION p85 VALUES LESS THAN (43000000) ENGINE = MyISAM,
 PARTITION p86 VALUES LESS THAN (43500000) ENGINE = MyISAM,
 PARTITION p87 VALUES LESS THAN (44000000) ENGINE = MyISAM,
 PARTITION p88 VALUES LESS THAN (44500000) ENGINE = MyISAM,
 PARTITION p89 VALUES LESS THAN (45000000) ENGINE = MyISAM,
 PARTITION p90 VALUES LESS THAN (45500000) ENGINE = MyISAM,
 PARTITION p91 VALUES LESS THAN (46000000) ENGINE = MyISAM,
 PARTITION p92 VALUES LESS THAN (46500000) ENGINE = MyISAM,
 PARTITION p93 VALUES LESS THAN (47000000) ENGINE = MyISAM,
 PARTITION p94 VALUES LESS THAN (47500000) ENGINE = MyISAM,
 PARTITION p95 VALUES LESS THAN (48000000) ENGINE = MyISAM,
 PARTITION p96 VALUES LESS THAN (48500000) ENGINE = MyISAM,
 PARTITION p97 VALUES LESS THAN (49000000) ENGINE = MyISAM,
 PARTITION p98 VALUES LESS THAN (49500000) ENGINE = MyISAM,
 PARTITION p99 VALUES LESS THAN (50000000) ENGINE = MyISAM,
 PARTITION p100 VALUES LESS THAN (50500000) ENGINE = MyISAM,
 PARTITION p101 VALUES LESS THAN (51000000) ENGINE = MyISAM,
 PARTITION p102 VALUES LESS THAN (51500000) ENGINE = MyISAM,
 PARTITION p103 VALUES LESS THAN (52000000) ENGINE = MyISAM,
 PARTITION p104 VALUES LESS THAN (52500000) ENGINE = MyISAM,
 PARTITION p105 VALUES LESS THAN (53000000) ENGINE = MyISAM,
 PARTITION p106 VALUES LESS THAN (53500000) ENGINE = MyISAM,
 PARTITION p107 VALUES LESS THAN (54000000) ENGINE = MyISAM,
 PARTITION p108 VALUES LESS THAN (54500000) ENGINE = MyISAM,
 PARTITION p109 VALUES LESS THAN (55000000) ENGINE = MyISAM,
 PARTITION p110 VALUES LESS THAN (55500000) ENGINE = MyISAM,
 PARTITION p111 VALUES LESS THAN (56000000) ENGINE = MyISAM,
 PARTITION p112 VALUES LESS THAN (56500000) ENGINE = MyISAM,
 PARTITION p113 VALUES LESS THAN (57000000) ENGINE = MyISAM,
 PARTITION p114 VALUES LESS THAN (57500000) ENGINE = MyISAM,
 PARTITION p115 VALUES LESS THAN (58000000) ENGINE = MyISAM,
 PARTITION p116 VALUES LESS THAN (58500000) ENGINE = MyISAM,
 PARTITION p117 VALUES LESS THAN (59000000) ENGINE = MyISAM,
 PARTITION p118 VALUES LESS THAN (59500000) ENGINE = MyISAM,
 PARTITION p119 VALUES LESS THAN (60000000) ENGINE = MyISAM,
 PARTITION p120 VALUES LESS THAN (60500000) ENGINE = MyISAM,
 PARTITION p121 VALUES LESS THAN (61000000) ENGINE = MyISAM,
 PARTITION p122 VALUES LESS THAN MAXVALUE ENGINE = MyISAM) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_trade`
--

LOCK TABLES `tw_trade` WRITE;
/*!40000 ALTER TABLE `tw_trade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tw_trade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_trade_json`
--

DROP TABLE IF EXISTS `tw_trade_json`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_trade_json` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `market` varchar(100) NOT NULL,
  `data` varchar(500) NOT NULL DEFAULT '',
  `type` varchar(100) NOT NULL DEFAULT '',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `market` (`market`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='交易图表表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_trade_json`
--

LOCK TABLES `tw_trade_json` WRITE;
/*!40000 ALTER TABLE `tw_trade_json` DISABLE KEYS */;
/*!40000 ALTER TABLE `tw_trade_json` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_trade_log`
--

DROP TABLE IF EXISTS `tw_trade_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_trade_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `market` varchar(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  `price` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000',
  `num` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000',
  `mum` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000',
  `type` tinyint(2) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `main` (`market`,`status`,`addtime`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC
/*!50100 PARTITION BY RANGE (id)
(PARTITION p1 VALUES LESS THAN (1000000) ENGINE = MyISAM,
 PARTITION p2 VALUES LESS THAN (2000000) ENGINE = MyISAM,
 PARTITION p3 VALUES LESS THAN (3000000) ENGINE = MyISAM,
 PARTITION p4 VALUES LESS THAN (4000000) ENGINE = MyISAM,
 PARTITION p5 VALUES LESS THAN (5000000) ENGINE = MyISAM,
 PARTITION p6 VALUES LESS THAN (6000000) ENGINE = MyISAM,
 PARTITION p7 VALUES LESS THAN (7000000) ENGINE = MyISAM,
 PARTITION p8 VALUES LESS THAN (8000000) ENGINE = MyISAM,
 PARTITION p9 VALUES LESS THAN (9000000) ENGINE = MyISAM,
 PARTITION p10 VALUES LESS THAN (10000000) ENGINE = MyISAM,
 PARTITION p11 VALUES LESS THAN (11000000) ENGINE = MyISAM,
 PARTITION p12 VALUES LESS THAN (12000000) ENGINE = MyISAM,
 PARTITION p13 VALUES LESS THAN (13000000) ENGINE = MyISAM,
 PARTITION p14 VALUES LESS THAN (14000000) ENGINE = MyISAM,
 PARTITION p15 VALUES LESS THAN (15000000) ENGINE = MyISAM,
 PARTITION p16 VALUES LESS THAN (16000000) ENGINE = MyISAM,
 PARTITION p17 VALUES LESS THAN (17000000) ENGINE = MyISAM,
 PARTITION p18 VALUES LESS THAN (18000000) ENGINE = MyISAM,
 PARTITION p19 VALUES LESS THAN (19000000) ENGINE = MyISAM,
 PARTITION p20 VALUES LESS THAN (20000000) ENGINE = MyISAM,
 PARTITION p21 VALUES LESS THAN (21000000) ENGINE = MyISAM,
 PARTITION p22 VALUES LESS THAN (22000000) ENGINE = MyISAM,
 PARTITION p23 VALUES LESS THAN (23000000) ENGINE = MyISAM,
 PARTITION p24 VALUES LESS THAN (24000000) ENGINE = MyISAM,
 PARTITION p25 VALUES LESS THAN (25000000) ENGINE = MyISAM,
 PARTITION p26 VALUES LESS THAN (26000000) ENGINE = MyISAM,
 PARTITION p27 VALUES LESS THAN (27000000) ENGINE = MyISAM,
 PARTITION p28 VALUES LESS THAN (28000000) ENGINE = MyISAM,
 PARTITION p29 VALUES LESS THAN (29000000) ENGINE = MyISAM,
 PARTITION p30 VALUES LESS THAN (30000000) ENGINE = MyISAM,
 PARTITION p31 VALUES LESS THAN (31000000) ENGINE = MyISAM,
 PARTITION p32 VALUES LESS THAN (32000000) ENGINE = MyISAM,
 PARTITION p33 VALUES LESS THAN (33000000) ENGINE = MyISAM,
 PARTITION p34 VALUES LESS THAN (34000000) ENGINE = MyISAM,
 PARTITION p35 VALUES LESS THAN (35000000) ENGINE = MyISAM,
 PARTITION p36 VALUES LESS THAN (36000000) ENGINE = MyISAM,
 PARTITION p37 VALUES LESS THAN (37000000) ENGINE = MyISAM,
 PARTITION p38 VALUES LESS THAN (38000000) ENGINE = MyISAM,
 PARTITION p39 VALUES LESS THAN (39000000) ENGINE = MyISAM,
 PARTITION p40 VALUES LESS THAN (40000000) ENGINE = MyISAM,
 PARTITION p41 VALUES LESS THAN (41000000) ENGINE = MyISAM,
 PARTITION p42 VALUES LESS THAN (42000000) ENGINE = MyISAM,
 PARTITION p43 VALUES LESS THAN (43000000) ENGINE = MyISAM,
 PARTITION p44 VALUES LESS THAN (44000000) ENGINE = MyISAM,
 PARTITION p45 VALUES LESS THAN (45000000) ENGINE = MyISAM,
 PARTITION p46 VALUES LESS THAN (46000000) ENGINE = MyISAM,
 PARTITION p47 VALUES LESS THAN (47000000) ENGINE = MyISAM,
 PARTITION p48 VALUES LESS THAN (48000000) ENGINE = MyISAM,
 PARTITION p49 VALUES LESS THAN (49000000) ENGINE = MyISAM,
 PARTITION p50 VALUES LESS THAN (50000000) ENGINE = MyISAM,
 PARTITION p51 VALUES LESS THAN (51000000) ENGINE = MyISAM,
 PARTITION p52 VALUES LESS THAN (52000000) ENGINE = MyISAM,
 PARTITION p53 VALUES LESS THAN (53000000) ENGINE = MyISAM,
 PARTITION p54 VALUES LESS THAN (54000000) ENGINE = MyISAM,
 PARTITION p55 VALUES LESS THAN (55000000) ENGINE = MyISAM,
 PARTITION p56 VALUES LESS THAN (56000000) ENGINE = MyISAM,
 PARTITION p57 VALUES LESS THAN (57000000) ENGINE = MyISAM,
 PARTITION p58 VALUES LESS THAN (58000000) ENGINE = MyISAM,
 PARTITION p59 VALUES LESS THAN (59000000) ENGINE = MyISAM,
 PARTITION p60 VALUES LESS THAN (60000000) ENGINE = MyISAM,
 PARTITION p61 VALUES LESS THAN (61000000) ENGINE = MyISAM,
 PARTITION p62 VALUES LESS THAN (62000000) ENGINE = MyISAM,
 PARTITION p63 VALUES LESS THAN (63000000) ENGINE = MyISAM,
 PARTITION p64 VALUES LESS THAN (64000000) ENGINE = MyISAM,
 PARTITION p65 VALUES LESS THAN (65000000) ENGINE = MyISAM,
 PARTITION p66 VALUES LESS THAN (66000000) ENGINE = MyISAM,
 PARTITION p67 VALUES LESS THAN (67000000) ENGINE = MyISAM,
 PARTITION p68 VALUES LESS THAN (68000000) ENGINE = MyISAM,
 PARTITION p69 VALUES LESS THAN (69000000) ENGINE = MyISAM,
 PARTITION p70 VALUES LESS THAN (70000000) ENGINE = MyISAM,
 PARTITION p71 VALUES LESS THAN (71000000) ENGINE = MyISAM,
 PARTITION p72 VALUES LESS THAN (72000000) ENGINE = MyISAM,
 PARTITION p73 VALUES LESS THAN (73000000) ENGINE = MyISAM,
 PARTITION p74 VALUES LESS THAN (74000000) ENGINE = MyISAM,
 PARTITION p75 VALUES LESS THAN (75000000) ENGINE = MyISAM,
 PARTITION p76 VALUES LESS THAN (76000000) ENGINE = MyISAM,
 PARTITION p77 VALUES LESS THAN (77000000) ENGINE = MyISAM,
 PARTITION p78 VALUES LESS THAN (78000000) ENGINE = MyISAM,
 PARTITION p79 VALUES LESS THAN (79000000) ENGINE = MyISAM,
 PARTITION p80 VALUES LESS THAN (80000000) ENGINE = MyISAM,
 PARTITION p81 VALUES LESS THAN (81000000) ENGINE = MyISAM,
 PARTITION p82 VALUES LESS THAN (82000000) ENGINE = MyISAM,
 PARTITION p83 VALUES LESS THAN (83000000) ENGINE = MyISAM,
 PARTITION p84 VALUES LESS THAN (84000000) ENGINE = MyISAM,
 PARTITION p85 VALUES LESS THAN (85000000) ENGINE = MyISAM,
 PARTITION p86 VALUES LESS THAN (86000000) ENGINE = MyISAM,
 PARTITION p87 VALUES LESS THAN (87000000) ENGINE = MyISAM,
 PARTITION p88 VALUES LESS THAN (88000000) ENGINE = MyISAM,
 PARTITION p89 VALUES LESS THAN (89000000) ENGINE = MyISAM,
 PARTITION p90 VALUES LESS THAN (90000000) ENGINE = MyISAM,
 PARTITION p91 VALUES LESS THAN (91000000) ENGINE = MyISAM,
 PARTITION p92 VALUES LESS THAN (92000000) ENGINE = MyISAM,
 PARTITION p93 VALUES LESS THAN (93000000) ENGINE = MyISAM,
 PARTITION p94 VALUES LESS THAN (94000000) ENGINE = MyISAM,
 PARTITION p95 VALUES LESS THAN (95000000) ENGINE = MyISAM,
 PARTITION p96 VALUES LESS THAN (96000000) ENGINE = MyISAM,
 PARTITION p97 VALUES LESS THAN (97000000) ENGINE = MyISAM,
 PARTITION p98 VALUES LESS THAN (98000000) ENGINE = MyISAM,
 PARTITION p99 VALUES LESS THAN (99000000) ENGINE = MyISAM,
 PARTITION p100 VALUES LESS THAN (100000000) ENGINE = MyISAM,
 PARTITION p101 VALUES LESS THAN (101000000) ENGINE = MyISAM,
 PARTITION p102 VALUES LESS THAN (102000000) ENGINE = MyISAM,
 PARTITION p103 VALUES LESS THAN (103000000) ENGINE = MyISAM,
 PARTITION p104 VALUES LESS THAN (104000000) ENGINE = MyISAM,
 PARTITION p105 VALUES LESS THAN (105000000) ENGINE = MyISAM,
 PARTITION p106 VALUES LESS THAN (106000000) ENGINE = MyISAM,
 PARTITION p107 VALUES LESS THAN (107000000) ENGINE = MyISAM,
 PARTITION p108 VALUES LESS THAN (108000000) ENGINE = MyISAM,
 PARTITION p109 VALUES LESS THAN (109000000) ENGINE = MyISAM,
 PARTITION p110 VALUES LESS THAN (110000000) ENGINE = MyISAM,
 PARTITION p111 VALUES LESS THAN (111000000) ENGINE = MyISAM,
 PARTITION p112 VALUES LESS THAN (112000000) ENGINE = MyISAM,
 PARTITION p113 VALUES LESS THAN (113000000) ENGINE = MyISAM,
 PARTITION p114 VALUES LESS THAN (114000000) ENGINE = MyISAM,
 PARTITION p115 VALUES LESS THAN (115000000) ENGINE = MyISAM,
 PARTITION p116 VALUES LESS THAN (116000000) ENGINE = MyISAM,
 PARTITION p117 VALUES LESS THAN (117000000) ENGINE = MyISAM,
 PARTITION p118 VALUES LESS THAN (118000000) ENGINE = MyISAM,
 PARTITION p119 VALUES LESS THAN (119000000) ENGINE = MyISAM,
 PARTITION p120 VALUES LESS THAN (120000000) ENGINE = MyISAM,
 PARTITION p121 VALUES LESS THAN (121000000) ENGINE = MyISAM,
 PARTITION p122 VALUES LESS THAN MAXVALUE ENGINE = MyISAM) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_trade_log`
--

LOCK TABLES `tw_trade_log` WRITE;
/*!40000 ALTER TABLE `tw_trade_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tw_trade_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_tyhyorder`
--

DROP TABLE IF EXISTS `tw_tyhyorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_tyhyorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `username` varchar(60) NOT NULL COMMENT '会员账号',
  `num` float(10,2) NOT NULL COMMENT '投资金额',
  `hybl` float(10,2) NOT NULL COMMENT '盈亏比例',
  `hyzd` int(11) NOT NULL COMMENT '合约涨跌1买涨2买跌',
  `coinname` varchar(30) NOT NULL COMMENT '交易对',
  `status` int(11) NOT NULL COMMENT '状态：1待结算2已结算3无效结算',
  `is_win` int(11) NOT NULL COMMENT '盈亏状态：1盈利2亏损',
  `buytime` datetime NOT NULL COMMENT '购买时间',
  `selltime` datetime NOT NULL COMMENT '结算时间',
  `intselltime` int(11) NOT NULL COMMENT '结算时间戳',
  `buyprice` decimal(12,6) NOT NULL COMMENT '建仓单价',
  `sellprice` decimal(12,6) NOT NULL COMMENT '结算单价',
  `ploss` decimal(12,6) NOT NULL COMMENT '盈亏金额',
  `time` int(11) NOT NULL COMMENT '结算分钟数',
  `kongyk` int(11) NOT NULL COMMENT '控制盈亏1盈利2亏损0未指定',
  `invit` varchar(60) NOT NULL COMMENT '邀请码(上级)',
  `tznum` int(11) NOT NULL DEFAULT '0' COMMENT '0未通知，1已通知',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='合约订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_tyhyorder`
--

LOCK TABLES `tw_tyhyorder` WRITE;
/*!40000 ALTER TABLE `tw_tyhyorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `tw_tyhyorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_hy_follow_plan`
--

DROP TABLE IF EXISTS `tw_hy_follow_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_hy_follow_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `batch_no` varchar(50) NOT NULL DEFAULT '' COMMENT '批次编号',
  `title` varchar(120) NOT NULL DEFAULT '' COMMENT '标题',
  `coinname` varchar(30) NOT NULL DEFAULT '' COMMENT '交易对',
  `amount` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '跟单金额',
  `percent` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '占用余额百分比',
  `period` int(11) NOT NULL DEFAULT '0' COMMENT '周期(秒)',
  `start_time` datetime NOT NULL COMMENT '开仓开始时间',
  `end_time` datetime NOT NULL COMMENT '开仓结束时间',
  `direction` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1买涨 2买跌',
  `kongyk` tinyint(1) NOT NULL DEFAULT '0' COMMENT '控制盈亏 0不控制 1盈利 2亏损',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1待开始/可跟随 2已结束 3取消',
  `follow_count` int(11) NOT NULL DEFAULT '0' COMMENT '跟随次数',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_start_time` (`start_time`),
  KEY `idx_status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='秒合约跟单发布计划';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tw_hy_follow_log`
--

DROP TABLE IF EXISTS `tw_hy_follow_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_hy_follow_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `plan_id` int(11) NOT NULL COMMENT '跟单计划ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `username` varchar(60) NOT NULL COMMENT '用户账号',
  `coinname` varchar(30) NOT NULL COMMENT '交易对',
  `direction` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1买涨 2买跌',
  `period` int(11) NOT NULL DEFAULT '0' COMMENT '周期(秒)',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_plan` (`plan_id`),
  KEY `idx_uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='秒合约跟单跟随记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tw_user`
--

DROP TABLE IF EXISTS `tw_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(50) NOT NULL COMMENT '账号(邮箱)',
  `phone` varchar(50) NOT NULL COMMENT '手机号码',
  `money` decimal(20,8) NOT NULL COMMENT '合约体验金',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '注册类型 1 手机  2 邮箱',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '登陆密码',
  `paypassword` varchar(32) NOT NULL DEFAULT '' COMMENT '支付密码',
  `cardzm` varchar(225) NOT NULL COMMENT '身份证正面',
  `cardfm` varchar(225) NOT NULL COMMENT '身份证反面',
  `rzstatus` int(11) NOT NULL COMMENT '认证状态0未申请1已提交2已认让3已驳回',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '待定',
  `invit_1` varchar(50) NOT NULL DEFAULT '' COMMENT '上一代',
  `invit_2` varchar(50) NOT NULL DEFAULT '' COMMENT '上二代',
  `invit_3` varchar(50) NOT NULL DEFAULT '' COMMENT '上三代',
  `path` text NOT NULL COMMENT '团队路径',
  `logins` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `addip` varchar(50) NOT NULL DEFAULT '' COMMENT '注册IP',
  `addr` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP区域',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间j',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `lgtime` date NOT NULL COMMENT '登陆时间',
  `loginip` varchar(50) NOT NULL COMMENT '登陆IP',
  `loginaddr` varchar(225) NOT NULL COMMENT '登陆地址',
  `logintime` datetime NOT NULL COMMENT '登陆时间',
  `rztime` int(11) unsigned NOT NULL COMMENT '认证提交时间',
  `rzuptime` int(11) unsigned NOT NULL COMMENT '认证处理时间',
  `status` tinyint(11) unsigned NOT NULL DEFAULT '0' COMMENT '状态1正常2禁用',
  `txstate` int(11) NOT NULL COMMENT '提币状态1正常2禁止',
  `invit` varchar(50) DEFAULT NULL COMMENT '邀请码',
  `stoptime` int(11) NOT NULL COMMENT '禁止提现时间',
  `is_agent` int(11) NOT NULL DEFAULT '0' COMMENT '	0否1是',
  `area_code` varchar(255) DEFAULT NULL COMMENT '区号',
  `real_name` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `rztype` enum('1','2','3','4') DEFAULT NULL COMMENT ' 1 护照 2驾驶证 3SSN 4身份ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `username` (`username`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `invit_1` (`invit_1`),
  KEY `invit_2` (`invit_2`),
  KEY `invit_3` (`invit_3`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_user`
--

LOCK TABLES `tw_user` WRITE;
/*!40000 ALTER TABLE `tw_user` DISABLE KEYS */;
INSERT INTO `tw_user` VALUES (176,'88888','',0.00000000,1,'d73a827c9238018d879bab6c3bc8470b','d73a827c9238018d879bab6c3bc8470b','','',2,0,'0','0','0','',40,'203.160.86.154','香港中国联通(香港)运营有限公司',1669125401,0,'2023-06-02','','','0000-00-00 00:00:00',0,0,1,1,'UqGvB',0,0,NULL,NULL,NULL,NULL),(191,'akcy2022@gmail.com','',5000.00000000,2,'d73a827c9238018d879bab6c3bc8470b','eb97edee5c25291d6a71ea910eec7857','','',2,0,'0','0','0','',34,'203.160.86.214','香港中国联通(香港)运营有限公司',1670330475,0,'2023-04-08','203.160.80.95','香港中国联通(香港)运营有限公司','2023-03-13 12:00:17',0,0,1,1,'kRcob',1672874798,0,'',NULL,NULL,NULL),(193,'pangzi@163.com','',0.00000000,1,'d73a827c9238018d879bab6c3bc8470b','75e266f182b4fa3625d4a4f4f779af54','','',2,0,'0','0','0','',0,'203.160.86.79','香港中国联通(香港)运营有限公司',1670971591,0,'0000-00-00','','','0000-00-00 00:00:00',0,0,1,1,'PMhNk',0,0,NULL,NULL,NULL,NULL),(194,'haizi@163.com','',0.00000000,1,'d73a827c9238018d879bab6c3bc8470b','75e266f182b4fa3625d4a4f4f779af54','','',2,0,'0','0','0','',9,'203.160.86.79','香港中国联通(香港)运营有限公司',1670971620,0,'2022-12-21','','','0000-00-00 00:00:00',0,0,1,1,'CyHsn',0,0,NULL,NULL,NULL,NULL),(195,'tianw@163.com','',0.00000000,1,'d73a827c9238018d879bab6c3bc8470b','75e266f182b4fa3625d4a4f4f779af54','','',2,0,'0','0','0','',0,'203.160.86.79','香港中国联通(香港)运营有限公司',1670971637,0,'0000-00-00','','','0000-00-00 00:00:00',0,0,1,1,'rlPCD',0,0,NULL,NULL,NULL,NULL),(196,'laola@163.com','',0.00000000,1,'d73a827c9238018d879bab6c3bc8470b','75e266f182b4fa3625d4a4f4f779af54','','',2,0,'0','0','0','',3,'203.160.86.79','香港中国联通(香港)运营有限公司',1670971672,0,'2023-04-20','203.160.86.151','香港中国联通(香港)运营有限公司','2022-12-23 11:46:18',0,0,1,1,'Ytpac',0,0,NULL,NULL,NULL,NULL),(197,'kaydencehenry110@gmail.com','',5000.00000000,2,'4297f44b13955235245b2497399d7a93','','','',2,0,'0','0','0','',1,'199.15.79.229','美国',1671217029,0,'2022-12-16','199.15.79.229','美国','2022-12-16 13:57:23',0,0,1,1,'Eqage',0,0,'',NULL,NULL,NULL),(198,'Travelingtrucker60@gmail.com','',5000.00000000,2,'0ecaefad04055a466ff9ef7e6e47d788','','','',2,0,'0','0','0','',1,'98.234.204.39','美国新泽西州伯灵顿县月桂山乡Comcast有线通信股份有限公司',1672633460,0,'2023-01-01','','','0000-00-00 00:00:00',0,0,1,1,'vQjoq',0,0,'',NULL,NULL,NULL),(199,'germangarcia199078@gmail.com','',0.00000000,1,'788593f6a5246e54bf7923a8ddd78233','','','',2,0,'0','0','0','',90,'203.160.80.216','香港中国联通(香港)运营有限公司',1672696292,0,'2023-05-05','','','0000-00-00 00:00:00',0,0,1,1,'vRMEm',0,0,NULL,NULL,NULL,NULL),(200,'arbarile@icloud.com','',5000.00000000,2,'a0d9136298d149fcde43519aeb12b8ba','','','',2,0,'0','0','0','',3,'107.122.157.114','美国',1673205384,0,'2023-01-11','165.225.220.239','美国','2023-01-11 15:46:15',0,0,1,1,'hfaMA',0,0,'',NULL,NULL,NULL),(201,'mistaraba@gmail.com','',5000.00000000,2,'e10adc3949ba59abbe56e057f20f883e','e10adc3949ba59abbe56e057f20f883e','63bf22b088fc6.jpeg','63bf22c8eb0af.jpeg',2,0,'0','0','0','',2,'102.89.34.19','非洲地区',1673470258,0,'2024-03-29','101.44.83.169','上海市鹏博士长城宽带','2024-03-29 06:18:07',1673470675,1676857560,1,1,'fqUWi',0,0,'','+2348088707054','area','1'),(202,'laola@gmail.com','',0.00000000,1,'d73a827c9238018d879bab6c3bc8470b','','','',2,0,'0','0','0','',4,'199.195.249.246','美国',1676857285,0,'2023-03-01','44.235.143.63','美国','2023-03-01 07:52:38',0,0,1,1,'WXGJL',0,0,NULL,NULL,NULL,NULL),(204,'namin@gmail.com','',0.00000000,1,'d73a827c9238018d879bab6c3bc8470b','','','',2,0,'0','0','0','',2,'199.195.249.246','美国',1676857323,0,'2023-03-06','','','0000-00-00 00:00:00',0,0,1,1,'sVSBy',0,0,NULL,NULL,NULL,NULL),(206,'laura@gmail.com','',0.00000000,1,'d73a827c9238018d879bab6c3bc8470b','d73a827c9238018d879bab6c3bc8470b','','',2,0,'0','0','0','',32,'199.195.249.246','美国',1676857352,0,'2023-04-20','103.105.49.249','亚太地区','2023-04-03 20:59:25',0,0,1,1,'aJQfY',0,0,NULL,NULL,NULL,NULL),(207,'Yomi@gmail.com','',0.00000000,1,'21374746ceff3dde553518e5a05fba70','d73a827c9238018d879bab6c3bc8470b','','',2,0,'0','0','0','',23,'199.195.249.246','美国',1676857364,0,'2023-05-03','138.128.246.135','北美地区','2023-02-24 15:50:27',0,0,1,1,'QstNG',1680897241,0,NULL,NULL,NULL,NULL),(208,'nora@gmail.com','',0.00000000,1,'d73a827c9238018d879bab6c3bc8470b','','','',2,0,'0','0','0','',0,'199.195.249.246','美国',1676857379,0,'0000-00-00','','','0000-00-00 00:00:00',0,0,1,1,'nwfzG',0,0,NULL,NULL,NULL,NULL),(209,'zxjdbq1219@gmail.com','',5000.00000000,2,'e10adc3949ba59abbe56e057f20f883e','e10adc3949ba59abbe56e057f20f883e','','',2,0,'0','0','0','',17,'203.91.85.116','澳大利亚',1678975037,0,'2024-03-11','139.5.108.91','欧洲','2023-06-01 14:56:27',0,0,1,1,'UeblS',1678975295,0,'',NULL,NULL,NULL),(210,'susan918918@gmail.com','',5000.00000000,2,'e98963e325c30e96836d9e5695139b05','','','',2,0,'0','0','0','',2,'13.214.41.32','美国Xerox',1678977162,0,'2023-03-16','13.214.42.17','美国Xerox','2023-03-16 10:38:10',0,0,1,1,'vsgoZ',0,0,'',NULL,NULL,NULL),(211,'gchil207@yahoo.com','',5000.00000000,2,'53d228de9da8f173a23182d2124e77e2','','64234e7edb14d.jpg','64234e96ecdd5.jpg',2,0,'0','0','0','',10,'12.94.56.234','美国ATT用户',1680022381,0,'2023-04-07','','','0000-00-00 00:00:00',1680035504,1680109315,1,1,'VYbyD',0,0,'','5736896352','area','2'),(212,'alejasl2515@icloud.com','',5000.00000000,2,'7f9e670fa1b83c81fefb3937e7704570','','','',2,0,'0','0','0','',2,'107.122.157.79','美国',1680549720,0,'2023-04-03','','','0000-00-00 00:00:00',0,0,1,1,'SpKhv',0,0,'',NULL,NULL,NULL),(213,'jtbrown64@gmail.com','',5000.00000000,2,'ad592b46d6887ddc99bfe68fd9937414','ad592b46d6887ddc99bfe68fd9937414','','',2,0,'0','0','0','',58,'98.47.231.75','美国',1680578672,0,'2023-04-26','','','0000-00-00 00:00:00',0,0,1,1,'djALP',1681230203,0,'',NULL,NULL,NULL),(215,'parsen44@gmail.com','',5000.00000000,2,'945866cc663d61c53cd92945e49305a5','','','',2,0,'0','0','0','',6,'99.184.247.39','加拿大温尼伯市',1680630494,0,'2023-05-03','','','0000-00-00 00:00:00',0,0,1,1,'HGFYA',0,0,'',NULL,NULL,NULL),(216,'cabrerajorge3171@gmail.com','',0.00000000,1,'f0a269924a4f56353289ebbe35c872fd','','','',2,0,'0','0','0','',3,'147.185.242.127','美国',1680982848,0,'2023-04-08','','','0000-00-00 00:00:00',0,0,1,1,'XzVMv',0,0,NULL,NULL,NULL,NULL),(217,'kaitlyndavis999@gmail.com','',5000.00000000,2,'6a52de2641de8923244aab54e563bafd','','','',2,0,'0','0','0','',1,'116.212.143.245','柬埔寨',1681066627,0,'2023-04-09','116.212.143.245','柬埔寨','2023-04-09 14:57:39',0,0,1,1,'kezTj',0,0,'',NULL,NULL,NULL),(218,'Suharni158598@gmail.com','',5000.00000000,2,'8a6f2805b4515ac12058e79e66539be9','','','',2,0,'0','0','0','',3,'182.239.93.26','香港中国移动香港有限公司',1681875706,0,'2023-05-01','','','0000-00-00 00:00:00',0,0,1,1,'FrRqP',0,0,'',NULL,NULL,NULL),(220,'Laura@gmail.com','',0.00000000,1,'f0a7e0fa27b7563dccbf2d7461632e7b','f0a7e0fa27b7563dccbf2d7461632e7b','','',2,0,'176','0','0','',0,'104.129.128.247','美国Vegasnap公司',1682353347,0,'0000-00-00','','','0000-00-00 00:00:00',0,0,1,1,'JzikM',0,0,NULL,NULL,NULL,NULL),(221,'ceshi888','',0.00000000,1,'200820e3227815ed1756a6b531e7e0d2','200820e3227815ed1756a6b531e7e0d2','','',2,0,'0','0','0','',6,'134.122.188.178','美国',1682414431,0,'2024-03-27','206.201.7.234','美国','2024-03-27 08:36:45',0,0,1,1,'JCZEb',0,0,NULL,NULL,NULL,NULL),(222,'iqv0bd6m@besttempmail.com','',5000.00000000,2,'e10adc3949ba59abbe56e057f20f883e','','','',2,0,'0','0','0','',1,'134.122.188.178','美国',1683113924,0,'2023-05-30','27.124.41.34','印度','2023-05-30 23:00:33',0,0,1,1,'rBDXb',0,0,'',NULL,NULL,NULL),(223,'baofu8618@gmail.com','',5000.00000000,2,'e10adc3949ba59abbe56e057f20f883e','','6478b5e0d9ea8.jpeg','6478b5e7d8eea.jpeg',2,0,'0','0','0','',5,'104.28.249.48','美国CloudFlare公司CDN节点',1685629915,0,'2024-03-11','','','0000-00-00 00:00:00',1685632495,1685632530,1,1,'yAKHc',0,0,'','1111111','area','1'),(224,'xiwang911','',0.00000000,1,'e10adc3949ba59abbe56e057f20f883e','e10adc3949ba59abbe56e057f20f883e','','',0,0,'0','0','0','',1,'209.141.57.35','美国加利福尼亚州弗里蒙特市Buyvm公司',1685634105,0,'2023-06-01','158.247.238.205','美国','2023-06-01 12:02:57',0,0,1,1,'iWflz',0,1,NULL,NULL,NULL,NULL),(225,'1900553000@qq.com','',5000.00000000,2,'dc483e80a7a0bd9ef71d8cf973673924','e10adc3949ba59abbe56e057f20f883e','65ef55009e141.png','65ef5501ef8da.png',2,0,'224','0','0',',224',30,'202.43.234.64','澳大利亚',1710183214,0,'2024-05-25','117.182.197.54','中国移动','2024-05-25 00:11:22',1710183682,1710183749,1,1,'aCuBh',1710185333,0,'','15777777777','area','1');
/*!40000 ALTER TABLE `tw_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_user_coin`
--

DROP TABLE IF EXISTS `tw_user_coin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_user_coin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `usdt` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000',
  `usdtd` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000',
  `usdtb` varchar(200) NOT NULL DEFAULT '0',
  `btc` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000',
  `btcd` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000',
  `btcb` varchar(200) NOT NULL DEFAULT '0',
  `eth` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000',
  `ethd` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000',
  `ethb` varchar(200) NOT NULL DEFAULT '0',
  `ogod` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000',
  `ogob` varchar(200) NOT NULL DEFAULT '0',
  `usdc` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000',
  `usdcd` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000',
  `usdcb` varchar(200) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid` (`userid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户币种表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_user_coin`
--

LOCK TABLES `tw_user_coin` WRITE;
/*!40000 ALTER TABLE `tw_user_coin` DISABLE KEYS */;
INSERT INTO `tw_user_coin` VALUES (142,176,45213.64999800,0.00000000,'0',2000102.69927415,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(143,177,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(144,178,1200.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(145,179,30.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(146,180,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(147,181,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(148,182,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(149,183,3000.10000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(150,184,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(151,185,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(152,186,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(153,187,115580.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(154,188,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(155,189,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(156,190,672424.35040000,0.00000000,'0',13.14843484,0.00000000,'0',100.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(157,191,409100.67850637,0.00000000,'0',0.99062062,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(158,192,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(159,193,91152.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(160,194,120560.65000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(161,195,148933.12162935,0.00000000,'0',0.00000071,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(162,196,99004.13407468,0.00000000,'0',0.00000064,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(163,197,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(164,198,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(165,199,162706.60000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(166,200,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(167,201,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(168,202,438444.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(169,203,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(170,204,232215.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(171,205,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(172,206,309178.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(173,207,121933.73331962,0.00000000,'0',1.05117258,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(174,208,343223.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(175,209,133536.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(176,210,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(177,211,5257.17000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(178,212,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(179,213,38972.70365460,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(180,214,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(181,215,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(182,216,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(183,217,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(184,218,100000.00000000,0.00000000,'0',1.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(185,219,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(186,220,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(187,221,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(188,222,485.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(189,223,5950.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(190,224,0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0'),(191,225,14669.29860000,5546.45040000,'0',1756.00530195,0.00000000,'0',11.00000000,0.00000000,'0',0.00000000,'0',0.00000000,0.00000000,'0');
/*!40000 ALTER TABLE `tw_user_coin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_user_log`
--

DROP TABLE IF EXISTS `tw_user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_user_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `type` varchar(200) NOT NULL DEFAULT '',
  `remark` varchar(200) NOT NULL DEFAULT '',
  `addip` varchar(200) NOT NULL DEFAULT '',
  `addr` varchar(200) NOT NULL DEFAULT '',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid` (`userid`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_user_log`
--

LOCK TABLES `tw_user_log` WRITE;
/*!40000 ALTER TABLE `tw_user_log` DISABLE KEYS */;
INSERT INTO `tw_user_log` VALUES (1,225,'登录','邮箱登录','117.182.197.54','中国移动',0,1716610282,0,1);
/*!40000 ALTER TABLE `tw_user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tw_user_qianbao`
--

DROP TABLE IF EXISTS `tw_user_qianbao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tw_user_qianbao` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `userid` int(11) unsigned NOT NULL COMMENT '会员ID',
  `coinname` varchar(200) NOT NULL COMMENT '会员账号',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '币名称',
  `remark` varchar(200) NOT NULL COMMENT '地址备注',
  `czline` varchar(200) NOT NULL COMMENT '充值网络',
  `addr` varchar(200) NOT NULL DEFAULT '' COMMENT '提币地址',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `addtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `userid` (`userid`) USING BTREE,
  KEY `coinname` (`coinname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户钱包表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tw_user_qianbao`
--

LOCK TABLES `tw_user_qianbao` WRITE;
/*!40000 ALTER TABLE `tw_user_qianbao` DISABLE KEYS */;
INSERT INTO `tw_user_qianbao` VALUES (1,207,'Yomi@gmail.com','usdt','1','','0×fjutc435fhjDj217Gjdrbn4ejnse5ffF',1,'2023-04-08 17:44:00',1);
/*!40000 ALTER TABLE `tw_user_qianbao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'okx123'
--

--
-- Dumping routines for database 'okx123'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-26 12:07:46
