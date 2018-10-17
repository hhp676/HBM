<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统日志</title>
</head>
<body>
<div class="easyui-layout" fit=true id="sysLog_layout">
<div data-options="region:'center',title:'日志列表',border:false" style="padding: 0px;">
    <table singleSelect=true fit=true id="sysLog_grid"
        fitColumns=true rownumbers="true" pagination="true" toolbar="#sysLog_toolbar"
        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
        data-options="url:'${ctx}/sys/sysLog/list'">
        <thead>
            <tr>
                 <th data-options="field:'logId',width:160,hidden:true">主键</th>
                 <th data-options="field:'tenantId',hidden:true,width:100">租户ID</th>
                 <th data-options="field:'logType',width:100,formatter:function(value){return HgUtil.getDictItemName('LOG_TYPE',value);}">类型</th>
                 <th data-options="field:'logLevel',width:80,hidden:true">日志级别</th>
                 <th data-options="field:'key1',width:80">关键词1</th>
                 <th data-options="field:'key2',width:80">关键词2</th>
                 <th data-options="field:'key3',width:80">关键词3</th>
                 <th data-options="field:'key4',width:80">关键词4</th>
                 <th data-options="field:'key5',width:80">关键词5</th>
                 <th data-options="field:'content',width:100">内容</th>
                 <th data-options="field:'crtUser.userName',width:80">操作人</th>
                 <th data-options="field:'crtTime',width:80,formatter:HgUtil.formatToDate">创建时间</th>
            </tr>
        </thead>
    </table>
    <div id="sysLog_toolbar" tag=listen_hotkey>
				<div class="hgGridSearchBar"
					style="height: 30px; width: 100%;display:block;" tag="queryDiv">
					<form id="sysLogSearchForm">
						<table  width="100%">
							<tr>
								<!-- <td width="50px" align="right"><span>租户ID：</span></td>
								<td><input name="tenantId" style="width: 100px;"/></td> -->
								<td align="right"><span>日志类型：</span></td>
								<td>
								    <input class="easyui-combobox" id="logType"  name="logType" style="width: 120px;" LOG_TYPE>
								</td>
								<td align="right"><span>关键词：</span></td>
								<td><input name="keyword" style="width: 100px;"></td>
								<td width=60px" align="right"><span>创建时间：</span></td>
								<td colspan="3">
									<input name="startTime" type="text" style="width: 100px;" class="Wdate" id="startTime" value=""
										onClick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endTime\',{d:0});}'})">
										&nbsp;&nbsp;---&nbsp;&nbsp;
									<input name="endTime" type="text" style="width: 100px;" class="Wdate" id="endTime" value=""
										onClick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'startTime\',{d:0});}'})">
								</td>
								<td style="text-align: right; padding-right: 15px">    
								    <a class="easyui-linkbutton" iconCls="icon-search" tag="submit">查询</a>
								    <a class="easyui-linkbutton" iconCls="icon_clear" tag="clear">清空</a>
								</td>
						</table>
					</form>
				</div>
			</div>
 </div>
</div>
	<script type="text/javascript" src="${ctx}/static/js/sys/log/sysLog_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>