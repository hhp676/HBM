package com.hginfo.hbm.core.utils;

import com.hginfo.hbm.core.constants.Constants;

/**
 * 获取当前用户ID。
 * Date: 2016年11月23日 下午5:09:53 <br/>
 * @author shichengqun
 */
public abstract class CurrentUserUtils {
    
    /**
     * 当前用户ID。
     */
    private static final ThreadLocal<Long> CURR_USER_ID = new InheritableThreadLocal<>();
    
    
    /**
     * 获取当前用户ID。
     * @return 当前用户ID，不存在时return -1
     */
    public static long getUserId() {
        Long userId = CURR_USER_ID.get();
        return userId == null ? Constants.ANONYMOUS_ID : userId;
    }
    
    /**
     * 保存当前用户ID。
     * @param userId 当前用户ID
     */
    public static void setUserId(long userId) {
        CURR_USER_ID.set(userId);
    }
    
    /**
     * 清除当前用户ID。
     */
    public static void clear() {
        CURR_USER_ID.remove();
    }
    
}

