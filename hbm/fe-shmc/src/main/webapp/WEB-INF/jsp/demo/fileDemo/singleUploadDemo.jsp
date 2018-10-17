<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>当个附件上传demo</title>
</head>
<body>
    <div class="easyui-layout" fit="true" id="singleUpload_layout">
        <div data-options="region:'center',border:false" style="padding: 10px; ">
            <form id="singleUpload" class="hgform">
                <table class="hgtable  table_form" cellpadding="0" cellspacing="0">
                    <tr>
                        <th  width="40%">参数1：</th>
                        <td width="60%">
                            <input type="text" name="param1" >
                        </td>
                    </tr>
                    <tr>
                        <th >参数2：</th>
                        <td>
                            <input type="text" name="param2" >
                        </td>
                    </tr>
                    <tr>
                        <th >附件：</th>
                        <td>
                            <input type="file" id="singleFile" name="singleFile" style="width: 130px;">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div data-options="region:'south',border:false">
            <div class="block_pop_foot">
	            <a href="javascript:void(0)" class="a_blue" 
	               onclick="singleFileUpload();"><em>提交</em></a>
	        </div>
        </div>
    </div>
    <script type="text/javascript">

    function singleFileUpload(){
        if(!$("#singleFile").val() || $("#singleFile").val().length==0 ){
            HgUi.notice("请选择需要上传的文件。");
            return false;
        } 
        var returnMap = HgUtil.FileCheck(['singleFile'], ["DOC","XLS","DOCX"]);
        if(!returnMap.flag){
            HgUi.error(returnMap.msg);
            return false;
        }else{
            //组装form内参数封装为Map(Name值不可重复)
            var params=HgUtil.paramArrayToMap($(["#singleUpload"]).serializeArray());
            $.messager.progress({
                title:"稍等",
                msg:"正在提交..."
            });
            var url=G_CTX_PATH+'/common/demo/fileDemo/singleFileUpload';
            $.ajaxFileUpload({
                url : url,
                type : 'POST',
                fileElementId : 'singleFile', //文件选择框的id属性 
                dataType : 'text',
                data : params,
                success : function(result) {
                    $.messager.progress("close");
                    if (result == "success") {
                        HgUi.ok("操作成功", function()  {
                            //TODO
                        	HgUi.closeWinByLayOutId("singleUpload_layout");
                        });
                    } else {
                        HgUi.error(result,function(){
                            
                        });
                    }
                },
                error : function(data, status, e) {
                    //服务器响应失败时的处理函数 
                    $.messager.progress("close");
                    $.messager.alert("error", '出错了');
                }
            });
        }
    }
    </script>
</body>
</html>