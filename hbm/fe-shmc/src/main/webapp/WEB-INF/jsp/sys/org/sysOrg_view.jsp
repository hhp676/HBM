<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>组织岗位</title>
</head>
<body>
<div class="block_layout block_form">
        <div class="block_title">
            <h3>组合查询</h3>
            <em><a onclick="javascript:HgUi.hideShowSearch(this);" class="slide_up"></a></em>
        </div>
        <div class="block_content" id="sysOrgSearchForm">
             <form class="hgform">
                <table cellpadding="0" cellspacing="0" class="table_form">
                    <colgroup>
	                    <col style="width: 120px;" />
	                    <col style="width: 240px;" />
	                    <col style="width: 120px;" />
	                    <col />
	                </colgroup>
	                <thead></thead>
	                <tfoot>
	                    <tr>
	                        <td></td>
	                        <td colspan="3">
	                            <a href="javascript:void(0);" class="a_blue" tag="submit"><em>查询</em></a>
	                            <a href="javascript:void(0);" class="a_green" tag="clear"><em>重置</em></a>
	                        </td>
	                    </tr>
	                </tfoot>
	                <tbody>
	                    <tr>
	                        <th>名称：</th>
	                        <td><input name="name" style="width: 120px;"/></td>
	                        <th>类型：</th>
	                        <td><input id="nodeType" name="nodeType"  style="width:126px;"></td>
	                    </tr>
	                    <tr>
	                        <th>编码：</th>
                            <td><input name="code" style="width: 120px;"/></td>
                            <th>英文名称：</th>
                            <td><input name="engName" style="width: 120px;"/></td>
	                    </tr>
	                    <tr>
	                        <th>国际化编码：</th>
                            <td><input name="i18nCode" style="width: 120px;"/></td>
	                    </tr>
                    </tbody>
                </table>
             </form>
        </div>
</div>
<div id="sysOrgTreeLayout" class="" style="">
    <div class="easyui-panel" data-options="border:true,split:true,title:'组织结构',height:'500px'">
        <table id="sysOrg_tree" toolbar="#sysOrg_toolbar"
        data-options="url: '${ctx}/sys/org/orgTree',
               idField: 'nodeId',
               treeField: 'name',
               pagination: false,
               fit: true,
               fitColumns: true,
               scrollbarSize:0,
               border:false,
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
            <table class="table_form_result">
                <caption>
                   <shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_NEW_ORG%>">
                       <a href="javascript:void(0);" class="a_btn_blue" tag="orgAdd"><em>新增部门</em></a>
                   </shiro:hasPermission>
                   <shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_NEW_POS%>">
                       <a href="javascript:void(0);" class="a_btn_blue" tag="posAdd"><em>新增岗位</em></a>
                   </shiro:hasPermission>
                   <shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_NEW_GROUP%>">
                       <a href="javascript:void(0);" class="a_btn_blue" tag="groupAdd"><em>新增小组</em></a>
                   </shiro:hasPermission>
                   <a href="javascript:void(0);"  class="a_btn_green" tag="edit"><em>编辑</em></a>
                   <a href="javascript:void(0);"  class="a_btn_red" tag="del"><em>删除</em></a>
                    <shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_JOB_MANAGE%>">
                        <a href="javascript:void(0);"  class="a_btn_green" tag="jobManage"><em>职务配置</em></a>
                    </shiro:hasPermission>
                </caption>
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
    <div class="easyui-panel easyui-panel-south"  title="组织架构人员配置" data-options="height: 400,split:true,href:'${ctx}/sys/org/orgUser/view/0'"></div>
</div>
<script type="text/javascript" src="${ctx}/static/js/sys/org/sysOrg_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>