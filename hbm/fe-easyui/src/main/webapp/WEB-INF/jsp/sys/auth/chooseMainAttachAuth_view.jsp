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
        <div data-options="region:'north',border:false" style="padding: 0px;height: 30px;">
		    <table style="width: 100%">
                <tr>
                    <td align="right" width="55px;">名称：</td>
                    <td align="left" width="130px">
                        <input id="authName" style="height:20px" >
                    </td>
                    <td>
                        <a href="javascript:void(0)" class="easyui-linkbutton"
                               iconCls="icon-search" onclick="chooseMainAttachAuth.searchStr();">定位</a>
	                    <label id="treeGridShowNext" style="display:none;">
                            <a href="javascript:void(0)" class="easyui-linkbutton"
                                   iconCls="icon_auto_colorful__down" onclick="chooseMainAttachAuth.showNext();">下一个</a>
                        </label>
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
    </div>
    <script type="text/javascript">
    	chooseMainAttachAuth_type = '${type}';
    	chooseMainAttachAuth_authId = '${authId}';
    </script>
    <script type="text/javascript"
        src="${ctx}/static/js/sys/auth/chooseMainAttachAuth_view.js?jsTimer=${jsTimer}"></script>
</body>
</html>