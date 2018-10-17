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
<div class="block_layout block_form">
        <div class="block_title">
            <h3>组合查询</h3>
            <em><a onclick="javascript:HgUi.hideShowSearch(this);" class="slide_up"></a></em>
        </div>
        <div class="block_content" >
           <form id="sysAuthSearchForm" class="hgform">
              <table cellpadding="0" cellspacing="0" class="table_form">
                   <colgroup>
                       <col style="width: 120px;" />
                       <col style="width: 240px;" />
                       <col style="width: 120px;" />
                       <col />
                   </colgroup>
                  <thead></thead>
                  <tbody>
	                  <tr>
	                      <th >名称：</th>
	                      <td><input style="width: 130px" name="authName"></td>
	                      <th >类型：</th>
	                      <td>
	                          <select id="searchAuthType" name="authShowType" class="easyui-combobox"
	                              panelHeight='auto' editable="false" style="width: 135px;">
	                              <option value="">---请选择---</option>
	                              <option value="1">模块</option>
	                              <option value="2">权限</option>
	                          </select>
	                      </td>
	                   </tr>
	                   <tr>
	                      <th >编码：</th>
	                      <td><input style="width: 130px"
	                          name="authCodeLike"></td>
	                      <th >英文名称：</th>
	                      <td><input style="width: 130px"
	                          name="engName"></td>
	                  </tr>
                      <tr>
	                      <th >URI：</th>
	                      <td><input style="width: 130px" name="uriLike"></td>
	                      <th></th>
	                      <td></td>	                                  
	                  </tr>
                  </tbody>
                  <tfoot>
                      <tr>
                          <td></td>
                          <td colspan="3">
                              <a href="javascript:void(0);" class="a_blue" tag="submit"><em>查询</em></a>
                              <a href="javascript:void(0);" class="a_green" tag="clear"><em>重置</em></a>
                          </td>
                      </tr>
                  </tfoot>
              </table>
          </form>
       </div>
</div>        
    <div class="easyui-layout" id="sysAuth_layout" style="height: 800px;">
        <div data-options="region:'center',title:'权限列表',border:true,tools:'#sysAuth_panel_toolbar',height:400,split:true"
            style="padding: 0px;">
            <table id="sysAuth_grid" class="" fit=true
                singleSelect=true toolbar="#sysAuth_toolbar"
                fitColumns=true 
                data-options="idField: 'authId',
                              scrollbarSize:0,      
                              onDblClickRow:sysAuth.sysAuthOnDblClickRow,  
                              onClickRow:sysAuth.sysAuthOnClickRow,
                              treeField:'authName', 
                              onContextMenu: sysAuth.treeContextMenu,
                              onLoadSuccess:sysAuth.authGridOnLoadSuccess,border:false,height:300" >
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
                <table class="table_form_result" id="auth_toolbar_menu">
                    <caption>
                        <h:hasAnyPermissions name="<%= Auths.Sys.MODEL_ADD %>">
                            <a href="javascript:void(0);" class="a_btn_blue" tag="modelAdd"><em>新增模块</em></a>
                        </h:hasAnyPermissions>
                        <shiro:hasPermission name="<%= Auths.Sys.AUTH_ADD %>">
                            <a href="javascript:void(0);" class="a_btn_blue" tag="authAdd"><em>新增权限</em></a>
                        </shiro:hasPermission>
                        <h:hasAnyPermissions name='<%= Auths.Sys.MODEL_UPDATE +","+ Auths.Sys.AUTH_UPDATE %>'>
                            <a href="javascript:void(0);"  class="a_btn_green" tag="edit"><em>编辑</em></a>
                        </h:hasAnyPermissions>
                        <h:hasAnyPermissions name='<%= Auths.Sys.MODEL_DELETE +","+ Auths.Sys.AUTH_DELETE %>'>
                            <a href="javascript:void(0);"  class="a_btn_red" tag="del"><em>删除</em></a>
                        </h:hasAnyPermissions>
                        <shiro:hasPermission name="<%= Auths.Sys.OPERATION_VIEW %>">
                            <a href="javascript:void(0);"  class="a_btn_green" tag="oper"><em>操作类型配置</em></a>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="<%= Auths.Sys.MENUSET_VIEW %>">
                            <a href="javascript:void(0);"  class="a_btn_green" tag="menuset"><em>首页MENU配置</em></a>
                        </shiro:hasPermission>
                        <label>名称：</label>
		                <label width="170px;">
		                    <input id="authName" >
		                </label>
		                <label width="65px">
		                    <a href="javascript:void(0)" class="a_btn_green" onclick="sysAuth.searchStr();"><em>定位</em></a>
		                </label>
		                <label id="treeGridShowNext">
		                    <a href="javascript:void(0)" class="a_btn_orange" onclick="sysAuth.showNext();"><em>下一个</em></a>
		                </label>
                   </caption>
                </table>
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
            	<select class="" id="sysAuth_authCategroy" editable="false" style="width: 90px;height: 20px;"
            		data-options="panelHeight:'auto',onChange:sysAuth.authCategoryOnChange">
                     <option value="1">主权限</option>
                     <option value="2">附属权限</option>
                </select>
            </div>
        </div>
        <div data-options="region:'south',split:true,border:true,title:'权限配置信息',
            href:'${ctx}/sys/sysAuthMenu/authManage_view_tabs'" style="height: 400px">
        </div>

    </div>
    <script type="text/javascript"
        src="${ctx}/static/js/sys/auth/authManage_view.js?jsTimer=${jsTimer}"></script>
</body>
</html>