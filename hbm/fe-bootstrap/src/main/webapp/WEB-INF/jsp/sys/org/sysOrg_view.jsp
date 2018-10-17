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
    <div data-options="region: 'center', split: true, title:'组织架构',border:false" >
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
            <div id="sysOrgSearchForm" class="hgGridSearchBar" style="height: 62px; width: 100%;display:none;" tag="queryDiv">
                <table width="100%">
                    <tr>
                        <td align="right"><span>名称：</span></td>
                        <td><input name="name" style="width: 120px;"/></td>
                        <td align="right"><span>类型：</span></td>
                        <td>
                            <input id="nodeType" name="nodeType"  style="width:120px; height:22px">
                        </td>
                        <td align="right"><span>编码：</span></td>
                        <td><input name="code" style="width: 120px;"/></td>
                        <td  rowspan="2" style="text-align: right; padding-right: 15px">
                            <a href="javascript:void(0);" class="btn btn-azure btn-sm" tag="submit"> <i class="fa fa-search"></i>搜索</a> 
                            <a href="javascript:void(0);" class="btn btn-yellow btn-sm" tag="clear"> <i class="fa fa-eraser"></i>清空</a>
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
                        <div class="btn-group">
	                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
	                            <i class="fa fa-plus"></i> 新增 <i class="fa fa-angle-down"></i>
	                        </a>
	                        <ul class="dropdown-menu">
	                            <shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_NEW_ORG%>">
	                                <li><a href="javascript:void(0);" tag="orgAdd"><i class="fa fa-star"></i>&nbsp;部门</a></li>
	                            </shiro:hasPermission>
	                            <shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_NEW_POS%>">
                                    <li><a href="javascript:void(0);" tag="posAdd"><i class="fa fa-tag"></i>&nbsp;岗位</a></li>
                                </shiro:hasPermission>
	                            <shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_NEW_GROUP%>">
                                    <li><a href="javascript:void(0);" tag="groupAdd"><i class="fa fa-group"></i>&nbsp;小组</a></li>
                                </shiro:hasPermission>
	                        </ul>
	                     </div>
                        
                        
                    <a href="javascript:void(0)" class="btn btn-success" tag="edit"><i class="fa fa-edit"></i>修改</a>
                    <a href="javascript:void(0)" class="btn btn-darkorange" tag="del"> <i class="fa fa-remove"></i>删除</a>
                    <a href="javascript:void(0)" class="btn btn-purple" tag="userList"><i class="fa fa-cog"></i>人员配置</a>
                    <shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_JOB_MANAGE%>">
                        <a href="javascript:void(0)" class="btn btn-yellow" tag="jobManage"> <i class="fa fa-wrench"></i>职务配置</a>
                    </shiro:hasPermission>
                    <a href="javascript:void(0)" class="btn btn-azure" tag="expandQuery"> <i class="fa fa-search"></i><span>展开查询</span></a>
                    
                   </td>
                    
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
    <div region="south" title="组织架构人员配置" data-options="split:true,border:false,collapsible:false,href:'${ctx}/sys/org/orgUser/view/0'" style="height:50%"></div>
</div>
<script type="text/javascript" src="${ctx}/static/js/sys/org/sysOrg_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>