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
    <div class="easyui-layout" style="height: 600px;">
        <div data-options="region:'center',title:'websocket消息推送demo',border:false" style="padding: 0px;">
            <div style="width: 900px;margin: 10px;border: 1px solid;">
              <strong>demo内容：</strong>websocket页面通讯<br/>
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
            <fieldset style="border: 1px solid;">
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
        var flag = 0;
        //页面的js的延时一定要长于后台循环延时时间,避免重复调用websocket,导致消息队列数据刷新过快
        $(function(){
        	$("#operateInfo").html("尝试调用正在运行的实例");
        	setTimeout(function(){
        		if(flag==0){
        			openWs();
        		}
        	}, 3000);
        });
        
        //该方法可以设置为$();调用执行,尽量避免使用按钮调用,
        function openWs() {
        	$("#operateInfo").html("正在检测是否存在可用的消息信道");
	        var stompClient = null;
            if (stompClient) {
                return;
            }
            var websocket = new SockJS("${ctx}/sockjs/stomp");
            stompClient = Stomp.over(websocket);
            stompClient.connect({}, function () {
                //console.log("stomp connection已建立！");
                //尝试直接信道读取内容
                stompClient.subscribe('/topic/notice1', function (msg) {
                	$("#operateInfo").html("调用成功,开始通讯");
                	flag = 1;
                	var content = $("#socketMessageDiv").html();
                	$("#socketMessageDiv").html(msg.body +"<br/>"+ content);
                });
                setTimeout(function(){
	               	if(flag==0){
	                	stompClient.send("/app/common/demo/webSocket/trigger-notice", {}, "test");
	               	}
                },3000);
               	
            })
        }

    </script>
</body>
</html>