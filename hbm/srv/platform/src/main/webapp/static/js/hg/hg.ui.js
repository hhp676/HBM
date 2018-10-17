/**
 * hongguaninfo ui wrap
 *
 * @author cecily yu
 */
(function(){
    if (typeof(HgUi) == "undefined") window.HgUi = {};

    /****************************************************************************************************************
     * 提示框
     ***************************************************************************************************************/
    HgUi.alert = function(title,msg,type,callback) {
        var alertMsg = new StringBuffer();
        alertMsg.append("<div>");
        alertMsg.append("    <i class='glyphicon glyphicon-info-sign' style='font-size:30px;color:#f4b400'></i>&nbsp;&nbsp;&nbsp;"+msg);
        alertMsg.append("</div>");
        bootbox.dialog({
            size:"small",
            className:"my-dialog",
            message: alertMsg.toString(),
            buttons: {
                ok: {label: '确定',className: 'btn-warning', callback:callback}
            },
        });
        $('.messager-window .panel-tool-close').click(callback);
    };
    HgUi.confirm = function(title, msg, callback) {
        var confirmMsg = new StringBuffer();
        confirmMsg.append("<div>");
        confirmMsg.append("    <i class='glyphicon glyphicon-question-sign' style='font-size:30px;color:#57b5e3'></i>&nbsp;&nbsp;&nbsp;"+msg);
        confirmMsg.append("</div>");

        bootbox.confirm({
            size: "small",
            className:"my-dialog",
            message: confirmMsg.toString(),
            callback: callback,
            buttons: {
                confirm: {label: '确定', className: 'btn-info'},
                cancel: {label: '取消', className: ""}
            }
        });
    };

    HgUi.ok = function(msg, callback) {
        var okMsg = new StringBuffer();
        okMsg.append("<div>");
        okMsg.append("    <i class='glyphicon glyphicon-ok-sign' style='font-size:30px;color:#53a93f'></i>&nbsp;&nbsp;&nbsp;"+msg);
        okMsg.append("</div>");
        bootbox.dialog({
            size:"small",
            className:"my-dialog",
            message: okMsg.toString(),
            buttons: {
                ok: {label: '确定',className: 'btn-success', callback:callback}
            },
        });
        $('.messager-window .panel-tool-close').click(callback);
    };

    HgUi.error = function(msg, callback) {
        var errorMsg = new StringBuffer();
        errorMsg.append("<div>");
        errorMsg.append("    <i class='glyphicon glyphicon-warning-sign' style='font-size:30px;color:#d73d32'></i>&nbsp;&nbsp;&nbsp;"+msg);
        errorMsg.append("</div>");
        bootbox.dialog({
            size:"small",
            className:"my-dialog",
            message: errorMsg.toString(),
            buttons: {
                ok: {label: '确定',className: 'btn-danger', callback:callback}
            },
        });
        $('.messager-window .panel-tool-close').click(callback);
    };


    HgUi.notice = function (msg, callback) {
        var noticeMsg = new StringBuffer();
        noticeMsg.append("<div>");
        noticeMsg.append("    <i class='glyphicon glyphicon-volume-down' style='font-size:30px;color:#57b5e3'></i>&nbsp;&nbsp;&nbsp;"+msg);
        noticeMsg.append("</div>");
        bootbox.dialog({
            size:"small",
            className:"my-dialog",
            message: noticeMsg.toString(),
            buttons: {
                ok: {label: '确定',className: 'btn-info', callback:callback}
            },
        });
        $('.messager-window .panel-tool-close').click(callback);
    };

    HgUi.formToData = function (data , serializeArray) {
        for(var i=0;i<serializeArray.length;i++){
            data[serializeArray[i].name] = serializeArray[i].value;
        }
    }


})();



