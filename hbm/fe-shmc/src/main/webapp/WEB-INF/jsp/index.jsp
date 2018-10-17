<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${h:getSysProperty('sysName')}</title>
<c:set var="curThemeColor" value="bootstrap" />
<script>
var G_THEME_COLOR = "${curThemeColor}";
</script>
<link id="easyuiTheme" rel="stylesheet" type="text/css"
    href="${ctx}/plugins/jquery-easyui/themes/${curThemeColor}/easyui.css" />
<link rel="stylesheet" type="text/css"
    href="${ctx}/plugins/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css"
    href="${ctx}/plugins/jquery-easyui/themes/color.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/sys/common/sysIcon/iconDynamicCss" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/icon.css" />
<link href="${ctx}/static/custom/css/font-awesome.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/global.css" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/main.css" />
<link rel="stylesheet" type="text/css"
    href="${ctx}/static/css/page/index.css" />
<link rel="stylesheet" type="text/css"
    href="${ctx}/static/custom/css/public.css" />
<link rel="stylesheet" type="text/css"
    href="${ctx}/static/custom/css/layout.css" />
<link rel="stylesheet" type="text/css"
    href="${ctx}/static/custom/css/head.css" />
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
    src="${ctx}/plugins/jquery-easyui/extension/datagrid-filter.js"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-easyui/extension/datagrid-detailview.js"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-easyui/extension/datagrid-groupview.js"></script>
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


<!-- validate -->
<script type="text/javascript"
    src="${ctx}/plugins/jquery-validator/jquery.validate.js"></script>
    <script type="text/javascript"
    src="${ctx}/plugins/jquery-validator/additional-methods.js"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-validator/localization/messages_zh.js"></script>
</head>
<body class="body_full">
    <div  id="indexTop_new" >
        <div class="head_top">
            <div class="system_name">${h:getSysProperty('sysName')}
             -${h:getSysProperty('sysVersion')}
            </div>
            <div class="head_right">
                             欢迎您：  ${curUser.userName}  | <a href="javascript:void(0);"  title="我的待办">我的待办<strong>(3)</strong></a>
                              |<!-- <a href="javascript:void(0)" rel="font14" title="字体大">大</a>  <a href="javascript:void(0)"  rel="font12" class="font_now"   title="字体小">小</a> | -->
                              <a href="javascript:void(0);" class="help" title="帮助">帮助</a> |
                              <a href="logout"  title="退出">退出</a>  
                          <div class="message_show">3条新的待办，
                              <a href="javascript:void(0);">查看待办</a><a href="javascript:void(0)" class="close_gif"></a>
                        </div>
            </div>
         </div>
            
         <div class="nav">
            <ul>
                <c:forEach var="menu" items="${topMenuList}">
                    <li  modelId="${menu.modelId}" class="<c:if test="${deaultLeftModelFid == menu.modelId}">tcurrent</c:if>">
                        <a href="javascript:void(0);"><i class="${menu.bsStyle}"></i>&nbsp;${menu.modelName}</a>
                    </li>
                </c:forEach>
               
            </ul>
        </div>
         
            <div id="tt" class="" fit=true pill=true plain=true
                 tabWidth="120">
                 <c:forEach var="menu" items="${topMenuList}">
                     <div title="<b>${menu.modelName}</b>" style="padding: 0px">
                         <div style="display: none;" tag="modelId">${menu.modelId}</div>
                         <div style="display: none;" tag="icon">${menu.icon}</div>
                     </div>
                 </c:forEach>
             </div>
             
    </div>

    <div class="content">
    <!--左侧-->
        <div class="left_col">
       <!--左侧菜单-->
            <div class="menu_left">
                <div class="menu_title" id="indexLeftNaviTitle"><span>${deaultLeftModel.modelName}</span></div>
                <ul class="ul_menu">
                    <div id="indexLeftNaviUl" class="easyui-panel" data-options="border:false" href="${ctx}/sys/common/indexLeftNavi/${deaultLeftModel.modelId}">         
                    </div>
                </ul>
            </div>
       <!--左侧菜单结束-->
        </div>
        
        <c:set var="sysLoginVerifCode" value="${h:getSysProperty('sysContainerStyle')}" />
        
    <!--右侧-->
        <div class="main">
            <c:if test="${sysLoginVerifCode == 'single'}">
                <script>
                var GLO_IS_SINGEL_CONTAINER = true;
                </script>
	            <div class="position">首页 </div>
	        </c:if>
            <div id="tab" class="easyui-tabs" style="width:100%;background-color:transparent" data-options="border:false,tabHeight:30<c:if test="${sysLoginVerifCode == 'single'}">,showHeader:false</c:if>">
                    <div title="首页" data-options="" href="${ctx}/sys/common/indexHome"></div>
            </div>
        </div>
     </div>
        

    <div class="foot">
    <div class="f_m">
        <div class="foot_word"><span>中国移动集团上海分公司</span><br />
        <span>ChinaMobile Shanghai Co.,Ltd</span> </div>
    </div>
    </div>
    
    
    
    <div id="rowContextMenu" class="easyui-menu" style="width:200px;">
    </div>

