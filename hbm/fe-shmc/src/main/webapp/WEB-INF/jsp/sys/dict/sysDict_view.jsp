<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
            <table singleSelect=true  id="datagroup_grid" 
                fitColumns=true toolbar="#datagroup_toolbar" pagination="true"
                pageSize="${defaultPageSize}" pageList="${defaultPageList}"
                data-options="url:'${ctx}/sys/sysDict/groupList',title:'系统字典组',widht:'100%',scrollbarSize:0">
                <thead>
                    <tr>
                        <th data-options="field:'dictGroupCode',width:100" sortable="true" editor="{type:'textbox',options:{required:true,missingMessage:'此输入项为必填项',validType:'length[1,60]'}}">字典组编码</th>
                        <th data-options="field:'groupName',width:150" sortable="true" editor="{type:'textbox',options:{required:true,missingMessage:'此输入项为必填项',validType:'length[1,100]'}}">字典组名称</th>
                        <th data-options="field:'descr',width:200" editor="{type:'textbox',options:{validType:'length[1,200]'}}">描述</th>
                    </tr>
                </thead>
            </table>
            <div id="datagroup_toolbar" tag=listen_hotkey>
                <table class="table_form_result">
                    <caption>
                        <shiro:hasPermission name="<%= Auths.Sys.DICT_GROUP_ADD %>">
	                        <a href="javascript:void(0)" class="a_btn_blue" tag="add"><em>新建</em></a>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="<%= Auths.Sys.DICT_GROUP_UPDATE %>">
			                <div style="display: none"><a href="javascript:void(0)" tag="update"><em>修改</em></a></div>
		            	</shiro:hasPermission>
		            	<h:hasAnyPermissions name='<%= Auths.Sys.DICT_GROUP_ADD + "," + Auths.Sys.DICT_GROUP_UPDATE %>'>
	                        <a href="javascript:void(0)" class="a_btn_green" tag="save"><em>保存</em></a>
		            	</h:hasAnyPermissions>
                        <shiro:hasPermission name="<%= Auths.Sys.DICT_GROUP_DELETE %>">
	                        <a href="javascript:void(0)" class="a_btn_red" tag="del"><em>删除</em></a>
                        </shiro:hasPermission>
                            <a href="javascript:void(0)" class="a_btn_orange" tag="undo"><em>撤销</em></a>
                            <a class="a_btn_gray" tag="clear"><em>清空查询</em></a>
                    </caption>
                </table>
            </div>
            <div class="easyui-panel" title="系统字典项" data-options="collapsible:true" href="${ctx}/sys/sysDict/item/view">
	<script type="text/javascript" src="${ctx}/static/js/sys/dict/sysDict_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>