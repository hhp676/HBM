$(function() {
	HgUtil.getJson("/sys/info/serverInfo",{},function(data){
		var groupRows = [];
		var subGridColumns = [[]];
		var subGridColumnsMultiObj = {};
		var rowData = {};
		var serverData = data;
		for (var prop in serverData) {
			if (typeof(serverData[prop]) == "object") {
				var groupRow = {group:"<b>"+prop+"</b>",groupTag:prop};					
				var obj = serverData[prop];
				if (obj instanceof Array) {
					groupRow.isMulti = true;
					var subGridColumnsMulti = [[]];
					var subData = obj[0];
					for (var subProp in subData) {
						subGridColumnsMulti[0].push({field:subProp,title:subProp,width:200});
					}
					subGridColumnsMultiObj[prop] = subGridColumnsMulti;
					//------------------------行数据组织-----------------------------------
					var ddAry = [];
					for (var i=0;i<obj.length;i++) {
						ddAry.push(obj[i]);
					}
					rowData[prop] = ddAry;
				} else {
					groupRow.isMulti = false;
					subGridColumns = [[{field:"name",title:'键',width:200},{field:'value',title:'值',width:200}]];
					//------------------------行数据组织-----------------------------------
					var ddAry = [];
					for (var subProp in obj) {
						ddAry.push({name:subProp,value:obj[subProp]});
					}
					rowData[prop] = ddAry;
					
				}
				groupRows.push(groupRow);
			}
		}
		$("#serverInfo_grid").datagrid({
			onExpandRow:function(index,row){
				var subGrid = $(this).datagrid('getRowDetail',index).find('table.subGrid');
				var isMulti = $(this).datagrid('getRows')[index].isMulti;
				var group = $(this).datagrid('getRows')[index].groupTag;
				var columns = [[]];
				if (isMulti) columns = subGridColumnsMultiObj[group];
				else columns = subGridColumns;
				subGrid.datagrid({
					height:"auto",
					fitColumns:true,
					columns:columns,
					onResize:function(){
                        $('#serverInfo_grid').datagrid('fixDetailRowHeight',index);
                    },
                    onLoadSuccess:function(){
                        setTimeout(function(){
                            $('#serverInfo_grid').datagrid('fixDetailRowHeight',index);
                        },0);
                    }
				});
				subGrid.datagrid('loadData', rowData[group]);
				$('#serverInfo_grid').datagrid('fixDetailRowHeight',index);
			}
		});
		
		for (var i=0;i<groupRows.length;i++) {
			$('#serverInfo_grid').datagrid('expandRow',i);
		}
		$('#serverInfo_grid').datagrid('loadData', groupRows);
	});	
});

function _serverInfoGridDefaultFmt(rowIndex, rowData){
	return '<div style="padding:2px"><table class="subGrid"></table></div>';
}	