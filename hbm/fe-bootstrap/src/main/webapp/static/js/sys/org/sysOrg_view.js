/**
 * 组织架构。 Created by qiujingde on 2016/12/22. / / /
 */
var sysOrgTree = {};
(function() {
	
	var contextMenu = $("#sysOrg_contextMenu");
    var layout = $("#sysOrgTreeLayout");

    var userListPanel = function () {
        return layout.layout("panel", "south");
    };

    // 按钮事件注册
    var toolbar = $("#sysOrg_toolbar");

    var userListBtn = toolbar.find("[tag='userList']");

    var refreshUserList = rowOpFunc(function(row) {
        var url;
        if (row["nodeType"] == 1){
            url = "/sys/org/orgUser/view/";
        } else if (row["nodeType"] == 2){
            url = "/sys/org/posUser/view/";
        } else{
            url = "/sys/org/groupUser/view/";
        }
        if (userListPanel().panel("options").closed) {
            layout.layout("expand", "south");
        }
        userListPanel().panel("refresh", G_CTX_PATH + url + row["baseId"]);
    });
	
	// 组织树
	var treegrid = $("#sysOrg_tree").treegrid({
	    onSelect: function(row) {
		    var orgAdd = contextMenu.find("[tag=orgAdd]")[0];
		    var posAdd = contextMenu.find("[tag=posAdd]")[0];
		    var groupAdd = contextMenu.find("[tag=groupAdd]")[0];
		    
		    if (row["nodeType"] == 1){
			    contextMenu.menu("showItem", orgAdd);
			    contextMenu.menu("showItem", posAdd);
			    contextMenu.menu("showItem", groupAdd);
		    } else if (row["nodeType"] == 2){
			    contextMenu.menu("hideItem", orgAdd);
			    contextMenu.menu("showItem", posAdd);
			    contextMenu.menu("hideItem", groupAdd);
		    } else if (row["nodeType"] == 3){
			    contextMenu.menu("hideItem", orgAdd);
			    contextMenu.menu("hideItem", posAdd);
			    contextMenu.menu("hideItem", groupAdd);
		    }
		    if (! userListPanel().panel("options").closed) {
                refreshUserList();
            }
	    },
	    onContextMenu: function(e, row) {
		    e.preventDefault();
		    $(this).treegrid('select', row["nodeId"]);
		    contextMenu.menu('show', {
		        left: e.pageX,
		        top: e.pageY
		    });
	    },
	    onLoadSuccess: function(row, data){
			HgUi.showGridCellTip("sysOrg_tree", ['name','nodeType','code','engName','i18nCode']);
		}
	});
	sysOrgTree.treegrid = treegrid;
	
	// 共用弹窗
	sysOrgTree.sysOrgPopWin = function(options) {
		var _opts = options || {};
		sysOrgTree.popWin = HgUi.window({
			id: 'sysOrgPopWin',
			width : _opts.width ? _opts.width : 600,
			height : _opts.height ? _opts.height : 400
		});
		return sysOrgTree.popWin;
	};
	
	
	// 扩展查询
	HgUi.toggleSearchBar("sysOrg_toolbar", function() {
	}, function() {
	});
	

	//新增部门---------------------------------------------------------------------------------------------------
	toolbar.find("[tag='orgAdd']").click(
	        orgRowOpFunc(function(row) {
	        	sysOrgTree.sysOrgPopWin().window("setTitle", "新增部门").window("refresh",
		                G_CTX_PATH + "/sys/org/newOrg/" + row["baseId"]);
	        }));
	
	//新增岗位---------------------------------------------------------------------------------------------------
	toolbar.find("[tag='posAdd']").click(
	        rowOpFunc(function(row) {
		        if (row["nodeType"] == 3){
			        $.messager.alert("提示", "请选择一条部门或岗位数据", "warning");
			        return;
		        }
		        sysOrgTree.sysOrgPopWin().window("setTitle", "新增岗位").window("refresh",
		                G_CTX_PATH + "/sys/org/newPos/" + row["nodeId"]);
	        }));
	
	//新增小组---------------------------------------------------------------------------------------------------
	toolbar.find("[tag='groupAdd']").click(
	        orgRowOpFunc(function(row) {
	        	sysOrgTree.sysOrgPopWin().window("setTitle", "新增小组").window("refresh",
		                G_CTX_PATH + "/sys/org/newGroup/" + row["baseId"]);
	        }));
	
	//修改-----------------------------------------------------------------------------------------------------
	toolbar.find("[tag='edit']").click(
	        rowOpFunc(function(row) {
		        
		        var option = {};
		        
		        if (row["nodeType"] == 1){
			        $.extend(option, {
			            title: "修改部门",
			            url: "/sys/org/editOrg/"
			        });
		        } else if (row["nodeType"] == 2){
			        $.extend(option, {
			            title: "修改岗位",
			            url: "/sys/org/editPos/"
			        });
		        } else if (row["nodeType"] == 3){
			        $.extend(option, {
			            title: "修改小组",
			            url: "/sys/org/editGroup/"
			        });
		        }
		        
		        sysOrgTree.sysOrgPopWin().window("setTitle", option.title).window("refresh",
		                G_CTX_PATH + option.url + row["baseId"]);
		        
	        }));
	
	//删除-----------------------------------------------------------------------------------------------------
	toolbar.find("[tag='del']").click(delFunc(function(row) {
		var url;
		if (row["nodeType"] == 1){
			url = "/sys/org/delOrg/";
		} else if (row["nodeType"] == 2){
			url = "/sys/org/delPos/";
		} else{
			url = "/sys/org/delGroup/";
		}
		
		HgUtil.post(url + row["baseId"], null, function() {
			HgUi.ok("删除成功!", function() {
				treegrid.treegrid("reload");
                treegrid.treegrid("clearSelections")
			});
		});
	}));
	
	//人员列表---------------------------------------------------------------------------------------------------
    userListBtn.click(refreshUserList);
	
    sysOrgTree.sysOrgPopWinn = function(options) {
		var _opts = options || {};
		sysOrgTree.popWin = HgUi.window({
			id: 'sysOrgPopWin',
			width : _opts.width ? _opts.width : 800,
			height : _opts.height ? _opts.height : 480
		});
		return sysOrgTree.popWin;
	};
	//职位配置---------------------------------------------------------------------------------------------------
	toolbar.find("[tag='jobManage']").click(function() {
		sysOrgTree.sysOrgPopWinn().window("setTitle", "职位配置").window("refresh", G_CTX_PATH + "/sys/org/jobManage");
	});
	
	//条件查询---------------------------------------------------------------------------------------------------
	var searchForm = $("#sysOrgSearchForm");
	searchForm.find("[tag=submit]").click(function() {
		treegrid.treegrid("load", {
		    name: $.trim(searchForm.find("[name=name]").val()),
		    nodeType: $.trim(searchForm.find("[name=nodeType]").val()),
		    code: $.trim(searchForm.find("[name=code]").val()),
		    engName: $.trim(searchForm.find("[name=engName]").val()),
		    i18nCode: $.trim(searchForm.find("[name=i18nCode]").val())
		});
	});
	//类型combobox------------------------------------
	toolbar.find("#nodeType").combobox({  
		prompt: '---请选择---',
		panelHeight:'auto',
		editable:false,
		textField:'text',
		valueField:'value',    
		data:HgUtil.getDictComboboxData('orgNodeType')
	}); 
	
	//清空查询---------------------------------------------------------------------------------------------------
	searchForm.find("[tag=clear]").click(function() {
		searchForm.form("clear");
		//清空后combobox选中第一条“请选择”数据
		toolbar.find("#nodeType").combobox("setValue",''); 
		treegrid.treegrid("load", {});
	});
	
	//关于本条---------------------------------------------------------------------------------------------------
	toolbar.find("[tag=about]").click(rowOpFunc(function(row) {
		var baseUrl = "/sys/org/";
		if (row["nodeType"] == 1){
			baseUrl += "aboutOrg/";
		} else if (row["nodeType"] == 2){
			baseUrl += "aboutPos/";
		} else if (row["nodeType"] == 3){
			baseUrl += "aboutGroup/";
		}
		HgUtil.aboutDialog(baseUrl + row["baseId"]);
	}));
	
	// 辅助方法
	function rowOpFunc(callback) {
		return function() {
			var row = treegrid.treegrid("getSelected");
			if (!row){
				$.messager.alert("提示", "请选择一条数据", "warning");
				return;
			}
			callback(row);
		}
	}
	
	function orgRowOpFunc(callback) {
		return rowOpFunc(function(row) {
			if (row["nodeType"] != 1){
				$.messager.alert("提示", "请选择一条部门数据", "warning");
				return;
			}
			callback(row);
		});
	}
	
	function delFunc(callback) {
		return rowOpFunc(function(row) {
		    if(row["children"].length > 0) {
		        HgUi.error("请先删除子节点！");
            } else {
                $.messager.confirm("确认删除", "确认将选中的项删除?", function(r) {
                	if (r){
                		callback(row);
                	}
                });
            }
		});
	}
	
})();
