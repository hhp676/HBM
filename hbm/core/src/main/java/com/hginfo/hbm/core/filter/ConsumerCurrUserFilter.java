package com.hginfo.hbm.core.filter;

import com.alibaba.dubbo.rpc.Filter;
import com.alibaba.dubbo.rpc.Invocation;
import com.alibaba.dubbo.rpc.Invoker;
import com.alibaba.dubbo.rpc.Result;
import com.alibaba.dubbo.rpc.RpcContext;
import com.alibaba.dubbo.rpc.RpcException;
import com.hginfo.hbm.core.utils.CurrentUserUtils;
import com.hginfo.hbm.core.utils.I18nUtil;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

import java.util.Arrays;

import static com.hginfo.hbm.core.constants.Constants.CURR_LOCALE_CODE;
import static com.hginfo.hbm.core.constants.Constants.CURR_USER_ID_CODE;

/**
 * dubbo消费者处理当前用户ID过滤器。<br/>
 * Date: 2016年11月24日 上午10:13:31 <br/>
 * @author shichengqun
 */
public class ConsumerCurrUserFilter implements Filter {
    
    /**
     */
    private static Log log = LogFactory.getLog(ConsumerCurrUserFilter.class);
    
    @Override
    public Result invoke(Invoker<?> invoker, Invocation invocation) throws RpcException {
        //消费者把当前用户ID传到提供者
        RpcContext.getContext().setAttachment(CURR_USER_ID_CODE,
            String.valueOf(CurrentUserUtils.getUserId()));

        RpcContext.getContext().setAttachment(CURR_LOCALE_CODE, I18nUtil.getCurrentLocale().toLanguageTag());
        
        log.info("请求地址为：" + invoker.getUrl());
        log.info("请求方法为：" + invocation.getMethodName());
        log.info("请求参数为：" + Arrays.toString(invocation.getArguments()));
        log.info("请求传CurrUserID为：" + CurrentUserUtils.getUserId());
        log.info("请求传本地化代码为： " + I18nUtil.getCurrentLocale().toLanguageTag());
        
        return invoker.invoke(invocation);
    }
    
}
