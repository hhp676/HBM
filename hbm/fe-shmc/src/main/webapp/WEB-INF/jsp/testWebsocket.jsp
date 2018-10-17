<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>WebSocket 测试</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.1.12.4.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ws/sockjs.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ws/stomp.js"></script>
    <script type="text/javascript">
        var stompClient = null;

        function openWs() {
            if (stompClient) {
                return;
            }
            var websocket = new SockJS("${pageContext.request.contextPath}/sockjs/stomp");
            stompClient = Stomp.over(websocket);
            stompClient.connect({}, function () {
                //console.log("stomp connection已建立！");
                stompClient.subscribe('/topic/notice1', function (msg) {
                    console.log(msg);
                    //console.log("收到消息：" + msg.body);
                });
                stompClient.subscribe('/topic/user/notice2', function (msg) {
                    //console.log(msg);
                    //console.log("收到消息：" + msg.body);
                });

                stompClient.send("/app/trigger-notice", {}, "test");
            })
        }

    </script>
</head>
<body>
    消息：<input name="msg" id="msg" value="消息测试！"><br/>
    <a href="javaScript:openWs();">连接</a>
</body>
</html>