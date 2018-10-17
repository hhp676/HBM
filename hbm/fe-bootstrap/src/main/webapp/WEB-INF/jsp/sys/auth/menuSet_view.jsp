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
                        <th data-options="field:'isBsTopMenu',width:30,formatter:function(value){return HgUtil.getDictItemName('trueOrFalse',value);},
                            editor:{type:'combobox',options:{prompt: '---请选择---',data:logicMap,textField:'itemName',
                            valueField:'itemValue',editable:false,panelHeight:'auto'}}">顶部菜单</th>
                        <th data-options="field:'isBsSubMenu',width:30,formatter:function(value){return HgUtil.getDictItemName('trueOrFalse',value);},
                             editor:{prompt: '---请选择---',type:'combobox',options:{data:logicMap,textField:'itemName',
                            valueField:'itemValue',editable:false,panelHeight:'auto'}}">左侧菜单</th>
                        <shiro:hasPermission name="<%= Auths.Sys.MENUSET_UPDATE %>">
                            <th data-options="field:'authId',width:30,formatter:sysMenuSet._format_edit">操作</th>
                        </shiro:hasPermission>
                    </tr>
                </thead>
            </table>
            <div id="menu_toolbar">
                <div class="hgGridSearchBar" style="height: 30px; width: 100%;">
                    <form id="menusetSearchForm">
                        <table width="100%">
                            <tr>
                                <td width="60px" align="right"><span>名称：</span></td>
                                <td width="130px">
                                	<input style="width: 130px" name="authName" class="easyui-textbox" id="menusetSearchAuthName"/>
                                </td>
                                <td width="60px" align="right"><span>模块层级：</span></td>
                                <td width="130px">
	                                <select class="easyui-combobox" panelHeight='auto' 
	                                    id="fidlevel" name="fid" style="width: 133px;"data-options="
                                        editable:false,
                                        textField: 'value',valueField: 'label', 
                                        prompt: '---请选择---',
                                        data: [{label: '1',value: '一级'},{label: '2',value: '二级'},{label: '3',value: '三级'}]">
	                                </select></td>
                                <td width="130px" style="padding-left: 20px">
                                	<a href="javascript:void(0);" class="btn btn-azure btn-sm" tag="submit" onclick="sysMenuSet._search();"> 
										<i class="fa fa-search"></i>查询
									</a>
									<a href="javascript:void(0);" class="btn btn-yellow btn-sm" tag="clear" onclick="sysMenuSet._clear();"> 
										<i class="fa fa-eraser"></i>清空
									</a>
                               </td>
                            </tr>
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
</body>
</html>