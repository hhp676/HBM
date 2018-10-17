<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>过滤器组配置</title>
</head>
<body>
    <table singleSelect=true fit=true id="dauthFilterGroup_grid"
        fitColumns=true toolbar="#dauthFilterGroup_toolbar" rownumbers="false" pagination="true"
        pageSize="${defaultPageSize}" pageList="${defaultPageList}">
        <thead>
            <tr>
               	<th data-options="field:'groupCode',width:150" sortable="true" editor="{type:'textbox',options:{required:true,validType:{length:[1,30]},missingMessage:'此输入项为必填项'}}">编码</th>
                <th data-options="field:'groupName',width:150" sortable="true" editor="{type:'textbox',options:{required:true,validType:{length:[1,30]},missingMessage:'此输入项为必填项'}}">名称</th>
                <th data-options="field:'descr',width:190" editor="{type:'textbox'}">描述</th>
            </tr>
        </thead>
    </table>
    <div id="dauthFilterGroup_toolbar" tag=listen_hotkey>
        <table>
            <tr>
            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_FILTERGROUP_ADD %>">
	                <td><a href="javascript:void(0)" class="easyui-linkbutton"
	                    iconCls="icon_add1" plain="true" tag="add">新建</a></td>
            	</shiro:hasPermission>
            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_FILTERGROUP_UPDATE %>">
	                <td style="display: none"><a href="javascript:void(0)"
	                    iconCls="icon_add1" plain="true" tag="update">修改</a></td>
            	</shiro:hasPermission>
            	<h:hasAnyPermissions name='<%= Auths.Sys.DAUTH_FILTERGROUP_ADD + "," + Auths.Sys.DAUTH_FILTERGROUP_UPDATE %>'>
	                <td><a href="javascript:void(0)" class="easyui-linkbutton"
	                    iconCls="icon_save1" plain="true" tag="save">保存</a></td>
            	</h:hasAnyPermissions>
            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_FILTERGROUP_DELETE %>">
	                <td><a href="javascript:void(0)" class="easyui-linkbutton"
	                    iconCls="icon_delete" plain="true" tag="del">删除</a></td>
            	</shiro:hasPermission>
                <td><a href="javascript:void(0)" class="easyui-linkbutton"
                    data-options="iconCls:'icon_undo',plain:true" tag="undo">撤销</a></td>
                <shiro:hasPermission name="<%= Auths.Sys.DAUTH_FILTERJOIN_VIEW %>">
	                <td><a href="javascript:void(0)" class="easyui-linkbutton"
	                    data-options="iconCls:'icon_edit',plain:true" tag="dauthFilterJoin">过滤器项配置</a></td>
                </shiro:hasPermission>
                <td><div class="datagrid-btn-separator"></div></td>
                <td><a class="easyui-linkbutton" iconCls="icon_clear" plain="true" tag="clear">清空查询</a></td>
            </tr>
        </table>
    </div>
	<script type="text/javascript" src="${ctx}/static/js/sys/dauth/dauthFilterGroup_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>