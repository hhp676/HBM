/**
 * 通用生成并展现附件datagrid
 * 例子：
 * 一、datagrid的写法；需要添加idField属性
 * 	<table class="easyui-datagrid"  id="oaCompleteProFile_grid" toolbar="#oaCompleteProFile_toolbar" idField="attId">
 * 
 * 二、JS使用
 * 	var attachmentSummaryGrid = HgWebUpload.initAttachmentGrid({
 *		editEnable:true,
 *		gridObj:"#oaCompleteProFile_grid",
 *		toolbarObj:"#oaCompleteProFile_toolbar",
 *		formData:{ "bizType": "contract","bizId": 1111},
 *		uploadButtonObj:'#file_uploader_packer'	,
	});
	attachmentSummaryGrid.loadUrl("/sys/sysFile/getListByBizId/contract/" + 1111)
 */

var HgWebUpload = (HgWebUpload == null) ? {} : HgWebUpload;

HgWebUpload.initAttachmentGrid = function(attachmentGrid) {
	var defaultOptions = {
			
			isEditing : false,
			editingIndex : 0,
			custId : 0,
			cusCrtUserid : 0,
			isUpload : false,
			
			editEnable:true,
			gridObj : '',//grid选择器
			toolbarObj : '',//toolbar选择器
			uploadButtonObj : '',//uploadButton选择器
			formData : '',
			extensions:'*.*',
			
			onBeginEdit:attachmentGrid.onBeginEditFn,//支持扩展
			onSelect:attachmentGrid.onSelectFn,//支持扩展
			onDblClickCell:attachmentGrid.onDblClickCellFn,//支持扩展
			onLoadSuccess:attachmentGrid.onLoadSuccessFn//支持扩展
		};
	
	attachmentGrid = $.extend(defaultOptions, attachmentGrid);
	attachmentGrid.gridObjName = (attachmentGrid.gridObj.length>0)?attachmentGrid.gridObj.substr(1):'';
	
	attachmentGrid.onBeginEditFn = function(index, field) {
		var realNameStr = $(attachmentGrid.gridObj).datagrid('getEditor', {
			index : index,
			field : "realName"
		});
		var descrStr = $(attachmentGrid.gridObj).datagrid('getEditor', {
			index : index,
			field : "descr"
		});
	};
	attachmentGrid.onSelectFn = function(index, row) {
		if (attachmentGrid.isEditing) {
			if (attachmentGrid.editingIndex != index) {
				//如果有保存按钮，则支持行编辑保存
				if (attachmentGrid.toolbarObj!=null) {
					$.messager.confirm("确认保存", "是否保存编辑状态的数据？", function(flag){
						if (flag) {
							$(attachmentGrid.toolbarObj+" [tag=save]").click();
						}
					});
				}
			}
		}
	};
	attachmentGrid.onDblClickCellFn = function(index, field) {
		if (!attachmentGrid.editEnable)
			return false;
		
		if(attachmentGrid.isUpload){
			HgUi.alert("文件正在上传，不可编辑！");
			return false;
		}
		if (attachmentGrid.isEditing == false) {
			var editRow = $(attachmentGrid.gridObj).datagrid("getRows")[index];
			//datagrid加载出的数据、已经上传完毕的可以编辑
			//if(editRow.uploader_fileId){
			//	HgWebUpload.showGridMsg(attachmentGrid.gridObjName,"文件正在上传，不可编辑！");
			//	return;
			//}
//			if (editRow.crtUserid != loginUserId) {
//				HgWebUpload.showGridMsg(attachmentGrid.gridObjName,"不可编辑由别人创建的数据！");
//				return false;
//			}
			$(attachmentGrid.gridObj).datagrid("beginEdit", index);		
			attachmentGrid.isEditing = true;
			attachmentGrid.editingIndex = index;
		} else {
			HgWebUpload.showMsgRowNotSaved(attachmentGrid.gridObjName);
		}
	};
	attachmentGrid.onLoadSuccessFn = function(data) {
		//加载完成后,重设按钮大小yinyanzhen
		var childrendivs=$(".webuploader-container").children("div");
		//alert($(childrendivs[1]).css('width'));
		$(childrendivs[1]).width(55);
		//加载完成后,设定上传参数yinyanzhen
		attachmentFile_uploader.option('formData',attachmentGrid.formData);
		attachmentGrid.isEditing = false;
		attachmentGrid.editingIndex = 0;
		attachmentGrid.isUpload = false;
	};
	 
	//加载附件信息
	attachmentGrid.loadUrl = function(url){
		$(attachmentGrid.gridObj).datagrid({
			url : G_CTX_PATH + url,
			onBeginEdit:attachmentGrid.onBeginEdit,
			onSelect:attachmentGrid.onSelectFn,
			onDblClickCell:attachmentGrid.onDblClickCellFn,
			onLoadSuccess:attachmentGrid.onLoadSuccessFn
		});
	};

	//下载附件信息
	$(attachmentGrid.toolbarObj+" [tag=downFile]").click(function(){
		var row = $(attachmentGrid.gridObj).datagrid("getSelected");
		if (!row) {
			HgUi.alert("请选择一条数据");
			return;
		}
		var fileId = row.fileId;
		var attId = row.attId;
		window.open(G_CTX_PATH + "/sys/sysFile/downFile/" + fileId + "/" + attId);
	});

	//--------------------------上传------------------------------------------------------------------
	var oaContractFile_fileSingleSizeLimit = 95;//单位M 需要比spring配置的最大上传值,参见-配置文件spring-mvc-views-base
	var attachmentFile_uploader = new  WebUploader.Uploader({
	    swf: G_CTX_PATH+'/plugins/webuploader/Uploader.swf',
	    disableGlobalDnd: true,//禁掉整个页面的拖拽功能
	    pick: {
					id: $(attachmentGrid.uploadButtonObj), //绑定按钮
					multiple:true//支持多个文件
		},
	    accept: {
						extensions: attachmentGrid.extensions	//允许的文件后缀，不带点，多个用逗号分割 比如：png,zip
		},
	    server: G_CTX_PATH+'/sys/sysFile/upload',
	    fileVal: 'fileData',//设置文件上传域的name
	    threads: 1,//上传并发数。允许同时最大上传进程数。
	    thumb: false,//不生成缩略图的选项
	    compress: false,//上传前不进行压缩图片
	    fileSingleSizeLimit: oaContractFile_fileSingleSizeLimit*1024*1024,//上传文件大小
	    duplicate: true//去重
	});
	//--------------------------当文件被加入队列之前触发------------------------------------------------------------------
	attachmentFile_uploader.onBeforeFileQueued = function( file ) {
		if(file.size==0){
			return false;
		}
		return true;
	};
	//--------------------------当一批文件添加进队列以后触发------------------------------------------------------------------
	attachmentFile_uploader.onFilesQueued = function(files) {
		if(files.length==0){
			HgUi.alert("排除不合法文件后,待上传文件队列为空,上传操作取消!");
		}else{
			$(attachmentGrid.toolbarObj).block();
		}
	};
	//--------------------------当文件被加入队列以后触发------------------------------------------------------------------
	attachmentFile_uploader.onFileQueued = function(file) {
		var rowindex = $(attachmentGrid.gridObj).datagrid("insertRow", {
			index : 0,
			row : {
				"fileId":file.id,
				"attId":file.id,
				"uploader_fileId":file.id,
				"fileType":file.ext,
				"attName":file.name,
				"sysFile":{"descr":'<div id="oaCommFileList_' + file.id + '" class="webuploaderprogress"><span class="text">0%</span><span class="percentage"></span></div>'}
			}
		});
		attachmentGrid.isUpload = true;
		$(attachmentGrid.gridObj).datagrid('acceptChanges');
		attachmentFile_uploader.upload();
	};
	//--------------------------当文件被移除队列后触发------------------------------------------------------------------
	attachmentFile_uploader.onFileDequeued = function(file) {
	};
	//--------------------------当文件上传成功时触发------------------------------------------------------------------
	attachmentFile_uploader.onUploadSuccess = function(file,response) {
		if (!response.success && file.name.length>125) {
			HgUi.alert("文件：" + file.name + " 上传失败，失败原因：文件名不能大于125个字符！");
			var gridrowIndex = $(attachmentGrid.gridObj).datagrid("getRowIndex",file.id);
			$(attachmentGrid.gridObj).datagrid("deleteRow",gridrowIndex);
			$(attachmentGrid.gridObj).datagrid('acceptChanges');
		} else if (!response.success){
            HgUi.alert("文件：" + file.name + " 上传失败，失败原因：服务器处理异常！");
            var gridrowIndex = $(attachmentGrid.gridObj).datagrid("getRowIndex",file.id);
            $(attachmentGrid.gridObj).datagrid("deleteRow",gridrowIndex);
            $(attachmentGrid.gridObj).datagrid('acceptChanges');
		} else {
			var gridrowIndex = $(attachmentGrid.gridObj).datagrid("getRowIndex",file.id);
			response.uploader_fileId = "";//使uploader_fileId字段失效，表示为已经上传完成
		}
	};
	//--------------------------当文件上传过程中触发------------------------------------------------------------------
	attachmentFile_uploader.onUploadProgress = function(file, percentage) {
		percentage = parseInt(percentage * 100);
		var $li = $('#oaCommFileList_' + file.id),
		$percenttext = $li.find('.text');
	    $percent = $li.find('.percentage');
	    $percenttext.text(percentage + '%' );
		$percent.css( 'width', percentage + '%' );
	};
	//--------------------------当文件上传出错时触发------------------------------------------------------------------
	attachmentFile_uploader.onUploadError = function(file,reason) {
		HgUi.alert("文件：" + file.name + " 上传失败");
		//删除相应行信息
		var gridrowIndex = $(attachmentGrid.gridObj).datagrid("getRowIndex",file.id);
		$(attachmentGrid.gridObj).datagrid("deleteRow",gridrowIndex);
		$(attachmentGrid.gridObj).datagrid('acceptChanges');
	};
	//--------------------------当validate不通过时，会以派送错误事件的形式通知调用者------------------------------------------------------------------
	attachmentFile_uploader.onError = function(err) {
		if(err=='Q_TYPE_DENIED'){
			HgUi.alert('文件类型不正确，只支持：' + attachmentFile_uploader.option( 'accept')[0].extensions);
		}
		if(err=='F_EXCEED_SIZE'){
			HgUi.alert('超出文件上传大小限制：' + oaContractFile_fileSingleSizeLimit + 'MB');
		}
		$(attachmentGrid.toolbarObj).unblock();
	};
	attachmentFile_uploader.onUploadComplete = function() {
		attachmentGrid.isUpload = false;
		$(attachmentGrid.toolbarObj).unblock();
		$(attachmentGrid.gridObj).datagrid('reload');
	};
	//当显示工具条时才绑定按钮事件
	if (attachmentGrid.toolbarObj!=null){
		
		$(attachmentGrid.toolbarObj+" [tag=add]").on( 'click', function() {
			
			if (attachmentGrid.isEditing) {
				HgWebUpload.showMsgRowNotSaved(attachmentGrid.gridObjName);
				return;
			}
			//文件上传请求的参数表
			attachmentFile_uploader.option('formData',attachmentGrid.formData);
			$(attachmentGrid.toolbarObj+" .webuploader-element-invisible").trigger('click');
		});
	
	
	
		$(attachmentGrid.toolbarObj+" [tag=undo]").click(function() {
			$(attachmentGrid.gridObj).datagrid('rejectChanges');
			attachmentGrid.isEditing = false;
		});
	
	
	
		// --------------------------保存数据------------------------------------------------------------------
		$(attachmentGrid.toolbarObj+" [tag=save]").click(function() {
			if (attachmentGrid.isEditing == true) {
				if(attachmentGrid.isUpload){
					HgWebUpload.showGridMsg(attachmentGrid.gridObjName,"文件正在上传，不可保存！");
					return;
				}
				if ($(attachmentGrid.gridObj).datagrid("validateRow", attachmentGrid.editingIndex)) {
					var data = attachmentGrid.makeSubmitData();
					var editRow = $(attachmentGrid.gridObj).datagrid("getRows")[attachmentGrid.editingIndex];
					var submitUrl = "/sys/sysFile/updateAttach";
					data.fileId = editRow.fileId;
					data.attId = editRow.attId;
					HgUtil.post(submitUrl, data, function(data) {
						if (!data.success) {
							HgWebUpload.showGridErrorMsg(attachmentGrid.gridObjName);
						} else {
							HgUi.ok("保存数据成功!", function() {
								$(attachmentGrid.gridObj).datagrid('reload');
								attachmentGrid.isEditing = false;
							});
//							$(attachmentGrid.gridObj).datagrid('updateRow',{
//								index: attachmentGrid.editingIndex,
//								row: data.attach
//							});
//							$(attachmentGrid.gridObj).datagrid('acceptChanges');
							
						}
					});
				} else {
					var str = new StringBuffer();
					str.append("<div style='float:left;'>");
					str.append("<img  src='"+ G_CTX_PATH + "/static/images/alert.gif'/>");
					str.append("</div>");
					str.append("<div style='float:left;'>");
					str.append("    &nbsp;有一条数据未校验通过!");
					str.append("</div>");
					
					$(attachmentGrid.gridObj).datagrid("getPanel").block({
						message : str.toString(),
						overlayCSS : {backgroundColor : "#fff;",opacity : 0},
						css : {padding : '10px',width : "180px",height : "35px",top : "0px", left : "0px", color : "red", border : 'solid red 2px',backgroundColor : "#fff;", opacity : 1},
						fadeIn : 1000,
						timeout : 1500
					});
				}
			} else {
				HgUi.alert("没有需要保存的数据!");
			}
		});
	
	
		//-------------------------删除-----------------------------------------------------------------------
		$(attachmentGrid.toolbarObj+" [tag=del]").click(function(){
			var row = $(attachmentGrid.gridObj).datagrid("getSelected");
			var rowIndex = $(attachmentGrid.gridObj).datagrid('getRowIndex', row);
			if (attachmentGrid.isEditing == true && rowIndex == 0){
				HgUi.alert("未保存的数据无法删除");
				return;
			}
			if (!row) {
				HgUi.alert("请选择一条数据");
				return;
			}
			$.messager.confirm("删除确认", "确认删除此条数据?", function(r){
				if(r){
					var isUploaderUpload = false;
					if(row.uploader_fileId){
						isUploaderUpload = true;
					}
					if(isUploaderUpload){
						//先暂停上传，删除后，再继续上传
						//暂停全部
						attachmentFile_uploader.stop();
						attachmentFile_uploader.cancelFile(row.uploader_fileId);//取消指定文件
						//删除相应行信息
						var gridrowIndex = $(attachmentGrid.gridObj).datagrid("getRowIndex",row);
						$(attachmentGrid.gridObj).datagrid("deleteRow",gridrowIndex);
						$(attachmentGrid.gridObj).datagrid('acceptChanges');
						attachmentFile_uploader.upload();//继续上传
					}else{
						HgUtil.getJson("/sys/sysFile/deleteAttach",{fileId:row.fileId,attId:row.attId},function(data){
							if (!data.success) {
								HgUi.alert("附件删除失败");
								return;
							}
							HgUi.ok("删除成功!",function(){
								//删除相应行信息
								var gridrowIndex = $(attachmentGrid.gridObj).datagrid("getRowIndex",row);
								$(attachmentGrid.gridObj).datagrid("deleteRow",gridrowIndex);
								$(attachmentGrid.gridObj).datagrid('acceptChanges');
							});	
						});
					}
				}
			});
		});
	}
	//组织提交数据
	attachmentGrid.makeSubmitData = function() {
		var attName = $(attachmentGrid.gridObj).datagrid('getEditor', {
			index : attachmentGrid.editingIndex,
			field : "attName"
		});
		var descr = $(attachmentGrid.gridObj).datagrid('getEditor', {
			index : attachmentGrid.editingIndex,
			field : "sysFile.descr"
		});
		var data = {
				attName : $(attName.target).textbox("getValue"),
			descr : $(descr.target).textbox("getValue")
		};
		return data;
	};
	 
	
	attachmentGrid.attachmentFile_uploader = attachmentFile_uploader;
	return attachmentGrid;
};