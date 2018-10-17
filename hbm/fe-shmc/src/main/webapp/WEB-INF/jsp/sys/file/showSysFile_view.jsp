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
			<table id="fileManage_grid" toolbar="#fileManage_toolbar" 
				data-options="
					url:'${ctx}/sys/sysFile/fileList',
		        	fitColumns:true,
					striped:true,
		        	rownumbers:true,
		        	singleSelect:true,
		        	scrollbarSize :10,
					idField: 'fileId',
					scrollbarSize:0,
					title:'附件管理'"
				pagination="true" pageSize="${defaultPageSize}" pageList="${defaultPageList}">
				<thead>
					<tr>
						<th data-options="field:'sysFile.realName',width:200"  >文件真实名称</th>
                        <!-- <th data-options="field:'sysFile.fileName',width:150"  >文件名称</th> -->
                        <th data-options="field:'attName',width:200"  >附件名称</th>
                        <th data-options="field:'sysFile.fileSize',width:200"  align="right">文件大小(单位:B)</th>
                        <th data-options="field:'sysFile.fileType',width:200"  >文件类型</th>
                        <th data-options="field:'attCode',width:200"  >附件编码</th>
                        <th data-options="field:'bizCode',width:200"  >业务编码</th>
					</tr>
				</thead>
			</table>
			<div id="fileManage_toolbar" tag=listen_hotkey>
				<table class="table_form_result">
					<caption>
						<!-- <td><a class="easyui-linkbutton" iconCls="icon_clear" tag="ajaxUpload">ajax上传</a></td> -->
						<shiro:hasPermission name="<%= Auths.Sys.FILE_UPLOAD %>">
						     <a  class="a_btn_blue" tag="webUpload"><em>上传</em></a>
						</shiro:hasPermission>
                            <a class="a_btn_gray" tag="clear"><em>清空查询</em></a>
					</caption>
				</table>
			</div>
	<script type="text/javascript"
		src="${ctx}/static/js/sys/file/showSysFile_view.js?jsTimer=${jsTimer}"></script>
</body>
</html>