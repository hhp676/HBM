<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${h:getSysProperty('sysName')}</title>
<c:set var="curThemeColor" value="default" />
<c:forEach items="${colorList}" var="color" varStatus="colorStatus"><c:if test="${color.itemValue == themeColor}">
        <c:set var="curThemeColor" value="${color.itemValue}" />
    </c:if></c:forEach>
<script>
var G_THEME_COLOR = "${curThemeColor}";
</script>
<link id="easyuiTheme" rel="stylesheet" type="text/css"
    href="${ctx}/plugins/jquery-easyui/themes/${curThemeColor}/easyui.css?jsTimer=${jsTimer}" />
<link rel="stylesheet" type="text/css"
    href="${ctx}/plugins/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css"
    href="${ctx}/plugins/jquery-easyui/themes/color.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/sys/common/sysIcon/iconDynamicCss?jsTimer=${jsTimer}" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/icon.css?jsTimer=${jsTimer}" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/global.css?jsTimer=${jsTimer}" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/main.css?jsTimer=${jsTimer}" />
<link rel="stylesheet" type="text/css"
    href="${ctx}/static/css/page/index.css?jsTimer=${jsTimer}" />
<link rel="stylesheet" type="text/css"
    href="${ctx}/static/custom/css/public.css?jsTimer=${jsTimer}" />
<link rel="stylesheet" type="text/css"
    href="${ctx}/static/custom/css/head.css?jsTimer=${jsTimer}" />
<!--[if IE 8]>
    <!-- ie8时,使用jqueryA版本 yyzh -->
    <script type="text/javascript" src="${ctx}/static/js/jquery-A.js"></script>
<![endif]-->
<!--[if gte IE 9]>
    <!-- ie版本大于等于9时,使用jquery1.12.4版本  yyzh-->
    <script type="text/javascript" src="${ctx}/static/js/jquery.1.12.4.js"></script>
<![endif]-->
<!-- My97DatePicker -->
<script type="text/javascript" src="${ctx}/plugins/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-blockUI/jquery.blockUI.js"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-easyui/jquery.easyui.1.4.5.js"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-easyui/extension/datagrid-filter.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-easyui/extension/datagrid-detailview.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-easyui/extension/datagrid-groupview.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/plugins/jquery-easyui/jquery.easyui.custom.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${ctx}/static/js/theme.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.config.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.util.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.ui.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.hotkey.monitor.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.moduleClass.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.common.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.authLocation.js?jsTimer=${jsTimer}"></script>

<!-- websocket -->
<script type="text/javascript" src="${ctx}/static/js/ws/sockjs.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/ws/stomp.js"></script>
<!-- WebUploader -->
<link rel="stylesheet" type="text/css" href="${ctx}/plugins/webuploader/webuploader.css" />
<script type="text/javascript" src="${ctx}/plugins/webuploader/webuploader.js"></script>
<script type="text/javascript" src="${ctx}/static/js/sys/file/hg.webUploadGrid.js?jsTimer=${jsTimer}"></script>
<!-- ajaxFileUpload -->
<script type="text/javascript" src="${ctx}/static/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="${ctx}/static/js/sys/file/hg.ajaxFileUpload.js?jsTimer=${jsTimer}"></script>
<!-- 富文本编辑器ueditor -->
<script type="text/javascript" src="${ctx}/plugins/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${ctx}/plugins/ueditor/ueditor.all.js"> </script>
<script type="text/javascript" src="${ctx}/plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
<!-- jquery局部打印PrintArea-2.4.0 -->
<script type="text/javascript" src="${ctx}/static/js/jquery.PrintArea.js"></script>
<!-- echarts报表 -->
<script type="text/javascript" src="${ctx}/plugins/echarts/echarts.js"></script>
<!--[if gte IE 9]>
   <!--  ie版本大于等于9时,才会引用该JS yyzh-->
	<script type="text/javascript" src="${ctx}/plugins/zeroclipboard/ZeroClipboard.js"></script>
	<script>
	   ZeroClipboard.config({swfPath: "${ctx}/plugins/zeroclipboard/ZeroClipboard.swf"});
	</script>
<![endif]-->
<%-- <script type="text/javascript" src="${ctx}/static/js/jquery.jdirk.js?jsTimer=${jsTimer}"></script> --%>

<!-- validate -->
<script type="text/javascript"
    src="${ctx}/plugins/jquery-validator/jquery.validate.js"></script>
    <script type="text/javascript"
    src="${ctx}/plugins/jquery-validator/additional-methods.js"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-validator/localization/messages_zh.js"></script>
