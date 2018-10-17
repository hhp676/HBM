<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据权限校验</title>
</head>
<body>
	<div class="easyui-panel" data-options="fit:true">
		<table style="border:none">
	        <tr style="height: 35px;">
	            <td style="width:80px;text-align: right;">校验人员：</td>
	            <td style="width: 230px;">
	            	<input type="hidden" id="dauthCheck_dauthId" value="${dauthId }">
	            	<input type="text" id="dauthCheck_userId" class="easyui-textbox" editable="false" data-options="buttonText:'选择',onClickButton:dauthChooseGrid.clickUserBtn">
	            </td>
	            <td>
	            	<a href="javascript:void(0)" id="dauthCheck_checkBtn" class="easyui-linkbutton" data-options="iconCls:'icon_auto_colorful__check'" >校验</a>
	            </td>
	        </tr>
	        <tr>
	        	<td style="width:80px;text-align: right;">校验结果：</td>
	        	<td colspan="2">
	        		<input class="easyui-textbox" id="dauthCheck_result" multiline=true style="width: 410px; height: 200px;" />
	        	</td>
	        </tr>
		</table>
	</div>
    <script type="text/javascript" src="${ctx}/static/js/sys/dauth/dauthCheck_view.js?jsTimer=${jsTimer}"></script>
</body>
</html>