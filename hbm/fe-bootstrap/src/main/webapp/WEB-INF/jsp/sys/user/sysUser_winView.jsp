<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>人员列表</title>
</head>
<body>
<div id="sysUserWinListLayout" class="easyui-layout" fit=true>
    <div region="center" border=false>
        <table singleSelect="${singleSelect }"  fit=true id="sysUserWinList_grid" pagination="true"
               fitColumns=true toolbar="#sysUserWinList_toolbar" pagination="false"
               pageSize="${defaultPageSize}" pageList="${defaultPageList}"
               data-options="url:'${ctx}/sys/sysUser/winList',">
            <thead>
            <tr>
                <th data-options="field:'userId',checkbox:true"></th>
                <th data-options="field:'userName',width:40">用户名</th>
                <th data-options="field:'engName',width:35">英文名称</th>
                <th data-options="field:'gender',
                    formatter:HgUtil.fieldFormatterFunc('maleOrFemale'), width:20" align="center">性别</th>
                <th data-options="field:'mobile',width:40">手机号码</th>
                <th data-options="field:'email',width:40">邮箱</th>
                <th data-options="field:'userPosition.sysOrganization.orgName',width:40">部门</th>
                <th data-options="field:'userPosition.positionName',width:40">主岗位</th>
            </tr>
            </thead>
        </table>
        <div id="sysUserWinList_toolbar" class="hgGridSearchBar" tag="listen_hotkey">
            <table width="100%">
                <tr>
                    <td width="50px" align="right"><span>用户名：</span></td>
                    <td><input type="text" name="name" style="width: 140px;"/></td>
                    <td width="85px" align="right"><span>性<div style="width: 23px; display: inline-block;">&nbsp;</div>别：</span></td>
                    <td><input type="text" id="gender" name="gender" style="width: 140px; height:20px"/></td>
                    <td rowspan="2" style="text-align: right; padding-right: 15px;">
                    	<a href="javascript:void(0);" class="btn btn-azure btn-sm" tag="search"> 
							<i class="fa fa-search"></i>查询
						</a>
						<a href="javascript:void(0);" class="btn btn-yellow btn-sm" tag="clear"> 
							<i class="fa fa-eraser"></i>清空
						</a>
                    </td>
                </tr>
                <tr>
                    <td align="right"><span>英文名：</span></td>
                    <td><input type="text" name="engName" style="width: 140px;"/></td>
                    <td align="right"><span>组织岗位：</span></td>
                    <td><input type="text" name="pos" style="width: 140px; height:20px"/></td>
                </tr>

            </table>
        </div>
    </div>
    <div data-options="region:'south',border:false" style="text-align: right; padding: 5px 5px 5px; background-color: #f2f2f2;">
    		<a href="javascript:void(0);" class="btn btn-sky btn-sm" tag="ok"> 
				<i class="fa fa-check-square-o"></i>确认
			</a>
			<a href="javascript:void(0);" class="btn btn-warning btn-sm" tag="cancel"> 
				<i class="fa fa-close"></i>取消
			</a>
    </div>
</div>
<script type="text/javascript" src="${ctx}/static/js/sys/user/sysUser_winView.js"></script>
</body>

</html>