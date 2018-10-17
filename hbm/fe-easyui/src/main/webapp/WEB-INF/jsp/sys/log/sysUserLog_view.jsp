<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户日志</title>
</head>
<body>
<div class="easyui-layout" fit=true id="sysUserLog_layout">
<div data-options="region:'center',title:'日志列表',border:false" style="padding: 0px;">
    <table singleSelect=true fit=true id="sysUserLog_grid"
        fitColumns=true rownumbers="true" pagination="true" toolbar="#sysUserLog_toolbar"
        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
        data-options="url:'${ctx}/sys/sysUserLog/list'">
        <thead>
            <tr>
                 <th data-options="field:'userLogId',width:160,hidden:true">主键</th>
                 <th data-options="field:'sysUser.userName',width:80,formatter:HgUtil.userInfoDetail('sysUserLogGrid.reload',null,'sysUser.isDelete')">用户名</th>
                 <th data-options="field:'operCode',width:80">操作编码</th>
                 <th data-options="field:'operName',width:90">操作名称</th>
                 <th data-options="field:'reqUri',width:80">URI</th>
                 <th data-options="field:'operIp',width:80">调用IP</th>
                 <th data-options="field:'key1',width:60">关键词1</th>
                 <th data-options="field:'key2',width:60">关键词2</th>
                 <th data-options="field:'key3',width:60">关键词3</th>
                 <th data-options="field:'operRes',width:50,formatter:HgUtil.fieldFormatterFunc('LOG_RESULT')" align="center">操作结果</th>
                 <th data-options="field:'content',width:120">内容</th>
                 <th data-options="field:'crtTime',width:110,formatter:HgUtil.formatToDateTime">创建时间</th>
            </tr>
        </thead>
    </table>
    <div id="sysUserLog_toolbar" tag=listen_hotkey>
		<div class="hgGridSearchBar"
			style="height: 50px; width: 100%;display:block;" tag="queryDiv">
			<form id="sysUserLogSearchForm">
				<table width="100%">
					<tr>
						<td align="right"><span>用户名：</span></td>
						<td><input name="userName" style="width: 100px;"/></td>
						<td align="right"><span>操作编码：</span></td>
                        <td><input name="operCode" style="width: 100px;"/></td>
                        <td align="right"><span>操作名称：</span></td>
                        <td><input name="operName" style="width: 100px;"/></td>
                        <td align="right"><span>URI：</span></td>
                        <td><input name="reqUri" style="width: 100px;"/></td>
                        <td width="100px"></td>
                        <td rowspan="2" style="text-align: right; padding-right: 15px;">
                            <a class="easyui-linkbutton" iconCls="icon-search" tag="submit">查询</a>
                            <a class="easyui-linkbutton" iconCls="icon_clear" tag="clear">清空</a>
                         </td>
					</tr>
					<tr>
					    <td align="right"><span>调用IP：</span></td>
                        <td><input name="operIp" style="width: 100px;"/></td>
						<td align="right"><span>关键词：</span></td>
						<td><input name="keyword" style="width: 100px;"></td>
						<td align="right"><span>创建时间：</span></td>
						<td>
							<input name="startTime" type="text" style="width: 100px;" class="Wdate" id="userLogStartTime" value=""
								onClick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'userLogEndTime\',{d:0});}'})">
						</td>
						<td align="center">
								---&nbsp;&nbsp;&nbsp;&nbsp;
					    </td>
					    <td>
							<input name="endTime" type="text" style="width: 100px;" class="Wdate" id="userLogEndTime" value=""
								onClick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'userLogStartTime\',{d:0});}'})">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
 </div>
</div>
	<script type="text/javascript" src="${ctx}/static/js/sys/log/sysUserLog_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>