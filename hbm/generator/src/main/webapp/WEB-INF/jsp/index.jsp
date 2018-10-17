<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<title>HDP代码生成器</title>
<style type="text/css">
    font{color:red;font-weight:bold,size:12px;}
</style>
<script type="text/javascript">
function validate_required(field,alerttxt){
	with (field)
	  {
	  if (value==null||value=="")
	    {alert(alerttxt);return false}
	  else {return true}
	  }
}

function validate_form(thisform){
	with (thisform) {
	    if (validate_required(jdbcDriverName,"驱动名称为必填!")==false)
	    	{jdbcDriverName.focus();return false}
		if (validate_required(jdbcDriverUrl,"驱动URL为必填!")==false)
	    	{jdbcDriverUrl.focus();return false}
		if (validate_required(jdbcUserName,"用户名为必填!")==false)
    		{jdbcUserName.focus();return false}
		if (validate_required(jdbcPassword,"密码为必填!")==false)
    		{jdbcPassword.focus();return false}
		if (validate_required(jdbcSchema,"schema信息为必填!")==false)
    		{jdbcSchema.focus();return false}
		if (validate_required(packageName,"包名称为必填!")==false)
		    {packageName.focus();return false}
		if (validate_required(outPath,"输出目录为必填!")==false)
	    	{outPath.focus();return false}
		if (validate_required(author,"代码作者信息为必填!")==false)
	   		{author.focus();return false}
	  }
}
</script>
</head>
<body>
	<form action="${ctx}/chooseTable" method="post" onsubmit="return validate_form(this)">
		<div style="text-align: center;">
			<h3>HDP代码生成器</h3>
		</div>
		<div style="text-align: center;">
			<span style="color: red; ">${message}</span>
		</div>
		<table align="center">
			<tr>
				<td>驱动名称<font color="red">*</font>:</td>
				<td><input name="jdbcDriverName" value="${config.jdbcDriverName}" size="50"></td>
			</tr>
			<tr>
				<td>驱动URL<font color="red">*</font>:</td>
				<td><input name="jdbcDriverUrl" value="${config.jdbcDriverUrl}" size="80"></td>
			</tr>
			<tr>
				<td>用户名<font color="red">*</font>:</td>
				<td><input name="jdbcUserName" value="${config.jdbcUserName}" size="20"></td>
			</tr>
			<tr>
				<td>密 码<font color="red">*</font>:</td>
				<td><input name="jdbcPassword" value="${config.jdbcPassword}" type="password" size="20"></td>
			</tr>
			<tr>
				<td>schema<font color="red">*</font>:</td>
				<td><input name="jdbcSchema" value="${config.jdbcSchema}" type="text" size="20"></td>
			</tr>
			<tr>
				<td>包名称<font color="red">*</font>:</td>
				<td><input name="packageName" value="${config.packageName}" type="text" size="50"></td>
			</tr>
			<tr>
				<td>输出目录<font color="red">*</font>:</td>
				<td><input name="outPath" value="${config.outPath}" type="text" size="50"></td>
			</tr>	
			<tr>
				<td>代码作者<font color="red">*</font>:</td>
				<td><input name="author" value="${config.author}" type="text" size="50"  ></td>
			</tr>			
			<tr>
				<td colspan="2" align="center" height="40"><input type="submit" value="下一步（选表）" size="50" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
