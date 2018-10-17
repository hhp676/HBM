<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>改密</title>
</head>
<body>
<div id="sysUserChangePwdLayout" class="easyui-layout" fit=true>
    <div region="center"  style="padding:10px">
       <form id="userUpdPwd_form" class="hgform">
				<input type="hidden" name="userId" value="${userId}"/>
				<table class="hgtable">
					<tr>
						<td width="80px;">新密码<font>*</font>：</td>
						<td>
							<input class="easyui-textbox" name="newPwd" type="password" style="width:200px;height:28px;padding:5px"
					  			data-options="iconCls:'icon-lock',iconWidth:38"/><br/>
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
	$('#userUpdPwd_form').validate({
	    rules: { 
	    	newPwd : {required: true, rangelength: [8, 20]}
	    }
	});

    
	$("#sysUserChangePwdLayout").find("[tag='ok']").click(function() {
		// 验证表单--------------------------------------------------
        if(!$('#userUpdPwd_form').validate().form()) return false;
		HgUtil.post("/sys/sysUser/updUserPwd",$("#userUpdPwd_form").serialize(),function(data){
			if (!data.success) {
				HgUi.alert(data.data);
			} else {
				HgUi.ok("修改密码成功!",function(){
					$("#sysUserChangePwdLayout").parent().window("close");
				});					
			}
		});
	});

	$("#sysUserChangePwdLayout").find("[tag='cancel']").click(function() {
		$("#sysUserChangePwdLayout").parent().window("close");
	});
</script>
</body>

</html>