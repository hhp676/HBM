<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>岗位列表</title>
</head>
<body>
<div id="sysPositionListLayout" class="easyui-layout" fit=true>
    <div region="center">
        <table singleSelect=true fit=true id="sysPositionList_grid" pagination="true"
               fitColumns=true toolbar="#sysPositionList_toolbar" pagination="false"
               pageSize="${defaultPageSize}" pageList="${defaultPageList}"
               data-options="url:'${ctx}/${fetchUrl}'">
            <thead>
            <tr>
                <th data-options="field:'userId',checkbox:true"></th>
                <th data-options="field:'sysOrganization.orgName',width:40">部门名称</th>
                <th data-options="field:'positionName',width:40">岗位名称</th>
                <th data-options="field:'positionCode',width:40">岗位编码</th>
                <th data-options="field:'engName',width:40">英文名称</th>
                <th data-options="field:'i18nCode',width:40">国际化编码</th>
            </tr>
            </thead>
        </table>
        <div id="sysPositionList_toolbar" class="hgGridSearchBar" tag="listen_hotkey">
            <table>
                <tr>
                    <td width="60px" align="right"><span>岗位名称：</span></td>
                    <td><input name="name" style="width: 120px;" class="easyui-textbox"/></td>
                    <td width="60px" align="right"><span>岗位编码：</span></td>
                    <td><input name="code" style="width: 120px;"class="easyui-textbox"/></td>
                    <td>
                        &nbsp;&nbsp;
                        <a href="javascript:void(0);" class="btn btn-sm btn-azure" tag="search"><i class="fa fa-search"></i>搜索</a>
                        <a href="javascript:void(0);" class="btn btn-sm btn-yellow" tag="clear"><i class="fa fa-eraser"></i>清空</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div data-options="region:'south',border:false" style="text-align: right; padding: 5px 5px 5px; background-color: #e0e0e0;">
        <a href="javascript:void(0);" class="btn btn-sky btn-sm" tag="ok"><i class="fa fa-check-square-o"></i>确认</a>
        <a href="javascript:void(0);" class="btn btn-warning btn-sm" tag="cancel"><i class="fa fa-close"></i>取消</a>
    </div>
</div>
<script type="text/javascript" src="${ctx}/static/js/sys/org/sysPos_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>