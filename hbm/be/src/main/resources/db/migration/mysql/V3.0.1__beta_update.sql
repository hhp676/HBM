/*
 * update for 3.0.1-beta
 */

/***新增附属权限***/
INSERT INTO `sys_auth` VALUES (1065516787538786594, 1, 'sysPos:getPosTree', '获取岗位树', '', '', 1052481650765665738, 2, 1060262570224060575, 0, '', '/sys/org/getPosTree', 1, 1, '', '', 0, 0, '2017-4-24 15:26:14', '2017-4-24 15:26:14', 1, 1, NULL, 1);
INSERT INTO `sys_auth` VALUES (1065516637426743584, 1, 'sysOrg:getOrgTree', '组织架构树', '', '', 1052481649938339272, 2, 1060262570224060575, 1, '', '/sys/org/getOrgTree', 1, 1, '', '', 0, 0, '2017-4-24 15:23:51', '2017-4-24 15:23:51', 1, 1, NULL, 1);
INSERT INTO `sys_auth` VALUES (1065516080032053505, 1, 'sysAuthMenu:getModelTree', '获取模块树', '', '', 1060425852316912889, 2, 1060262570224060575, 0, '', '/sys/sysAuthMenu/getModelTree', 2, 1, '', '', 0, 0, '2017-4-24 15:15:00', '2017-4-24 15:15:00', 1, 1, NULL, 1);
INSERT INTO `sys_auth` VALUES (1065515347409828075, 1, 'sysAuthmanage:tabs', '功能权限tabs', '', '', 1052481648470332868, 2, 1060512414373153244, 1, '', '/sys/sysAuthMenu/authManage_view_tabs', 1, 1, '', '', 0, 0, '2017-4-24 15:03:21', '2017-4-24 15:03:21', 1, 1, NULL, 1);


/**bootstrap菜单调整**/
update sys_model set IS_BS_SUB_MENU_=0 where MODEL_ID_ = '1052481649176024518';
update sys_model set IS_BS_SUB_MENU_=0 where MODEL_ID_ = '1052481650369304009';

/**修正无效配置**/
update sys_model set IS_TOP_MENU_=0,IS_SUB_MENU_=0 where MODEL_ID_ = '1052481650369304009';
update sys_model set IS_TOP_MENU_=0,IS_SUB_MENU_=0 where MODEL_ID_ = '1060521204894431579';
update sys_model set IS_TOP_MENU_=0,IS_SUB_MENU_=0 where MODEL_ID_ = '1060531546931984011';
update sys_model set IS_TOP_MENU_=0,IS_SUB_MENU_=0 where MODEL_ID_ = '1060535699748026070';
update sys_model set IS_TOP_MENU_=0,IS_SUB_MENU_=0 where MODEL_ID_ = '1060536269074462439';
update sys_model set IS_TOP_MENU_=0,IS_SUB_MENU_=0 where MODEL_ID_ = '1060536473503790825';
update sys_model set IS_TOP_MENU_=0,IS_SUB_MENU_=0 where MODEL_ID_ = '1060537266043746054';
update sys_model set IS_TOP_MENU_=0,IS_SUB_MENU_=0 where MODEL_ID_ = '1060537285849249544';
update sys_model set IS_TOP_MENU_=0,IS_SUB_MENU_=0 where MODEL_ID_ = '1060539373376370476';
update sys_model set IS_TOP_MENU_=0,IS_SUB_MENU_=0 where MODEL_ID_ = '1060545472174714840';
update sys_model set IS_TOP_MENU_=0,IS_SUB_MENU_=0 where MODEL_ID_ = '1060545543841738715';
update sys_model set IS_TOP_MENU_=0,IS_SUB_MENU_=0 where MODEL_ID_ = '1060545574796750813';
update sys_model set IS_TOP_MENU_=0,IS_SUB_MENU_=0 where MODEL_ID_ = '1063084084742170457';

/**同步到bootstrap**/
update sys_model set IS_BS_TOP_MENU_=1,IS_BS_SUB_MENU_=0 where MODEL_ID_ = '1056741606000308184';
update sys_model set IS_BS_TOP_MENU_=0,IS_BS_SUB_MENU_=1 where MODEL_ID_ = '1056745429913710559';

