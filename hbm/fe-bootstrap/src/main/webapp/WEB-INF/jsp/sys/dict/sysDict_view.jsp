<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
      <div class="easyui-layout easyui-datagrid-layout" fit=true>
        <div region="north" style="height: 55%;" title="系统字典组" data-options="split:true,collapsible:false" >
            <table singleSelect=true fit=true id="datagroup_grid" 
                fitColumns=true toolbar="#datagroup_toolbar" pagination="true"
                pageSize="${defaultPageSize}" pageList="${defaultPageList}"
                data-options="url:'${ctx}/sys/sysDict/groupList',border:false">
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
                        <td>
                        <shiro:hasPermission name="<%= Auths.Sys.DICT_GROUP_ADD %>">
                            <a href="javascript:void(0)" class="btn btn-primary"
                                  tag="add"><i class="fa fa-plus"></i>新建</a> 
                        </shiro:hasPermission>
                        <shiro:hasPermission name="<%= Auths.Sys.DICT_GROUP_UPDATE %>">
                            <div style="display: none"><a href="javascript:void(0)"  tag="update"><i class="fa fa-plus"></i>修改</a></div>
                        </shiro:hasPermission>
                        <h:hasAnyPermissions name='<%= Auths.Sys.DICT_GROUP_ADD + "," + Auths.Sys.DICT_GROUP_UPDATE %>'>
                            <a href="javascript:void(0)" class="btn btn-success" tag="save"><i class="fa fa-save"></i>保存</a>
                        </h:hasAnyPermissions>
                        <shiro:hasPermission name="<%= Auths.Sys.DICT_GROUP_DELETE %>">
                            <a href="javascript:void(0)" class="btn btn-darkorange" tag="del"><i class="fa fa-remove"></i>删除</a>
                        </shiro:hasPermission>
                        <a href="javascript:void(0)" class="btn btn-azure" tag="undo"><i class="fa fa-mail-reply"></i>撤销</a>
                        <a class="btn btn-yellow" tag="clear"><i class="fa fa-eraser"></i>清空查询</a>
                        </td>
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