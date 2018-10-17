<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>邮件相关demo</title>
</head>
<body>
    <div class="easyui-layout" fit=true>
        <div data-options="region:'center',title:'邮件相关demo',border:false" style="padding: 0px; ">
            <div style="width: 900px;margin: 10px;border: 1px solid;">
              <strong>demo内容：</strong>富文本邮件发送,模版邮件发送<br/>
              <strong>适 用 场 景：</strong>邮件发送<br/>
              <strong>使 用 说 明：</strong>[普通邮件发送]为普通邮件发送,[模版邮件发送]freemaker模版套用邮件发送<br/>
              <strong>注 意 事 项：</strong>详见开发手册及代码
            </div>
             <form id="mailForm" class="hgform">
                 <input type="hidden" id="mailBody" name="mailBody">
	             <table width="100%" class="hgtable">
	                <tr>
	                    <td colspan="2" style="padding-left: 20px;">
	                        <a href="javascript:void(0);" class="btn btn-success" onclick="sendMail(this);" ><i class="fa fa-send"></i>普通邮件发送</a>
	                        <a href="javascript:void(0);" class="btn btn-success" onclick="sendTempleteMail(this);" ><i class="fa fa-send"></i>模版邮件发送</a>
	                        <!-- 模版套用,是将预先准备的值,填入到freemaker的模版中进行发送,常适用于后台短信发送 -->
	                    </td>
	                </tr>
	                <tr>
	                    <th width="100px;" align="right">收件人：</th>
	                    <td>
	                        <input type="text" id="receiver" name="receiver" style="width: 80%">
	                    </td>
	                </tr>
	                <tr>
	                    <th align="right">主题：</th>
	                    <td>
	                        <input type="text" id="subject" name="subject" style="width: 80%">
	                    </td>
	                </tr>    
	             </table>
             </form>
             <div>
                <script id="mailBodyUeditor" type="text/plain" style="width:1024px;height:300px;"></script>
             </div>
        </div>
    </div>
    <script type="text/javascript">
    //发送普通邮件
    function sendMail(button){
    	//按钮置灰
    	_sendMail('0',button);
    }
    
   	//使用模版,发送邮件
    function sendTempleteMail(button){
    	//按钮置灰
    	_sendMail('1',button);
    }
   	
   	function _sendMail(type,button){
        var receiver = $("#mailForm #receiver").val();
        if($.trim(receiver)==''){
        	  HgUi.error("收件人地址不能为空!");
            return false;
        }
   	   //获取富文本编辑器,将值写入到form内的隐藏input框
        $("#mailBody").val(UE.getEditor('mailBodyUeditor').getContent());
        var data=$("#mailForm").serialize()+'&type='+type;
        //当前案例发送的邮件,未添加附件,
        HgUtil.post("/common/demo/mail/sendMail", data, function(data){
	    	//按钮恢复可用
            if(data.success){
            	HgUi.ok("邮件发送成功", function(){
            		//TODO
            	});
            }else{
            	HgUi.error("邮件发送失败!"+data.data, function(){
            		//TODO
            	});
            }
        });
        //如有添加附件请使用$.ajaxFileUpload方法,附件先暂存到临时目录再进行提交,--邮件的附件只能添加服务器本地的文件
   	}
    
    //必须使用延时加载方式,不然easyui的样式冲突,
    setTimeout(function(){
    	//先销毁,再创建,解决第二次打开页面时,不能成功创建的问题
        UE.delEditor('mailBodyUeditor');
       //实例化编辑器
       //创建全量的工具栏编辑器,工具栏配置项可以参考ueditor.config.js,已手动备注各属性含义,yyzh整理
       UE.getEditor('mailBodyUeditor',{
           //禁掉插入图片功能,reason:图片的回显地址邮件发送出去后会失败
           toolbars:[['fullscreen',//全屏
                      'source', '|',//源代码
                      'undo', //撤销
                      'redo',//重做
                      'link', //链接
                      'unlink', //取消链接
                      '|','bold',//加粗
                      'italic', //斜体
                      'underline',//下划线
                      'fontborder',//字符边框
                      'strikethrough',//删除线
                      'superscript', //上标
                      'subscript', //下标
                      'removeformat',//清除格式
                      'formatmatch',//格式刷
                      'autotypeset', //自动排版
                      'blockquote', //引用
                      'pasteplain', //纯文本粘贴模式
                      '|', 'forecolor',//字体颜色
                      'backcolor',//背景色
                      'insertorderedlist',//有序列表
                      'insertunorderedlist',//无序列表
                      'selectall',//全选
                      'cleardoc',//清空文档
                      '|','rowspacingtop',//段前距
                      'rowspacingbottom', //段后距
                      'lineheight', //行间距
                      'pagebreak',//分页
                      '|','directionalityltr',//从左向右输入
                      'directionalityrtl', //从右向左输入
                      'indent', //首行缩进
                      '|', 'touppercase',//字母大写
                      'tolowercase',//字母小写
                      '|','customstyle',//自定义标题
                      'paragraph', //段落格式
                      'fontfamily', //字体
                      'fontsize', //字号
                      '|','justifyleft',//居左对齐
                      'justifycenter', //居中对齐
                      'justifyright', //居右对齐
                      'justifyjustify',//两端对齐
                      /* 禁掉插入图片功能,reason:图片的回显地址邮件发送出去后会失败
                      '|','simpleupload',//单图上传
                      'imagenone',//默认
                      'imageleft',//左浮动
                      'imageright',//右浮动
                      'imagecenter',//居中 */
                      '|','horizontal',//分隔线
                      'date',//日期
                      'time',//时间
                      'spechars', //特殊字符
                      '|','inserttable', //插入表格
                      'deletetable',//删除表格
                      'insertparagraphbeforetable',//"表格前插入行"
                      'insertrow',//插入行
                      'deleterow',//删除行
                      'insertcol', //插入列
                      'deletecol',//删除列
                      'mergecells',//合并单元格
                      'mergeright', //右合并单元格
                      'mergedown',//下合并单元格
                      'splittocells',//完全拆分单元格
                      'splittorows',//拆分成行
                      'splittocols',//拆分成列
                      '|','print', //打印
                      'preview', //预览
                      'drafts' // 从草稿箱加载
           ]],
           maximumWords:500//设定最大可输入字符数
       });
    }, 100);
    </script>
</body>
</html>