<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件上传下载demo</title>
</head>
<body>
    <div class="easyui-layout" style="height: 700px;">
        <div data-options="region:'center',title:'文件上传下载demo',border:false" style="padding: 0px; ">
            <div style="width: 900px;margin: 10px;border: 1px solid;">
              <strong>demo内容：</strong>文件上传下载 1.ajaxfileupload文件上传 2.webuploader上传 3.文件下载<br/>
              <strong>适 用 场 景：</strong>1.ajaxfileupload上传,书写简单,参数组织方便 2.webuploader书写较为复杂,但能提供进度条展示,请根据业务所需,自行选择<br/>
              <strong>使 用 说 明：</strong>1.单文件上传,多文件上传,以及关联上传为ajaxfileupload上传方式,参数和附件信息一同到后台 2.webuploader上传为异步上传,需要先保存业务信息,然后再使用该方式保存附件<br/>
              <strong>注 意 事 项：</strong>详见开发手册及代码
            </div>
            <fieldset style="width: 920px;height: 80px;">
                <legend>功能点演示demo</legend>
	            <table width="100%">
	                <tr style="height: 60px;" valign="middle">
	                   <td>
	                    <a href="javascript:void(0);" class="a_blue" 
	                        onclick="singleUpload();"><em>单附件上传</em></a>
	                    <a href="javascript:void(0);" class="a_blue" 
	                        onclick="filesUploadDemo();"><em>多附件上传</em></a>
	                    <a href="javascript:void(0);" class="a_blue" 
	                        onclick="relationFileUploadDemo();"><em>关联上传</em></a>
	                    <a href="javascript:void(0);" class="a_blue" 
	                        onclick="webUploadDemo();"><em>webupload上传</em></a>
	                   </td>
	                </tr>
	            </table>
            </fieldset>
            <fieldset style="width: 920px;height: 80px;">
                <legend>上传框样式demo</legend>
                <form class="hgform">
	                <table>
	                    <tr style="height: 60px;" valign="middle">
	                        <td>样式示例：</td>
	                        <!-- 开始层叠样式yyzh -->
	                        <td style="position: relative;">
	                            <div style="float: left;">
	                                <input id="fileText" value="请选择上传文件" disabled>
	                            </div>
	                            <div style="position: relative;width: 80px;height: 26px;float: left;margin-left: 2px;margin-top: -2px;">
	                                <a href="javascript:void(0)" class="a_blue" 
	                                    id="addFiles"
	                                    style="position: absolute;"
	                                    iconCls="icon-add1" tag="add"><em>浏览</em></a>
	                                <input type="file" id="file" name="file"
	                                    onmouseenter="$('#addFiles').css('background-color','rgb(230,230,230)');"
	                                    onmouseleave="$('#addFiles').css('background-color','rgb(245,245,245)');"
	                                    onchange="$('#fileText').val(this.value);$('#fileText').attr('title',this.value)"
	                                    style="position: absolute;filter: alpha(opacity=0);opacity:0;
	                                        z-index: 2;width: 62px;height: 26px;">
	                            </div>
	                        </td>
	                    </tr>
	                </table>
                </form>
            </fieldset>
            <fieldset style="width: 920px;height: 80px;">
                <legend>文件下载demo</legend>
                <table>
                    <tr style="height: 60px;" valign="middle">
                        <td align="right">文件下载：</td>
                        <td align="left">
                            <a href="javascript:void(0);" class="a_blue" onclick="downLoadFile();"><em>文件下载demo</em></a>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
    </div>
    <script type="text/javascript">
    //单附件上传示例
    function singleUpload(){
    	var data={};
    	HgUi.window({
            id:"singleFileUploadDemoWin",
            url:"/common/demo/fileDemo/toSingleUpload",
            queryParams:data,
            title:"单附件上传",width:450,height:300,
        });
    }
    //多附件上传示例
    function filesUploadDemo(){
    	var data={};
    	HgUi.window({
            id:"filesUploadDemoWin",
            url:"/common/demo/fileDemo/toFilesUpload",
            queryParams:data,
            title:"多附件上传",width:450,height:400,
        });
    }
    //关联关系的附件上传示例
    function relationFileUploadDemo(){
    	var data={};
    	HgUi.window({
            id:"relationFileUploadDemoWin",
            url:"/common/demo/fileDemo/toRelationFileUploadDemo",
            queryParams:data,
            title:"带关联关系的多附件上传",width:650,height:400,
        });
    }
    //webupload上传--该方法优点是有上传进度条,缺点是不易书写,js方法很繁复
    //该方法对应的后台及jsp页面非demo,代码请勿随意修改
    function webUploadDemo(){
    	//传递至公用附件上传页面的参数
    	var data={};
   	    HgUi.window({
   	    	id:"webUploadWin",
   	    	url:"/sys/sysFile/webUpload",
   	    	queryParams:data,
   	    	width:800,height:280,
   	    	title:"webUpload上传"
   	    });
    }
    
    //下载文件
    function downLoadFile(){
    	var url=G_CTX_PATH + '/common/demo/fileDemo/downloadFile';
    	HgUtil.open(url,null);
    }
    </script>
</body>
</html>