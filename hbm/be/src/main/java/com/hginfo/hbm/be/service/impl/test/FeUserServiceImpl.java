package com.hginfo.hbm.be.service.impl.test;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.Arrays;

import com.hginfo.hbm.base.BaseEntity;
import com.hginfo.hbm.base.entity.test.FeUser;
import com.hginfo.hbm.base.service.test.FeUserService;
import com.hginfo.hbm.be.dao.base.BaseDao;
import com.hginfo.hbm.be.mapper.base.BaseSqlMapper;
import com.hginfo.hutils.SpringContextUtil;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hvalidate.annotation.HValidated;

/**
 * 测试。
 */
@HService
public class FeUserServiceImpl extends TestBizServiceImpl<FeUser> implements FeUserService {
    
    private Log log = LogFactory.getLog(TestBaseServiceImpl.class);
    /**
     * @param o 
     * @param o1 
     */
    public void testValid(@HValidated FeUser o, FeUser o1) {
        log.info("-----FeUserService------testValid------------");
    }
    
    /**
     * @param o 
     */
    public void test(FeUser o) {
        log.info("-----FeUserService------test(FeUser)------------");
    }
    
    
    @Override
    public void test() {
        log.info("-----FeUserService------test()------------");
    }
    
    @Override
    public void test(String userName) {
        log.info("-----FeUserService------test(String)------------");
        
    }
    
    @Override
    public void testEx() {
        log.info("-----FeUserService------testEx()------------");
        int a = 1 / 0;
        log.info("-----FeUserService------testEx() end------------");
    }
    
    /**
     * 测试非接口定义方法，不会dubbo暴露。
     */
    public void testNoDubbo() {
        log.info("-----FeUserService------testNoDubbo(String)------------");
    }
    
    @Override
    @SuppressWarnings("unchecked")
    public void testGetDao() {
        String[] beanNames = SpringContextUtil.getContext().getBeanNamesForType(BaseDao.class);
        
        System.out.println("Dao beans : " + Arrays.toString(beanNames));
        
        BaseDao<BaseEntity, Serializable> sysConfigDao = SpringContextUtil.getBean("sysConfigDao");
        Class<BaseDao<BaseEntity, Serializable>> c = (Class<BaseDao<BaseEntity, Serializable>>) sysConfigDao
            .getClass().getGenericSuperclass();
        Type[] ms = c.getGenericInterfaces();
        
        for (Type m : ms) {
            Class<?> mc = (Class<?>) m;
            if (BaseSqlMapper.class.isAssignableFrom(mc)) {
                Method[] methods = mc.getDeclaredMethods();
                System.out.println("mapper class : " + mc);
                
                System.out.println("mapper class method: " + Arrays.toString(methods));
            }
        }
        
        System.out.println("Dao class : " + c);
    }

}
