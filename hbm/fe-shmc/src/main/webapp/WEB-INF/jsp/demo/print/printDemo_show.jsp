<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>打印demo</title>
</head>
<body>
	<div class="easyui-layout" fit="true">
		<div data-options="region:'center',title:'打印demo',border:true" style="padding: 0px;">
			<div style="width: 900px;margin: 10px;border: 1px solid;">
                  <strong>demo内容：</strong>打印操作演示 1.整个网页打印 2.网页内选取区域打印<br/>
                  <strong>适 用 场 景：</strong>网页打印<br/>
                  <strong>使 用 说 明：</strong>一.点击网页打印,将打印整个网页信息,二.点击局部打印,将单独打印被选取区域内信息<br/>
                  <strong>注 意 事 项：</strong>详见开发手册及代码
               </div>
               <div id="area1" style="width: 900px; float: left;">
                   <fieldset>
                       <legend>局部打印区域</legend>
                         <table width="100%">
                              <tr>
                                   <td align="right">文字信息:</td>
                                   <td>
                                        待打印文本信息
                                   </td>
                              </tr>
                              <tr>
                                   <td align="right">单选复选:</td>
                                   <td>
                                        <input name="chkTest1" value="1" type="checkbox">
                                        <input name="chkTest2" value="2" type="checkbox">
                                        <input value="3" name="rdoTest3" type="radio"> 
                                        <input value="4" name="rdoTest3" type="radio"> <br> 
                                   </td>
                              </tr>
                              <tr>
                                   <td align="right">文本输入:</td>
                                   <td>
                                        <input value="" name="textTest5" type="text"> <br> 
                                   </td>
                              </tr>
                              <tr>
                                   <td align="right">文本输入:</td>
                                   <td>
                                        <input value="" name="textTest5" type="text"> <br> 
                                   </td>
                              </tr>
                              <tr>
                                   <td align="right">下拉框:</td>
                                   <td>
                                        <select name="selTest6">
                                             <option value="A">A</option>
                                             <option value="B">B</option>
                                             <option value="C">C</option>
                                        </select> 
                                   </td>
                              </tr>
                              <tr>
                                   <td align="right">文本域:</td>
                                   <td>
                                        <textarea name="textareaTest8"></textarea>
                                   </td>
                              </tr>
                              <tr>
                                   <td align="right">图片:</td>
                                   <td>
                                        <img src="${ctx}/static/custom/img/logo2.png" >
                                   </td>
                              </tr>
                         </table>
                    </fieldset>
               </div>
			<div>
                <a class="easyui-linkbutton" iconCls="icon_auto_colorful__print"  
                     onclick="printDemo.printAll();">网页打印</a>
                <a class="easyui-linkbutton" iconCls="icon_auto_colorful__print"  
                     onclick="printDemo.printTest();">局部打印</a>
            </div>
		</div>
	</div>
	<script type="text/javascript">
	var printDemo = {};
	printDemo.printAll = function(){
		window.print();
	}
	printDemo.printTest = function(){
    	//mode:popup弹窗执行打印/popClose打印执行完毕自动关闭/extraHead头信息
    	var options = { mode : 'popup', popClose : 'popup',
                extraHead : '<meta charset="utf-8" />,<meta http-equiv="X-UA-Compatible" content="IE=edge"/>' };
       //选择器可以书写多个,以英文逗号间隔,如:#area1,#area2也可以书写样式选择器
       $( "#area1" ).printArea( options );
    }
    </script>
</body>
</html>