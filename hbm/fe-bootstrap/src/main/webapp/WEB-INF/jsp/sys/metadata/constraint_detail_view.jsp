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
                <td>
                    <shiro:hasPermission name="<%= Auths.Sys.CONSTRAINT_DETAIL_ADD %>">
                        <a href="javascript:void(0);" class="btn btn-primary" tag="add"><i class="fa fa-plus"></i>新建</a>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="<%= Auths.Sys.CONSTRAINT_DETAIL_UPDATE %>">
                        <a href="javascript:void(0);" style="display:none" tag="update"><i class="fa fa-plus"></i>修改</a>
                    </shiro:hasPermission>
                    <h:hasAnyPermissions name='<%= Auths.Sys.CONSTRAINT_DETAIL_ADD + "," + Auths.Sys.CONSTRAINT_DETAIL_UPDATE %>'>
                        <a href="javascript:void(0);" class="btn btn-success" tag="save"><i class="fa fa-save"></i>保存</a>
                    </h:hasAnyPermissions>
                    <shiro:hasPermission name="<%= Auths.Sys.CONSTRAINT_DETAIL_DEL %>">
                        <a href="javascript:void(0);" class="btn btn-darkorange" tag="del"><i class="fa fa-remove"></i>删除</a>
                    </shiro:hasPermission>
                    <a href="javascript:void(0);" class="btn btn-azure" tag="undo"><i class="fa fa-mail-reply"></i>撤销</a>
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript" src="${ctx}/static/js/sys/metadata/constraint_detail_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>