package com.hginfo.hbm.core.profile;

import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.config.Scope;
import org.springframework.core.NamedThreadLocal;

import java.util.HashMap;
import java.util.Map;

/**
 * Profile对应的scope。<br />
 * 主体实现参考{@link org.springframework.context.support.SimpleThreadScope}实现。<br />
 * 模拟实现request scope的效果，同时兼容dubbo的使用场景。
 * Created by qiujingde on 2016/12/14.
 * @author qiujingede
 */
public class ProfileScope implements Scope {

    /**
     *
     */
    private static final Log LOG = LogFactory.getLog(ProfileScope.class);

    /**
     *
     */
    private static final ThreadLocal<Map<String, Object>> THREAD_SCOPE =
            new NamedThreadLocal<Map<String, Object>>("ProfileScope") {
                @Override
                protected Map<String, Object> initialValue() {
                    return new HashMap<>();
                }
            };

    /**
     * 重置THREAD_SCOPE中的数据。<br />
     * 在{@link com.hginfo.hbm.core.filter.ProviderCurrUserFilter}和CurrentUserInterceptor中调用。
     */
    public static void reset() {
        THREAD_SCOPE.remove();
    }

    @Override
    public Object get(String name, ObjectFactory<?> objectFactory) {
        Map<String, Object> scope = THREAD_SCOPE.get();
        scope.computeIfAbsent(name, key -> objectFactory.getObject());
        return scope.get(name);
    }

    @Override
    public Object remove(String name) {
        Map<String, Object> scope = THREAD_SCOPE.get();
        return scope.remove(name);
    }

    @Override
    public void registerDestructionCallback(String name, Runnable callback) {
        LOG.warn("SimpleThreadScope does not support destruction callbacks. "
                + "Consider using RequestScope in a web environment.");
    }

    @Override
    public Object resolveContextualObject(String key) {
        return null;
    }

    @Override
    public String getConversationId() {
        return Thread.currentThread().getName();
    }

}
