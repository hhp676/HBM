package com.hginfo.hbm.fe.core.spring;

import java.util.Date;

import com.hginfo.hbm.core.utils.RSAUtilSetter;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Service;

import com.hginfo.hbm.base.service.sys.SysConfigService;
import com.hginfo.hdubbo.annotation.HReference;

/**
 * spring启动时的监听事件.
 * ClassName: SpringStartupListener <br/>
 * @author yinyanzhen
 * @version 
 * @since V1.0.0
 */
@Service
public class SpringStartupListener implements ApplicationListener<ContextRefreshedEvent> {
    /**
     * 系统配置文件service.
     */
    @HReference
    private SysConfigService configService;
   
    
    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        //spring父容器和子容器启动为两次,判断仅在父容器启动时执行
        if (event.getApplicationContext().getParent() == null) {
            //更新系统时间版本
            this.updateSysTimerVerson();
            //从数据库中获取并设置RSAUtil keypair
            RSAUtilSetter.setKeyPair();
        }
    }
    
    /**
     * updateSysTimerVerson:(更新系统时间版本). <br/>
     * @author yinyanzhen
     * @since V1.0.0
     */
    private void updateSysTimerVerson() {
        try {
            //执行更新动作,参数不存在时会抛出异常,忽略该异常信息
            String keyVal = String.valueOf((new Date()).getTime());
            configService.edit("sysTimerVerson", keyVal);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
