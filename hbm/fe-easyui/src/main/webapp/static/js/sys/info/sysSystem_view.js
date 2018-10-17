var mycolumns = [[
	    	{field:'name',title:'<b>键</b>',width:80,resizable:true},
	        {field:'value',title:'<b>值</b>',width:400,resizable:true}
	    ]];	
$(function() {
	HgUtil.getJson("/sys/info/systemInfo",{},function(data){
		var rows = [];
		$('#sysInfo_pgrid').propertygrid('loadData', rows);
		var systemData = data ;
		var row = {};
		for (var prop in systemData) {
			row = {};
			row.name = prop;
			row.value = systemData[prop];
			$('#sysInfo_pgrid').propertygrid('appendRow', row);
		}
		
	});
});
		
		
		 