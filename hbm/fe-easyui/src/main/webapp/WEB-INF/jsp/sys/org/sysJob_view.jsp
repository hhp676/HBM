<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>职位管理</title>
</head>
<body>
<div class="easyui-layout" fit=true>
    <div region="center">
        <table singleSelect=true fit=true id="sysJobGrid"
               fitColumns=true toolbar="#sysJobToolbar" pagination="true"
               pageSize="${defaultPageSize}" pageList="${defaultPageList}"
               data-options="url:'${ctx}/sys/org/jobList'">
            <thead>
            <tr>
                <th data-options="field:'jobCode',width:100" sortable="true" editor="{type:'textbox',options:{required:true,missingMessage:'此输入项为必填项',validType:'length[1,25]'}}">编码</th>
                <th data-options="field:'jobName',width:150" sortable="true" editor="{type:'textbox',options:{required:true,missingMessage:'此输入项为必填项',validType:'length[1,25]'}}">名称</th>
                <th data-options="field:'engName',width:150" sortable="true" editor="{type:'textbox',options:{validType:['onlyEng','length[0,60]']}}">英文名称</th>
                <th data-options="field:'i18nCode',width:150" sortable="true" editor="{type:'textbox',options:{validType:'length[0,100]'}}">国际化编码</th>
                <th data-options="field:'descr',width:200" editor="{type:'textbox',options:{validType:'length[0,200]'}}">描述</th>
            </tr>
            </thead>
        </table>
        <div id="sysJobToolbar" tag=listen_hotkey>
            <table>
                <tr>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon_add1" plain="true" tag="add">新建</a></td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon_save1" plain="true" tag="save">保存</a></td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon_delete" plain="true" tag="del">删除</a></td>

                    <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon_undo',plain:true" tag="undo">撤销</a></td>
                    <td><div class="datagrid-btn-separator"></div></td>
                    <td><a class="easyui-linkbutton" iconCls="icon_clear" plain="true" tag="clear">清空查询</a></td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/static/js/sys/org/sysJob_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>