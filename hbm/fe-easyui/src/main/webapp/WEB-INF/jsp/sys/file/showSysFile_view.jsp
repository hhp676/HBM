<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SysConfig</title>
</head>
<body>
	<div class="easyui-layout" fit=true>
		<div data-options="region:'center',title:'附件管理',border:false" style="padding: 0px; ">
			<table id="fileManage_grid" toolbar="#fileManage_toolbar" 
				data-options="
					border:false,
					url:'${ctx}/sys/sysFile/fileList',
					fit:true,
		        	fitColumns:true,
					striped:true,
		        	rownumbers:true,
		        	singleSelect:true,
		        	scrollbarSize :10,
					idField: 'fileId'"
				pagination="true" pageSize="${defaultPageSize}" pageList="${defaultPageList}">
				<thead>
					<tr>
						<th data-options="field:'sysFile.realName',width:200"  >文件真实名称</th>
                        <th data-options="field:'attName',width:200"  >附件名称</th>
                        <!-- <th data-options="field:'sysFile.fileName',width:150"  >文件名称</th> -->
                        <th data-options="field:'sysFile.fileSize',width:200"  align="right">文件大小(单位:B)</th>
                        <th data-options="field:'sysFile.fileType',width:200"  >文件类型</th>
                        <th data-options="field:'attCode',width:200"  >附件编码</th>
                        <th data-options="field:'bizCode',width:200"  >业务编码</th>
					</tr>
				</thead>
			</table>
			<div id="fileManage_toolbar" tag=listen_hotkey>
				<table>
					<tr>
						<!-- <td><a class="easyui-linkbutton" iconCls="icon_clear" tag="ajaxUpload">ajax上传</a></td> -->
						<shiro:hasPermission name="<%= Auths.Sys.FILE_UPLOAD %>">
						     <td><a class="easyui-linkbutton" iconCls="icon_auto_colorful__upload1" plain="true" tag="webUpload">web上传</a></td>
						</shiro:hasPermission>
						<!-- <td><a class="easyui-linkbutton" iconCls="icon_clear" tag="ajaxFilesUpload">ajax多文件上传</a></td> -->
                        <td><div class="datagrid-btn-separator"></div></td>
                        <td><a class="easyui-linkbutton" iconCls="icon_clear" plain="true" tag="clear">清空查询</a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="${ctx}/static/js/sys/file/showSysFile_view.js?jsTimer=${jsTimer}"></script>
</body>
</html>