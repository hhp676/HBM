/**
 * 组织架构。 Created by qiujingde on 2016/12/22. / /
 */

$("#sysPosForm #orgId").combotree({
	onLoadSuccess: function() {
		$("#sysPosForm #orgId").combotree("setValue", sysPos_edit.orgId);
	}
});
$("#sysPosForm #fid").combotree({
	onLoadSuccess: function() {
		$("#sysPosForm #fid").combotree("setValue", sysPos_edit.fid);
	}
});
//清空父岗位
sysPos_edit.fidClear = function(){
	$("#sysPosForm #fid").combotree("clear");
}
//部门重选后,岗位tree重设
function sysPos_editOrgIdOnChange(newValue, oldValue){
	if(newValue != sysPos_edit.orgId){
		sysPos_edit.fid='';
	}
	//部门改变时,父岗位重新请求,值设置为空
	$('#sysPosForm #fid').combotree({    
	    url : G_CTX_PATH+'/sys/org/getPosTree?currPosID='+sysPos_edit.positionId+'&currOrgID='+newValue
	});
}

var sysPosLayout = $("#sysPosLayout");
var sysPosForm = $("#sysPosForm");

sysPosForm.validate({
	rules:{
		jobId: {required: true},
		positionName: {
			required: true,
			rangelength: [1, 50]
		},
		positionCode: {
			required: true,
			rangelength: [1, 50]
		},
		engName: {
			onlyEng: true,
			rangelength: [0, 60]
		},
		i18nCode: {
			rangelength: [0, 100]
		},
		descr: {
			rangelength: [0, 500]
		}
	}
});
// 保存---------------------------------------------------------------------------------------------------
sysPosLayout.find("[tag=ok]").click(function() {
	//验证表单--------------------------------------------------
	if(!sysPosForm.validate().form())  return false;
	sysPosLayout.block();
	HgUtil.post("/"+sysPos_edit.formUrl, $("#sysPosForm").serialize(), function(data){
		if (data.success){
			HgUi.ok("保存数据成功!", function() {
				sysOrgTree.popWin.window("close");
			    sysOrgTree.treegrid.treegrid("reload");
			});
		}else{
			/*HgUi.error(data.data, function() {
			});*/
		}
	},function(data){
		HgUi.error(JSON.parse(data.responseText).data,function(){
			sysPosLayout.unblock();
		});
	});
	
});

// 取消---------------------------------------------------------------------------------------------------
sysPosLayout.find("[tag=cancel]").click(function() {
	sysOrgTree.popWin.window("close");
});
