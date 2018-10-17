<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="easyui-layout" fit=true>
        <div region="west" style="width: 680px;" title="系统字典组" data-options="split:true" >
            <table singleSelect=true fit=true id="datagroup_grid" 
                fitColumns=true toolbar="#datagroup_toolbar" pagination="true"
                pageSize="${defaultPageSize}" pageList="${defaultPageList}"
                data-options="url:'${ctx}/sys/sysDict/groupList'">
                <thead>
                    <tr>
                        <th data-options="field:'dictGroupCode',width:100" sortable="true" editor="{type:'textbox',options:{required:true,missingMessage:'此输入项为必填项',validType:'length[1,60]'}}">字典组编码</th>
                        <th data-options="field:'groupName',width:150" sortable="true" editor="{type:'textbox',options:{required:true,missingMessage:'此输入项为必填项',validType:'length[1,100]'}}">字典组名称</th>
                        <th data-options="field:'descr',width:200" editor="{type:'textbox',options:{validType:'length[1,200]'}}">描述</th>
                    </tr>
                </thead>
            </table>
            <div id="datagroup_toolbar" tag=listen_hotkey>
                <table>
                    <tr>
                        <shiro:hasPermission name="<%= Auths.Sys.DICT_GROUP_ADD %>">
	                        <td><a href="javascript:void(0)" class="easyui-linkbutton"
	                            iconCls="icon_add1" plain="true" tag="add">新建</a></td>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="<%= Auths.Sys.DICT_GROUP_UPDATE %>">
			                <td style="display: none"><a href="javascript:void(0)"
			                    iconCls="icon_add1" plain="true" tag="update">修改</a></td>
		            	</shiro:hasPermission>
		            	<h:hasAnyPermissions name='<%= Auths.Sys.DICT_GROUP_ADD + "," + Auths.Sys.DICT_GROUP_UPDATE %>'>
	                        <td><a href="javascript:void(0)" class="easyui-linkbutton"
	                            iconCls="icon_save1" plain="true" tag="save">保存</a></td>
		            	</h:hasAnyPermissions>
                        <shiro:hasPermission name="<%= Auths.Sys.DICT_GROUP_DELETE %>">
	                        <td><a href="javascript:void(0)" class="easyui-linkbutton"
	                            iconCls="icon_delete" plain="true" tag="del">删除</a></td>
                        </shiro:hasPermission>
                        <td><a href="javascript:void(0)" class="easyui-linkbutton"
                            data-options="iconCls:'icon_undo',plain:true" tag="undo">撤销</a></td>
                        <td><div class="datagrid-btn-separator"></div></td>
                        <td><a class="easyui-linkbutton" iconCls="icon_clear" plain="true" tag="clear">清空查询</a></td>

                    </tr>
                </table>
            </div>
        </div>
        <div region="center" title="系统字典项" data-options="" href="${ctx}/sys/sysDict/item/view">
        </div>
    </div>
	<script type="text/javascript" src="${ctx}/static/js/sys/dict/sysDict_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>