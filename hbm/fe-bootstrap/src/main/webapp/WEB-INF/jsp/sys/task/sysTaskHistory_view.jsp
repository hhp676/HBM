<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>任务办理记录</title>
</head>
<body>
<div class="easyui-layout" fit=true>
    <div region="center" title="任务办理历史">
        <div id="sysTaskHistory_toolbar" tag=listen_hotkey>
            <form id="sysTaskHistorySearchForm" class="hgform">
                <table class="hgtable" width="100%">
                    <tr>
                        <td align="right">任务类型：</td>
                        <td>
                            <select name="taskTypeId" class="easyui-combobox" 
                                panelHeight='auto' editable="false" style="width: 130px;"
                                data-options="
                                url: 'sys/sysTaskType/getSysTaskTypeList',
                                valueField: 'taskTypeId', textField: 'taskTypeName', 
                                prompt: '---请选择---'">
                            </select>
                        </td>
                        <td align="right">任务名称：</td>
                        <td>
                            <input name="bo.taskNameLike" style="width: 130px;">
                        </td>
                        <td>
                            <a href="javascript:void(0);" class="btn btn-azure btn-sm" tag="search"> 
                                <i class="fa fa-search"></i>搜索
                            </a>
                            <a href="javascript:void(0);" class="btn btn-yellow btn-sm" tag="clear"> 
                                <i class="fa fa-eraser"></i>清空
                            </a>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <table singleSelect=true fit=true id="sysTaskHistory_datagrid"
               fitColumns=true toolbar="#sysTaskHistory_toolbar" pagination="true"
               pageSize="${defaultPageSize}" pageList="${defaultPageList}"
               data-options="
	                url:'${ctx}/sys/sysTask/getHistoryTasklist',
	                rownumbers:true">
            <thead>
            <tr>
                <th data-options="field:'sysTaskType.taskTypeName',width:150" align="center"><b>任务类型</b></th>
                <th data-options="field:'taskName',width:150"><b>任务名称</b></th>
                <th data-options="field:'taskCrtTime',width:150" align="center"><b>添加时间</b></th>
                <th data-options="field:'taskEndTime',width:150" align="center"><b>办理时限</b></th>
                <th data-options="field:'taskStatusStr',width:150" align="center"><b>任务状态</b></th>
                <th data-options="field:'descr',width:150"><b>描述</b></th>
                <th data-options="field:'operate',width:150,
                    formatter:sysTaskHistoryDatagrid.gridOperateFormatter" align="center"><b>操作</b></th>
            </tr>
            </thead>
        </table>
    </div>
    <div region="south" style="height: 180px;" title="任务办理日志">
        <table id="sysTaskLog_datagrid" 
               fitColumns=true fit=true
               pagination="true" pageSize="${defaultPageSize}" pageList="${defaultPageList}"
               data-options="
                url:'${ctx}/sys/sysTask/getSysTaskLogList',
                queryParams:{taskId:'0'},
                rownumbers:true">
            <thead>
            <tr>
                <th data-options="field:'taskHandleTypeStr',width:150" align="center"><b>处理类型</b></th>
                <th data-options="field:'taskHandleTime',
                    formatter:HgUtil.formatToDateTime,width:150" align="center"><b>处理时间</b></th>
                <th data-options="field:'descr',width:450"><b>描述</b></th>
                <!-- formatter:HgUtil.formatStrInLength, -->
            </tr>
            </thead>
        </table>
    </div>
</div>
<script type="text/javascript" src="${ctx}/static/js/sys/task/sysTaskHistory_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>