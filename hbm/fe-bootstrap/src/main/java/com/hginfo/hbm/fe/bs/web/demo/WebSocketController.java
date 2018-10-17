package com.hginfo.hbm.fe.bs.web.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * ClassName: WebSocketController .<br/>
 * @author yinyanzhen
 * @since V1.0.0
 */
@Controller
@RequestMapping("/common/demo/webSocket")
public class WebSocketController {
    /**
     * toDemoView:(跳转到页面). <br/>
     * @author yinyanzhen
     * @return 页面
     * @since V1.0.0
     */
    @RequestMapping("/toDemoView")
    public String toDemoView() {
        return "demo/webSocket/webSocketDemo_show";
    }
}