update sys_model set IS_BS_SUB_MENU_=1 where MODEL_ID_ = '1058615343450023223';
update sys_model set IS_BS_SUB_MENU_=1 where MODEL_ID_ = '1058634996701833057';
update sys_model set IS_BS_SUB_MENU_=1 where MODEL_ID_ = '1058635183551784802';
update sys_model set IS_BS_SUB_MENU_=1 where MODEL_ID_ = '1058635416398571363';
update sys_model set IS_BS_SUB_MENU_=1 where MODEL_ID_ = '1059183053449771506';
update sys_model set IS_BS_SUB_MENU_=1 where MODEL_ID_ = '1059277349464124526';
update sys_model set IS_BS_SUB_MENU_=1 where MODEL_ID_ = '1059442767489324695';
update sys_model set IS_BS_SUB_MENU_=1 where MODEL_ID_ = '1059970869698056785';
update sys_model set IS_BS_SUB_MENU_=1 where MODEL_ID_ = '1061265384278891362';


/***bootstrap样式***/
ALTER TABLE `sys_model` ADD COLUMN `BS_STYLE_` VARCHAR(256) NULL COMMENT 'bootstrap css' AFTER `STYLE_`;
ALTER TABLE `sys_auth` ADD COLUMN `BS_STYLE_` VARCHAR(256) NULL COMMENT 'bootstrap css' AFTER `STYLE_`;
 