</body>
<script type="text/javascript">
    //------------------------------------------------ui js-------------------------------------------------
    
    $('#indexTop_new .nav ul li').click(function(){
        $(this).addClass('tcurrent').siblings().removeClass('tcurrent');
        var modelId = $(this).attr("modelId");
        $("#indexLeftNaviTitle span").text($(this).text());
        $("#indexLeftNaviUl").panel({href:G_CTX_PATH+"/sys/common/indexLeftNavi/"+modelId});
    });
    
    $("#indexMenuTable").datagrid({onClickRow:function(index,row){
        var tab = new HgUi.Tab();
        tab.commonAdd(row.modelName,row.uri,null,row.icon);
    }});
    
    
    $("#indexLeftNaviUl").on('click',"li>a", function() {
        $(this).siblings('.ul_sub_menu').slideToggle(200);
        var uri = $(this).attr("hguri");
        $("#indexLeftNaviUl li>a").removeClass("now");
        var pathNames = [];
        $(this).parentsUntil("#indexLeftNaviUl").each(function(i){
            $(this).children("a").addClass("now");
            $(this).children("a").length>0 && pathNames.push($(this).children("a").text());
        })
        if (uri){
        	var tab = new HgUi.Tab();
        	if (typeof GLO_IS_SINGEL_CONTAINER !== 'undefined' && GLO_IS_SINGEL_CONTAINER){
        		$(".main>.position").text(pathNames.reverse().join(" > "));
                tab.closeCurrent()
        	}
            tab.commonAdd($(this).text(),uri,null,null);
        }
    })
    
    
    var tab = new HgUi.Tab();
    $("#tab-tools [tag=remove]").click(function(){
        tab.closeCurrent(true);
    });
    $("#tab-tools [tag=removeAll]").click(function(){
        tab.closeAll(true);
    });
    $("#tab-tools [tag=refresh]").click(function(){
        tab.refreshCurrent();
    });

    $(".close_gif").click(function () {
        $(".message_show").addClass("hide");
    });
    
    $("boyd").resize(function(){
    	
    })
    
    $(".help").click(function () {
    	 $.messager.alert('提示','<br>&nbsp;暂无帮助文档！');
    });
    
</script>


<script type="text/javascript" src="${ctx}/static/js/hg/hg.online.timeout.checker.js?jsTimer=${jsTimer}"></script>
<script>
var onlineTimeoutNumber = parseInt("${h:getProfile('userOnlineTimeout')}");
if (!isNaN(onlineTimeoutNumber) && onlineTimeoutNumber > 0){
    onlineTimeoutChecker.init(onlineTimeoutNumber);
    onlineTimeoutChecker.callback = function(){
        $.messager.alert('警告','长时间未操作，您的会话已结束！','warning',function ()
        {
            window.location.reload();
        });
    }
    onlineTimeoutChecker.intervalID = window.setInterval(onlineTimeoutChecker.intervalFunction, 10*1000);
}
</script>
 
</html>