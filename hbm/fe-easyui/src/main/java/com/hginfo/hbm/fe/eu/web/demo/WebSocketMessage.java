package com.hginfo.hbm.fe.eu.web.demo;

import java.security.Principal;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.hginfo.hutils.DateTimeUtil;

/**
 * websocketDemo通信controller.
 * ClassName: WebSocketMessage <br/>
 * @author yinyanzhen
 * @since V1.0.0
 */
@Controller
@MessageMapping("/common/demo/webSocket")
public class WebSocketMessage {
    /**
     */
    @Autowired
    private SimpMessagingTemplate msgTemplate;
    
    /**
     * greeting:(websockt通信方法). <br/>
     * @author yinyanzhen
     * @param value2 value2
     * @param principal principal
     * @since V1.0.0
     */
    @MessageMapping("trigger-notice")
    public void greeting(String value2, Principal principal) {
//        该参数可以设定为json格式传送数据,后台解析后进行处理
        System.out.println(value2);
        try {
            while (true) {
                //全局消息发送
                msgTemplate.convertAndSend("/topic/notice1", 
                    "来至websocket的通信信息:通知公告__当前时间" 
                    + DateTimeUtil.getDateTimeStr(new Date(), "yyyy-MM-dd HH:mm:ss"));
                //循环中,每次消息发送延时两秒
                Thread.currentThread().sleep(2000L);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();   
        }
        //用户定点发送(非全局通信)
        //msgTemplate.convertAndSendToUser(principal.getName(), "/topic/notice1", "notice1: " + value2);
    } 
}
