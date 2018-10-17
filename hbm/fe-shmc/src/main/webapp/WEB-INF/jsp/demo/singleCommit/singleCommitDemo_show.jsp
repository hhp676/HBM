<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>防重复提交demo</title>
</head>
<body>
	<div class="easyui-layout" style="height: 700px;">
		<div data-options="region:'center',title:'使用token防重复提交demo',border:false"
			style="padding: 0px;">
			<div style="width: 900px;margin: 10px;border: 1px solid;">
              <strong>demo内容：</strong>防重复提交<br/>
              <strong>适 用 场 景：</strong>添加动作时,防止一次添加,保存多条记录<br/>
              <strong>使 用 说 明：</strong>demo内演示了form装入token,提交到后台,后台删除token,模拟报错,前端刷新token<br/>
              <strong>注 意 事 项：</strong>详见开发手册及代码
            </div>
			<form id="singleCommitForm" class="hgform">
				<table width="45%" class="hgtable">
					<tr>
						<td align="right"><span style="font-size:13px">参数A：</span></td>
						<td>
						     <input name="paramA">
						</td>
						<td align="right"><span style="font-size:13px">参数B：</span></td>
						<td>
						     <input name="paramB">
						</td>
					     <td>
					          <a href="javascript:void(0);" class="a_blue" 
                                       onclick="singleCommit(this);"><em>测试</em></a>
					     </td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	//页面加载完成时,装入token值
	$(function(){
		HgUtil.initSubmitToken("#singleCommitForm");
	});
	
	function singleCommit(button){
		
		//TODO js校验,业务处理等逻辑
		
		var url='/common/demo/singleCommit/saveSingleCommit';
		var param=$("#singleCommitForm").serialize();
		HgUtil.post(url,param,function(completeData){
			if(completeData.success){
				HgUi.ok('操作成功!', function(){
					//TODO
				})
			}else{
				//操作失败时,重设token值
				HgUi.error('操作失败!'+completeData.data,function(){
					HgUtil.initSubmitToken("#singleCommitForm");
					//TODO
				});
			}
			
		},function(exceptionData){
			HgUi.error('后台处理异常,请稍后再试',function(){
				//异常时,按钮恢复可用,重设token值
	            HgUtil.initSubmitToken("#singleCommitForm");
	            //TODO
			});
		});
	}
    </script>
</body>
</html>