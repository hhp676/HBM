package com.hginfo.hbm.srv.toolkit;

import com.hginfo.hbm.srv.rest.IndexController;
import org.springframework.web.method.HandlerMethod;

/**
 * 包工具类。
 * Created by licheng on 2017-6-16.
 */
public class PackageUtil {

    /**
     * 判断方法是否属于REST包。
     * @param handlerMethod 方法
     * @return 是否属于
     */
    public static boolean isBelongRest(HandlerMethod handlerMethod){
        String className = handlerMethod.getMethod().getDeclaringClass().getName();
        return className.startsWith(getRestPackageName());
    }

    /**
     * 获取REST包名。
     * @return 包名
     */
    public static String getRestPackageName(){
        return IndexController.class.getPackage().getName();
    }

}
