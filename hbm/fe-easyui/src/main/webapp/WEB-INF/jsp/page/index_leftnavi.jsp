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
	<table fit=true id="indexMenuTable" data-options="autoRowHeight:true"
		showHeader=false border=false  singleSelect=true style="width: 230px;">
		<thead>
			<tr>
				<th data-options="field:'uri',width:'100px',hidden:true">uri</th>
				<th data-options="field:'modelName',width:'100px',hidden:true">modelName</th>
				<th data-options="field:'icon',width:'100px',hidden:true">icon</th>
				<th data-options="field:'name',width:'500px'">name</th>
			</tr>
		</thead>
		<c:forEach var="model" items="${modelList}">
			<tr>
				<td>${model.uri}</td>
				<td>${model.modelName}</td>
				<td>${model.icon}</td>
				<td>
					<span style="display: block; padding-left: 5px;"> 
						<a href="#" class="easyui-linkbutton" hidefocus="true" style="outline:none;outline-style:none; -moz-outline-style: none;"
						data-options="plain:true,iconCls:'${model.icon}'">&nbsp;&nbsp;&nbsp;${model.modelName}</a>
				</span></td>
			</tr>
		</c:forEach>
		


	</table>
	<script type="text/javascript">
		$("#indexMenuTable").datagrid({onClickRow:function(index,row){
			var tab = new HgUi.Tab();
			tab.commonAdd(row.modelName,row.uri,null,row.icon);
		}});
	</script>
</body>

</html>