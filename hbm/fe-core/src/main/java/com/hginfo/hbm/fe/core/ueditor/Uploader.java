package com.hginfo.hbm.fe.core.ueditor;

import com.alibaba.druid.support.json.JSONUtils;
import com.baidu.ueditor.define.State;
import com.baidu.ueditor.upload.Base64Uploader;
import com.baidu.ueditor.upload.BinaryUploader;

import java.io.IOException;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

/**
 * Reason: 添加对ftp上传的支持<br/>.
 * date: 2017年1月23日 上午10:42:45 <br/>
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
public class Uploader {
    /**
     * 
     */
    private HttpServletRequest  request = null;
    /**
     * 
     */
    private Map<String, Object> conf    = null;
    
    /**
     * 
     * Creates a new instance of Uploader.
     *
     * @param request request
     * @param conf conf
     */
    public Uploader(HttpServletRequest request, Map<String, Object> conf) {
        this.request = request;
        this.conf = conf;
    }
    
    /**
     * 
     * @author yinyanzhen
     * @return State
     * @since V1.0.0
     */
    public final State doExec() {
        String filedName = (String) this.conf.get("fieldName");
        State state = null;
        //保留原有逻辑,在json.config中加入是否使用FTP上传配置项
        if ("true".equals(this.conf.get("isBase64"))) {
            state = Base64Uploader.save(this.request.getParameter(filedName), this.conf);
            
        } else {
            if ("true".equals(this.conf.get("useFtpUpload"))) {
                state = FtpUploader.save(request, conf);
                
            } else {
                state = BinaryUploader.save(this.request, this.conf);
            }
        }
        //读取配置文件参数
        Properties pro = new Properties();
        try {
            pro.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("env.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        //读取配置文件内回显地址,拼接图片回显完整地址  BY yinyanzhen
        Map map = (Map) JSONUtils.parse(state.toJSONString());
        state.putInfo("url", pro.getProperty("ueditor.imageUrlPrefix") + map.get("url"));
        return state;
    }
}
