var sysMetaConstraintGrid = new HgUi.Datagrid("sysMetaConstraint_grid");
sysMetaConstraintGrid.checkUpdateAuth = true;
sysMetaConstraintGrid.toolbar = $("#sysMetaConstraint_toolbar");
sysMetaConstraintGrid.mode = "rowEdit"; //行编辑模式
sysMetaConstraintGrid.options.isShowContextMenu = true;
sysMetaConstraintGrid.options.aboutUrl = "/sys/meta/aboutDef";
sysMetaConstraintGrid.options.tipCells = ["metaEntity.entityName", "defCode", "defName", "errorMsg"];
sysMetaConstraintGrid.options.onSelect = function(index, row) {
	var detailGrid = $("#sysMetaConstraintDetail_grid");
    if (row && row.defId){
        sysMetaConstraintGrid.selectedRow = row;

        // 显示约束字段列表
        if (detailGrid.length > 0) {
            detailGrid.datagrid("options").url = G_CTX_PATH + "/sys/meta/constraintDetailList/" + row["defId"];
            detailGrid.datagrid("reload");
        }
    } else {
        if (detailGrid.length > 0) {
        	detailGrid.datagrid("options").url = G_CTX_PATH + "/sys/meta/constraintDetailList/-1";
            detailGrid.datagrid("reload");
        }
    }
};

sysMetaConstraintGrid.options.onLoadSuccess = function() {
    sysMetaConstraintGrid.grid.datagrid("selectRow",0);
};

sysMetaConstraintGrid.options.onBeginEdit = function (index, row) {
    var entityCol = sysMetaConstraintGrid.grid.datagrid("getEditor", {
        index: index,
        field : "metaEntity.entityName"
    });

    $(entityCol.target).combogrid({
        url: G_CTX_PATH + '/sys/sysMetadata/getEntityList',
        value:sysMetadataEntityConstraintGrid.selectedRow.entityId,
        readonly:true,
        columns: [[
            {field:'entityCode',title:'实体编码',width:150},
            {field:'entityName',title:'实体名称',width:150}
        ]]
    });

    if (row["entityId"]) {
        $(entityCol.target).combogrid("setValue", row["entityId"]);
    }

    /*var refCol = sysMetaConstraintGrid.grid.datagrid("getEditor", {
        index: index,
        field : "refId"
    });

    $(refCol.target).combogrid({
        url: G_CTX_PATH + '/sys/meta/getDefList',
        columns: [[
            {field:'defCode',title:'约束编码',width:150},
            {field:'defName',title:'约束名称',width:150}
        ]]
    });

    if (row["refId"]) {
        $(refCol.target).combogrid("setValue", row["refId"]);
    }*/

};

var sysConstraintDefEntityNameFormatter = function (entityId) {
    if (!entityId) {
        return "";
    }
    var entityName = "";
    HgUtil.ajax({
        url:"/sys/meta/getEntity/"+entityId,
        success:function(data){
            entityName = data["entityName"];
        },
        async:false
    });
    return entityName;
};

var sysConstraintDefRefFormatter = function (defId) {
    if (!defId) {
        return "";
    }
    var defName = "";
    HgUtil.ajax({
        url:"/sys/meta/getDef/"+defId,
        success:function(data){
            defName = data["defName"];
        },
        async:false
    });
    return defName;
};

sysMetaConstraintGrid.init();
sysMetaConstraintGrid.grid.datagrid("enableFilter");

sysMetaConstraintGrid.bindDefaultToolbarEvent();
// --------------------------保存数据------------------------------------------------------------------
sysMetaConstraintGrid.toolbar.find("[tag=save]").click(function() {
    if (sysMetaConstraintGrid.isEditing) {
        if (sysMetaConstraintGrid.grid.datagrid("validateRow", sysMetaConstraintGrid.editingIndex)) {
            var data = sysMetaConstraintGrid.makeSubmitData();
            var editRow = sysMetaConstraintGrid.grid.datagrid("getRows")[sysMetaConstraintGrid.editingIndex];
            var submitUrl = "/sys/meta/addDef";
            if (editRow["defId"]) {
                submitUrl = "/sys/meta/updateDef";
                data.defId = editRow.defId;
            }
            if (!HgUtil.repeatSubmitCheck($(this), submitUrl)){
				return;
			}
            HgUtil.post(submitUrl, data, function(data) {
                if (!data.success) {
                    sysMetaConstraintGrid.showMsgbox("error",data.data,330);
                } else {
                	HgUi.ok("保存成功!",function(){
                		sysMetaConstraintGrid.grid.datagrid('reload');
                    });
                }
            });

        } else {
            sysMetaConstraintGrid.showMsgbox("alert","有一条数据未校验通过!",180);
        }
    }

});


//-------------------------删除-----------------------------------------------------------------------
sysMetaConstraintGrid.toolbar.find("[tag=del]").click(function(){
    var row = sysMetaConstraintGrid.grid.datagrid("getSelected");
    if (!row) {
        $.messager.alert("提示","请选择一条数据","warning");
        return;
    }
    $.messager.confirm("确认删除", "确认将选中的数据删除?", function(r){
        if (r) {
            HgUtil.getJson("/sys/meta/delDef",{defId:row.defId},function(data){
                if (!data.success) {
                    $.messager.alert("提示","删除失败,"+data.data,"warning");
                } else {
                    HgUi.ok("删除成功!",function(){
                        sysMetaConstraintGrid.grid.datagrid("reload");
                    });
                }
            });
        }
    });
});

// 组织提交数据
sysMetaConstraintGrid.makeSubmitData = function() {
    var data = sysMetaConstraintGrid.getEditorsData();
    data["entityId"] = data["metaEntity.entityName"];
    data["defType"] = 3;
    return data;
};


// 清空查询---------------------------------------------------------------------------------------------------
sysMetaConstraintGrid.toolbar.find("[tag=clear]").click(function() {
    sysMetaConstraintGrid.grid.datagrid("getPanel").find("tr.datagrid-filter-row td input").each(function(){
        $(this).val("");
    });
    sysMetaConstraintGrid.grid.datagrid("removeFilterRule");
    sysMetaConstraintGrid.grid.datagrid("load", {});
});

