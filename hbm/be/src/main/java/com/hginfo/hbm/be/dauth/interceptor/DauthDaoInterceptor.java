package com.hginfo.hbm.be.dauth.interceptor;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import com.hginfo.hbm.base.SingleKeyBaseEntity;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.dao.base.Updater;
import com.hginfo.hbm.be.dauth.utils.DauthThreadContext;
import com.hginfo.hbm.core.constants.SysDauthConstants;
import com.hginfo.hbm.core.exception.DauthNoAuthException;
import com.hginfo.hbm.core.exception.DauthParseException;
import com.hginfo.hbm.core.utils.CurrentUserUtils;
import com.hginfo.hbm.core.utils.SysDauthUtil;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.StringUtil;

/**
 * 对Dao中update*、update*方法进行拦截，进行数据权限校验。<br/>
 * Date: 2016年11月28日 下午5:42:46 <br/>
 * @author shichengqun
 */
@Aspect
@Component
public class DauthDaoInterceptor {
    /**
     */
    private static Log log = LogFactory.getLog(DauthDaoInterceptor.class);   
    
    /**
     * 在方法之前执行. <br/>
     * @param point 切点
     */
    @Before(value = "@annotation(com.hginfo.hbm.be.dauth.annotation.DauthDaoMethod)")
    @SuppressWarnings({"rawtypes", "unchecked"})
    public void before(JoinPoint point) {
        
        //如果不启用数据权限，则直接返回
        if (!SysDauthUtil.isDauthFlagValid()) {
            return;
        }
        
        //根据target获取实体类，然后根据method查询数据权限配置，并进行
        Object target = point.getTarget();
        String targetClassName = target.getClass().getCanonicalName();
        log.info("Dao class为：" + targetClassName);
        
        
        //只支持单主键
        if (!(target instanceof SingleKeyBaseDao)) {
            return;
        }
        
        //数据权限相关的不进行处理。
        if (target.getClass().getSimpleName().startsWith(SysDauthConstants.DAUTH_NO_CHECK_PREFIX)) {
            return;
        }
        
        //如果是超级管理员，则直接返回
        if (SysDauthUtil.getSysAccountService().isSuperAdmin(CurrentUserUtils.getUserId())) {
            return;
        }
        
        
        Signature s = point.getSignature();
        
        SingleKeyBaseDao dao = (SingleKeyBaseDao) target;
        String entityClassName = dao.getEntityClass().getCanonicalName();
        
        String simpleMethodName = s.getName();
        String className = dao.getClass().getCanonicalName();
        log.info("Dao方法为：" + className + "." + simpleMethodName);
        
        Object[] args = point.getArgs();
        log.info("Dao参数为：" + Arrays.toString(args));
        log.info("Dao实体为：" + entityClassName);
        
        //获取update/delete的Id
        if (args != null && args.length > 0) {
            Long id = null;
            for (Object arg : args) {
                if (arg != null) {
                    if (arg instanceof SingleKeyBaseEntity) {
                        id = ((SingleKeyBaseEntity) arg).getId();
                        break;
                    } else if (arg instanceof Updater) {
                        id = ((SingleKeyBaseEntity) ((Updater) arg).getBean()).getId();
                        break;
                    } else if (arg instanceof Long) {
                        id = (Long) arg;
                        break;
                    }
                }
            }
            if (id == null) {
                throw new DauthParseException(SysDauthConstants.DAUTH_MESSAGE_PARSE_EXCEPTION_IDFAIL);
            }
            
            //取出从service传参的数据权限code
            String dauthCode = DauthThreadContext.getEntityDauthCode(entityClassName);
            
            log.info("数据权限控制-方法配置DauthCode：" + dauthCode);
            if (StringUtil.isNotEmpty(dauthCode)) {
                try {
                    DauthThreadContext.bindUpdateMethodDauthCode(dauthCode);
                    SingleKeyBaseEntity entity = (SingleKeyBaseEntity) dao.getById(id);
                    if (entity == null) {
                        throw new DauthNoAuthException();
                    }
                } catch (Exception e) {
                    log.error(e.getMessage(), e);
                    if (e instanceof DauthNoAuthException) {
                        throw e;
                    } else {
                        throw new DauthParseException(SysDauthConstants.DAUTH_MESSAGE_PARSE_EXCEPTION_DEFAULT, e);
                    }
                } finally {
                    DauthThreadContext.unBindUpdateMethodDauthCode();
                }
            }
        }
    }
}
