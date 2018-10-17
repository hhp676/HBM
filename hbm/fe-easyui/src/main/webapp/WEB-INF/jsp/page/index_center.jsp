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
	<div class="easyui-layout" fit=true>
		<div region="west" style="width: 230px;" split=true>
			<div class="easyui-accordion" fit=true style="width: 230px;"
				id="indexAccord">
				<div title="&nbsp;权限管理" data-options="iconCls:'icon_signals_16'">
					<table class="easyui-datagrid" fit=true
						data-options="autoRowHeight:true" showHeader=false
						singleSelect=true style="width: 230px;">
						<thead>
							<tr>
								<th data-options="field:'listprice',width:'500px'">List
									Price</th>
							</tr>
						</thead>
						<tr>
							<td><span style="display: block; padding-left: 5px;">
									<a href="#" class="easyui-linkbutton"
									data-options="plain:true,iconCls:'icon_dot'">&nbsp;&nbsp;&nbsp;用户管理</a>
							</span></td>
						</tr>
						<tr>
							<td><span style="display: block; padding-left: 5px;">
									<a href="#" class="easyui-linkbutton"
									data-options="plain:true,iconCls:'icon_dot'">&nbsp;&nbsp;&nbsp;角色管理</a>
							</span></td>
						</tr>
						<tr>
							<td><span style="display: block; padding-left: 5px;">
									<a href="#" class="easyui-linkbutton"
									data-options="plain:true,iconCls:'icon_dot'">&nbsp;&nbsp;&nbsp;功能权限</a>
							</span></td>
						</tr>
						<tr>
							<td><span style="display: block; padding-left: 5px;">
									<a href="#" class="easyui-linkbutton"
									data-options="plain:true,iconCls:'icon_dot'">&nbsp;&nbsp;&nbsp;组织架构</a>
							</span></td>
						</tr>
						<tr>
							<td><span style="display: block; padding-left: 5px;">
									<a href="#" class="easyui-linkbutton"
									data-options="plain:true,iconCls:'icon_dot'">&nbsp;&nbsp;&nbsp;数据权限</a>
							</span></td>
						</tr>
					</table>
				</div>
				<div title="&nbsp;配置运维" data-options="iconCls:'icon_settings_16'">
					<table class="easyui-datagrid" fit=true
						data-options="autoRowHeight:true" showHeader=false
						singleSelect=true style="width: 230px;">
						<thead>
							<tr>
								<th data-options="field:'listprice',width:'500px'">List
									Price</th>
							</tr>
						</thead>
						<tr>
							<td><span style="display: block; padding-left: 5px;">
									<a href="#" class="easyui-linkbutton"
									data-options="plain:true,iconCls:'icon_dot'">&nbsp;&nbsp;&nbsp;系统设置</a>
							</span></td>
						</tr>
						<tr>
							<td><span style="display: block; padding-left: 5px;">
									<a href="#" class="easyui-linkbutton"
									data-options="plain:true,iconCls:'icon_dot'">&nbsp;&nbsp;&nbsp;字典配置</a>
							</span></td>
						</tr>
						
						<tr>
							<td><span style="display: block; padding-left: 5px;">
									<a href="#" class="easyui-linkbutton"
									data-options="plain:true,iconCls:'icon_dot'">&nbsp;&nbsp;&nbsp;日志管理</a>
							</span></td>
						</tr>
						<tr>
							<td><span style="display: block; padding-left: 5px;">
									<a href="#" class="easyui-linkbutton"
									data-options="plain:true,iconCls:'icon_dot'">&nbsp;&nbsp;&nbsp;附件管理</a>
							</span></td>
						</tr>
					</table>
				</div>
				
			</div>
		</div>
		<div region="center">
			<div id="tab" class="easyui-tabs" fit=true>
				<div title="首页" data-options="iconCls:'icon_auto_blue__home'" href="${ctx}/sys/common/indexHome"></div>
			</div>
		</div>
	</div>

</body>

</html>