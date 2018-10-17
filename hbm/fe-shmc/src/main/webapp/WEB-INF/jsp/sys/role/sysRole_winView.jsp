<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色列表</title>
</head>
<body>
    <div id="sysRoleWinListLayout" class="easyui-layout" fit=true>
        <div region="center">
            <table singleSelect="${singleSelect }" fit=true id="sysRoleWinList_grid"
                pagination="true" fitColumns=true toolbar="#sysRoleWinList_toolbar"
                pagination="false" pageSize="${defaultPageSize}"
                pageList="${defaultPageList}"
                data-options="url:'${ctx}/sys/sysRole/winList'">
                <thead>
                    <tr>
                        <th data-options="field:'roleId',checkbox:true"></th>
                        <th data-options="field:'roleName',width:120">角色名称</th>
                        <th data-options="field:'roleCode',width:120">角色代码</th>
                        <th data-options="field:'descr',width:200">描述</th>
                    </tr>
                </thead>
            </table>
            <div id="sysRoleWinList_toolbar" tag="listen_hotkey">
            	<table>
				      <tr>
				       		<td><a  class="easyui-linkbutton" iconCls="icon_clear" plain="true" tag="clear1">清空查询</a></td>
				       </tr>
			    </table>
                <div class="hgGridSearchBar"
                    style="height: 35px; width: 100%;  display: none;" tag="queryDiv">
                    <form id="sysRoleWinListSearchForm">
                        <table width="100%">
                            <tr>
                                <td width="60px" align="right"><span>角色名称：</span></td>
                                <td width="80px"><input style="width: 80px"
                                    name="roleName"></td>
                                <td width="60px" align="right"><span>角色代码：</span></td>
                                <td width="80px"><input style="width: 80px"
                                    name="roleCode"></td>
                                <td style="text-align: right; padding-right: 15px"><a
                                    class="easyui-linkbutton" iconCls="icon-search" tag="submit">查询</a><a
                                    class="easyui-linkbutton" iconCls="icon_clear" tag="clear">清空</a>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
        <div data-options="region:'south',border:false" style="text-align: right; padding: 10px 10px 10px; background-color: #dfe4ec;">
	        <a href="javascript:void(0);" class="a_blue" tag="ok"><em>提交</em></a>
	        <a href="javascript:void(0);" class="a_gray" tag="cancel"><em>关闭</em></a>
	    </div>
        
    </div>
    <script type="text/javascript"
        src="${ctx}/static/js/sys/role/sysRole_winView.js?jsTimer=${jsTimer}"></script>
</body>

</html>