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
	<table class="table_form_result">
		<caption>
			名称：
			    <input id="authName" >
                       <a href="javascript:void(0)" class="a_btn_green" onclick="sysRoleAuthGrid.searchStr();"><em>定位</em></a>
			<div id="sysRoleAuthGridShowNext" style="display:none;display:inline-block">
                       <a href="javascript:void(0)" class="a_btn_orange" onclick="sysRoleAuthGrid.showNext();"><em>下一个</em></a>
                     </div>
			<shiro:hasPermission name="<%=Auths.Sys.ROLE_AUTH_MANAGE%>">
				<div style="float:right;" >
					   <a href="javascript:void(0)" class="a_btn_orange" tag="manage"><em>管理</em></a>
			     </div>
			</shiro:hasPermission>
		</caption>
	</table>
</div>

<script type="text/javascript"
	src="${ctx}/static/js/sys/role/sysRoleAuth_view.js?jsTimer=${jsTimer}"></script>