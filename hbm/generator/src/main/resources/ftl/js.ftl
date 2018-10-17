var ${meta.className}Datagrid = new HgUi.Datagrid("${meta.className}_datagrid");
${meta.className}Datagrid.toolbar = $("#${meta.className}_toolbar");
${meta.className}Datagrid.mode = "rowEdit"; //行编辑模式
${meta.className}Datagrid.options.isShowContextMenu = true;
${meta.className}Datagrid.options.onSelect = function(index,row) {
    if (row && row.dictGroupId){
        ${meta.className}Datagrid.selectedRow = row;
    }
};
${meta.className}Datagrid.options.onLoadSuccess = function(data) {
    ${meta.className}Datagrid.grid.datagrid("selectRow",0);
};
${meta.className}Datagrid.init();
${meta.className}Datagrid.grid.datagrid("enableFilter");
${meta.className}Datagrid.bindDefaultToolbarEvent();

// --------------------------保存数据------------------------------------------------------------------
${meta.className}Datagrid.toolbar.find("[tag=save]").click(function() {
    if (${meta.className}Datagrid.isEditing == true) {
        if (${meta.className}Datagrid.grid.datagrid("validateRow", ${meta.className}Datagrid.editingIndex)) {
            var data = ${meta.className}Datagrid.makeSubmitData();
            var editRow = ${meta.className}Datagrid.grid.datagrid("getRows")[${meta.className}Datagrid.editingIndex];
            var submitUrl = "/${meta.module}/${meta.className}/add";
            if (editRow.id) {
                submitUrl = "/${meta.module}/${meta.className}/upd";
                data.id = editRow.id;
            }
            HgUtil.post(submitUrl, data, function(data) {
                if (!data.success) {
                    ${meta.className}Datagrid.showMsgbox("error", data.data, 330);
                } else {
                    ${meta.className}Datagrid.grid.datagrid('reload');
                }
            });

        } else {
            ${meta.className}Datagrid.showMsgbox("alert", "有一条数据未校验通过!", 180);
        }
    }
});

//-------------------------删除-----------------------------------------------------------------------
${meta.className}Datagrid.toolbar.find("[tag=del]").click(function(){
    var row = ${meta.className}Datagrid.grid.datagrid("getSelected");
    if (!row) {
        $.messager.alert("提示","请选择一条字典组数据","warning");
        return;
    }
    $.messager.confirm("确认删除", "确认将选中的字典组删除?", function(r){
        if (r) {
            HgUtil.getJson("/${meta.module}/${meta.className}/del",{id:row.id}, function(data){
                if (!data.success) {
                    $.messager.alert("提示","删除失败,"+data.data,"warning");
                } else {
                    HgUi.ok("删除成功!",function(){
                        ${meta.className}Datagrid.grid.datagrid("reload");
                    });
                }
            });
        }
    });
});

// 组织提交数据
${meta.className}Datagrid.makeSubmitData = function() {
<#list meta.entityCols as col>
    <#if col.pkFlag == false && col.fieldName != "tenantId">
    var ${col.fieldName} = ${meta.className}Datagrid.grid.datagrid('getEditor', {
        index : ${meta.className}Datagrid.editingIndex,
        field : "${col.fieldName}"
    });
    </#if>
</#list>

    var data = {
<#list meta.entityCols as col>
    <#if col.pkFlag == false && col.fieldName != "tenantId">
        ${col.fieldName} : $(${col.fieldName}.target).textbox("getValue")<#if col_index + 1 < meta.entityCols?size>,</#if>
    </#if>
</#list>
    };
    return data;
};

// 清空查询---------------------------------------------------------------------------------------------------
${meta.className}Datagrid.toolbar.find("[tag=clear]").click(function() {
    ${meta.className}Datagrid.grid.datagrid("removeFilterRule");
    ${meta.className}Datagrid.grid.datagrid("load", {});
});
