var sysUserTabLogViewGrid = new HgUi.Datagrid("sysUserTabLogView_grid");
sysUserTabLogViewGrid.toolbar = $ ("#sysUserTabLog_toolbar");
sysUserTabLogViewGrid.options.tipCells = ["operCode","operName","reqUri","operIp","key1","key2","key3","content","operRes","crtTime"];
sysUserTabLogViewGrid.init();
sysUserTabLogViewGrid.grid.datagrid("enableFilter",[
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
					sysUserTabLogViewGrid.grid.datagrid('removeFilterRule', 'operRes');
				}
				else{
					sysUserTabLogViewGrid.grid.datagrid('addFilterRule', {
						field: 'operRes',
						op: 'equal',
						value: value
					});
				}
				sysUserTabLogViewGrid.grid.datagrid('doFilter');
			}
		}
	}
]);

// 清空查询---------------------------------------------------------------------------------------------------
sysUserTabLogViewGrid.toolbar.find("[tag=clear]").click(function() {
    sysUserTabLogViewGrid.grid.datagrid("removeFilterRule");
    sysUserTabLogViewGrid.grid.datagrid("load");
});