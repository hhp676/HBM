package com.hginfo.hbm.fe.core.jsonp;

import com.alibaba.fastjson.support.spring.FastJsonpResponseBodyAdvice;
import com.alibaba.fastjson.support.spring.MappingFastJsonValue;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;

import javax.servlet.http.HttpServletRequest;
import java.nio.charset.Charset;

/**
 * Created by qiujingde on 2017/4/20.
 * Jsonp处理
 */
public class JsonpAdvice extends FastJsonpResponseBodyAdvice {

    /**
     * jsonp callback 参数名。
     */
    private final String[] jsonpQueryParamNames;

    /**
     * 是否启用jsonp数据返回。
     */
    private boolean enableJsonp;

    /**
     * 使用默认的jsonp callback 参数名。
     */
    public JsonpAdvice() {
        this(DEFAULT_JSONP_QUERY_PARAM_NAMES);
    }

    /**
     * 自定义回调函数的请求参数名。
     * @param queryParamNames jsonp callback 参数名
     */
    public JsonpAdvice(String... queryParamNames) {
        super(queryParamNames);
        jsonpQueryParamNames = queryParamNames;
    }

    /**
     * Return the content type to set the response to.
     * This implementation always returns "application/javascript".
     *
     * @param contentType the content type selected through content negotiation
     * @param request the current request
     * @param response the current response
     * @return the content type to set the response to
     */
    @Override
    protected MediaType getContentType(MediaType contentType, ServerHttpRequest request, ServerHttpResponse response) {
        return new MediaType("application", "javascript", Charset.forName("UTF-8"));
    }

    @Override
    public void beforeBodyWriteInternal(
            MappingFastJsonValue bodyContainer, MediaType contentType,
            MethodParameter returnType, ServerHttpRequest request, ServerHttpResponse response) {
        if (enableJsonp) {
            super.beforeBodyWriteInternal(bodyContainer, contentType, returnType, request, response);
        }
    }

    /**
     * 判断当前请求是否为jsonp请求。
     * @param servletRequest request
     * @return 是否为jsonp请求
     */
    @SuppressWarnings("unused")
    public boolean isJsonp(HttpServletRequest servletRequest) {
        if (enableJsonp) {
            for (String name : this.jsonpQueryParamNames) {
                String value = servletRequest.getParameter(name);
                if (value != null) {
                    if (!isValidJsonpQueryParam(value)) {
                        continue;
                    }
                    return true;
                }
            }
        }
        return false;
    }

    public void setEnableJsonp(boolean enableJsonp) {
        this.enableJsonp = enableJsonp;
    }
}
