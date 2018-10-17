package com.hginfo.hbm.srv;

import com.hginfo.hbm.base.entity.srv.SrvInterface;
import com.hginfo.hbm.base.service.srv.SrvInterfaceService;
import com.hginfo.hbm.srv.rest.IndexController;
import com.hginfo.hbm.srv.toolkit.PackageUtil;
import com.hginfo.hbm.srv.toolkit.UrlMappingUtil;
import com.hginfo.hdubbo.annotation.HReference;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import java.util.List;
import java.util.Map;

/**
 * 工程初始化任务。
 * Created by licheng on 2017-6-9.
 */
@Service
public class SrvSpringStartupListener implements ApplicationListener<ContextRefreshedEvent> {

    @HReference
    private SrvInterfaceService srvInterfaceService;


    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        //spring父容器和子容器启动大于两次,判断仅在子容器启动时执行
        if (event.getApplicationContext().getParent() != null && event.getApplicationContext().getParent().getDisplayName().equals("Root WebApplicationContext")) {
            ApplicationContext applicationContext = event.getApplicationContext();
            WebApplicationContext webApplicationContext = (WebApplicationContext) applicationContext;
            Map<RequestMappingInfo, HandlerMethod> handlerMethods = webApplicationContext.getBean(RequestMappingHandlerMapping.class).getHandlerMethods();

            List<SrvInterface> interfaces = UrlMappingUtil.getSrvInterface(handlerMethods, PackageUtil.getRestPackageName());
            srvInterfaceService.updateData(interfaces, false);

        }
    }


}
