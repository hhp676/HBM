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
            style="width: 100%">
            <input type="hidden" name="orgId" value="${org.orgId}">
            <table style="width: 100%" class="hgtable">
                <tr>
                    <td width="70px" align="right">父部门：</td>
                    <td width="140px">
                        <select id="fid" name="fid" class="easyui-combotree" 
                            panelHeight='auto' panelMaxHeight="300" style="width:133px;"   
                            data-options="url:'${ctx}/sys/org/getOrgTree?currOrgID=${org.orgId}'"></select>
                        <%-- <input type="text" name="fName" class="easyui-textbox" disabled value="${org.parent.orgName}">
                        <input type="hidden" name="fid" value="${org.fid}"> --%>
                    </td>
                    <td width="80px" align="right">部门名称<font class="red">*</font>：</td>
                    <td width="150px">
                        <input type="text" name="orgName" class="easyui-textbox" value="${org.orgName}">
                    </td>
                </tr>
                <tr>
                    <td align="right">部门全名：</td>
                    <td>
                        <input type="text" name="orgFullname" class="easyui-textbox" value="${org.orgFullname}">
                    </td>
                    <td align="right">部门编码<font class="red">*</font>：</td>
                    <td>
                        <input type="text" name="orgCode" class="easyui-textbox" value="${org.orgCode}">
                    </td>
                </tr>
                <tr>
                    <td align="right">英文名称：</td>
                    <td>
                        <input type="text" name="engName" class="easyui-textbox" value="${org.engName}">
                    </td>
                    <td align="right">国际化编码：</td>
                    <td>
                        <input type="text" name="i18nCode" class="easyui-textbox" value="${org.i18nCode}">
                    </td>
                </tr>
                <tr>
                    <td align="right">描述：</td>
                    <td colspan="3">
                        <textarea type="text" name="descr"  multiline="true" 
                            style="height:80px;width:402px;overflow-x:hidden;" >${org.descr}</textarea>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'south',border:false" style="text-align: right; padding: 5px 5px 5px; background-color: #e0e0e0;">
            <a href="javascript:void(0);" class="btn btn-sky btn-sm" tag="ok"> 
                <i class="fa fa-check-square-o"></i>提交
           </a>
           <a href="javascript:void(0);" class="btn btn-warning btn-sm" tag="cancel"> 
                <i class="fa fa-close"></i>关闭
           </a>
    </div>
</div>
<script type="text/javascript">
  var fid = '${org.fid}';
  var formUrl ='${formUrl}';
</script>
<script type="text/javascript" src="${ctx}/static/js/sys/org/sysOrg_edit.js?jsTimer=${jsTimer}"></script>
</body>

</html>