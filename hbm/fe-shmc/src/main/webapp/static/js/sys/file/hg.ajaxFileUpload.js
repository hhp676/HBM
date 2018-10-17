/**
 * 一、jsp
 * 	<div id="fileUploadAward">
		 <input name="docFile" type="file" style='font-size:14px'  class="form-input"  id="docFileId_personalInfo" />&nbsp;&nbsp;
		 <br>
		 <div id="fileInfo"></div>
		 <font color="red" font-size="10px">文件大小请小于5M！</font>
	   </div>
 * 二、JS使用
//绑定事件
  $("#docFileId_personalInfo").change(function () {
        UploadImg();
  });
  function UploadImg(docFileId_personalInfo){
	  var ajaxUpload = HgAjaxFile.ajaxUpload('fileUploadAward','docFileId_personalInfo');
  }
 */

var HgAjaxFile = (HgAjaxFile == null) ? {} : HgAjaxFile;
HgAjaxFile.fileElementId;
HgAjaxFile.divId;
/**
 * 初始化设置
 * @param divId
 * @param fileElementId
 */
HgAjaxFile.ajaxUpload = function(divId,fileElementId){
	$.messager.progress({
        title:"稍等",
        msg:"正在上传..."
    });
	HgAjaxFile.fileElementId=fileElementId;
	HgAjaxFile.divId = divId;
	$.ajaxFileUpload({ 
        //处理文件上传操作的服务器端地址
        url:G_CTX_PATH + "/sys/sysFile/uploadFile",
        fileElementId:fileElementId,
        dataType:'text/html',
        success: HgAjaxFile.onSuccessFun,
        error:  HgAjaxFile.onErrorFun
    });
	
	
}
/**
 * 上传成功后运行方法，可根据自己需求更改
 * @param data
 * @param status
 */
HgAjaxFile.onSuccessFun = function (data, status){
	var datas=$.parseJSON(data);
    $.messager.progress("close");
    if (datas.result == "success") {
    	 
       	 HgUi.ok("上传文件成功!",function(){
       		  
            	   $("#"+HgAjaxFile.divId+" #fileInfo").html( "<a href='javaScript:void(0)' onclick='HgAjaxFile.downFile(\""+datas.fileId+"\",\""+datas.attId+"\")'>" + datas.oldName +"</a>"); 
            	   $("#"+HgAjaxFile.divId+" #fileInfo").append("<a href='javaScript:void(0)' onclick='HgAjaxFile.deleteFile(\""+datas.fileId+"\",\""+datas.attId+"\")'>删除</a>");
       	 });
       	 $("#"+HgAjaxFile.divId+" #"+HgAjaxFile.fileElementId).change(function () {
                UploadImg();
            });
    }else {
    	HgUi.error( datas.result,function(){
   	 });
    } 
}
/**
 * 上传失败后运行方法，可根据自己需求更改
 * @param data
 * @param status
 * @param e
 */
HgAjaxFile.onErrorFun =function(data, status, e){
    alert(e);
    $.messager.progress("close");
}   
/**
 * 文件下载
 * @param fileId 文件ID
 * @param attId 附件ID
 */
HgAjaxFile.downFile =function (fileId,attId){
	window.open(G_CTX_PATH + "/sys/sysFile/downFile/" + fileId);
} 

/**
 * 文件删除
 * @param fileId 文件ID
 * @param attId 附件ID
 */
HgAjaxFile.deleteFile= function(fileId,attId){
	HgUtil.getJson("/sys/sysFile/deleteAttach",{fileId:fileId,attId:attId},function(data){
		if (!data.success) {
			$.messager.alert("提示","附件删除失败","warning");
			return;
		}
		HgUi.ok("删除成功!",function(){
			//删除相应行信息
			$("#"+HgAjaxFile.divId+" #fileInfo").html(""); 
		});	
	});
}