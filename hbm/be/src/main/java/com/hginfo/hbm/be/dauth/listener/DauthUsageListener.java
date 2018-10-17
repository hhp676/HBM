package com.hginfo.hbm.be.dauth.listener;

import java.util.Collection;

import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

import com.hginfo.hbm.base.entity.sys.SysDauthUsage;
import com.hginfo.hbm.be.dauth.utils.DauthMethodNameUtils;
import com.hginfo.hbm.be.service.impl.sys.SysDauthUsageServiceImpl;
import com.hginfo.hbm.core.constants.SysDauthConstants;
import com.hginfo.hbm.core.utils.SysDauthUtil;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

/**
 * 加载数据权限应用的数据。
 * date: 2017年1月22日 下午6:07:24 <br/>
 *
 * @author shichengqun
 */
public class DauthUsageListener implements ApplicationListener<ContextRefreshedEvent> {
    
    /**
     * 
     */
    private static Log log = LogFactory.getLog(DauthUsageListener.class);
    
    /**
     * 
     */
    @Autowired
    private SysDauthUsageServiceImpl sysDauthUsageServiceImpl;
    
    
    
    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        
        try {
            ApplicationContext context = event.getApplicationContext();
            //Spring的context
            if (context.getParent() == null) {

                //如果不启用数据权限，则直接返回
                if (!SysDauthUtil.isDauthFlagValid()) {
                    return;
                }
                
                String methodName;
                String shortName;
                
                //首先把所有数据设置为不再用，然后逐条更新为在用
                sysDauthUsageServiceImpl.setAllInvalid();
                
                SqlSessionFactory mySqlSessionFactory = context.getBean(SqlSessionFactory.class);
                if (mySqlSessionFactory != null) {
                    Configuration configuration = mySqlSessionFactory.getConfiguration();
                    Collection<String> nameList = configuration.getMappedStatementNames();
                    for (String name : nameList) {
                        //非short name
                        if (name.contains(".")) {
                            methodName = configuration.getMappedStatement(name).getId();
                            //XxMapper.xx
                            shortName = DauthMethodNameUtils.getShortName(methodName);
                            addOrUpdateUsage(methodName, shortName);
                        }
                    }
                }
                
            }
        } catch (Exception e) {
            log.error("加载数据权限应用数据出现错误：", e);
        }
    }

    /**
     * add or update usage.
     * @param methodName   method name
     * @param shortName    short name
     */
    private void addOrUpdateUsage(final String methodName, final String shortName) {
        SysDauthUsage oldUsage;
        SysDauthUsage usage;
        if (!shortName.startsWith(SysDauthConstants.DAUTH_NO_CHECK_PREFIX) 
            && !shortName.endsWith(SysDauthConstants.DAUTH_NO_CHECK_GETBYID)) {
            oldUsage = sysDauthUsageServiceImpl.getDauthUsage(methodName);
            usage = new SysDauthUsage();
            usage.setIsValid(SysDauthConstants.DAUTH_USAGE_METHOD_VALID_YES);
            if (oldUsage == null) {
                usage.setMethodName(methodName);
                usage.setMethodShortName(shortName);
                sysDauthUsageServiceImpl.addOriginalUsage(usage);
            } else {
                usage.setUsageId(oldUsage.getId());
                sysDauthUsageServiceImpl.updateOriginalUsage(usage);
            }
        }
    }

}
