<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>约束管理</title>
</head>
<body>
    <div class="easyui-layout" fit=true>
        <div region="center" title="约束定义" data-options="split:true">
            <table singleSelect=true fit=true id="sysMetaConstraint_grid"
                   fitColumns=true toolbar="#sysMetaConstraint_toolbar" rownumbers="true" pagination="true"
                   pageSize="${defaultPageSize}" pageList="${defaultPageList}"
                   data-options="">
                <thead>
                <tr>
                    <th data-options="field:'metaEntity.entityName',width:150" sortable="true"
                        editor="{type:'combogrid',options:{disabled:true,required:true,panelWidth:300,fitColumns:true, idField:'entityId',textField:'entityName',
                        editable:false, mode:'remote', missingMessage:'此输入项为必填项'}}">实体名称</th>
                    <th data-options="field:'defCode',width:150" sortable="true"
                        editor="{type:'textbox',options:{required:true,validType:{length:[1,30]},missingMessage:'此输入项为必填项'}}">约束编码</th>
                    <th data-options="field:'defName',width:150" sortable="true"
                        editor="{type:'textbox',options:{required:true,validType:{length:[1,30]},missingMessage:'此输入项为必填项'}}">约束名称</th>
                    <th data-options="field:'errorMsg',width:300" editor="{type:'textbox',options:{validType:{length:[0,60]}}}">错误提示</th>
                </tr>
                </thead>
            </table>
            <div id="sysMetaConstraint_toolbar" tag=listen_hotkey>
                <table>
                    <tr>
                        <td>
                            <shiro:hasPermission name="<%= Auths.Sys.CONSTRAINT_DEF_ADD %>">
                                <a href="javascript:void(0);" class="btn btn-primary" tag="add"><i class="fa fa-plus"></i>新建</a>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="<%= Auths.Sys.CONSTRAINT_DEF_UPDATE %>">
                                <a href="javascript:void(0);" style="display:none" tag="update"><i class="fa fa-plus"></i>修改</a>
                            </shiro:hasPermission>
                            <h:hasAnyPermissions name='<%= Auths.Sys.CONSTRAINT_DEF_ADD + "," + Auths.Sys.CONSTRAINT_DEF_UPDATE %>'>
                                <a href="javascript:void(0);" class="btn btn-success" tag="save"><i class="fa fa-save"></i>保存</a>
                            </h:hasAnyPermissions>
                            <shiro:hasPermission name="<%= Auths.Sys.CONSTRAINT_DEF_DEL %>">
                                <a href="javascript:void(0);" class="btn btn-darkorange" tag="del"><i class="fa fa-remove"></i>删除</a>
                            </shiro:hasPermission>
                            <a href="javascript:void(0);" class="btn btn-azure" tag="undo"><i class="fa fa-mail-reply"></i>撤销</a>
                            <a href="javascript:void(0);" class="btn btn-yellow" tag="clear"><i class="fa fa-eraser"></i>清空查询</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div region="south" title="约束字段" data-options="height:'240px',split:true,hideCollapsedContent:false,collapsible:true"
             href='${ctx}/sys/meta/constraintDetailView'>
        </div>
    </div>
    <script type="text/javascript" src="${ctx}/static/js/sys/metadata/constraint_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>