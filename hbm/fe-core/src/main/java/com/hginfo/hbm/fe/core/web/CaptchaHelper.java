package com.hginfo.hbm.fe.core.web;

import com.google.code.kaptcha.Producer;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;

/**
 * Created by qiujingde on 2017/3/10.
 * 验证码辅助类。
 *
 * @author qiujingde
 */
public class CaptchaHelper {

    /**
     * 日志。
     */
    private static final Log LOG = LogFactory.getLog(CaptchaHelper.class);

    /**
     * google captcha producer.
     */
    @Autowired
    private Producer captchaProducer;

    /**
     * 显示验证码图片。
     * @param request request
     * @param response response
     * @since V3.0.0-beta1
     */
    public void getKaptchaImage(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        response.setDateHeader("Expires", 0);
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
        response.setContentType("image/jpeg");
        String capText = captchaProducer.createText();
        session.setAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY, capText);
        BufferedImage bi = captchaProducer.createImage(capText);
        try (ServletOutputStream out = response.getOutputStream()) {
            ImageIO.write(bi, "jpg", out);
            out.flush();
            LOG.debug("*****验证码是: " + capText + "*****");
        } catch (Exception e) {
            LOG.error("getKaptchaImage fail !", e);
        }
    }

}
