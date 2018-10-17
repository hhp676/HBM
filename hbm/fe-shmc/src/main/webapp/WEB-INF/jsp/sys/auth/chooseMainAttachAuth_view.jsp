<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限管理</title>
</head>
<body>
      <div class="easyui-layout" data-options="fit:true" id="chooseMainAttachAuth_layout">
        <div data-options="region:'north',border:false" style="padding: 0px;height: 38px;">
		    <table class="table_form_result">
                    <caption>
                            名称：
                    
                        <input id="authName" >
                    
                    
                        <a href="javascript:void(0)" class="a_btn_green"
                              onclick="chooseMainAttachAuth.searchStr();"><em>定位</em></a>
                    
                    <span id="treeGridShowNext"  style="display:none">
                        <a href="javascript:void(0)" class="a_btn_orange" 
                               onclick="chooseMainAttachAuth.showNext();"><em>下一个</em></a>
                    </span>
                </caption>
                </table>
        </div>
		<div data-options="region:'center',border:false" style="padding: 0px;">
			<table id="chooseMainAttachAuth_grid" class="easyui-treegrid" 
					fit=true fitColumns=true 
					data-options="idField:'authId',treeField:'authName',cascadeCheck:true">
				<thead>
					<tr>
						<th data-options="field:'authName',width:150">名称</th>
						<th data-options="field:'authCode',width:80">编码</th>
                   		<th data-options="field:'uri',width:120">URI</th>
               			<th data-options="field:'descr',width:100">描述</th>
					</tr>
				</thead>
			</table>
		</div>
    </div>
    <script type="text/javascript">
    	chooseMainAttachAuth_type = '${type}';
    	chooseMainAttachAuth_authId = '${authId}';
    </script>
    <script type="text/javascript"
        src="${ctx}/static/js/sys/auth/chooseMainAttachAuth_view.js?jsTimer=${jsTimer}"></script>
</body>
</html>