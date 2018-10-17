var sysMetaConstraintDetailGrid = new HgUi.Datagrid("sysMetaConstraintDetail_grid");
sysMetaConstraintDetailGrid.checkUpdateAuth = true;
sysMetaConstraintDetailGrid.toolbar = $("#sysMetaConstraintDetail_toolbar");
sysMetaConstraintDetailGrid.mode = "rowEdit"; //行编辑模式
sysMetaConstraintDetailGrid.options.isShowContextMenu = true;
sysMetaConstraintDetailGrid.options.aboutUrl = "/sys/meta/aboutDetail";
sysMetaConstraintDetailGrid.options.tipCells = ["field.fieldName", "field.columnName"];

if (sysMetaConstraintGrid.selectedRow) {
    var defId = sysMetaConstraintGrid.selectedRow["defId"];
    sysMetaConstraintDetailGrid.options.url = G_CTX_PATH + "/sys/meta/constraintDetailList/" + defId;
}

sysMetaConstraintDetailGrid.options.onSelect = function(index,row) {
    if (row && row.detailId){
        sysMetaConstraintDetailGrid.selectedRow = row;
    }
};

sysMetaConstraintDetailGrid.options.onLoadSuccess = function() {
    sysMetaConstraintDetailGrid.grid.datagrid("selectRow",0);
};

sysMetaConstraintDetailGrid.options.onBeginEdit = function (index, row) {
    var fieldNameCol = sysMetaConstraintDetailGrid.grid.datagrid("getEditor", {
        index: index,
        field : "field.fieldName"
    });
    var columnNameCol = sysMetaConstraintDetailGrid.grid.datagrid("getEditor", {
        index: index,
        field : "field.columnName"
    });
    var entityId = sysMetaConstraintGrid.selectedRow["entityId"];
    $(fieldNameCol.target).combogrid({
        url: G_CTX_PATH + '/sys/meta/getFieldList/' + entityId,
        columns: [[
            {field:'fieldCode',title:'字段编码',width:150},
            {field:'fieldName',title:'字段名称',width:150}
        ]],
        onSelect: function (i, row) {
            $(columnNameCol.target).textbox("setValue", row["columnName"]);
        }
    });

    if (row["fieldId"]) {
        $(fieldNameCol.target).combogrid("setValue", row["fieldId"]);
    }
};


sysMetaConstraintDetailGrid.init();

sysMetaConstraintDetailGrid.bindDefaultToolbarEvent();
// --------------------------保存数据------------------------------------------------------------------
sysMetaConstraintDetailGrid.toolbar.find("[tag=save]").click(function() {
    if (sysMetaConstraintDetailGrid.isEditing) {
        if (sysMetaConstraintDetailGrid.grid.datagrid("validateRow", sysMetaConstraintDetailGrid.editingIndex)) {
            var data = sysMetaConstraintDetailGrid.makeSubmitData();
            var editRow = sysMetaConstraintDetailGrid.grid.datagrid("getRows")[sysMetaConstraintDetailGrid.editingIndex];
            data.defId = sysMetaConstraintGrid.selectedRow["defId"];
            var submitUrl = "/sys/meta/addDetail";
            if (editRow["detailId"]) {
                submitUrl = "/sys/meta/updateDetail";
                data.detailId = editRow.detailId;
            }
            if (!HgUtil.repeatSubmitCheck($(this), submitUrl)){
				return;
			}
            HgUtil.post(submitUrl, data, function(data) {
                if (!data.success) {
                    sysMetaConstraintDetailGrid.showMsgbox("error",data.data,330);
                } else {
                	HgUi.ok("保存成功!",function(){
                        sysMetaConstraintDetailGrid.grid.datagrid("reload");
                    });
                }
            });

        } else {
            sysMetaConstraintDetailGrid.showMsgbox("alert","有一条数据未校验通过!",180);
        }
    }
});

//-------------------------删除-----------------------------------------------------------------------
sysMetaConstraintDetailGrid.toolbar.find("[tag=del]").click(function(){
    var row = sysMetaConstraintDetailGrid.grid.datagrid("getSelected");
    if (!row) {
    	HgUi.alert("请选择一条数据");
        return;
    }
    $.messager.confirm("确认删除", "确认将选中的数据删除?", function(r){
        if (r) {
            HgUtil.getJson("/sys/meta/delDetail",{detailId:row.detailId},function(data){
                if (!data.success) {
                	HgUi.alert("删除失败,"+data.data);
                } else {
                    HgUi.ok("删除成功!",function(){
                        sysMetaConstraintDetailGrid.grid.datagrid("reload");
                    });
                }
            });
        }
    });
});

// 组织提交数据
sysMetaConstraintDetailGrid.makeSubmitData = function() {
    var data = sysMetaConstraintDetailGrid.getEditorsData();
    return {
        "fieldId": data["field.fieldName"]
    };
};

// 清空查询---------------------------------------------------------------------------------------------------
sysMetaConstraintDetailGrid.toolbar.find("[tag=clear]").click(function() {
    sysMetaConstraintDetailGrid.grid.datagrid("getPanel").find("tr.datagrid-filter-row td input").each(function(){
        $(this).val("");
    });
    sysMetaConstraintDetailGrid.grid.datagrid("removeFilterRule");
    sysMetaConstraintDetailGrid.grid.datagrid("load", {});
});

