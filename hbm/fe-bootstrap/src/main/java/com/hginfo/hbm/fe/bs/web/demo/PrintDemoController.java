package com.hginfo.hbm.fe.bs.web.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 打印.
 * ClassName: PrintDemoController <br/>
 * date: 2017年3月30日 下午2:52:01 <br/>
 * @author yinyanzhen
 * @version 
 * @since V1.0.0
 */
@RequestMapping("/common/demo/print")
@Controller
public class PrintDemoController {
    
    /**
     * toPrintDemoPage:(跳转页面). <br/>
     * @author yinyanzhen
     * @return String
     * @since V1.0.0
     */
    @RequestMapping("/toPrintDemoPage")
    public String toPrintDemoPage() {
        return "demo/print/printDemo_show";
    }
    
}