</head>
<body class="easyui-layout">
    <div region="north" split="false" border="false" id="indexTop_new"
        style="padding: 0px;">
        <div class="head_top">
             <div class="mainLogo"><img src="${ctx}/static/custom/img/logo2.png" /> </div>
             <div class="logo-txt">${h:getSysProperty('sysName')}
                -${h:getSysProperty('sysVersion')}
            </div>
            <ul class="headInfo">
                <li><a href="${ctx}/logout" title="退出登录" class="easyui-tooltip"><img
                        src="${ctx}/static/custom/img/ic03.png" /> <img
                        src="${ctx}/static/custom/img/ic03a.png" /></a></li>
                <li id="colorSelect"><a><img
                        src="${ctx}/static/custom/img/ic02.png" /><img
                        src="${ctx}/static/custom/img/ic02a.png" /> </a></li>
                <li><a onclick="toPersonalCenter();" title="个人中心" class="easyui-tooltip"><img
                        src="${ctx}/static/custom/img/ic01.png" /><img
                        src="${ctx}/static/custom/img/ic01a.png" /></a></li>

            </ul>
            <div class="Welcome">
                <a href="#"> Hello！${curUser.userName}</a>
            </div>
        </div>
    </div>

    <div id="center" data-options="region:'center',border:false"
        split="false">
        <div class="easyui-layout" fit="true">
            <div data-options="region:'north',border:false" split="false"
                style="height: 32px;">
                <div id="tt" class="" fit=true pill=true plain=true
                    tabWidth="120">
                    <c:forEach var="menu" items="${topMenuList}">
                        <div title="<b>${menu.modelName}</b>" style="padding: 0px">
                            <div style="display: none;" tag="modelId">${menu.modelId}</div>
                            <div style="display: none;" tag="icon">${menu.icon}</div>
                        </div>
                    </c:forEach>
                </div>
                <!-- 将顶部按钮下挂菜单放置在隐藏div中,供js创建顶部菜单时使用 -->
                <div style="display: none;">
				    ${menuHtml}
                </div>
            </div>
            <div data-options="region:'center',border:false,onLoad:function(){$('#indexSouth').show()}" split="false"
                href="${ctx}/sys/common/indexCenter/3" ></div>
        </div>



    </div>
    <div region="south" split="false" id="indexSouth" style="display: none">
        <div class="man_footer">鸿冠信息  www.hongguaninfo.com</div>
    </div>



    <div class="bgSet">
        <dl class="colorList">

            <dd class="activeColor">
                <span style="background-color: #E0ECFF;" value="default"></span>
            </dd>
            <dd>
                <span style="background-color: #DAEEF5;" value="metro"></span>
            </dd>
            <dd>
                <span style="background-color: #D7EBF9;" value="ui-cupertino"></span>
            </dd>
            <dd>
                <span style="background-color: #F3F3F3;" value="gray"></span>
            </dd>
            <dd>
                <span style="background-color: #F2F2F2;" value="bootstrap"></span>
            </dd>
            <dd>
                <span style="background-color: #ECEADF;" value="ui-pepper-grinder"></span>
            </dd>
            <dd>
                <span style="background-color: #666666;" value="black"></span>
            </dd>
            <!-- <dd>
                <span style="background-color: #f5f5f5;" value="material"></span>
            </dd> -->
            <dd>
                <span style="background-color: #000000;" value="ui-dark-hive"></span>
            </dd>
            <dd>
                <span style="background-color: #FEEEBD;" value="ui-sunny"></span>
            </dd>
        </dl>
    </div>
    
    
    
    <div id="rowContextMenu" class="easyui-menu" style="width:200px;">
    </div>

</body>
<script type="text/javascript">
    //------------------------------------------------ui js-------------------------------------------------
    //头部按钮背景切换效果
    $('.headInfo li a').hover(function() {
        $(this).children('img').eq(0).hide().end().eq(1).show();
    }, function() {
        $(this).children('img').eq(0).show().end().eq(1).hide();
    });


    
    
    //生成顶部菜单效果
    var tabAry = $('#tt').tabs().tabs('tabs');
    $("#tt").tabs("unselect", 0)
    for (var i=0;i<tabAry.length;i++) {
        var menuButton = tabAry[i].panel('options').tab.find('a.tabs-inner');
        var modelId = tabAry[i].find("[tag=modelId]").text();
        var iconCls = tabAry[i].find("[tag=icon]").text();
        if ($("#mm"+modelId).length > 0) {
            menuButton.menubutton({
                duration:300,
                menu : '#mm'+modelId,
                iconCls : iconCls
            });
        }
        
    }
    
    $("[tag=leafMenu]").click(function() {
        var mainMenu = $(this).attr("mainMenu");
        var modelId = $(this).attr("modelId");
        var iconCls = $(this).attr("iconCls");
        var modelName = $(this).text();
        $('#tt').tabs('select', "<b>"+mainMenu+"</b>");
        $("#indexCenterLayout").layout("panel","west").panel({iconCls:iconCls,title:modelName,href:G_CTX_PATH+"/sys/common/indexLeftNavi/"+modelId});
    });
    
    var personalCls ="${personalCenterModel.style}";
    var personalName ="${personalCenterModel.modelName}";
    var personalId ="${personalCenterModel.modelId}";
    function toPersonalCenter(){
        $("#indexCenterLayout").layout("panel","west").panel(
        		{iconCls:personalCls,title:personalName,href:G_CTX_PATH+"/sys/common/indexLeftNavi/"+personalId});
    }

    
</script>


<script type="text/javascript" src="${ctx}/static/js/hg/hg.online.timeout.checker.js?jsTimer=${jsTimer}"></script>
<script>
var onlineTimeoutNumber = parseInt("${h:getProfile('userOnlineTimeout')}");
if (!isNaN(onlineTimeoutNumber) && onlineTimeoutNumber > 0){
    onlineTimeoutChecker.init(onlineTimeoutNumber);
    onlineTimeoutChecker.callback = function(){
    	HgUi.alert('长时间未操作，您的会话已结束！',function ()
        {
            window.location.reload();
        });
    }
    onlineTimeoutChecker.intervalID = window.setInterval(onlineTimeoutChecker.intervalFunction, 10*1000);
}
</script>
 
</html>