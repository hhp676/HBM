package com.hginfo.hbm.srv.toolkit;

import com.hginfo.hbm.base.entity.srv.SrvInterface;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;

import java.lang.reflect.Parameter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * spring url映射工具类。
 * Created by licheng on 2017-6-9.
 */
public final class UrlMappingUtil {


    /**
     * 获取接口列表。
     * @param handlerMethods 委托方法
     * @return 接口列表
     */
    public static List<SrvInterface> getSrvInterface(Map<RequestMappingInfo, HandlerMethod> handlerMethods) {
        return getSrvInterface(handlerMethods, null);
    }


    /**
     * 获取某包下的接口列表。
     * @param handlerMethods 委托方法
     * @param basePackage 包名
     * @return 接口列表
     */
    public static List<SrvInterface> getSrvInterface(Map<RequestMappingInfo, HandlerMethod> handlerMethods, String basePackage) {

        List<SrvInterface> interfaces = new ArrayList<>();

        for (Map.Entry<RequestMappingInfo, HandlerMethod> m : handlerMethods.entrySet()) {
            RequestMappingInfo info = m.getKey();
            HandlerMethod method = m.getValue();
            if (!method.getMethod().getDeclaringClass().getName().startsWith(basePackage)) {
                continue;
            }

            SrvInterface srvInterface = new SrvInterface();

            List<String> urlList = new ArrayList<>();
            for (String url : info.getPatternsCondition().getPatterns()) {
                urlList.add(url);
            }
            srvInterface.setReqUri(String.join(",", urlList));
            srvInterface.setClassName(method.getMethod().getDeclaringClass().getName());
            srvInterface.setMethodName(method.getMethod().getName());
            srvInterface.setParameters(getUniqueMethodParameter(method.getMethod().getParameters()));

            interfaces.add(srvInterface);
        }

        return interfaces;
    }


    public static String getUniqueMethodParameter(Parameter[] parameters) {
        String typeStr = ";";
        for (int i = 0; i < parameters.length; i++) {
            typeStr += parameters[i].getType().getName() + ";";
        }
        return typeStr;
    }

}
