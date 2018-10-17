package com.hginfo.hbm.fe.mc.web.demo;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.fe.core.freemarker.FeFreeMarkerFactory;
import com.hginfo.hbm.fe.core.utils.FreeMarkerUtil;
import com.hginfo.hbm.fe.mc.op.OperationResult;
import com.hginfo.hutils.EncodeUtil;
import com.hginfo.hutils.MailSmtpUtil;
import com.hginfo.hutils.RequestUtil;
import com.hginfo.hutils.exception.ExceptionUtil;

import freemarker.template.Template;

/**
 * 邮件发送demo.
 * ClassName: MailController <br/>
 * @author yinyanzhen
 * @since V1.0.0
 */
@Controller
@RequestMapping("/common/demo/mail")
public class MailController {
    /**
     */
    @Autowired
    private FeFreeMarkerFactory freeMarkerFactory;
    
    /**
     * toMailDemoPage:(跳转到邮件发送页面). <br/>
     * @author yinyanzhen
     * @return 页面
     * @since V1.0.0
     */
    @RequestMapping("/toMailDemoPage")
    public String toMailDemoPage() {
        return "demo/mail/mailDemo_show";
    }
    
    /**
     * 
     * sendMail:(邮件发送). <br/>
     * @author yinyanzhen
     * @param request request
     * @return json
     * @since V1.0.0
     */
    @RequestMapping("/sendMail")
    @ResponseBody
    public OperationResult sendMail(HttpServletRequest request) {
        Map<String, String> vo = RequestUtil.getRequestParamMap(request);
        //消息体到达后台以后,需要重新转换为html语言
        vo.put("mailBody", EncodeUtil.unescapeHtml4(vo.get("mailBody")));
        
        OperationResult result = new OperationResult();
        boolean flag;
        Properties pro = new Properties();
        try {
            pro.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("env.properties"));
        } catch (IOException e1) {
        }
        MailSmtpUtil mailSmtpUtil = new MailSmtpUtil(
            pro.getProperty("mail.host"), 
            Integer.parseInt(pro.getProperty("mail.port")),
            pro.getProperty("mail.username"), 
            pro.getProperty("mail.password"));
        if ("0".equals(vo.get("type"))) {
            flag = mailSmtpUtil.sendMailAndFile(vo.get("receiver"), vo.get("subject"),
                vo.get("mailBody"), new String[]{});
        } else {
            try {
                //设置邮件使用的默认模版
                Template temp = freeMarkerFactory.getTemplate("mail.ftl");
                Map<String, Object> freeMakerMap = new HashMap<>(); 
                freeMakerMap.put("mailBody", vo.get("mailBody"));
                //将参数传入freemarker模版,获取邮件信息
                String mailBody = FreeMarkerUtil.generateHtmlFromFtl(temp, freeMakerMap);
                
                flag = mailSmtpUtil.sendMailAndFile(vo.get("receiver"), vo.get("subject"),
                    mailBody, new String[]{});
            } catch (Exception e) {
                flag = false; 
                e.printStackTrace();
                result.setData(ExceptionUtil.getExceptionMsg(e));
            }
        }
        result.setSuccess(flag);
        return result;
    }
    
}
