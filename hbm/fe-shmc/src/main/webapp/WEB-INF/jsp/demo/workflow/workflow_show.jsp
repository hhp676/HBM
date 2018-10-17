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
    <div class="easyui-layout" style="height: 500px;">
        <div data-options="region:'center',title:'工作流相关demo',border:false" style="padding: 0px; ">
            <div style="width: 900px;margin: 10px;border: 1px solid;">
              <strong>demo内容：</strong>发起流程<br/>
              <strong>适 用 场 景：</strong>通过key发起流程实例<br/>
              <strong>使 用 说 明：</strong>1、通过hbpm-admin发布流程定义 ；2、在此demo中选择一个流程，点击发起<br/>
              <strong>注 意 事 项：</strong>详见开发手册及代码
            </div>
             <table class="hgtable">
                <tr>
                	<td width="20px"></td>
                	<td width="100px">选择一个流程</td>
                	<td width="400px">
                        <select id="workflow_demo_def" style="width:350px">
                        	<c:if test="${defList != null }">
	                        	<c:forEach var="def" items="${defList }">
		                        	<option value="${def.key }">${def.name }-${def.key }</option>
	                        	</c:forEach>
                        	</c:if>
                        </select>
                    </td>
                    <td width="100px">
                        <a class="easyui-linkbutton" onclick="startProcessByKey()">发起流程</a>
                    </td>
                </tr>
             </table>
        </div>
    </div>
    <script type="text/javascript">
	   	function startProcessByKey(type,button){
	   		var _defKey = $("#workflow_demo_def").val();
	   		if(_defKey){
		        HgUtil.post("/common/demo/workflowDemo/startProcessByKey", {defKey:_defKey}, function(data){
		            if(data.success){
		            	HgUi.ok("发起流程成功！", function(){
		            	});
		            }else{
		            	HgUi.error("发起流程失败！"+data.data, function(){
		            	});
		            }
		        });
	   		} else {
	   			alert("请先通过hbpm-admin发布流程定义 ，然后在此demo中选择一个流程，点击发起");
	   		}
	   	}
    </script>
</body>
</html>