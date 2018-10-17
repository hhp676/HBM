<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>约束字段管理</title>
</head>
<body>
    <table singleSelect=true fit=true id="sysMetaConstraintDetail_grid"
           fitColumns=true toolbar="#sysMetaConstraintDetail_toolbar" rownumbers="true" pagination="true"
           pageSize="${defaultPageSize}" pageList="${defaultPageList}">
        <thead>
        <tr>
            <th data-options="field:'field.fieldName',width:150" sortable="true"
                editor="{type:'combogrid',options:{required:true,panelWidth:300,fitColumns:true, idField:'fieldId',textField:'fieldName',
                            editable:false, mode:'remote', missingMessage:'此输入项为必填项'}}">字段名称</th>
            <th data-options="field:'field.columnName',width:150" sortable="true" editor="{type:'textbox',options:{disabled:true}}">表字段</th>
        </tr>
        </thead>
    </table>
    <div id="sysMetaConstraintDetail_toolbar" tag=listen_hotkey>
        <table>
            <tr>
                <shiro:hasPermission name="<%= Auths.Sys.CONSTRAINT_DETAIL_ADD %>">
                    <td>
                        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon_add1" plain="true" tag="add">新建</a>
                    </td>
                </shiro:hasPermission>
                <shiro:hasPermission name="<%= Auths.Sys.CONSTRAINT_DETAIL_UPDATE %>">
                    <td style="display: none">
                        <a href="javascript:void(0)" iconCls="icon_add1" plain="true" tag="update">修改</a>
                    </td>
                </shiro:hasPermission>
                <h:hasAnyPermissions name='<%= Auths.Sys.CONSTRAINT_DETAIL_ADD + "," + Auths.Sys.CONSTRAINT_DETAIL_UPDATE %>'>
                    <td>
                        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon_save1" plain="true" tag="save">保存</a>
                    </td>
                </h:hasAnyPermissions>
                <shiro:hasPermission name="<%= Auths.Sys.CONSTRAINT_DETAIL_DEL %>">
                    <td>
                        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon_delete" plain="true" tag="del">删除</a>
                    </td>
                </shiro:hasPermission>
                <td>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon_undo',plain:true" tag="undo">撤销</a>
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript" src="${ctx}/static/js/sys/metadata/constraint_detail_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>