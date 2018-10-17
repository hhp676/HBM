<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>druid页面</title>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
</head>
<body>

<iframe src="${ctx}/druid/" width="100%" crolling="no" frameborder="0" id="druid_iframe"  onload="changeFrameHeight()">
</iframe>

<script>
function changeFrameHeight(){
    var ifm= document.getElementById("druid_iframe"); 
    if (ifm){
    	ifm.height=document.documentElement.clientHeight-130;
    }
}
window.onresize=function(){  
     changeFrameHeight();  
} 
</script>
</body>

</html>
