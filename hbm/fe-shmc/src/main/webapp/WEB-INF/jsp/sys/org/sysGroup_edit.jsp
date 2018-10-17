<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>小组管理</title>
</head>
<body>
<div id="sysGroupLayout" class="easyui-layout" fit="true">
    <div data-options="region:'center'" style="padding: 10px 10px 10px 20px;">
        <form id="sysGroupForm" method="post" name="sysGroupForm" style="height: 100%; width: 100%" class="hgform">
            <input type="hidden" name="groupId" value="${group.groupId}">
            <table class="hgtable  table_form" cellpadding="0" cellspacing="0">
                <tr>
                    <th width="75px" >所在部门：</th>
                    <td width="180px">
                        <select id="orgId" name="orgId" class="easyui-combotree" 
                            panelHeight='auto' panelMaxHeight="300" style="width:149px;"   
                            data-options="url:'${ctx}/sys/org/getOrgTree'"></select>
                        <%-- <input type="text" name="orgName" class="easyui-textbox" disabled="disabled" value="${group.sysOrganization.orgName}">
                        <input type="hidden" name="orgId" value="${group.orgId}"> --%>
                    </td>
                    <th width="70px" ><font>*</font>小组名称：</th>
                    <td width="180px">
                        <input type="text" name="groupName" class="easyui-textbox" value="${group.groupName}" style="width:149px;">
                    </td>
                </tr>
                <tr>
                    <th ><font>*</font>小组编码：</th>
                    <td>
                        <input type="text" name="groupCode" class="easyui-textbox" value="${group.groupCode}" style="width:149px;">
                    </td>
                    <th >英文名称：</th>
                    <td>
                        <input type="text" name="engName" class="easyui-textbox" value="${group.engName}" style="width:149px;">
                    </td>
                </tr>
                <tr>
                    <th >国际化编码：</th>
                    <td>
                        <input type="text" name="i18nCode" class="easyui-textbox" value="${group.i18nCode}" style="width:149px;">
                    </td>
                    <th></th>
                    <td></td>
                </tr>
                <tr>
                    <th >描述：</th>
                    <td colspan="3">
                        <textarea name="descr"  multiline="true" 
                            style="height:70px;width:420px;" >${group.descr}</textarea>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'south',border:false" style="text-align: right; padding: 5px 5px 5px; background-color: #e0e0e0;">
        <div class="block_pop_foot">
            <a href="javascript:void(0)" class="a_blue" rel="close" tag="ok"><em>提交</em></a>
            <a href="javascript:void(0)" class="a_gray" rel="close" tag="cancel"><em>取消</em></a>
        </div>
    </div>
</div>
<script type="text/javascript">
  var orgId = '${group.orgId}';
  var formUrl = '${formUrl}';
</script>
<script type="text/javascript" src="${ctx}/static/js/sys/org/sysGroup_edit.js?jsTimer=${jsTimer}"></script>
</body>

</html>