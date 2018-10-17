/**
 * 组织架构。 Created by qiujingde on 2016/12/22.
 */
var sysUserWinList = {};

var sysUserWinListGrid = new HgUi.Datagrid("sysUserWinList_grid");
sysUserWinListGrid.toolbar = $("#sysUserWinList_toolbar");
sysUserWinListGrid.options.isShowContextMenu = true;
sysUserWinListGrid.options.tipCells = [
    "userName", "engName", "telephone", "email", "userPosition.sysOrganization.orgName", "userPosition.positionName"];
sysUserWinListGrid.init();
sysUserWinListGrid.bindDefaultToolbarEvent();
sysUserWinListGrid.options.onLoadSuccess = function() {
    var options = sysUserWinList.grid.datagrid("options");
    if (options.singleSelect) {
        //移除复选框
        sysUserWinList.grid.datagrid('getPanel')
            .find('.datagrid-view2 .datagrid-header-check').empty();
    }
};

sysUserWinList.layout = $("#sysUserWinListLayout");
sysUserWinList.grid = sysUserWinListGrid.grid;

sysUserWinList.layout.find("[tag='ok']").click(function() {
	var rows = sysUserWinList.grid.datagrid("getSelections");
	if (rows.length == 0){
		HgUi.alert("请选择一条数据");
		return;
	}
	if (sysUserWinListCallback){
		sysUserWinListCallback(rows);
	}
	sysUserWinList.layout.parent().window("close");
});

sysUserWinList.layout.find("[tag='cancel']").click(function() {
	sysUserWinList.layout.parent().window("close");
});

sysUserWinListGrid.toolbar.genderCombo = sysUserWinListGrid.toolbar.find("[name='gender']").combobox({
	textField:'text',
	valueField:'value', 
	prompt: '---请选择---',
    data:HgUtil.getDictComboboxData('maleOrFemale'),
    editable:false,
    panelHeight: 'auto'
});

(function () {
    function parseData(raw) {
        var trim = [];
        if (raw && raw.length) {
            for (var i = 0; i < raw.length; i++) {
                if (raw[i]["nodeType"] != 3) {
                    trim.push({
                        id : raw[i]["baseId"],
                        text: raw[i]["name"],
                        iconCls: raw[i]["iconCls"],
                        nodeType: raw[i]["nodeType"],
                        children: parseData(raw[i]["children"])
                    })
                }
            }
        }
        return trim;
    }
    sysUserWinListGrid.toolbar.posCombo = sysUserWinListGrid.toolbar.find("[name='pos']").combotree({
    	prompt: '---请选择---',
        url: G_CTX_PATH + "/sys/org/orgTree",
        panelWidth:'200',
        panelHeight:'200',
        loadFilter: function (data) {
            return parseData(data.rows);
        }
    });
})();

sysUserWinListGrid.toolbar.find("[tag='search']").click(function () {
    var data = {
        userName: $.trim(sysUserWinListGrid.toolbar.find("[name=name]").val()),
        engName: $.trim(sysUserWinListGrid.toolbar.find("[name=engName]").val()),
        gender: sysUserWinListGrid.toolbar.genderCombo.combobox("getValue")
    };

    var row = sysUserWinListGrid.toolbar.posCombo.combotree("tree").tree("getSelected");
    if (row) {
        if (row["nodeType"] == 1) {
            data["userPosition.orgId"] = row.id;
        } else {
            data["userPosition.id"] = row.id;
        }
    }

    sysUserWinList.grid.datagrid("load", data);
});

sysUserWinListGrid.toolbar.find("[tag='clear']").click(function () {
    sysUserWinListGrid.toolbar.form("clear");
    //清空后combobox选中第一条“请选择”数据
//	var val = sysUserWinListGrid.toolbar.find("#gender").combobox("getData"); 
//	for (var item in val[0]) {  
//        if (item == "text") {  
//        	sysUserWinListGrid.toolbar.find("#gender").combobox("select", val[0][item]);  
//        }  
//    }
    sysUserWinList.grid.datagrid("load", {});
});

