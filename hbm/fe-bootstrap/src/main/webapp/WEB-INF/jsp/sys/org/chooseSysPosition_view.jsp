<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>岗位列表</title>
</head>
<body>
<div id="chooseSysPosition_Layout" class="easyui-layout" fit=true>
    <div region="center">
        <table id="chooseSysPosition_tree" data-options="url:'${ctx}/sys/org/orgTree',
               idField: 'nodeId',
               treeField: 'name',
               toolbar: '#chooseSysPosition_toolbar',
               pagination: false,
               fit: true,
               fitColumns: true,
               singleSelect: true,
               cascadeCheck:false,
               checkbox: function(row){
			        if (row.nodeType ==2){
			            return true;
			        }
			   }">
            <thead>
            <tr>
                <th data-options="field:'name',width:400">名称</th>
                <th data-options="field:'nodeType',width:150,formatter:HgUtil.fieldFormatterFunc('orgNodeType')">类型</th>
                <th data-options="field:'code',width:200">编码</th>
            </tr>
            </thead>
        </table>
        <div id="chooseSysPosition_toolbar" tag="listen_hotkey">
            <table>
                <tr>
                    <td>
                        <a href="javascript:void(0);" class="btn btn-azure" tag="search"><i class="fa fa-search"></i>搜索</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
//组织树
$("#chooseSysPosition_tree").treegrid({
    onSelect: function (row) {
    	
    },
    onLoadSuccess : function(row, data){
        for(var index in chooseSysPositionTree.paramData){
        	$ (this).treegrid ('checkNode', "p_"+chooseSysPositionTree.paramData[index].positionId);
        }
    },
    onBeforeCheckNode:function(row, checked){
    	//单选模式下，只能选中一个
   		if (checked && chooseSysPositionTree.mode == 'single') {
        	$(this).treegrid("clearChecked");
        }
   	}
});

//保存操作
chooseSysPositionTree.onSave = function(callback){
	var rows = $("#chooseSysPosition_tree").treegrid("getCheckedNodes");
	var checkedIds = [];
	for(var index in rows){
		checkedIds.push(rows[index].baseId);
	}
	callback(checkedIds,rows);
}
</script>
</body>

</html>