<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>部门管理</title>
</head>
<body>
<div id="sysOrgEditLayout" class="easyui-layout" fit="true">
    <div data-options="region:'center'" style="padding: 10px 10px 10px 20px;">
        <form id="sysOrgEditForm" method="post" name="sysOrgEditForm" class="hgform"
            style="height: 100%; width: 100%">
            <input type="hidden" name="orgId" value="${org.orgId}">
            <table class="hgtable  table_form" cellpadding="0" cellspacing="0">
                <tr>
                    <th width="70px">父部门：</th>
                    <td width="180px">
                        <select id="fid" name="fid" class="easyui-combotree" 
                            panelHeight='auto' panelMaxHeight="300" style="width:149px;"   
                            data-options="url:'${ctx}/sys/org/getOrgTree?currOrgID=${org.orgId}'"></select>
                        <%-- <input type="text" name="fName" class="easyui-textbox" disabled value="${org.parent.orgName}">
                        <input type="hidden" name="fid" value="${org.fid}"> --%>
                    </td>
                    <th width="75px;"><font>*</font>部门名称：</th>
                    <td width="180px">
                        <input type="text" name="orgName" class="easyui-textbox" value="${org.orgName}" style="width:149px;">
                    </td>
                </tr>
                <tr>
                    <th >部门全名：</th>
                    <td>
                        <input type="text" name="orgFullname" class="easyui-textbox" value="${org.orgFullname}" style="width:149px;">
                    </td>
                    <th ><font>*</font>部门编码：</th>
                    <td>
                        <input type="text" name="orgCode" class="easyui-textbox" value="${org.orgCode}" style="width:149px;">
                    </td>
                </tr>
                <tr>
                    <th >英文名称：</th>
                    <td>
                        <input type="text" name="engName" class="easyui-textbox" value="${org.engName}" style="width:149px;">
                    </td>
                    <th >国际化编码：</th>
                    <td>
                        <input type="text" name="i18nCode" class="easyui-textbox" value="${org.i18nCode}" style="width:149px;">
                    </td>
                </tr>
                <tr>
                    <th >描述：</th>
                    <td colspan="3">
                        <textarea  name="descr"  multiline="true" 
                            style="height:70px;width:418px;">${org.descr}</textarea>
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
  var fid = '${org.fid}';
  var formUrl ='${formUrl}';
</script>
<script type="text/javascript" src="${ctx}/static/js/sys/org/sysOrg_edit.js?jsTimer=${jsTimer}"></script>
</body>

</html>