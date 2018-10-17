<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>岗位管理</title>
</head>
<body>
<div id="sysPosLayout" class="easyui-layout" fit="true">
    <div data-options="region:'center'" style="padding: 10px 10px 10px 20px;">
        <form id="sysPosForm" method="post" name="sysPosForm" class="hgform"
            style="width: 100%">
            <input type="hidden" name="positionId" value="${pos.positionId}">
            <table style="width: 100%" class="hgtable">
                <tr>
                    <td width="70px" align="right">所在部门：</td>
                    <td width="140px">
                        <select id="orgId" name="orgId" class="easyui-combotree"
                            panelHeight='auto' panelMaxHeight="300" style="width:133px;"   
                            data-options="url:'${ctx}/sys/org/getOrgTree',
                            onChange:sysPos_editOrgIdOnChange"></select>
                        <%-- <input type="text" name="orgName" class="easyui-textbox" disabled value="${pos.sysOrganization.orgName}">
                        <input type="hidden" name="orgId" value="${pos.orgId}"> --%>
                    </td>
                    <td width="80px" align="right">父岗位：</td>
                    <td width="195px">
                        <select id="fid" name="fid" class="easyui-combotree"
                            panelHeight='auto' style="width:133px;"
                            data-options=""></select>
                            <a href="javascript:void(0);" class="btn btn-xs btn-yellow" onclick="sysPos_edit.fidClear();"><i class="fa fa-eraser"></i>清空</a>
                        <%-- <input type="text" name="fName" class="easyui-textbox" disabled value="${pos.parent.positionName}">
                        <input type="hidden" name="fid" value="${pos.fid}"> --%>
                    </td>
                </tr>
                <tr>
                    <td align="right">职务<font class="red">*</font>：</td>
                    <td>
                        <select  name="jobId" class="easyui-combobox" 
                            panelHeight='200px' editable="false" style="width: 133px;"
                            data-options="url: 'sys/org/allJobs',
                            valueField: 'jobId', textField: 'jobName', 
                            value:'${pos.jobId}',
                            prompt: '---请选择---'">
                        </select>
                    </td>
                    <td align="right">岗位名称<font class="red">*</font>：</td>
                    <td>
                        <input type="text" name="positionName" class="easyui-textbox" value="${pos.positionName}">
                    </td>
                </tr>
                <tr>
                    <td align="right">岗位编码<font class="red">*</font>：</td>
                    <td>
                        <input type="text" name="positionCode" class="easyui-textbox" value="${pos.positionCode}">
                    </td>
                    <td align="right">英文名称：</td>
                    <td>
                        <input type="text" name="engName" class="easyui-textbox" value="${pos.engName}">
                    </td>
                </tr>
                <tr>
                    <td align="right">国际化编码：</td>
                    <td>
                        <input type="text" name="i18nCode" class="easyui-textbox" value="${pos.i18nCode}">
                    </td>
                </tr>
                <tr>
                    <td align="right">描述：</td>
                    <td colspan="3">
                        <textarea  name="descr"  multiline="true" 
                            style="height:80px;width:360px; overflow-x:hidden;" >${pos.descr}</textarea>
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
  var sysPos_edit = {};
  sysPos_edit.formUrl= '${formUrl}';
  sysPos_edit.orgId = '${pos.orgId}';
  sysPos_edit.fid = '${pos.fid}';
  sysPos_edit.positionId = '${pos.positionId}';
</script>
<script type="text/javascript" src="${ctx}/static/js/sys/org/sysPos_edit.js?jsTimer=${jsTimer}"></script>
</body>

</html>