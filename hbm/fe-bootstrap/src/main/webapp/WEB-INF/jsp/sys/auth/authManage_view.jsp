<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限管理</title>
</head>
<body>
	<div class="easyui-layout" fit=true id="sysAuth_layout">
		<div
			data-options="region:'center',title:'权限列表',border:false,tools:'#sysAuth_panel_toolbar'"
			style="padding: 0px;">
			<table fit=true id="sysAuth_grid" class="" singleSelect=true
				toolbar="#sysAuth_toolbar" showFooter=true fitColumns=true
				data-options="idField: 'authId',      
                              onDblClickRow:sysAuth.sysAuthOnDblClickRow,  
                              onClickRow:sysAuthOnClickRow,  
                              treeField:'authName', 
                              onContextMenu: treeContextMenu,
                              onLoadSuccess:sysAuth.authGridOnLoadSuccess">
				<thead>
					<tr>
						<th data-options="field:'authName',width:150">名称</th>
						<th
							data-options="field:'authShowType',width:25,formatter:sysAuth.authShowTypeFormatter"
							align="center">类型</th>
						<th data-options="field:'authCode',width:100">编码</th>
						<th data-options="field:'engName',width:100">英文名称</th>
						<!--  <th data-options="field:'i18nCode',width:40">国际化编码</th> -->
						<!-- <th data-options="field:'style',width:50">图标</th> -->
						<th data-options="field:'uri',width:120">URI</th>
						<!-- <th data-options="field:'tip',width:60">提示信息</th> -->
						<th data-options="field:'descr',width:120">描述</th>
					</tr>
				</thead>
			</table>
			<div id="sysAuth_toolbar" tag=listen_hotkey>
				<div class="hgGridSearchBar"
					style="height: 35px; width: 100%; display: none;" tag="queryDiv">
					<form id="sysAuthSearchForm" class="hgform">
						<table class="hgtable" width="100%">
							<tr>
								<td align="right"><span>名称：</span></td>
								<td><input style="width: 120px" name="authName"></td>
								<td align="right"><span>类型：</span></td>
								<td><select id="searchAuthType" name="authShowType"
									class="easyui-combobox" panelHeight='auto' editable="false"
									style="width: 103px;"
									data-options="
								        textField: 'value',valueField: 'label', 
                                                prompt: '---请选择---',
								        data: [{label: '1',value: '模块'},{label: '2',value: '权限'}]">
								</select></td>
								<td align="right"><span>编码：</span></td>
								<td><input style="width: 130px" name="authCodeLike"></td>
								<td align="right"><span>英文名称：</span></td>
								<td><input style="width: 130px" name="engName"></td>
								<td align="right"><span>URI：</span></td>
								<td><input style="width: 130px" name="uriLike"></td>
								<td style="text-align: right; padding-right: 15px"><a
									href="javascript:void(0);" class="btn btn-azure btn-sm"
									tag="submit"> <i class="fa fa-search">搜索</i>
								</a> <a href="javascript:void(0);" class="btn btn-yellow btn-sm"
									tag="clear"> <i class="fa fa-eraser"></i>清空
								</a></td>
							</tr>
						</table>
					</form>
				</div>
				<table>
					<tr>
						<td>
							<h:hasAnyPermissions name='<%= Auths.Sys.MODEL_ADD + ","+ Auths.Sys.AUTH_ADD %>'>
							<div class="btn-group">
								<a class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-plus"></i> 添加 <i class="fa fa-angle-down"></i>
                                </a>
								<ul class="dropdown-menu dropdown-primary"  id="auth_toolbar_menu">
									<h:hasAnyPermissions name="<%= Auths.Sys.MODEL_ADD %>">
									<li><a href="javascript:void(0);"  tag="modelAdd"><i class="fa fa-star"></i>&nbsp;模块</a></li>
									</h:hasAnyPermissions>
									<h:hasAnyPermissions name="<%= Auths.Sys.AUTH_ADD %>">
									<li><a href="javascript:void(0);" tag="authAdd"><i class="fa fa-tag"></i>&nbsp;权限</a></li>
									</h:hasAnyPermissions>
								</ul>
							</div>
							</h:hasAnyPermissions>
							<h:hasAnyPermissions name='<%= Auths.Sys.MODEL_UPDATE +","+ Auths.Sys.AUTH_UPDATE %>'>
								<a href="javascript:void(0)" class="btn btn-success" tag="edit"><i
									class="fa fa-edit"></i>修改</a>
							</h:hasAnyPermissions>
							<h:hasAnyPermissions name='<%= Auths.Sys.MODEL_DELETE +","+ Auths.Sys.AUTH_DELETE %>'>
								<a href="javascript:void(0)" class="btn btn-darkorange"
									tag="del"> <i class="fa fa-remove"></i>删除
								</a>
							</h:hasAnyPermissions>
							<shiro:hasPermission name="<%=Auths.Sys.OPERATION_VIEW%>">
								<a href="javascript:void(0)" class="btn btn-purple" tag="oper">
									<i class="fa fa-cog"></i>操作类型配置
								</a>
							</shiro:hasPermission> <shiro:hasPermission name="<%=Auths.Sys.MENUSET_VIEW%>">
								<a href="javascript:void(0)" class="btn btn-yellow"
									tag="menuset"> <i class="fa fa-wrench"></i>首页MENU配置
								</a>
							</shiro:hasPermission> <a href="javascript:void(0)" class="btn btn-azure"
							tag="expandQuery"> <i class="fa fa-search"></i><span>展开查询</span>
						</a>



						</td>



						<td><div class="datagrid-btn-separator"></div></td>
						<td align="right">名称：</td>
						<td width="150px;"><input id="authName"
							class="easyui-textbox"></td>
						<td width="65px"><a href="javascript:void(0)"
							class="btn-palegreen  btn-sm" onclick="sysAuth.searchStr();"><i
								class="fa fa-search"></i>定位 </a></td>
						<td id="treeGridShowNext"><a href="javascript:void(0)"
							class="btn-yellow  btn-sm" onclick="sysAuth.showNext();"><i
								class="fa fa-angle-down"></i>下一个</a></td>
					</tr>
				</table>
				<!-- <div id="auth_toolbar_menu" style="width: 100px;">
					<div iconCls="icon_auto_user_man_24px" tag="modelAdd">模块</div>
					<div iconCls="icon_auto_user_center" tag="authAdd">权限</div>
				</div> -->
				<div id="authTreeContextMenu" class="easyui-menu"
					style="width: 100px;">
					<div data-options="iconCls:'fa fa-check-circle-o'" tag="toRole">授予角色</div>
					<div data-options="iconCls:'fa fa-user'" tag="toUser">授予用户</div>
					<div data-options="iconCls:'fa fa-user-times'" tag="unUser">负授予用户</div>
					<div data-options="iconCls:'fa fa-file-text-o'" tag="aboutAuth">关于本条记录</div>
				</div>
				<div id="modelTreeContextMenu" class="easyui-menu"
					style="width: 100px;">
					<div data-options="iconCls:'fa fa-star'" tag="addModel">模块新增</div>
					<div data-options="iconCls:'fa fa-tag'" tag="addAuth">权限新增</div>
					<div data-options="iconCls:'fa fa-file-text-o'" tag="aboutModel">关于本条记录</div>
				</div>
			</div>
			<div id="sysAuth_panel_toolbar">
				<select class="" id="sysAuth_authCategroy" editable="false"
					style="width: 90px; height: 16px;"
					data-options="panelHeight:'auto',onChange:sysAuth.authCategoryOnChange">
					<option value="1">主权限</option>
					<option value="2">附属权限</option>
				</select>
			</div>
		</div>
		<div
			data-options="region:'south',split:true,border:false,
            href:'${ctx}/sys/sysAuthMenu/authManage_view_tabs'"
			style="height: 50%"></div>

	</div>
	<script type="text/javascript"
		src="${ctx}/static/js/sys/auth/authManage_view.js?jsTimer=${jsTimer}"></script>
</body>
</html>