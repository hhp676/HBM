<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>职位管理</title>
</head>
<body>
<div class="easyui-layout easyui-datagrid-layout" fit=true>
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
                    <td>
                        <a href="javascript:void(0);" class="btn btn-primary" tag="add"><i class="fa fa-plus"></i>新建</a>
                        <a href="javascript:void(0);" class="btn btn-success" tag="save"><i class="fa fa-save"></i>保存</a>
                        <a href="javascript:void(0);" class="btn btn-darkorange" tag="del"><i class="fa fa-remove"></i>删除</a>
                        <a href="javascript:void(0);" class="btn btn-azure" tag="undo"><i class="fa fa-mail-reply"></i>撤销</a>
                        <a href="javascript:void(0);" class="btn btn-yellow" tag="clear"><i class="fa fa-eraser"></i>清空查询</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/static/js/sys/org/sysJob_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>