UPDATE sys_model SET BS_STYLE_='fa fa-medium' WHERE `MODEL_ID_`='1052481646384715198';
UPDATE sys_model SET BS_STYLE_='fa fa-user-secret' WHERE `MODEL_ID_`='1052481646805194175';
UPDATE sys_model SET BS_STYLE_='fa fa-cubes' WHERE `MODEL_ID_`='1052481646805194176';
UPDATE sys_model SET BS_STYLE_='fa fa-user' WHERE `MODEL_ID_`='1052481647455311297';
UPDATE sys_model SET BS_STYLE_='fa fa-calculator' WHERE `MODEL_ID_`='1052481647455311298';
UPDATE sys_model SET BS_STYLE_='fa fa-database' WHERE `MODEL_ID_`='1052481647455311299';
UPDATE sys_model SET BS_STYLE_='fa fa-cube' WHERE `MODEL_ID_`='1052481647455311300';
UPDATE sys_model SET BS_STYLE_='fa fa-filter' WHERE `MODEL_ID_`='1052481647455311301';
UPDATE sys_model SET BS_STYLE_='fa fa-users' WHERE `MODEL_ID_`='1052481648127448515';
UPDATE sys_model SET BS_STYLE_='fa fa-navicon' WHERE `MODEL_ID_`='1052481648470332868';
UPDATE sys_model SET BS_STYLE_='fa fa-magnet' WHERE `MODEL_ID_`='1052481649938339272';
UPDATE sys_model SET BS_STYLE_='fa fa-cogs' WHERE `MODEL_ID_`='1052481652225283534';
UPDATE sys_model SET BS_STYLE_='fa fa-cog' WHERE `MODEL_ID_`='1052481652225283555';
UPDATE sys_model SET BS_STYLE_='fa fa-wrench' WHERE `MODEL_ID_`='1052481652945655248';
UPDATE sys_model SET BS_STYLE_='fa fa-table' WHERE `MODEL_ID_`='1052481653319996881';
UPDATE sys_model SET BS_STYLE_='fa fa-file-text' WHERE `MODEL_ID_`='1052481654405273044';
UPDATE sys_model SET BS_STYLE_='fa fa-file-text-o' WHERE `MODEL_ID_`='1052481654405273056';
UPDATE sys_model SET BS_STYLE_='fa fa-file-text-o' WHERE `MODEL_ID_`='1052481654405273057';
UPDATE sys_model SET BS_STYLE_='fa fa-th-large' WHERE `MODEL_ID_`='1052481654739768666';
UPDATE sys_model SET BS_STYLE_='fa fa-upload' WHERE `MODEL_ID_`='1052481654739768789';
UPDATE sys_model SET BS_STYLE_='fa fa-picture-o' WHERE `MODEL_ID_`='1052481655604843993';
UPDATE sys_model SET BS_STYLE_='fa fa-tachometer' WHERE `MODEL_ID_`='1052481655704243258';
UPDATE sys_model SET BS_STYLE_='fa fa-connectdevelop' WHERE `MODEL_ID_`='1052481655704243260';
UPDATE sys_model SET BS_STYLE_='fa fa-diamond' WHERE `MODEL_ID_`='1052481655704243262';
UPDATE sys_model SET BS_STYLE_='fa fa-sellsy' WHERE `MODEL_ID_`='1052481655704243263';
UPDATE sys_model SET BS_STYLE_='fa fa-area-chart' WHERE `MODEL_ID_`='1052481655947728344';
UPDATE sys_model SET BS_STYLE_='fa fa-pie-chart' WHERE `MODEL_ID_`='1052481656350381529';
UPDATE sys_model SET BS_STYLE_='fa fa-bar-chart-o' WHERE `MODEL_ID_`='1052481656748840410';
UPDATE sys_model SET BS_STYLE_='fa fa-bar-chart' WHERE `MODEL_ID_`='1052481656748840422';
UPDATE sys_model SET BS_STYLE_='fa fa-line-chart' WHERE `MODEL_ID_`='1052481656748840460';
UPDATE sys_model SET BS_STYLE_='fa fa-user' WHERE `MODEL_ID_`='1052481657072850395';
UPDATE sys_model SET BS_STYLE_='fa fa-user' WHERE `MODEL_ID_`='1052481657408394716';
UPDATE sys_model SET BS_STYLE_='fa fa-info-circle' WHERE `MODEL_ID_`='1052481657744987613';
UPDATE sys_model SET BS_STYLE_='fa fa-lock' WHERE `MODEL_ID_`='1052481658097309150';
UPDATE sys_model SET BS_STYLE_='fa fa-dot-circle-o' WHERE `MODEL_ID_`='1052481658449630687';
UPDATE sys_model SET BS_STYLE_='fa fa-tasks' WHERE `MODEL_ID_`='1052481658842846688';
UPDATE sys_model SET BS_STYLE_='fa fa-tint' WHERE `MODEL_ID_`='1056741606000308184';
UPDATE sys_model SET BS_STYLE_='fa fa-recycle' WHERE `MODEL_ID_`='1056745429913710559';
UPDATE sys_model SET BS_STYLE_='fa fa-binoculars' WHERE `MODEL_ID_`='1058615343450023223';
UPDATE sys_model SET BS_STYLE_='fa fa-edit' WHERE `MODEL_ID_`='1058634996701833057';
UPDATE sys_model SET BS_STYLE_='fa fa-file-excel-o' WHERE `MODEL_ID_`='1058635183551784802';
UPDATE sys_model SET BS_STYLE_='fa fa-file-pdf-o' WHERE `MODEL_ID_`='1058635416398571363';
UPDATE sys_model SET BS_STYLE_='fa fa-upload' WHERE `MODEL_ID_`='1059183053449771506';
UPDATE sys_model SET BS_STYLE_='fa fa-pie-chart' WHERE `MODEL_ID_`='1059277349464124526';
UPDATE sys_model SET BS_STYLE_='fa fa-inbox' WHERE `MODEL_ID_`='1059442767489324695';
UPDATE sys_model SET BS_STYLE_='fa fa-repeat' WHERE `MODEL_ID_`='1059970869698056785';
UPDATE sys_model SET BS_STYLE_='fa fa-wechat' WHERE `MODEL_ID_`='1061265384278891362';



