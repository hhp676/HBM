<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="easyui-layout" fit=true id="indexCenterLayout">
		<div region="west" style="width: 230px;" split=true  iconCls="${iconCls}" title="${title}" href="${ctx}/sys/common/indexLeftNavi/${modelID}">			
		</div>
		<div region="center">
			<div id="tab" class="easyui-tabs" fit=true  data-options="tools:'#tab-tools'">
				<div title="首页" data-options="iconCls:'icon_auto_blue__home'" href="${ctx}/sys/common/indexHome"></div>
			</div>
		</div>
	</div>

	 <div id="tab-tools">	 	
        <a href="javascript:void(0)" class="easyui-linkbutton easyui-tooltip" title="关闭页面" tag="remove" data-options="plain:true,iconCls:'icon_auto_colorful__close'"></a>
        <a href="javascript:void(0)" class="easyui-linkbutton easyui-tooltip" title="关闭全部" tag="removeAll" data-options="plain:true,iconCls:'icon_auto_colorful__close_all'"></a>
        <a href="javascript:void(0)" class="easyui-linkbutton" tag="refresh" title="刷新页面" data-options="plain:true,iconCls:'icon_blue_refresh'"></a>
        <a href="javascript:void(0)" class="easyui-linkbutton" tag="fullscreen" title="全屏切换" data-options="plain:true,iconCls:'icon_auto_blue__all'"></a>
    </div>
    
    
    <script type="text/javascript">
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
    	
    	$("#tab-tools [tag=fullscreen]").click(function(){
    		 if (HgUtil.fullScreen.supports) {
                 if (HgUtil.isFullScreen()) {
                	 HgUtil.cancelFullScreen();
                 } else {
                	 HgUtil.requestFullScreen();
                 }
             } else {
            	 HgUi.alert("当前浏览器不支持全屏 API，请更换至最新的 Chrome/Firefox/Safari 浏览器或通过 F11 快捷键进行操作。");
             }
    	});
    	
    	
    </script>
</body>

</html>