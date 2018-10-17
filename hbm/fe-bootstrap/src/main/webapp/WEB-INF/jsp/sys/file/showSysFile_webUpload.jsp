<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>附件上传</title>
</head>
<body>
	<div class="easyui-layout " data-options="fit:true" id="purchaseFile_layout">
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
					   <td style="position: position: relative;">
					    <shiro:hasPermission name="<%= Auths.Sys.FILE_UPLOAD %>">
							<!-- ie下,必须是点到文件框选择文件才可以成功上传,故只能使用层叠样式实现 -->
							<!-- 开始层叠样式,将按钮和webupload堆叠yyzh -->
							
								<!-- 布局必须写两层嵌套,不然按钮走偏 -->
										<a href="javascript:void(0);" class="btn btn-primary" tag="add" id="addFiles"><i class="fa fa-plus"></i>新建</a>
									<!-- 设置webupload样式为透明,并设置为上层显示 -->
									<div href="javascript:void(0)" id="purchase_file_uploader_packer"
                                                  onclick="if(!checkGridOnEdit()){return false;}"
										onmouseenter="$('#addFiles').css('background-color','rgb(230,230,230)');"
										onmouseleave="$('#addFiles').css('background-color','rgb(245,245,245)');"
										style="position: absolute; filter: alpha(opacity=0);opacity:0;
											float: left;margin-top: 0px;z-index: 2;width: 55px;height: 25px;">&nbsp;</div>
						  </shiro:hasPermission>
						  <shiro:hasPermission name="<%= Auths.Sys.FILE_UPDATEATTACH %>">
							    <a href="javascript:void(0);" class="btn btn-success" tag="save"><i class="fa fa-save"></i>保存</a>
						  </shiro:hasPermission>
						  <shiro:hasPermission name="<%= Auths.Sys.FILE_DELETEATTACH %>">
							    <a href="javascript:void(0);" class="btn btn-darkorange" tag="del"><i class="fa fa-remove"></i>删除</a>
						  </shiro:hasPermission>
					        <a href="javascript:void(0);" class="btn btn-azure" tag="undo"><i class="fa fa-mail-reply"></i>撤销</a>
							<shiro:hasPermission name="<%= Auths.Sys.FILE_DOWN_ATTACH %>">
						    <a href="javascript:void(0);" class="btn btn-maroon" tag="downFile"><i class="fa fa-download"></i>下载</a>
							</shiro:hasPermission>
                       </td>
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
