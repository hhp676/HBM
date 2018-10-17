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
    <div class="easyui-layout" fit=true id="sysAuth_layout">
        <div data-options="region:'center',title:'权限列表',border:false,tools:'#sysAuth_panel_toolbar'"
            style="padding: 0px;">
            <table fit=true id="sysAuth_grid" class=""
                singleSelect=true toolbar="#sysAuth_toolbar"
                fitColumns=true 
                data-options="idField: 'authId',      
                              onDblClickRow:sysAuth.sysAuthOnDblClickRow,  
                              onClickRow:sysAuth.sysAuthOnClickRow,
                              treeField:'authName', 
                              onContextMenu: sysAuth.treeContextMenu,
                              onLoadSuccess:sysAuth.authGridOnLoadSuccess">
                <thead>
                    <tr>
                        <th data-options="field:'authName',width:150">名称</th>
                        <th data-options="field:'authShowType',width:25,formatter:sysAuth.authShowTypeFormatter"
                            align="center">类型</th>
                        <th data-options="field:'authCode',width:100">编码</th>
                        <th data-options="field:'engName',width:100">英文名称</th>
                        <!--  <th data-options="field:'i18nCode',width:40">国际化编码</th> -->
                        <!-- <th data-options="field:'style',width:50">图标</th> -->
                        <th data-options="field:'uri',width:120">URI</th>
                        <!-- <th data-options="field:'tip',width:60">提示信息</th> -->
                        <th data-options="field:'descr',width:120">描述</th>
                    </tr>
                </thead>
            </table>
            <div id="sysAuth_toolbar" tag=listen_hotkey>
                <div class="hgGridSearchBar"
                    style="height: 35px; width: 100%; display: none;" tag="queryDiv">
                    <form id="sysAuthSearchForm" class="hgform">
                        <table class="hgtable" width="100%">
                            <tr>
                                <td align="right"><span>名称：</span></td>
                                <td><input style="width: 120px"
                                    name="authName"></td>
                                <td align="right"><span>类型：</span></td>
                                <td>
                                    <select id="searchAuthType" name="authShowType" class="easyui-combobox"
	                                    panelHeight='auto' editable="false" style="width: 103px;"
	                                    data-options="
								        textField: 'value',valueField: 'label',
                                                prompt: '---请选择---', 
								        data: [{label: '1',value: '模块'},{label: '2',value: '权限'}]">
                                    </select>
                                </td>
                                <td align="right"><span>编码：</span></td>
                                <td><input style="width: 130px"
                                    name="authCodeLike"></td>
                                <td align="right"><span>英文名称：</span></td>
                                <td><input style="width: 130px"
                                    name="engName"></td>
                                <td align="right"><span>URI：</span></td>
                                <td><input style="width: 130px" name="uriLike"></td>
                                <td style="text-align: right; padding-right: 15px">
                                    <a class="easyui-linkbutton" iconCls="icon-search" tag="submit">查询</a>
                                    <a class="easyui-linkbutton" iconCls="icon_clear" tag="clear">清空</a>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                <table>
                    <tr>
                        <h:hasAnyPermissions name='<%= Auths.Sys.MODEL_ADD + ","+ Auths.Sys.AUTH_ADD %>'>
	                        <td><a href="#" class="easyui-menubutton"
	                            data-options="menu:'#auth_toolbar_menu',iconCls:'icon_add1'">添加</a></td>
                        </h:hasAnyPermissions>
                        <h:hasAnyPermissions name='<%= Auths.Sys.MODEL_UPDATE +","+ Auths.Sys.AUTH_UPDATE %>'>
	                        <td><a href="javascript:void(0)" class="easyui-linkbutton"
	                            iconCls="icon_auto_colorful__editor" plain="true" tag="edit">修改</a></td>
                        </h:hasAnyPermissions>
                        <h:hasAnyPermissions name='<%= Auths.Sys.MODEL_DELETE +","+ Auths.Sys.AUTH_DELETE %>'>
	                        <td><a href="javascript:void(0)" class="easyui-linkbutton"
	                            iconCls="icon_delete" plain="true" tag="del">删除</a></td>
                        </h:hasAnyPermissions>
                        <td><div class="datagrid-btn-separator"></div></td>
                        <shiro:hasPermission name="<%= Auths.Sys.OPERATION_VIEW %>">
	                        <td><a href="javascript:void(0)" class="easyui-linkbutton"
	                            iconCls="icon_edit" plain="true" tag="oper">操作类型配置</a></td>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="<%= Auths.Sys.MENUSET_VIEW %>">
	                        <td><a href="javascript:void(0)" class="easyui-linkbutton"
	                            iconCls="icon_auto_colorful__editmenu" plain="true" tag="menuset">首页MENU配置</a></td>
                        </shiro:hasPermission>
                        <td><div class="datagrid-btn-separator"></div></td>
                        <td><a href="javascript:void(0)" class="easyui-linkbutton"
                            iconCls="icon-search" plain="true" tag="expandQuery">展开查询</a></td>
                        <td><div class="datagrid-btn-separator"></div></td>
                        <td align="right" >名称：</td>
		                <td width="130px;">
		                    <input id="authName" >
		                </td>
		                <td >
		                    <a href="javascript:void(0)" class="easyui-linkbutton"
		                           iconCls="icon-search" onclick="sysAuth.searchStr();">定位</a>
                              <label id="treeGridShowNext">
    		                        <a href="javascript:void(0)" class="easyui-linkbutton"
    		                           iconCls="icon_auto_colorful__down" onclick="sysAuth.showNext();">下一个</a>
                              </label>
		                </td>
                    </tr>
                </table>
                <div id="auth_toolbar_menu" style="width: 100px;">
                    <h:hasAnyPermissions name="<%= Auths.Sys.MODEL_ADD %>">
                        <div iconCls="icon_auto_user_man_24px" tag="modelAdd">模块</div>
                    </h:hasAnyPermissions>
                    <h:hasAnyPermissions name="<%= Auths.Sys.AUTH_ADD %>">
                        <div iconCls="icon_auto_user_center" tag="authAdd">权限</div>
                    </h:hasAnyPermissions>
                </div>
                <div id="authTreeContextMenu" class="easyui-menu"
                    style="width: 100px;">
                    <div data-options="iconCls:'icon_info'" tag="toRole">授予角色</div>
                    <div data-options="iconCls:'icon_info'" tag="toUser">授予用户</div>
                    <div data-options="iconCls:'icon_info'" tag="unUser">负授予用户</div>
                    <div data-options="iconCls:'icon_info'" tag="aboutAuth">关于本条记录</div>
                </div>
                <div id="modelTreeContextMenu" class="easyui-menu"
                    style="width: 100px;">
                    <div data-options="iconCls:'icon_info'" tag="addModel">模块新增</div>
                    <div data-options="iconCls:'icon_info'" tag="addAuth">权限新增</div>
                    <div data-options="iconCls:'icon_info'" tag="aboutModel">关于本条记录</div>
                </div>
            </div>
            <div id="sysAuth_panel_toolbar">
            	<select class="" id="sysAuth_authCategroy" editable="false" style="width: 90px;height: 16px;"
            		data-options="panelHeight:'auto',onChange:sysAuth.authCategoryOnChange">
                     <option value="1">主权限</option>
                     <option value="2">附属权限</option>
                </select>
            </div>
        </div>
        <div data-options="region:'south',split:true,border:false,title:'权限配置信息',
            href:'${ctx}/sys/sysAuthMenu/authManage_view_tabs'" style="height: 50%">
        </div>

    </div>
    <script type="text/javascript"
        src="${ctx}/static/js/sys/auth/authManage_view.js?jsTimer=${jsTimer}"></script>
</body>
</html>