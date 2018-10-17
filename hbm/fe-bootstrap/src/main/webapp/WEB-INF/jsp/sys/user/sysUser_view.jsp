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
	<div class="easyui-layout" fit=true id="sysUser_layout">
		<div data-options="region:'center',border:false"
			style="padding: 0px;">
			<table singleSelect=true fit=true id="sysUser_grid" fitColumns=true
				toolbar="#sysUser_toolbar" pagination="true"
				pageSize="${defaultPageSize}" pageList="${defaultPageList}"
				data-options="url:'${ctx}/sys/sysUser/list'">
				<thead>
					<tr>
						<th data-options="field:'staffInfo.staffCode',width:60">员工号</th>
						<th data-options="field:'userName',width:80">用户名</th>
						<th data-options="field:'userAccount.loginName',width:80">登录名</th>
						<th
							data-options="field:'gender',width:40,
						formatter:function(value){return HgUtil.getDictItemName('maleOrFemale',value);}"
							align="center">性别</th>
						<th data-options="field:'mobile',width:100">手机号</th>
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
							align="center">入职时间</th>

					</tr>
				</thead>
			</table>
			<div id="sysUser_toolbar" tag=listen_hotkey>
				<div class="hgGridSearchBar"
					style="height: 64px; width: 100%; display: none;" tag="queryDiv">
					<form id="sysUserSearchForm">
						<table width="100%">
							<tr>
								<td align="right"><span>用户名：</span></td>
								<td><input name="userName" class="easyui-textbox" style="width: 120px;" /></td>
								<td align="right"><span>登录名：</span></td>
								<td><input name="loginName" class="easyui-textbox" style="width: 120px;" /></td>
								<td align="right"><span>主岗位：</span></td>
								<td><input name="positionName" class="easyui-textbox" style="width: 120px;" /></td>
								<td align="right"><span>邮箱：</span></td>
								<td><input name="email" class="easyui-textbox" style="width: 120px;" /></td>
								<td align="right"><span>部门：</span></td>
								<td><input name="orgName" class="easyui-textbox" style="width: 120px;" /></td>
								<td rowspan="2" style="text-align: right; padding-right: 15px;">
									<a href="javascript:void(0);" class="btn btn-azure btn-sm" tag="submit"> 
										<i class="fa fa-search"></i>搜索
									</a>
									<a href="javascript:void(0);" class="btn btn-yellow btn-sm" tag="clear"> 
										<i class="fa fa-eraser"></i>清空
									</a>
								</td>
							</tr>
							<tr>
								<td align="right"><span>员工号：</span></td>
								<td><input name="staffCode" class="easyui-textbox" style="width: 120px;"></td>
								<td align="right"><span>入职时间：</span></td>
								<td><input name="startTime" type="text" 
									style="width: 120px;" class="Wdate" id="sysUser_entryStartTime"
									value=""
									onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'sysUser_entryEndTime\',{d:0})||\'%y-%M-%d\'}'})">
								</td>
								<td align="center"><span>---</span></td>
								<td><input name="endTime" type="text" style="width: 120px;"
									class="Wdate" id="sysUser_entryEndTime" value=""
									onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'sysUser_entryStartTime\',{d:0});}',maxDate:'%y-%M-%d'})">
								</td>
								<td align="right"><span>员工状态：</span></td>
								<td>
                                             <select id="staffStatus" name="staffStatus" class="easyui-combobox" 
                                               panelHeight='auto' editable="false" style="width: 120px;"
                                               data-options="
                                                    prompt: '---请选择---',
                                                    data:HgUtil.getDictComboboxData('STAFF_STATUS')">
                                             </select>
								<td align="right"><span>职务：</span></td>
								<td><input name="jobName" class="easyui-textbox" style="width: 120px;"></td>
							</tr>
						</table>
					</form>
				</div>
				<table>
					<tr>
						<td>
							<h:hasAllPermissions name="<%=Auths.Sys.USER_ADD%>">
								<a href="javascript:void(0);" class="btn btn-primary" tag="add">
									<i class="fa fa-plus"></i>新建
								</a>
							</h:hasAllPermissions>
							
							<h:hasAllPermissions name="<%=Auths.Sys.USER_UPDATE%>">
								<a href="javascript:void(0);" class="btn btn-success" tag="edit"> 
									<i class="fa fa-edit"></i>修改
								</a>
							</h:hasAllPermissions>
							<h:hasAllPermissions name="<%=Auths.Sys.USER_DELETE%>">
								<a href="javascript:void(0);" class="btn btn-darkorange" tag="del"> 
									<i class="fa fa-remove"></i>删除
								</a>
							</h:hasAllPermissions>
							<h:hasAllPermissions name="<%=Auths.Sys.USER_PWD_VIEW%>">
								<a href="javascript:void(0);" class="btn btn-magenta" tag="changePwd"> 
									<i class="fa fa-key"></i>改密
								</a>
							</h:hasAllPermissions>
							<a href="javascript:void(0);" class="btn btn-azure" tag="expandQuery"> 
									<i class="fa fa-search"></i><span>展开查询</span>
							</a>
						</td>

					</tr>
				</table>
			</div>
		</div>
		<div data-options="region:'south',split:true,border:false"
			style="height: 50%">
			<div id="sysUser_tabs" class="easyui-tabs" style="height: 100%;">
				<div title="用户日志" style="padding: 0px;">
					<div id="sysUserTabLogView" class="easyui-panel"
						data-options="border:false,fit:true,href:'${ctx}/sys/sysUser/sysUserTabLogView'">
					</div>
				</div>

				<div title="用户角色" style="padding: 0px;">
					<div id="sysUserTabRoleView" class="easyui-panel"
						data-options="border:false,fit:true,href:'${ctx}/sys/sysUser/sysUserTabRoleView'">
					</div>
				</div>

				<div title="用户权限" style="padding: 0px;">
					<div id="sysUserTabAuthView" class="easyui-panel"
						data-options="border:false,fit:true,href:'${ctx}/sys/sysUser/sysUserTabAuthView'">
					</div>
				</div>

				<div title="用户负权限" style="padding: 0px;">
					<div id="sysUserTabNAuthView" class="easyui-panel"
						data-options="border:false,fit:true,href:'${ctx}/sys/sysUser/sysUserTabNAuthView'">
					</div>
				</div>

				<div title="用户岗位" style="padding: 0px;">
					<div id="sysUserTabPosView" class="easyui-panel"
						data-options="border:false,fit:true,href:'${ctx}/sys/sysUser/sysUserTabPosView'">
					</div>
				</div>

				<div title="用户小组" style="padding: 0px;">
					<div id="sysUserTabGroupView" class="easyui-panel"
						data-options="border:false,fit:true,href:'${ctx}/sys/sysUser/sysUserTabGroupView'">
					</div>
				</div>
			</div>

		</div>

	</div>
	<script type="text/javascript"
		src="${ctx}/static/js/sys/user/sysUser_view.js"></script>
</body>
</html>