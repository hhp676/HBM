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
        <div data-options="region:'north',border:false" style="padding: 4px;height: 36px;">
		    <table style="width: 100%;" >
                <tr>
                    <td align="right" width="55px;">名称：</td>
                    <td width="150px;">
                        <input id="authName" class="easyui-textbox">
                    </td>
                    <td width="65px">
                    	<a href="javascript:void(0);" onclick="chooseMainAttachAuth.searchStr();" class="btn-palegreen  btn-sm"> 
							<i class="fa fa-search"></i>定位
						</a>
                    </td>
                    <td id="treeGridShowNext" align="left" style="display:none">
                    	<a href="javascript:void(0);" onclick="chooseMainAttachAuth.showNext();" class="btn-yellow  btn-sm"> 
							<i class="fa fa-angle-down"></i>下一个
						</a>
                    </td>
                    <td>
                    </td>
                </tr>
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
		
		<div data-options="region:'south',border:false" style="text-align: right; padding: 5px 5px 5px; background-color: #f2f2f2;">
    		<a href="javascript:void(0);" class="btn btn-sky btn-sm" tag="ok"> 
				<i class="fa fa-check-square-o"></i>确认
			</a>
			<a href="javascript:void(0);" class="btn btn-warning btn-sm" tag="cancel"> 
				<i class="fa fa-close"></i>取消
			</a>
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