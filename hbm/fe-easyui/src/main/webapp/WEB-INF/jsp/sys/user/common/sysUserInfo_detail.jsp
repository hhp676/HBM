<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户详情页面</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true" id="sysUserInfoDetail_layout">
		<h:hasAnyPermissions name='<%=Auths.Sys.USER_UPDATE + "," + Auths.Sys.USER_DELETE%>'>
	       	<div data-options="region:'north',border:false"
               style="text-align: left; padding: 5px 5px 5px;background-color: #fafafa">
               <h:hasAllPermissions name="<%=Auths.Sys.USER_UPDATE%>">
                   <a class="easyui-linkbutton" iconCls="icon_warning"  plain="true"
                       onclick="sysUserInfoDetail.toEdit()">修改</a>
               </h:hasAllPermissions>
               <h:hasAllPermissions name="<%=Auths.Sys.USER_DELETE%>">
                   <a class="easyui-linkbutton" iconCls="icon_delete"  plain="true"
                       onclick="sysUserInfoDetail.toDel()">删除</a>
               </h:hasAllPermissions>
          	</div>
		</h:hasAnyPermissions>
		<div data-options="region:'center'" style="padding: 10 10 10 20px;">
			<div class="easyui-layout" fit=true data-options="border:false">
				<div data-options="region:'center',border:false" title="用户信息">
					<form class="hgform">
						<table class="hgtable" style="line-height: 25px">
							<tr>
								<td style="width: 60px;" align="right">用户名<font>*</font>：
								</td>
								<td style="width: 170px;">
									<input type="text"  name="userName" value="${user.userName}" disabled="disabled" style="width: 140px;" /><br/>
								</td>
								<td align="right">英文名：</td>
								<td style="width: 170px;">
									<input name="engName"  value="${user.engName}" disabled="disabled" style="width: 140px;" /><br/>
								</td>
							</tr>
							<tr>
								<td align="right">性别<font>*</font>：</td>
								<td style="width: 170px;">
									<select type="text" name="gender" class="easyui-combobox" disabled="disabled" 
									     style="width: 142px;" panelHeight='auto'
		                            			 data-options="url: '${ctx}/sys/common/sysDict/itemList/maleOrFemale',
		                            			   valueField: 'itemValue', textField: 'itemName', 
		                            			   value:'${user.gender}',
		                            			   editable: false, prompt: '---请选择---'">
		                           			</select><br/>
								</td>
								<td align="right">手机号码：</td>
								<td style="width: 170px;">
									<input name="mobile"  value="${user.mobile}" disabled="disabled" 
									style="width: 140px;" /><br/>
								</td>
							</tr>
							<tr>
								<td align="right">生日：</td>
								<td style="width: 170px;">
								   <input name="birthday" type="text" class="Wdate" disabled="disabled" 
		                                       onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'})"
		                                    	  value="${user.birthday}" style="width: 140px;" /><br/>
									<!-- <input name="birthday" class="easyui-datebox" editable=false 
									  data-options="buttons:HgUi.dateboxButtons" value="${user.birthday}" style="width: 140px;" />-->
								</td>
								<td align="right">联系电话：</td>
								<td style="width: 170px;">
									<input name="telephone"  prompt="格式:XXX-XXXXXXXX" disabled="disabled" 
									value="${user.telephone}" style="width: 140px;" /><br/>
								</td>
							</tr>
							<tr>
								<td align="right">邮箱：</td>
								<td colspan="3">
									<input name="email" disabled="disabled" value="${user.email}" style="width: 374px;" /><br/>
		                                     <label for="idCard"></label>
								</td>
							</tr>
							<tr>
								<td align="right">地址：</td>
								<td colspan="3">
									<input name="address" disabled="disabled" value="${user.address}" style="width: 374px;" /><br/>
								</td>
							</tr>
							<tr>
								<td align="right">描述：</td>
								<td colspan="3">
									<textarea name="descr" cols=80 rows=3 disabled="disabled" style="width: 366px; height: 30px;">${user.descr}</textarea><br/>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div data-options="region:'east'" style="width: 410px;">
					<div class="easyui-tabs" fit=true data-options="border:false">
						<div title="岗位信息">
	   					   <table class="easyui-datagrid"  singleSelect=true 
   					        	data-options="fit: true, fitColumns: true, 
                               	url:'${ctx}/sys/sysUser/sysUserTabPosList?userId=${user.userId}'">
                               <thead>
                                   <tr>
                                       <th data-options="field:'sysPosition.positionName',width:40">岗位名称</th>
                                       <th data-options="field:'isMajor',width:20,
                                              formatter:HgUtil.fieldFormatterFunc('isMajorPztn')" align="center">岗位类别</th>
                                          <th data-options="field:'sysPosition.positionCode',width:40">岗位编码</th>
                                   </tr>
                               </thead>
                           </table>
						</div>
						<div title="小组信息">
       					    <table class="easyui-datagrid" singleSelect=true 
     					       data-options="fit: true,fitColumns: true, 
                                 url:'${ctx}/sys/sysUser/sysUserTabGroupList?userId=${user.userId}'">
                                 <thead>
                                     <tr>
                                         <th data-options="field:'sysGroup.groupName',width:150">小组名称</th>
                                         <th data-options="field:'sysGroup.groupCode',width:150">小组编码</th>
				        				 <th data-options="field:'isLeader',
						             		formatter:HgUtil.fieldFormatterFunc('sysGroupDuty'),width:150">小组职责</th>
                                     </tr>
                                 </thead>
                             </table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var sysUserInfoDetail = {};
		sysUserInfoDetail.toEdit = function(){
			var _callbackName = $("#sysUserInfoDetail_layout").parent().window("options").callbackName;
			$("#sysUserInfoDetail_layout").parent().window("close");
			HgCommon.editSysUser('${user.userId}', function() {
				if (_callbackName) {
					var _func = eval(_callbackName);
					return _func("edit");
				}
			});
		}
	
		sysUserInfoDetail.toDel = function(){
			var _callbackName = $("#sysUserInfoDetail_layout").parent().window("options").callbackName;
			$("#sysUserInfoDetail_layout").parent().window("close");
			
			HgCommon.delSysUser('${user.userId}', function() {
				if (_callbackName) {
					var _func = eval(_callbackName);
					return _func("del");
				}
			});
		}
	</script>
</body>

</html>
