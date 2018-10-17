<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>组织岗位</title>
</head>
<body>
<div id="sysOrgTreeLayout" class="easyui-layout" fit="true">
    <div data-options="region: 'center', split: true, title:'组织架构'" >
        <table id="sysOrg_tree" data-options="url: '${ctx}/sys/org/orgTree',
               idField: 'nodeId',
               treeField: 'name',
               toolbar: '#sysOrg_toolbar',
               pagination: false,
               fit: true,
               fitColumns: true,
               singleSelect: true">
            <thead>
            <tr>
                <th data-options="field:'name',width:400">名称</th>
                <th data-options="field:'nodeType',width:150,
                    formatter:HgUtil.fieldFormatterFunc('orgNodeType')" align="center">类型</th>
                <th data-options="field:'code',width:200">编码</th>
                <th data-options="field:'engName',width:200">英文名称</th>
                <th data-options="field:'i18nCode',width:200">国际化编码</th>
            </tr>
            </thead>
        </table>
        <div id="sysOrg_toolbar" tag="listen_hotkey">
            <div id="sysOrgSearchForm" class="hgGridSearchBar" style="height: 50px; width: 100%;display:none;" tag="queryDiv">
                <table width="100%">
                    <tr>
                        <td align="right"><span>名称：</span></td>
                        <td><input name="name" style="width: 120px;"/></td>
                        <td align="right"><span>类型：</span></td>
                        <td>
                            <input id="nodeType" name="nodeType"  style="width:120px;">
                        </td>
                        <td align="right"><span>编码：</span></td>
                        <td><input name="code" style="width: 120px;"/></td>
                        <td  rowspan="2" style="text-align: right; padding-right: 15px">
                            <a class="easyui-linkbutton" iconCls="icon-search" tag="submit">查询</a>
                            <a class="easyui-linkbutton" iconCls="icon_clear" tag="clear">清空</a>
                        </td>
                    </tr>
                    <tr>
                        <td align="right"><span>英文名称：</span></td>
                        <td><input name="engName" style="width: 120px;"/></td>
                        <td align="right"><span>国际化编码：</span></td>
                        <td><input name="i18nCode" style="width: 120px;"/></td>
                    </tr>
                </table>
            </div>
            <table>
                <tr>
                    <td>
                        <a href="javascript:void(0)" class="easyui-menubutton" menu="#sysOrgTreeAddMenu" iconCls="icon_add1" plain="true" tag="add">新增</a>
                        <div id="sysOrgTreeAddMenu">
                            <shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_NEW_ORG%>">
                                <div iconCls="icon_auto_colorful__bumen" tag="orgAdd">部门</div>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_NEW_POS%>">
                                <div iconCls="icon_auto_colorful__gangwei" tag="posAdd">岗位</div>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_NEW_GROUP%>">
                                <div iconCls="icon_auto_colorful__fill" tag="groupAdd">小组</div>
                            </shiro:hasPermission>
                        </div>
                    </td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon_auto_colorful__editor" plain="true" tag="edit">修改</a></td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon_delete" plain="true" tag="del">删除</a></td>
                    <td><div class="datagrid-btn-separator"></div></td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" tag="userList">人员配置</a></td>
                    <td><div class="datagrid-btn-separator"></div></td>
                    <td>
                        <shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_JOB_MANAGE%>">
                            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon_edit" plain="true" tag="jobManage">职务配置</a>
                        </shiro:hasPermission>
                    </td>
                    <td><div class="datagrid-btn-separator"></div></td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" tag="expandQuery">展开查询</a></td>
                    
                </tr>
            </table>
            <div id="sysOrg_contextMenu" class="easyui-menu" style="width: 100px">
                <div data-options="iconCls:'icon_info'" tag="orgAdd">新增部门</div>
                <div data-options="iconCls:'icon_info'" tag="posAdd">新增岗位</div>
                <div data-options="iconCls:'icon_info'" tag="groupAdd">新增小组</div>
                <div data-options="iconCls:'icon_info'" tag="userList">人员配置</div>
                <div data-options="iconCls:'icon_info'" tag="about">关于本条</div>
            </div>
        </div>
    </div>
    <div region="south" title="组织架构人员配置" data-options="split:true,href:'${ctx}/sys/org/orgUser/view/0'" style="height: 50%"></div>
</div>
<script type="text/javascript" src="${ctx}/static/js/sys/org/sysOrg_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>