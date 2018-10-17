<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<div class="easyui-layout" fit=true>
    <div region="center" style="width: 680px;" title="系统字典组">
        <table singleSelect=true fit=true id="${meta.className}_datagrid"
               fitColumns=true toolbar="#${meta.className}_toolbar" pagination="true"
               pageSize="${r'${defaultPageSize}'}" pageList="${r'${defaultPageList}'}"
               data-options="url:'${r'${ctx}'}/${meta.module}/${meta.className}/list'">
            <thead>
            <tr>
            <#list meta.entityCols as col>
                <#if col.pkFlag == false && col.fieldName != "tenantId">
                <th data-options="field:'${col.fieldName}',width:150" editor="{type:'textbox'<#if col.nullable != "1">, options:{required:true,missingMessage:'此输入项为必填项'}</#if>}"><b>${col.colDesc}</b></th>
                </#if>
            </#list>
            </tr>
            </thead>
        </table>
        <div id="${meta.className}_toolbar" tag=listen_hotkey>
            <table>
                <tr>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon_add1" plain="true" tag="add">新建</a></td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon_save1" plain="true" tag="save">保存</a></td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon_delete" plain="true" tag="del">删除</a></td>

                    <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon_undo',plain:true" tag="undo">撤销</a></td>
                    <td><div class="datagrid-btn-separator"></div></td>
                    <td><a class="easyui-linkbutton" iconCls="icon_clear" tag="clear">清空查询</a></td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="${r'${ctx}'}/static/js/sys/${meta.className}_view.js"></script>
</body>

</html>