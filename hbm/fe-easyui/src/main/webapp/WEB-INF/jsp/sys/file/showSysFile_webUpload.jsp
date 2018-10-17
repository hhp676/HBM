<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>附件上传</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true" id="purchaseFile_layout">
		<table class="easyui-datagrid" idField="attId" toolbar="#purchaseFile_toolbar" id="purchaseFile_grid" 
			pagination="true" fit=true rownumbers="true" fitColumns="true" singleSelect="true" showFooter="true"
			data-options="">
			<thead>
				<tr>
					<th field="attName" width="50"
					   editor="{type:'textbox',options:{required:true,missingMessage:'此输入项为必填项',validType:'length[1,125]'}}">附件名称</th>
					<th field="sysFile.descr" width="100" 
					   editor="{type:'textbox',options:{validType:'length[1,500]'}}">备注</th>
				</tr>
			</thead>
		</table>
		
		<div id="purchaseFile_toolbar">
				<table>
					<tr>
					    <shiro:hasPermission name="<%= Auths.Sys.FILE_UPLOAD %>">
							<!-- ie下,必须是点到文件框选择文件才可以成功上传,故只能使用层叠样式实现 -->
							<!-- 开始层叠样式,将按钮和webupload堆叠yyzh -->
							<td style="position: position: relative;">
								<!-- 布局必须写两层嵌套,不然按钮走偏 -->
								<div style="position: position: relative;width:55px;height: 25px;">
									<a href="javascript:void(0)" class="easyui-linkbutton" 
										id="addFiles"
										style="position: absolute;height: 25px;"
										iconCls="icon-add1" plain="true" tag="add">新建</a>
									<!-- 设置webupload样式为透明,并设置为上层显示 -->
									<div href="javascript:void(0)" id="purchase_file_uploader_packer"
                                                  onclick="if(!checkGridOnEdit()){return false;}"
										onmouseenter="$('#addFiles').css('background-color','rgb(230,230,230)');"
										onmouseleave="$('#addFiles').css('background-color','rgb(245,245,245)');"
										style="position: absolute; filter: alpha(opacity=0);opacity:0;
											float: left;margin-top: 0px;z-index: 2;width: 55px;height: 25px;">&nbsp;</div>
								</div>
							</td>
						</shiro:hasPermission>
						<shiro:hasPermission name="<%= Auths.Sys.FILE_UPDATEATTACH %>">
							<td>
							    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" tag="save">保存</a>
							</td>
						</shiro:hasPermission>
						<shiro:hasPermission name="<%= Auths.Sys.FILE_DELETEATTACH %>">
							<td>
							    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-del1" plain="true" tag="del">删除</a>
							</td>
						</shiro:hasPermission>
					    <td>
					        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon_undo',plain:true" tag="undo">撤销</a>
						</td>
						<shiro:hasPermission name="<%= Auths.Sys.FILE_DOWN_ATTACH %>">
						<td>
						    <a href="javascript:void(0)" class="easyui-linkbutton"  iconCls="icon_auto_colorful__download1" plain="true" tag="downFile">下载</a>
                        </td>
						</shiro:hasPermission>
					</tr>
				</table>
		</div>
	</div>

	<script>
        var editEnabled = false;
		<shiro:hasPermission name="<%= Auths.Sys.FILE_DOWN_ATTACH %>">
        editEnabled = true;
		</shiro:hasPermission>
	</script>
	<script type="text/javascript">
          function checkGridOnEdit(){
        	  var rows = $("#purchaseFile_grid").datagrid('getPanel').find('.datagrid-row-editing');
        	  if(rows.length>0){
        		  checkAlert();
        		  return false;
        	  }else{
        		  return true;
        	  }
          }
          //时间戳值,用于记录本次弹窗时间
          var checkTimer = Date.parse(new Date());
          //校验弹窗时间,避免重复弹窗
          function checkAlert(){
        	  var now = Date.parse(new Date());
        	  if(now-checkTimer>2000){
        		  checkTimer=now;
        		  HgUi.alert("当前存在正在编辑状态的数据,操作取消");
        	  }
          }

		var purchaseFile_attachmentGrid = HgWebUpload.initAttachmentGrid({
			editEnable:editEnabled,
			gridObj:"#purchaseFile_grid",
            toolbarObj:"#purchaseFile_toolbar",
            formData:{ 
            	   "bizType":"ict",
            	   "relationPk":"${relationPk}",
            	   "fileType":"${fileType}",
            	   "groupType":"${groupType}"
            },
            uploadButtonObj:'#purchase_file_uploader_packer',
		});
		 purchaseFile_attachmentGrid.loadUrl("/sys/sysFile/fileList");
		 
	</script>
</body>

</html>
