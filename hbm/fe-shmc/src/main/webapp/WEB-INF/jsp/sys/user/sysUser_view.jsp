<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SysUser</title>
</head>
<body>
	<div class="block_layout block_form">
		<div class="block_title">
			<h3>组合查询</h3>
			<em><a onclick="javascript:HgUi.hideShowSearch(this);" class="slide_up"></a></em>
		</div>
		<div class="block_content">
			<form id="sysUserSearchForm" class="hgform">
			<table cellpadding="0" cellspacing="0" class="table_form">
				<!--普通表单填写表格使用table_form-->
				<colgroup>
					<col style="width: 120px;" />
					<col style="width: 240px;" />
					<col style="width: 120px;" />
					<col />
				</colgroup>
				<!--表单表格宽度控制使用colgroup，每个col对应下方的一个td，或者th，上下是对齐的-->
				<thead></thead>
				<!--表头-->
				<tfoot>
					<!--表尾，主要放表单按钮-->
					<tr>
						<td></td>
						<td colspan="3">
							<a href="javascript:void(0);" class="a_blue" tag="submit"><em>查询</em></a>
							<a href="javascript:void(0);" class="a_green" tag="clear"><em>重置</em></a>
						</td>
					</tr>

				</tfoot>
				<tbody>
					<!--表内容，th是蓝色字体，主要放字段名，td为字段内容-->
					<tr>
						<th>用户名：</th>
						<td><input name="userName" style="width: 120px;" /></td>
						<td align="right"><span>登录名：</span></td>
						<td><input name="loginName" style="width: 120px;" /></td>
					</tr>
					<tr>
						<th>主岗位：</th>
						<td><input name="positionName" style="width: 120px;" /></td>
						<th>职务:</th>
						<td><input name="jobName" style="width: 120px;"></td>
						
					</tr>
					<tr>
						<th>部门:</th>
						<td><input name="orgName" style="width: 120px;" /></td>
						<th>员工号:</th>
						<td><input name="staffCode" style="width: 120px;"></td>
					</tr>
					<tr>
						<th>员工状态:</th>
						<td><input name="staffStatus" id="staffStatus" style="width: 126px;">
						</td>
						<th><span>入职日期:</th>
						<td><input name="startTime" type="text"
							style="width: 120px;" class="Wdate" id="sysUser_entryStartTime"
							onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'sysUser_entryEndTime\',{d:0})||\'%y-%M-%d\'}'})">
							---
							<input name="endTime" type="text" style="width: 120px;"
							 class="Wdate" id="sysUser_entryEndTime" 
							onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'sysUser_entryStartTime\',{d:0});}',maxDate:'%y-%M-%d' })">
						</td>
						
					</tr>
					<tr>
						<th>邮箱:</td>
						<td colspan="3"><input name="email" style="width: 627px;" /></td>
					</tr>
					
				</tbody>


			</table>
			</form>
		</div>
	</div>









	<div class="easyui-layout" id="sysUser_layout" style="height: 800px;width:100%;">
		<div data-options="region:'north',border:false"
			style="padding: 0px;height: 410px">
			<table singleSelect=true id="sysUser_grid" fitColumns=true striped=true
				toolbar="#sysUser_toolbar" pagination="true"
				pageSize="${defaultPageSize}" pageList="${defaultPageList}"
				data-options="url:'${ctx}/sys/sysUser/list',title:'用户列表',height:400,width:'100%'">
				<thead>
					<tr>
						<th data-options="field:'staffInfo.staffCode',width:60">员工号</th>
						<th data-options="field:'userName',width:80">用户名</th>
						<th data-options="field:'userAccount.loginName',width:80">登录名</th>
						<th
							data-options="field:'gender',width:40,
						formatter:function(value){return HgUtil.getDictItemName('maleOrFemale',value);}"
							align="center">性别</th>
						<th data-options="field:'mobile',width:100">手机号码</th>
						<th data-options="field:'email',width:180">邮箱</th>
						<th
							data-options="field:'userPosition.sysOrganization.orgName',width:100">部门</th>
						<th data-options="field:'userPosition.positionName',width:80">主岗位</th>
						<th data-options="field:'userPosition.sysJob.jobName',width:80">职务</th>
						<th
							data-options="field:'staffInfo.staffStatus',width:50,
						formatter:function(value){return HgUtil.getDictItemName('STAFF_STATUS',value);}"
							align="center">员工状态</th>
						<th
							data-options="field:'staffInfo.entryTime',width:100,
						   formatter:HgUtil.formatToDate"
							align="center">入职日期</th>

					</tr>
				</thead>
			</table>
			<div id="sysUser_toolbar" tag=listen_hotkey>
				<table class="table_form_result">
					<caption>
						<h:hasAllPermissions name="<%=Auths.Sys.USER_ADD%>">
							<a href="javascript:void(0);" class="a_btn_blue" tag="add"><em>新增</em></a>
						</h:hasAllPermissions>
						<h:hasAllPermissions name="<%=Auths.Sys.USER_UPDATE%>">
							<a href="javascript:void(0);"  class="a_btn_green" tag="edit"><em>编辑</em></a>
						</h:hasAllPermissions>
						<h:hasAllPermissions name="<%=Auths.Sys.USER_DELETE%>">
							<a href="javascript:void(0);"  class="a_btn_red" tag="del"><em>删除</em></a>
						</h:hasAllPermissions>
						<h:hasAllPermissions name="<%=Auths.Sys.USER_PWD_VIEW%>">
							<a href="javascript:void(0);" class="a_btn_orange" tag="changePwd"><em>改密</em></a>
						</h:hasAllPermissions>
					
					</caption>
					
					
					
				</table>
			</div>
		</div>
		<div data-options="region:'center',split:false,border:true,title:'用户配置信息'" >
			<div id="sysUser_tabs" class="easyui-tabs" style="height: 100%;">
				<div title="用户日志" style="padding-bottom: 10px;">
					
				</div>

				<div title="用户角色" style="padding-bottom: 10px;">
					
				</div>

				<div title="用户权限" style="padding-bottom: 10px;">
					
				</div>

				<div title="用户负权限" style="padding-bottom: 10px;">
					
				</div>

				<div title="用户岗位" style="padding-bottom: 10px;">
					
				</div>

				<div title="用户小组" style="padding-bottom: 10px;">
					
				</div>
			</div>

		</div>

	</div>
	<script type="text/javascript"
		src="${ctx}/static/js/sys/user/sysUser_view.js?jsTimer=${jsTimer}"></script>
</body>
</html>