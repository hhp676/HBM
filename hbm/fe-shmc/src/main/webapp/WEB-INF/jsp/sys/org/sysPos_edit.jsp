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
        <form id="sysPosForm" method="post" name="sysPosForm" class="hgform" style="height: 100%; width: 100%">
            <input type="hidden" name="positionId" value="${pos.positionId}">
            <table class="hgtable  table_form" cellpadding="0" cellspacing="0">
                <tr>
                    <th width="75px" >所在部门：</th>
                    <td width="180px">
                        <select id="orgId" name="orgId" class="easyui-combotree"
                            panelHeight='auto' panelMaxHeight="300" style="width:149px;"   
                            data-options="url:'${ctx}/sys/org/getOrgTree',
                            onChange:sysPos_editOrgIdOnChange"></select>
                        <%-- <input type="text" name="orgName" class="easyui-textbox" disabled value="${pos.sysOrganization.orgName}">
                        <input type="hidden" name="orgId" value="${pos.orgId}"> --%>
                    </td>
                    <th width="70px" >父岗位：</th>
                    <td width="180px">
                        <select id="fid" name="fid" class="easyui-combotree"
                            panelHeight='auto' style="width:149px;"
                            data-options=""></select>
                        <a href="javascript:void(0)" onclick="sysPos_edit.fidClear();">清空</a>
                    </td>
                </tr>
                <tr>
                    <th ><font>*</font>职务：</th>
                    <td>
                        <select  name="jobId" class="easyui-combobox" 
                            panelHeight='200px' editable="false" style="width: 149px;"
                            data-options="url: 'sys/org/allJobs',
                            valueField: 'jobId', textField: 'jobName', 
                            value:'${pos.jobId}',
                            prompt: '---请选择---'">
                        </select>
                    </td>
                    <th ><font>*</font>岗位名称：</th>
                    <td>
                        <input type="text" name="positionName" class="easyui-textbox" value="${pos.positionName}" style="width: 149px;">
                    </td>
                </tr>
                <tr>
                    <th ><font>*</font>岗位编码：</th>
                    <td>
                        <input type="text" name="positionCode" class="easyui-textbox" value="${pos.positionCode}" style="width:149px;">
                    </td>
                    <th >英文名称：</th>
                    <td>
                        <input type="text" name="engName" class="easyui-textbox" value="${pos.engName}" style="width:149px;">
                    </td>
                </tr>
                <tr>
                    <th >国际化编码：</th>
                    <td>
                        <input type="text" name="i18nCode" class="easyui-textbox" value="${pos.i18nCode}" style="width:149px;">
                    </td>
                    <th></th>
                    <td></td>
                </tr>
                <tr>
                    <th >描述：</th>
                    <td colspan="3">
                        <textarea  name="descr" multiline="true" 
                            style="height:70px;width:410px;" >${pos.descr}</textarea>
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
  var sysPos_edit = {};
  sysPos_edit.formUrl= '${formUrl}';
  sysPos_edit.orgId = '${pos.orgId}';
  sysPos_edit.fid = '${pos.fid}';
  sysPos_edit.positionId = '${pos.positionId}';
</script>
<script type="text/javascript" src="${ctx}/static/js/sys/org/sysPos_edit.js?jsTimer=${jsTimer}"></script>
</body>

</html>