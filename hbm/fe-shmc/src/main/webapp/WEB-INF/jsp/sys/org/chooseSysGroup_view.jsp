<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>岗位列表</title>
</head>
<body>
<div id="chooseSysGroup_Layout" class="easyui-layout" fit=true>
    <div region="center">
        <table id="chooseSysGroup_tree" data-options="url:'${ctx}/sys/org/orgTree',
               idField: 'nodeId',
               treeField: 'name',
               toolbar: '#chooseSysGroup_toolbar',
               pagination: false,
               fit: true,
               fitColumns: true,
               singleSelect: true,
               cascadeCheck:false,
               checkbox: function(row){
			        if (row.nodeType ==3){
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
        <div id="chooseSysGroup_toolbar" tag="listen_hotkey">
            <table>
                <tr>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon_add1" plain="true" tag="search">查询</a></td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
//组织树
$("#chooseSysGroup_tree").treegrid({
    onSelect: function (row) {
    	
    },
    onLoadSuccess : function(row, data){
        for(var index in chooseSysGroupTree.paramData){
        	$ (this).treegrid ('checkNode', "g_"+chooseSysGroupTree.paramData[index].groupId);
        }
    }
});

//保存操作
chooseSysGroupTree.onSave = function(callback){
	var rows = $("#chooseSysGroup_tree").treegrid("getCheckedNodes");
	var checkedIds = [];
	for(var index in rows){
		checkedIds.push(rows[index].baseId);
	}
	callback(checkedIds,rows);
}
</script>
</body>

</html>