/***主权限,附属权限对应关系****/
INSERT INTO `sys_auth_join` VALUES (1065516826446199078, 1053269290030336589, 1065516787538786594, 0, '2017-4-24 15:26:52', 1);
INSERT INTO `sys_auth_join` VALUES (1065516845624654122, 1053269290079619662, 1065516787538786594, 0, '2017-4-24 15:27:10', 1);
INSERT INTO `sys_auth_join` VALUES (1065516921636976941, 1060546419125874659, 1065516637426743584, 0, '2017-4-24 15:28:22', 1);
INSERT INTO `sys_auth_join` VALUES (1065516939160779056, 1060546527206797285, 1065516637426743584, 0, '2017-4-24 15:28:39', 1);
INSERT INTO `sys_auth_join` VALUES (1065516174408087812, 1053269289002732093, 1065516080032053505, 0, '2017-4-24 15:16:30', 1);
INSERT INTO `sys_auth_join` VALUES (1065516273342281990, 1053269289043626558, 1065516080032053505, 0, '2017-4-24 15:18:04', 1);
INSERT INTO `sys_auth_join` VALUES (1065516313320290568, 1053269289539603013, 1065516080032053505, 0, '2017-4-24 15:18:42', 1);
INSERT INTO `sys_auth_join` VALUES (1065516333588216074, 1053269289616149062, 1065516080032053505, 0, '2017-4-24 15:19:02', 1);
INSERT INTO `sys_auth_join` VALUES (1065516359987165469, 1053269288910457403, 1065516080032053505, 0, '2017-4-24 15:19:27', 1);
INSERT INTO `sys_auth_join` VALUES (1065516358506576140, 1053269288910457403, 1065515347409828075, 0, '2017-4-24 15:19:25', 1);


/**系统配置**/
INSERT INTO `sys_config` VALUES (1064879811563183922, 1, 'isUsingCache', '0', 'js缓存使用标记,(0使用时间戳值,1使用系统时间版本值)', 'sys', '1', 20, 1, 1, NULL, 0, 0, '2017-4-17 14:41:47', '2017-4-17 14:41:47', 1, 1);
INSERT INTO `sys_config` VALUES (1065138732049337769, 1, 'sysTimerVerson', '1492658232602', '系统时间版本值,该值跟随系统启动进行更新', 'sys', '1', 19, 1, 1, NULL, 0, 0, '2017-4-20 11:17:13', '2017-4-20 16:12:11', -1, -1);
INSERT INTO `sys_config` VALUES (1065513867577587797, 1, 'sysDefultLeftMenu', 'sysAuthManagementMenu', '系统默认左侧菜单,值设定为访问权限code值', 'sys', 'sysPersonalMenu', 21, 1, 1, NULL, 0, 0, '2017-4-24 14:39:50', '2017-4-24 14:39:50', 1, 1);

/**新增函数**/
DROP FUNCTION IF EXISTS `get_pos_children`;
DELIMITER ;;
CREATE FUNCTION `get_pos_children`(`positionID` bigint) RETURNS varchar(1000) CHARSET utf8
BEGIN
  declare sTemp varchar(1000);
  declare sTempChd varchar(1000);
  
  set sTemp = '$';
  set sTempChd = cast(positionID as char);
  
  WHILE sTempChd is not null DO
    set sTemp = concat(sTemp, ',', sTempChd);
    SELECT 
        GROUP_CONCAT(POSITION_ID_)
    INTO sTempChd FROM
        sys_position sp
    WHERE
        FIND_IN_SET(sp.FID_, sTempChd) > 0
            AND sp.IS_DELETE_ = 0;
  END WHILE;
  RETURN sTemp;
END
;;
DELIMITER ;

/**系统配置**/
INSERT INTO `sys_config` VALUES ('1065521702166992466', '1', 'sysVersion', 'V3.0.0.RELEASE', '版本控制', 'sys', 'V3.0.0.RELEASE', '22', '1', '1', null, '0', '0', '2017-04-24 16:44:21', '2017-04-24 16:44:21', '1', '1');

