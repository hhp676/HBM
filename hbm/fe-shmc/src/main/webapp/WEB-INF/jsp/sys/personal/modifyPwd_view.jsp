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
	<div class="easyui-panel" fit=true
		style="padding-top: 20px;padding-left: 20px;">
		<table class="hgtable table_form" id="modifyPwdTb">
			<colgroup>
				<col style="width:130px;">
				<col>
				<col>
			</colgroup>
			<tbody>
			<tr>
				<td align="right"><font>*</font>旧密码：
				</td>
				<td>
					 <input class="easyui-textbox" name="oldPwd" type="password" style="padding:5px"
					  data-options="iconCls:'icon-lock',iconWidth:38" value=""/>
				</td>
			</tr>
			<tr>
				<td align="right"><font>*</font>新密码：
				</td>
				<td> <input id="newPwd" class="easyui-textbox easyui-validatebox" name="newPwd" type="password" style="padding:5px"
					  data-options="iconCls:'icon-lock',iconWidth:38,validType:'length[8,20]'"/>
			 	</td>
			</tr>
			<tr>
				<td align="right"><font>*</font>确认新密码：
				</td>
				<td>
					<input id="repeatPwd" class="easyui-textbox easyui-validatebox" name="repeatPwd" type="password" style="padding:5px"
					  data-options="iconCls:'icon-lock',iconWidth:38,validType:'length[8,20]'"/>
				</td>

			</tr>
			</tbody>
			
			<tfoot>
				<tr>
				<td></td>
				<td style="padding-top: 10px;padding-bottom: 250px;">
					<a href="javascript:void(0);" class="a_blue" tag="save"><em>保存</em> 
					</a>
				</td>

			</tr> 
			<tr></tr>
			</tfoot>
		</table>
	</div>
	<script type="text/javascript">
		$("#modifyPwdTb [tag=save]").click(function(){
			var oldPwd = $("#modifyPwdTb [name=oldPwd]").val();
			var newPwd = $("#modifyPwdTb [name=newPwd]").val();
			var repeatPwd = $("#modifyPwdTb [name=repeatPwd]").val();
			$("#newPwd").validatebox({
				validType:"length[8,20]"
			})
			var nPwd = $("#newPwd").validatebox("isValid");
			$("#repeatPwd").validatebox({
				validType:"length[8,20]"
			})
			var rPwd = $("#repeatPwd").validatebox("isValid");
			if(!nPwd || !rPwd){
				$.messager.alert("提示", "数据未通过验证!", "warning");
				return;
			}
			if (newPwd.length == 0 && oldPwd.length != 0) {
				$.messager.alert("提示","新密码不能为空","warning");
				return false;
			}if (newPwd.length !=0 && oldPwd.length == 0) {
				$.messager.alert("提示","旧密码不能为空","warning");
				return false;
			}if (oldPwd.length == 0 && newPwd.length == 0) {
				$.messager.alert("提示","新密码和旧密码不能为空","warning");
				return false;
			}
			if (newPwd != repeatPwd) {
				$.messager.alert("提示","确认新密码与新密码不一致","warning");
				return false;
			}
			var url = "/sys/sysPersonal/modifyPwd/update";
			if (!HgUtil.repeatSubmitCheck($(this), url)){
				return;
			}
			HgUtil.post(url,{oldPwd:oldPwd,newPwd:newPwd},function(data){
				if (!data.success) {
					$.messager.alert("提示",data.data,"warning");
				} else {
					HgUi.ok("修改密码成功!",function(){
						var tab = new HgUi.Tab();
						tab.refreshCurrent();
					});					
				}
			});
		});
	</script>
</body>

</html>