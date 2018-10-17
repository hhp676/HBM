<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>WebSocket demo</title>
</head>
<body>
    <div class="easyui-layout" fit=true>
        <div data-options="region:'center',title:'websocket消息推送demo',border:false" style="padding: 0px;">
            <div style="width: 900px;margin: 10px;border: 1px solid;">
              <strong>demo内容：</strong>websocket页面通讯,也可以借鉴当前系统内任务中心模块代码<br/>
              <strong>适 用 场 景：</strong>系统通知,消息提醒,待办,以及超时处理等动作<br/>
              <strong>使 用 说 明：</strong>前台直接读取信道(因为js不跟随页面消亡,所以需要先探知是否已经有调用的实例存在,然后再尝试读取信道信息,信道不能多次读取或者写入多次,否者页面内消息刷新频率将会累加)<br/>
              <strong>注 意 事 项：</strong>详见开发手册及代码
            </div>
            <table width="100%">
                <tr>
                    <td align="center">稍等片刻即将开始websocket消息通讯</td>
                </tr>
                <tr>
                    <td align="center">
                        <label id="operateInfo" style="color: red;"></label>
                    </td>
                </tr>
            </table>
            <fieldset>
                <legend>信息展示框</legend>
	            <div id="socketMessageDiv" 
	               style="width: 100%;height: 400px;overflow: hidden;text-align: center;">
	            </div>
            </fieldset>
		</div>
    </div>
    
    <script type="text/javascript" src="${ctx}/static/js/ws/sockjs.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/ws/stomp.js"></script>
    <script type="text/javascript">
        $(function(){
        	$("#operateInfo").html("尝试调用正在运行的实例");
        	//本处延时添加,是因为websocket会影响easyui的样式渲染
        	setTimeout(function(){
        			openWs();
        	}, 3000);
        });
        var flag = 0;
        //该方法可以设置为$();调用执行,尽量避免使用按钮调用,
        function openWs() {
        	$("#operateInfo").html("正在检测是否已经订阅");
        	//websocket存在,且处于连接状态时,返回,不再继续调用
            if (HgCommon.demoStompClient && HgCommon.demoStompClient.connected) {
                return;
            }
            if (!HgCommon.demoStompClient){
	            var websocket = new SockJS("${ctx}/sockjs/stomp");
	            HgCommon.demoStompClient = Stomp.over(websocket);
            }
            HgCommon.demoStompClient.connect({}, function () {
                //订阅消息
                HgCommon.demoStompClient.subscribe('/topic/notice1', function (msg) {
                	//页面在当前页面时,继续执行回调函数
                	if($("#operateInfo").length>0 && $("#socketMessageDiv").length>0){
	                	$("#operateInfo").html("调用成功,开始通讯");
	                	flag = 1;
	                	var content = $("#socketMessageDiv").html();
	                	$("#socketMessageDiv").html(msg.body +"<br/>"+ content);
                	}else{
                		//已经离开当前页面时,进行websocket断开,订阅将自动取消
                		HgCommon.demoStompClient.disconnect(function(){});
		            	//取消订阅demo
			            /* $.each(HgCommon.demoStompClient.subscriptions, function(subscription){
			                HgCommon.sysTaskStompClient.unsubscribe(subscription);
			            }); */
                	}
                });
                //本处延时添加是因为避免重复启用websocket,(建议将websocket启用,设置为后台启用,不建议页面书写)
                setTimeout(function(){
	               	if(flag==0){
	                	HgCommon.demoStompClient.send("/app/common/demo/webSocket/trigger-notice", {}, "test");
	               	}
                },3000);
               	
            })
        }

    </script>
</body>
</html>