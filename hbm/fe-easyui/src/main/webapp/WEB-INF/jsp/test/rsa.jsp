<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${ctx}/static/js/jquery-1.11.3.js" ></script>
<script type="text/javascript" src="${ctx}/static/js/security/rsaSecurity.js"></script>
</head>
<body>
<input type="text" name="password" value="" />
<button id="submit">加密请求</button>
<script type="text/javascript">
 $("#submit").click(function(){
	 var modulus = "${modulus}";
	 var exponent = "${exponent}";
	 var key = RSAUtils.getKeyPair(exponent, '', modulus);
	 
	 var password = $("input[name='password']").val();
	 console.log(password);
	 password = RSAUtils.encryptedString(key, password);
	 console.log("encrypt:"+password);
	 $.post("submit",{"password":password},function(data){
		 console.log(data);
	 });
 })
</script>
</body>
</html>