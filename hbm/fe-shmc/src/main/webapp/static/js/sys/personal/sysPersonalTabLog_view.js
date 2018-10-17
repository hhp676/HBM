var sysPersonalTabLogViewGrid = new HgUi.Datagrid("sysPersonalTabLogView_grid");
sysPersonalTabLogViewGrid.toolbar = $ ("#sysPersonalTabLog_toolbar");
sysPersonalTabLogViewGrid.options.tipCells = ["operCode","operName","reqUri","operIp","key1","key2","key3","content","operRes","crtTime"];
sysPersonalTabLogViewGrid.init();
sysPersonalTabLogViewGrid.grid.datagrid("enableFilter",[
	{
		field: 'operRes',
		type: 'combobox',
		options: {
			panelHeight:'auto',
			editable:false,
			prompt: '---请选择---',
			data:HgUtil.getDictComboboxData('LOG_RESULT'),
			onChange: function(value) {
				if (value == ''){
					sysPersonalTabLogViewGrid.grid.datagrid('removeFilterRule', 'operRes');
				}
				else{
					sysPersonalTabLogViewGrid.grid.datagrid('addFilterRule', {
						field: 'operRes',
						op: 'equal',
						value: value
					});
				}
				sysPersonalTabLogViewGrid.grid.datagrid('doFilter');
			}
		}
	}
]);
//清空查询---------------------------------------------------------------------------------------------------
sysPersonalTabLogViewGrid.toolbar.find("[tag=clear]").click(function() {
	sysPersonalTabLogViewGrid.grid.datagrid("removeFilterRule");
	sysPersonalTabLogViewGrid.grid.datagrid("load", {});
});