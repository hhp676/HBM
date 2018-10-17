package com.hginfo.hbm.core.filter;

import java.util.Arrays;
import java.util.Locale;

import com.alibaba.dubbo.rpc.Filter;
import com.alibaba.dubbo.rpc.Invocation;
import com.alibaba.dubbo.rpc.Invoker;
import com.alibaba.dubbo.rpc.Result;
import com.alibaba.dubbo.rpc.RpcContext;
import com.alibaba.dubbo.rpc.RpcException;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.core.profile.ProfileScope;
import com.hginfo.hbm.core.utils.CurrentUserUtils;
import com.hginfo.hbm.core.utils.I18nUtil;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.StringUtil;

import static com.hginfo.hbm.core.constants.Constants.CURR_LOCALE_CODE;

/**
 * dubbo提供者处理当前用户ID过滤器。<br/>
 * Date: 2016年11月24日 上午10:13:31 <br/>
 * @author shichengqun
 */
public class ProviderCurrUserFilter implements Filter {
    
    /**
     */
    private static Log log = LogFactory.getLog(ProviderCurrUserFilter.class);
    
    @Override
    public Result invoke(Invoker<?> invoker, Invocation invocation) throws RpcException {
        //提供者者把当前用户ID获取并存放，执行完毕后清除
        long currUserId = Constants.ANONYMOUS_ID;
        try {
            String userId = RpcContext.getContext().getAttachment(Constants.CURR_USER_ID_CODE);
            if (StringUtil.isNotEmpty(userId) && !"null".equals(userId)) {
                currUserId = Long.parseLong(userId);
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        CurrentUserUtils.setUserId(currUserId);
        // 重置当前线程的scope数据。
        // qiujingde add at 2016-12-14 15:53
        ProfileScope.reset();

        Locale locale = Locale.getDefault();
        try {
            locale = Locale.forLanguageTag(RpcContext.getContext().getAttachment(CURR_LOCALE_CODE));
            log.info("请求的本地化代码： " + locale.toLanguageTag());
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        I18nUtil.setCurrentLocale(locale);
        
        log.info("请求地址为：" + invoker.getUrl());
        log.info("请求方法为：" + invocation.getMethodName());
        log.info("请求参数为：" + Arrays.toString(invocation.getArguments()));
        log.info("接收CurrUserID,执行方法之前为：" + CurrentUserUtils.getUserId());
        
        Result result = invoker.invoke(invocation);
        
        CurrentUserUtils.clear();
        I18nUtil.clearCurrentLocale();
        
        log.info("接收CurrUserID,执行方法之后为：" + CurrentUserUtils.getUserId());
        
        return result;
    }


    
}
