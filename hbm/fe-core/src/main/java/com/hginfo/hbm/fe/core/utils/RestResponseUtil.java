/**
 * Project Name:hbm-fe-core
 * File Name:RestResponseUtil.java
 * Package Name:com.hginfo.hbm.srv.utils
 * Date:2017年5月24日下午6:46:18
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.utils;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.exolab.castor.xml.MarshalException;
import org.exolab.castor.xml.Marshaller;
import org.exolab.castor.xml.ValidationException;

import com.hginfo.hutils.ResponseUtil;
import com.hginfo.hutils.StringUtil;

/**
 * XML转换工具类。
 * ClassName:RestResponseUtil <br/>
 * Date: 2017年5月24日 下午6:46:18 <br/>
 * @author licheng
 * @version
 * @since V1.0.0
 * @see
 */
public final class RestResponseUtil {
    
    /**
     * 
     */
    private static String renderDataType = "";
    
    public static void setRenderDataType(String renderDataType) {
        RestResponseUtil.renderDataType = renderDataType;
    }
    
    /**
     * 以XML方式输出对象。
     * @author licheng
     * @param response response
     * @param obj obj
     * @since V1.0.0
     */
    public static void renderXML(HttpServletResponse response, Object obj) {
        try {
            Marshaller.marshal(obj, response.getWriter());
        } catch (MarshalException | ValidationException | IOException e) {
            
        }
        response.setContentType("text/xml");
    }
    
    /**
     * 输出对象。
     * @author licheng
     * @param request request
     * @param response response
     * @param obj obj
     * @since V1.0.0
     */
    public static void render(HttpServletRequest request, HttpServletResponse response,
        Object obj) {
        if (RenderDataType.XML.equals(getAutoRenderDataType(request))) {
            renderXML(response, obj);
        } else {
            ResponseUtil.renderJson(response, obj);
        }
    }
    
    /**
     * 获取自动识别的输出类型。
     * @author licheng
     * @param request request
     * @return 类型
     * @since V1.0.0
     */
    private static RenderDataType getAutoRenderDataType(HttpServletRequest request) {
        if (!StringUtil.isEmpty(renderDataType)) {
            return RenderDataType.getDataType(renderDataType);
        }
        if (request.getHeader("Accept") != null
            && request.getHeader("Accept").contains("application/xml")) {
            return RenderDataType.XML;
        }
        return RenderDataType.JSON;
    }
    
    /**
     * 输出类型枚举。
     * ClassName: RenderDataType <br/>
     * date: 2017年5月25日 上午9:34:32 <br/>
     * @author licheng
     * @version RestResponseUtil
     * @since V1.0.0
     */
    private enum RenderDataType {
        
        /**
         * 
         */
        XML("xml"),
        
        /**
         * 
         */
        JSON("json");
        
        /**
         * 
         */
        private String dataType;
        
        /**
         * Creates a new instance of RenderDataType.
         * @param dataType dataType
         */
        RenderDataType(String dataType) {
            this.dataType = dataType;
        }
        
        /**
         * 根据字符获取类型对象。
         * @author licheng
         * @param dataTypeStr dataTypeStr
         * @return RenderDataType
         * @since V1.0.0
         */
        public static RenderDataType getDataType(String dataTypeStr) {
            RenderDataType[] values = RenderDataType.values();
            for (RenderDataType dataType : values) {
                if (dataType.dataType.equalsIgnoreCase(dataTypeStr)) {
                    return dataType;
                }
            }
            return RenderDataType.JSON;
        }
    }
    
    /**
     * Creates a new instance of XmlConvertUtil.
     */
    private RestResponseUtil() {
        
    }
    
}
