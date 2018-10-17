<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="easyui-layout" fit=true>
		<div region="north" style="height: 205px;" 
			data-options="split:true,border:false">
			<div class="easyui-layout" fit=true>
				<div region="west" data-options="split:false" style="width: 650px">
					<div class="easyui-panel" fit=true border=false data-options="tools:'#basicPersonal_tools'" title="基础信息">
						<table id="personalBasicTb" fit=true singleSelect=true border=false
						class="easyui-datagrid" data-options="showHeader:false">
						<thead>
							<tr>
								<th data-options="field:'td1',width:'90px'" align="right">td1</th>
								<th data-options="field:'td2',width:'150px'">td2</th>
								<th data-options="field:'td3',width:'90px'" align="right">td3</th>
								<th data-options="field:'td4',width:'320px'">td4</th>
							</tr>
						</thead>

						<tr>
							<td><div align="center">
									<div style="width: 70px; height: 70px;">
										<img src="${ctx}/static/images/user_72px.png" />
									</div>
								</div>
							<td>
							<td><b>用户名：</b></td>
							<td>${user.userName}</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td></td>
							<td><b>英文名称：</b></td>
							<td>
								<div tag="infoTd" id="engNameDisabled">${user.engName}</div>
								<div tag="editTd" style="display: none;">
									<input id="engNameInput" name="engName" type="text" 
									   class="tbtxt" style="width: 278px;"/>
								</div>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td></td>
							<td><b>手机号码：</b></td>
							<td>
								<div tag="infoTd" id="mobileDisabled">${user.mobile}</div>
								<div tag="editTd" style="display: none;">
									<input id="mobileInput" name="mobile" type="text" 
									   class="tbtxt" style="width: 278px;"/>
								</div>
							</td>
						</tr>
						<tr>
							<td><b>生日：</b></td>
							<td>${user.birthday}</td>
							<td><b>EMAIL：</b></td>
							<td>${user.email}</td>
						</tr>
						<tr>
							<td><b>性别：</b></td>
							<td id="personalBasicTb_gender">${user.gender}</td>
							<td><b>住址：</b></td>
							<td>
								<div tag="infoTd" id="addressDisabled">${user.address}</div>
								<div tag="editTd" style="display: none;">
									<input id="addressInput" name="address" type="text" 
									   class="tbtxt" style="width: 278px;"/>
								</div>
							</td>
						</tr>
						<tr>
							<td><b>其他信息：</b></td>
							<td>${user.descr}</td>
							<td></td>
							<td></td>
						</tr>
					</table>
					</div>
					
				</div>
				<div region="center" title="员工信息" data-options="split:false" >
					<table id="staffinfoTb" fit=true singleSelect=true fitColumns=true border=false
					 class="easyui-datagrid" data-options="showHeader:false">
						<thead>
							<tr>
								<th data-options="field:'td1',width:'90px'" align="right">td1</th>
								<th data-options="field:'td2',width:'320px'">td2</th>
							</tr>
						</thead>
						<tr>
							<td><b>员工编号：</b></td>
							<td>${staff.staffCode}</td>
						</tr>
						<tr>
							<td><b>员工状态：</b></td>
							<td id="staffinfoTb_staffStatus">${staff.staffStatus}</td>
						</tr>
						<tr>
							<td><b>入职日期：</b></td>
							<td><fmt:formatDate value="${staff.entryTime}" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<td><b>离职日期：</b></td>
							<td><fmt:formatDate value="${staff.quitTime}" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<td><!-- <b>银行卡号：</b> --></td>
							<td><%-- ${staff.bankCard} --%></td>
						</tr>
						<tr>
							<td><b>其他信息：</b></td>
							<td>${staff.descr}</td>
						</tr>

					</table>
				</div>
			</div>



		</div>
		<div region="center" data-options="">
			<div id="tab" class="easyui-tabs" fit=true plain=true>
				<!-- <div title="我的消息"></div> -->
				<div title="我的操作日志">
				    <div id="sysPersonalTabLogView" class="easyui-panel" data-options="border:false,fit:true,href:'${ctx}/sys/sysPersonal/logView'"></div>
				</div>
				<div title="我的角色">
				    <div id="sysPersonalTabRoleView" class="easyui-panel" data-options="border:false,fit:true,href:'${ctx}/sys/sysPersonal/roleView'"></div>
				</div>
				<div title="我的权限">
				    <div id="sysPersonalTabAuthView" class="easyui-panel" data-options="border:false,fit:true,href:'${ctx}/sys/sysPersonal/authView'"></div>
				</div>
				<div title="我的岗位">
				    <div id="sysPersonalTabPosView" class="easyui-panel" data-options="border:false,fit:true,href:'${ctx}/sys/sysPersonal/posView'"></div>
				</div>
				<div title="我的小组">
                    <div id="sysPersonalTabGroupView" class="easyui-panel" data-options="border:false,fit:true,href:'${ctx}/sys/sysPersonal/groupView'"></div>
                </div>
			</div>
		</div>
	</div>
	
	<div id="basicPersonal_tools">
		 <a href="javascript:void(0)" class="icon-edit" id="basicPersonal_tools_btn" tag="btn"></a>
		 &nbsp;&nbsp;&nbsp;
		 <a href="javascript:void(0)" class="icon_undo" tag="undo"></a>
	</div>
	<script type="text/javascript">	
		var sysPersonal = {};
		sysPersonal.loginUserGender = "${user.gender}";
		sysPersonal.loginUserStaffStatus = "${staff.staffStatus}";
	</script>

	<script type="text/javascript" src="${ctx}/static/js/sys/personal/personal_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>