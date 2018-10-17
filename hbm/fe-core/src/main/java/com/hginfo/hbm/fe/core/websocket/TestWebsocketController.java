package com.hginfo.hbm.fe.core.websocket;

import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

/**
 * Websocket测试需要的Controller类。<br>
 * Created by qiujingde on 2016/11/5.
 * @author qiujingde
 */
@Controller
public class TestWebsocketController {

    /**
     *
     */
    private static final Log LOG = LogFactory.getLog(TestWebsocketController.class);

    private SimpMessagingTemplate msgTemplate;

    /**
     *
     * @return String
     */
    @RequestMapping("/test/ws")
    public String testWs() {
        return "testWebsocket";
    }


    /**
     *
     * @param value2      信息
     * @param principal   授权信息
     */
    @MessageMapping("/trigger-notice")
    public void greeting(String value2, Principal principal) {
        if (LOG.isDebugEnabled()) {
            LOG.debug("principal: " + principal);
        }
        msgTemplate.convertAndSend("/topic/notice1", "notice1: " + value2);
        msgTemplate.convertAndSend("/topic/notice2", "notice2: " + value2);
        msgTemplate.convertAndSendToUser(principal.getName(), "/topic/notice1", "notice1: " + value2);
    }

    public String userGreeting(String value) {
        return value;
    }

    @Autowired
    public void setMsgTemplate(SimpMessagingTemplate msgTemplate) {
        this.msgTemplate = msgTemplate;
    }
}
