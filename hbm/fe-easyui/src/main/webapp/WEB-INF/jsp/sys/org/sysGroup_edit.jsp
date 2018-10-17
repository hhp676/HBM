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
            <table style="width: 100%" class="hgtable">
                <tr>
                    <td width="70px" align="right">所在部门：</td>
                    <td width="140px">
                        <select id="orgId" name="orgId" class="easyui-combotree" 
                            panelHeight='auto' panelMaxHeight="300" style="width:148px;"   
                            data-options="url:'${ctx}/sys/org/getOrgTree'"></select>
                        <%-- <input type="text" name="orgName" class="easyui-textbox" disabled="disabled" value="${group.sysOrganization.orgName}">
                        <input type="hidden" name="orgId" value="${group.orgId}"> --%>
                    </td>
                    <td width="80px" align="right">小组名称<font>*</font>：</td>
                    <td width="150px">
                        <input type="text" name="groupName" class="easyui-textbox" value="${group.groupName}">
                    </td>
                </tr>
                <tr>
                    <td align="right">小组编码<font>*</font>：</td>
                    <td>
                        <input type="text" name="groupCode" class="easyui-textbox" value="${group.groupCode}">
                    </td>
                    <td align="right">英文名称：</td>
                    <td>
                        <input type="text" name="engName" class="easyui-textbox" value="${group.engName}">
                    </td>
                </tr>
                <tr>
                    <td align="right">国际化编码：</td>
                    <td>
                        <input type="text" name="i18nCode" class="easyui-textbox" value="${group.i18nCode}">
                    </td>
                </tr>
                <tr>
                    <td align="right">描述：</td>
                    <td colspan="3">
                        <textarea  name="descr"  multiline="true" 
                            style="height:70px;width:420px;" >${group.descr}</textarea>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'south',border:false" style="text-align: right; padding: 5px 5px 5px; background-color: #e0e0e0;">
        <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" tag="ok">提交</a>
        <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" tag="cancel">关闭</a>
    </div>
</div>
<script type="text/javascript">
  var orgId = '${group.orgId}';
  var formUrl = '${formUrl}';
</script>
<script type="text/javascript" src="${ctx}/static/js/sys/org/sysGroup_edit.js?jsTimer=${jsTimer}"></script>
</body>

</html>