<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="easyui-layout" data-options="fit:true" id="chooseIconView_layout">
        <div region="center" data-options="split:true" >
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCss="" data-options="plain:true,iconCls:'',size:'large',toggle:true">&nbsp;清空&nbsp;</a>
            <c:forEach var="sysIcon" items="${sysIconList}">
            	<a href="javascript:void(0)" class="easyui-linkbutton" iconCss="${sysIcon.iconCss}" data-options="plain:true,iconCls:'${sysIcon.iconCss}',size:'large',toggle:true"> </a>
            </c:forEach>
        </div>
    </div>
    <script type="text/javascript">
    $("#chooseIconView_layout a").click(function(){
    	var icon = {
    		iconCss:$(this).attr("iconCss")
    	};
    	$("#chooseIconView_layout").parent().window("close");
        window.sysIconsWinListCallback(icon);
    })
    </script>
</body>
</html>