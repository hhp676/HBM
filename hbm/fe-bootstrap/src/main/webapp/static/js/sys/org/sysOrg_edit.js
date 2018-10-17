/**
 * 组织架构。 Created by qiujingde on 2016/12/22. / /
 */

var sysOrgEditLayout = $("#sysOrgEditLayout");
var sysOrgEditForm = $("#sysOrgEditForm");

$("#sysOrgEditForm #fid").combotree({
	onLoadSuccess: function() {
		$("#sysOrgEditForm #fid").combotree("setValue", fid);
	}
});

sysOrgEditForm.validate({
	rules:{
		orgName: {
			required: true,
			rangelength: [1, 50]
		},
		orgFullname: {
			rangelength: [0, 50]
		},
		orgCode: {
			required: true,
			rangelength: [1, 50]
		},
		engName: {
			rangelength: [0, 60],
			onlyEng: true
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
sysOrgEditLayout.find("[tag=ok]").click(function() {
	//验证表单--------------------------------------------------
	if(!sysOrgEditForm.validate().form()) return false;
	sysOrgEditLayout.block();
	HgUtil.post("/"+formUrl, $("#sysOrgEditForm").serialize(), function(data){
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
			sysOrgEditLayout.unblock();
		});
	});
});

// 取消---------------------------------------------------------------------------------------------------
sysOrgEditLayout.find("[tag=cancel]").click(function() {
	sysOrgTree.popWin.window("close");
});
