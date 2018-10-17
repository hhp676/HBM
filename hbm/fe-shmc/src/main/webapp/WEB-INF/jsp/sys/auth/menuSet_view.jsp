<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页MENU配置</title>

</head>
<body>
    <div class="easyui-layout" fit=true id="menu_layout">
        <div data-options="region:'center',border:false" style="padding: 0px;">
            <table fit=true id="menu_grid" class="easyui-treegrid"
                singleSelect=true toolbar="#menu_toolbar" showFooter=true
                fitColumns=true
                data-options="url: '${ctx}/sys/sysAuthMenu/treeList',
                              idField: 'authId',      
                              treeField:'authName'
                              ">
                <thead>
                    <tr>
                        <th data-options="field:'authName',width:50">菜单名称</th>
                        <th data-options="field:'authCode',width:50">菜单编码</th>
                        <th data-options="field:'isBsTopMenu',width:20,formatter:function(value){return HgUtil.getDictItemName('trueOrFalse',value);},
                            editor:{type:'combobox',options:{prompt: '---请选择---',data:logicMap,textField:'itemName',
                            valueField:'itemValue',editable:false,panelHeight:'auto'}}">顶部菜单</th>
                        <th data-options="field:'isBsSubMenu',width:20,formatter:function(value){return HgUtil.getDictItemName('trueOrFalse',value);},
                            editor:{prompt: '---请选择---',type:'combobox',options:{data:logicMap,textField:'itemName',
                            valueField:'itemValue',editable:false,panelHeight:'auto'}}">左侧菜单</th>
                        <shiro:hasPermission name="<%= Auths.Sys.MENUSET_UPDATE %>">
                            <th data-options="field:'authId',width:30,formatter:sysMenuSet._format_edit" align="center">操作</th>
                        </shiro:hasPermission>
                    </tr>
                </thead>
            </table>
            <div id="menu_toolbar">
                <div class="hgGridSearchBar" style="height: 30px; width: 100%;">
                    <form id="menusetSearchForm">
                        <table class="table_form_result">
                            <caption>
                                <label>名称：</label>
                                <label>
                                    <input style="width: 130px"
                                        name="authName" id="menusetSearchAuthName" >
                                 </label>
                                <label>模块层级：</label>
                                <select class="easyui-combobox" panelHeight='auto' 
                                    id="fidlevel" name="fid" style="width: 133px;"data-options="
                                       editable:false,
                                       textField: 'value',valueField: 'label', 
                                       prompt: '---请选择---',
                                       data: [{label: '1',value: '一级'},{label: '2',value: '二级'},{label: '3',value: '三级'}]">
                                </select>
	                            <a href="javascript:void(0);" class="a_btn_blue" onclick="sysMenuSet._search();"><em>查询</em></a>
	                            <a href="javascript:void(0);"  class="a_btn_green" onclick="sysMenuSet._clear();"><em>重置</em></a>
                            </caption>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var logicMap = HgUtil.getDictItemMap ('trueOrFalse');
    </script>
    <script type="text/javascript"
        src="${ctx}/static/js/sys/auth/menuSet_view.js?jsTimer=${jsTimer}"></script>
    <style type="text/css">
	 .table_form_result caption a, .table_form_result caption input {
		margin-right: 0px;
	}  
</style>
</body>
</html>