/**
 * hongguaninfo moduleClass 模块类
 * 
 * @author cecily yu
 */

 
/*******************************************************************************************************************
	 * 权限/负权限管理
*******************************************************************************************************************/
function sysAuthManage(authType,id) {
	this.authType = authType;//1:正授权  -1：负授权
	this.gridId = "sysAuthManage_grid_"+ id;
	this.disabledIds = [];
	this.checkedIds = [];
};

sysAuthManage.prototype.init = function(listQueryParam){
	var me = this;
	me.processStatus = true;//是否程序处理状态，默认在程序处理状态，不对onBeforeCheckNode、onCheckNode进行处理
	me.hasShowUncheckConfirm = false;
	/**
	 * 加载已授权数据后再加载权限树。
	 */
	HgUtil.getJson("/sys/sysAuthMenu/getGrantedAuthList",listQueryParam,function(data){
		for (var index=0; index<data.length; index++){
	        if (me.authType && me.authType!=data[index].authType){
	            me.disabledIds.push(data[index].authId);
	        }else{
	        	me.checkedIds.push(data[index].authId);
	        }
	    }
	    $("#"+me.gridId).treegrid({
	    	url: G_CTX_PATH+ "/sys/sysAuthMenu/authManageDialogList",
	    	onLoadSuccess:function(row, authData){
	    		//if (me.authType == 1) {
	    		//	sysAuthManage_grid_userAuth.data = authData;
	    		//} else {
	    		//	sysAuthManage_grid_userNAuth.data = authData
	    		//}	    			    		
	    		$("#"+me.gridId).treegrid('loading');
	    		for(var index in me.checkedIds){
	    			 $("#"+me.gridId).treegrid('checkNode',me.checkedIds[index]);
	    		}
                //不显示无任何权限的模块
                for(var i=0; i<authData.rows.length;i++){
                    if (authData.rows[i].authCategory == null){
                        var children = $("#"+me.gridId).treegrid('getChildren',authData.rows[i].id);
                        if (children.length == 0){
                            $("#"+me.gridId).treegrid('remove',authData.rows[i].id);
                        }
                    }
                }
	    		 $("#"+me.gridId).treegrid('loaded');
	    		 me.processStatus = false;
	    		 if ($("#"+me.gridId).treegrid('options').onLoadSuccessOver) {
	    			 $("#"+me.gridId).treegrid('options').onLoadSuccessOver(row, authData);
				 }	
	    	},
	    	checkbox:function(row){
	    		//2017-03-24 使用jquery的inArray方法
	    		//if (me.disabledIds.indexOf(row['authId'])>-1){
	    		if ($.inArray(row['authId'], me.disabledIds)>-1){
	    			return false;
	    		}
	    		return true;
	    	},
	    	onBeforeCheckNode:function(row,checked){
	    		//如果非程序处理 ，且是访问操作，且是进行取消赋权
	    		if (me.authType != -1 && !me.processStatus && row.isViewOperation && row.isViewOperation == 1 && !checked) {
	    			var _parentModel = $("#" + me.gridId).treegrid("getParent", row.authId);
	    			if (_parentModel && (_parentModel.isTopMenu == 1 || _parentModel.isSubMenu == 1) && !me.hasShowUncheckConfirm) {
	    				$.messager.confirm("确认取消", "取消此权限后，可能引起此模块的菜单不能显示，是否取消？", function(flag){
	    					if (flag) {
	    						$("#"+me.gridId).treegrid("uncheckNode",row['authId']);
	    					}
	    					me.hasShowUncheckConfirm = false;
	    				});
	    				me.hasShowUncheckConfirm = true;
	    				return false;
	    			}
	    		}
	    		return true;
	    	},
	    	onCheckNode:function(row,checked){
	    		//进行级联向上赋权
	    		if (me.authType != -1 && !me.processStatus && checked) {
	    			var checkedNodes = new Array();
	    			var _parentModel = $("#" + me.gridId).treegrid("getParent", row.authId);
    				while (_parentModel && _parentModel.authId) {
    					var _viewNodes = $("#" + me.gridId).treegrid("getChildren", _parentModel.authId);
    					$.each(_viewNodes, function(i, node){
    						//选中访问节点
    						if (node.authShowType == 2 && node.isViewOperation && node.isViewOperation == 1
    								&& node._parentId == _parentModel.authId){
    							checkedNodes.push(node.authId);
    						}
    					});
    					_parentModel = $("#" + me.gridId).treegrid("getParent", _parentModel.authId);
    				}
    				me.processStatus = true;
    				$.each(checkedNodes, function(i, n){
    					$("#"+me.gridId).treegrid('checkNode', n);
    				});
    				me.processStatus = false;
	    		}
	    	}
	    	
	    });

	});
	
};

/**
 * 点击保存事件。
 */
sysAuthManage.prototype.onSave = function(callback) {
	var checkedAuthIds = [];
	var checkedNodes = $("#"+this.gridId).treegrid("getCheckedNodes");
	for(var index in checkedNodes){
		if (checkedNodes[index].authShowType==2){
			checkedAuthIds.push(checkedNodes[index].authId);
		}
	}
	callback(checkedAuthIds,checkedNodes);
};