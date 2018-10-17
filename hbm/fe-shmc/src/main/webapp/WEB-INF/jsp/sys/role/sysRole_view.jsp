<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SysRole</title>
</head>
<body>
            <table singleSelect=true  id="sysRole_grid" fitColumns=true
                toolbar="#sysRole_toolbar" pagination="true"
                pageSize="${defaultPageSize}" pageList="${defaultPageList}"
                data-options="url:'${ctx}/sys/sysRole/list',title:'角色管理',width:'100%',scrollbarSize:0">
                <thead>
                    <tr>
                        <th data-options="field:'roleId',width:160,hidden:true" >主键</th>
                        <th data-options="field:'roleName',width:120"
                            editor="{type:'textbox',options:{required:true,missingMessage:'此输入项为必填项',validType:['length[1,120]']}}">角色名称</th>
                        <th data-options="field:'roleCode',width:120"
                            editor="{type:'textbox',options:{required:true,missingMessage:'此输入项为必填项',validType:['length[1,60]']}}">角色代码</th>
                        <th data-options="field:'descr',width:200"
                            editor="{type:'textbox',options:{required:true,missingMessage:'此输入项为必填项',validType:['length[1,200]']}}">描述</th>
                        <th data-options="field:'isFinal',width:120,formatter:function(value){return HgUtil.getDictItemName('trueOrFalse',value);}"
                            editor="{type:'combobox',options:{prompt: '---请选择---',url:'${ctx}/sys/common/sysDict/itemList/trueOrFalse',textField:'itemName',valueField:'itemValue', panelHeight:'auto',mode:'remote',editable:false}}"
                            align="center">是否锁定</th>

                    </tr>
                </thead>
            </table>
            <div id="sysRole_toolbar" tag=listen_hotkey>
                <table class="table_form_result">
                    <caption>
                        <shiro:hasPermission name="<%= Auths.Sys.ROLE_ADD %>">
                          <a href="javascript:void(0)" class="a_btn_blue" tag="add"><em>新建</em></a>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="<%= Auths.Sys.ROLE_UPDATE %>">
                            <div style="display: none"><a href="javascript:void(0)" tag="update"><em>修改</em></a></div>
                        </shiro:hasPermission>
                        <h:hasAnyPermissions name='<%= Auths.Sys.ROLE_ADD + "," + Auths.Sys.ROLE_UPDATE %>'>
                            <a href="javascript:void(0)" class="a_btn_green" tag="save"><em>保存</em></a>
                        </h:hasAnyPermissions>
                        <shiro:hasPermission name="<%= Auths.Sys.ROLE_DELETE %>">
                        <a href="javascript:void(0)" class="a_btn_red" tag="del"><em>删除</em></a>
                        </shiro:hasPermission>

                        <a href="javascript:void(0)" class="a_btn_orange" tag="undo"><em>撤销</em></a>
                        </td>
                        <a class="a_btn_gray" tag="clear"><em>清空查询</em></a>
                    </caption>
                </table>
            </div>
        <div class="easyui-panel" data-options="split:true,border:true,title:'角色配置信息',width:'100%'" style="height: 500px;">
            <div id="sysRoleView_tabs" class="easyui-tabs" style="height:100%;">
                <shiro:hasPermission name="<%= Auths.Sys.ROLE_AUTH_VIEW %>">
                <div title="角色权限" style="padding: 0px; display: none;">
                    <div id="sysRoleAuthView" class="easyui-panel" fit=true  data-options="href:'${ctx}/sys/sysRole/sysRoleAuthView',border:false"></div>
                </div>
                </shiro:hasPermission>
                
                <shiro:hasPermission name="<%= Auths.Sys.ROLE_USER_VIEW %>">
                <div title="授权用户" style="padding: 0px; display: none;height:100%;">
                    <%@ include file="./sysRoleUser_view.jsp" %>
                </div>
                </shiro:hasPermission>
            </div>
        </div>

    <script type="text/javascript"
        src="${ctx}/static/js/sys/role/sysRole_view.js?jsTimer=${jsTimer}"></script>
</body>
</html>