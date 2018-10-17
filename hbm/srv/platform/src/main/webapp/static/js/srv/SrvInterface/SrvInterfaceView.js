var SrvInterface = {};
var SrvInterfaceTable = $('#SrvInterfaceTable').DataTable({
    "processing": true,
    "serverSide": true,
    "lengthMenu": [[10, 25, 50], [10, 25, 50]],
    "searching": false,
    "ordering": false,
    "ajax": {
        "url": G_CTX_ADMIN_PATH + "/SrvInterface/list",
        "data": function (reqData) {
            HgUi.formToData(reqData , $("#srvInterfaceSearchForm").serializeArray());
            return reqData;
        }
    },
    "columns": [
        { "data": 'id', "visible" : false},
        { "data": "reqUri" },
        { "data": "className" },
        { "data": "methodName" },
        {
            "data": "ifSwitch" ,
            "render": function ( data, type, row ) {
                if (row.enabled!=1){
                    return '<button type="button" class="btn btn-xs">无效</button>';
                }
                //return "<input type='checkbox' onchange='SrvInterface.switchChanged("+row.ifId +",this)' class='flat-red' "+((data==1)?"checked":"")+"> 是否启用";
                return (data==1)?'<span  class="label label-success">正常</span>':'<span class="label label-danger">禁用</span>';
            }
        },
        {
            "data": "updTime" ,
            "render": function ( data, type, row ) {
                return (new Date(data)).format("yyyy-MM-dd hh:mm:ss");
            }
        },
        {
            "data": "enabled" ,
            "render": function ( data, type, row ) {
                if (row.enabled!=1){
                    return '无效数据';
                }
                if (row.reqUri=="/login"||row.reqUri=="/logout"){
                    return "系统接口"
                }
                var reStr = '<button type="button" class="btn btn-xs btn-success btn-enable-interface" onclick="SrvInterface.switch(\''+row.id+'\',true)">启用</button> ';
                reStr += '<button type="button" class="btn btn-xs btn-danger btn-disable-interface" onclick="SrvInterface.switch(\''+row.id+'\',false)">禁用</button> ';
                return reStr;
            }
        }
    ]
});


SrvInterface.switch = function (ifId, status) {
    var newValue = status?1:0;
    var msg = status?"您确定要启用接口吗？":"您确定要禁用接口吗？";
    HgUi.confirm("提示",msg,function (r) {
        if (r){
            HgUtil.getJson("/SrvInterface/update",{
                'ifId':ifId,
                'ifSwitch':newValue
            },function(data){
                console && console.log(data);
                SrvInterfaceTable.draw(false);
            })
        }
    })
    return false;
}

$("#srvInterfaceSearchForm .searchBtn").on('click',function (){
    SrvInterfaceTable.draw();
    return false;
})

$("#srvInterfaceSearchForm .clearBtn").on('click',function (){
    $("#srvInterfaceSearchForm")[0].reset()
    SrvInterfaceTable.draw();
    return false;
})

$("#srvInterfaceGenerate").on('click',function (){
    var url = "/SrvInterface/generateData";
    HgUtil.repeatSubmitCheck($(this),url);
    HgUtil.getJson(url,{},function(){
        SrvInterfaceTable.draw();
    })
})


