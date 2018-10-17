<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<table singleSelect=true fit=true id="sysRoleAuth_grid" fitColumns=true
	toolbar="#sysRoleAuth_toolbar" pagination="false"
	class="easyui-treegrid"
	data-options="idField:'authId',treeField:'authName'">
	<thead>
		<tr>
			<th data-options="field:'authId',width:160,hidden:true">主键</th>
			<th data-options="field:'authName',width:120">名称</th>
			<th data-options="field:'authShowType',formatter:function(val){if(val == 2) {return '权限';}else if(val == 1){return '模块';}}"
				width="30px" align="center">类型</th>
			<!-- <th data-options="field:'authShowType',formatter:function(value){return HgUtil.getDictItemName('trueOrFalse',value);}">类型</th> -->
		</tr>
	</thead>
</table>
<div id="sysRoleAuth_toolbar" tag=listen_hotkey>
	<table style="width: 100%">
		<tr>
			<td align="right" width="10%">名称：</td>
			<td width="130px">
			    <input id="authName" >
			</td>
			<td>
			    <a href="javascript:void(0)" class="easyui-linkbutton"
                       iconCls="icon-search" onclick="sysRoleAuthGrid.searchStr();">定位</a>
                   <label id="sysRoleAuthGridShowNext">
    			        <a href="javascript:void(0)" class="easyui-linkbutton"
                           iconCls="icon_auto_colorful__down" onclick="sysRoleAuthGrid.showNext();">下一个</a>
                   </label>    
			</td>
			<td></td>
			<shiro:hasPermission name="<%=Auths.Sys.ROLE_AUTH_MANAGE%>">
				<td align="right" width="60px;">
				    <a href="javascript:void(0)" class="easyui-linkbutton"
					   iconCls="icon_auto_colorful__Administration" tag="manage">管理</a>
			     </td>
			</shiro:hasPermission>
		</tr>
	</table>
</div>

<script type="text/javascript"
	src="${ctx}/static/js/sys/role/sysRoleAuth_view.js?jsTimer=${jsTimer}"></script>