<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个性化配置</title>
</head>
<body>
	<div class="easyui-layout" fit=true>
		<div data-options="region:'center',title:'个性化设置',border:false"
			style="padding: 0px;">
			<table singleSelect=true fit=true id="sysUserProfile_grid" fitColumns=true toolbar="#sysUserProfile_toolbar"
				data-options="url:'${ctx}/sys/sysPersonal/personalSetting/list',
				    onBeforeEdit:sysUserProfileOnBeforeEdit">
				<thead>
					<tr>
						<th data-options="field:'profileType',width:150">个性化名称</th>
						<th data-options="field:'profileValue',width:80">设置值</th>
						<th data-options="field:'defaultValue',width:80">默认值</th>
						<th data-options="field:'descr',width:220">描述</th>
					</tr>
				</thead>
			</table>
			<div id="sysUserProfile_toolbar">
				<table>
					<tr>
						<td>
							<a href="javascript:void(0)" class="btn btn-success" tag="save">
								<i class="fa fa-save"></i>保存</a>
							<a href="javascript:void(0)" class="btn btn-magenta" tag="revert">
								<i class="fa fa-level-up"></i>恢复默认设置</a>
							 <a href="javascript:void(0)" class="btn btn-azure" tag="undo">
							 	<i class="fa fa-mail-reply"></i>撤销</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="${ctx}/static/js/sys/profile/sysUserProfile_view.js?jsTimer=${jsTimer}"></script>
</body>
</html>