/**图标配置**/
INSERT INTO `sys_icon` VALUES ('1064880437790709156', '1', '508', 'icon_auto_colorful__editor', '/static/images/icons/colorful/editor.png', '', '', '', '508', '1', '0', '1', null, '2017-04-17 14:51:44', '2017-04-17 14:51:44', '1', '1');
INSERT INTO `sys_icon` VALUES ('1064881024030676390', '1', '509', 'icon_auto_colorful__changePassword', '/static/images/icons/colorful/changePassword.png', '', '', '', '509', '1', '0', '1', null, '2017-04-17 15:01:03', '2017-04-17 15:01:03', '1', '1');
INSERT INTO `sys_icon` VALUES ('1064882125993874856', '1', '510', 'icon_auto_colorful__close_all', '/static/images/icons/colorful/close_all.png', '', '', '', '510', '1', '0', '1', null, '2017-04-17 15:18:56', '2017-04-17 15:18:34', '1', '1');
INSERT INTO `sys_icon` VALUES ('1064882187001075115', '1', '511', 'icon_auto_colorful__close', '/static/images/icons/colorful/close.png', '', '', '', '511', '1', '0', '1', null, '2017-04-17 15:19:32', '2017-04-17 15:19:32', '1', '1');
INSERT INTO `sys_icon` VALUES ('1064891738157564746', '1', '512', 'icon_auto_colorful__Administration', '/static/images/icons/colorful/Administration.png', '', '', '', '512', '1', '0', '1', null, '2017-04-17 17:51:21', '2017-04-17 17:51:21', '1', '1');
INSERT INTO `sys_icon` VALUES ('1064891792756917068', '1', '513', 'icon_auto_colorful__check', '/static/images/icons/colorful/check.png', '', '', '', '513', '1', '0', '1', null, '2017-04-17 17:52:13', '2017-04-17 17:52:13', '1', '1');
INSERT INTO `sys_icon` VALUES ('1064892222319706958', '1', '514', 'icon_auto_colorful__download1', '/static/images/icons/colorful/download1.png', '', '', '', '514', '1', '0', '1', null, '2017-04-17 17:59:03', '2017-04-17 17:59:03', '1', '1');
INSERT INTO `sys_icon` VALUES ('1064892278196224848', '1', '515', 'icon_auto_colorful__editmenu', '/static/images/icons/colorful/editmenu.png', '', '', '', '515', '1', '0', '1', null, '2017-04-17 17:59:56', '2017-04-17 17:59:56', '1', '1');
INSERT INTO `sys_icon` VALUES ('1064892399346598738', '1', '516', 'icon_auto_colorful__upload1', '/static/images/icons/colorful/upload1.png', '', '', '', '516', '1', '0', '1', null, '2017-04-17 18:01:51', '2017-04-17 18:01:51', '1', '1');
INSERT INTO `sys_icon` VALUES ('1064898141630806100', '1', '517', 'icon_auto_colorful__post', '/static/images/icons/colorful/post.png', '', '', '', '517', '1', '0', '1', null, '2017-04-17 19:33:08', '2017-04-17 19:33:08', '1', '1');


/**字典**/
INSERT INTO `sys_dict_group` VALUES ('1059355057992395013', '1', 'bsColorList', null, 'bootstrap系统主题配色', null, null, 'bootstrap系统主题配色', '0', '1', '2017-02-15 15:08:11', '2017-02-15 15:08:11', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1059355090484619526', '1', '1059355057992395013', 'bule', '#5DB2FF', null, null, '1', null, '1', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1059355103639005447', '1', '1059355057992395013', 'skyblue', '#2dc3e8', null, null, '1', null, '2', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1059355116460992776', '1', '1059355057992395013', 'cyan', '#03B3B2', null, null, '1', null, '4', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1059355128791197961', '1', '1059355057992395013', 'green', '#53a93f', null, null, '1', null, '8', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1059355140782713098', '1', '1059355057992395013', 'yellow', '#FF8F32', null, null, '1', null, '16', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');
INSERT INTO `sys_dict_item` VALUES ('1059355151988844811', '1', '1059355057992395013', 'red', '#cc324b', null, null, '1', null, '32', '', null, '0', '1', '2017-03-30 20:01:45', '2017-03-30 20:01:45', '1', '1');


update sys_config set CONFIG_VALUE_ = 'V3.0.1-BETA' where CONFIG_KEY_ = 'sysVersion';
