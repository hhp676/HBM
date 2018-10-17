var mycolumns = [[
	    	{field:'name',title:'<b>键</b>',width:80,resizable:true},
	        {field:'value',title:'<b>值</b>',width:400,resizable:true}
	    ]];
		
		
//-------------------------------JVM信息-----------------------------------------------------------------
$(function() {
	HgUtil.getJson("/sys/info/jvmInfo",{},function(data){
		var rows = [];
		var jvmData = data;
		for (var prop in jvmData) {				
			if (typeof(jvmData[prop]) == "object") {
				var obj = jvmData[prop];
				if (obj instanceof Array) {
					
				} else {
					for (var subProp in obj) {
						_makePgRowAndPush(rows,subProp,obj[subProp],prop);							
					}
				}
			} else {
				_makePgRowAndPush(rows,prop,jvmData[prop],"main");	
			}				
		}
		$('#jvmInfo_pgrid').propertygrid('loadData', rows);
		
	});
});

		
		
/*-----------------------------------------------------------------------------
* 私有工具方法
------------------------------------------------------------------------------*/
function _makePgRowAndPush(rows,name,value,group) {
	var row = {};
	row.name = name;
	row.value = value;
	if (group) row.group = group;			
	rows.push(row);
}