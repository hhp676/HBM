<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.1.12.4.js"></script>
</head>
<body>
jsp页面：<%=session.getId() %><%session.setAttribute("aa", "bbb"); %>
session value：<%=session.getAttribute("aa") %> 
<a href="javaScript:testEx()">testEx</a>
<spring:message code="base.welcome"></spring:message> <spring:message code="base.copy"></spring:message>
<script type="text/javascript">

$.ajaxSetup({   
    error: function(jqXHR, textStatus, errorThrown){ 
    	//alert(jqXHR.status);
        switch (jqXHR.status){  
            case(401):  
            	window.location.href = G_CTX_PATH; 
                break;  
            case(500):  
            	console.log("error jqXHR:");
           	 	console.log(jqXHR);
            	console.log("error textStatus:");
            	console.log(textStatus);
            	console.log("error errorThrown:");
            	console.log(errorThrown)
                break;  
        }  
    },
    success: function(data){  
    	//alert("操作成功");  
    }  
}); 
function testEx(){
	$.post("${pageContext.request.contextPath}/test/testEx", { name: "John", time: "2pm" },
			   function(data){
			     console.log(data);
			   });
}
</script>
</body>
</html>