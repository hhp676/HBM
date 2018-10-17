package com.hginfo.hbm.fe.core.interceptor;

import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

/**
 * ClassName: RepeatSubmitUtil .<br/>
 * @author yinyanzhen
 * @since V1.0.0
 */
public final class RepeatSubmitUtil {
    /**
     */
    public static final String TOKEN_TAG = "submitToken";
    /**
     */
    public static final int TOKEN_MAXCOUNT = 100;
    
    /**
     * Creates a new instance of RepeatSubmitUtil.
     */
    private RepeatSubmitUtil() {
        
    }
    
    /**
     * putRepeatToken:(增加token.). <br/>
     * @author yinyanzhen
     * @param request request
     * @return String token
     * @since V1.0.0
     */
    public static String putRepeatToken(HttpServletRequest request) {
        ArrayList<String> tokenList = getTokens(request);
        //token令牌超出数量上限时,先删除最早的一个,然后再添加
        if (tokenList.size() >= TOKEN_MAXCOUNT) {
            tokenList.remove(0);
        }
        //生成新的令牌
        String tokenValue = UUID.randomUUID().toString();
        tokenList.add(tokenValue);
        request.getSession(false).setAttribute(TOKEN_TAG, tokenList);
        
        return tokenValue;
    }
    
    /**
     * isRepeatSubmit:(是否是重复提交的请求). <br/>
     * @author yinyanzhen
     * @param request request
     * @return boolean
     * @since V1.0.0
     */
    public static boolean isRepeatSubmit(HttpServletRequest request) {
        ArrayList<String> tokens = getTokens(request);
        if (tokens.size() == 0) {
            return true;
        }
        //获取请求中的token
        String submitToken = request.getParameter(TOKEN_TAG);
        if (!tokens.contains(submitToken)) {
            return true;
        }
        return false;
    }
    
    /**
     * removeRepeatToken:(删除token). <br/>
     * @author yinyanzhen
     * @param request request
     * @since V1.0.0
     */
    public static void removeRepeatToken(HttpServletRequest request) {
        String tokenValue = request.getParameter(TOKEN_TAG);
        ArrayList<String> tokenList = getTokens(request);
        for (String tmp : tokenList) {
            if (tmp.equals(tokenValue)) {
                tokenList.remove(tokenValue);
                break;
            }
        }
        request.getSession(false).setAttribute(TOKEN_TAG, tokenList);
    }
    
    /**
     * getTokens:(获取所有tokens). <br/>
     * @author yinyanzhen
     * @param request request
     * @return ArrayList<String>
     * @since V1.0.0
     */
    @SuppressWarnings("unchecked")
    private static ArrayList<String> getTokens(HttpServletRequest request) {
        ArrayList<String> tokens = (ArrayList<String>) request.getSession(true)
            .getAttribute(TOKEN_TAG);
        if (tokens == null) {
            return new ArrayList<String>();
        }
        return tokens;
    }
    
}
