package com.hginfo.hbm.base.dict;

import com.hginfo.hbm.annotation.HDict;
import com.hginfo.hvalidate.BeanValidators;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.validation.Validator;
import java.lang.reflect.Field;

/**
 * HDict注解测试
 * Created by qiujingde on 2016/12/12.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext-base.xml",
        "classpath:spring/applicationContext-identityid.xml",
        "classpath:spring/applicationContext-validate.xml",
        "classpath:spring/applicationContext-hdubbo.xml",
        "classpath:spring/applicationContext-*.xml"})
public class HDictTest {

    @Autowired
    private Validator validator;

    @Test
    public void testAnnotationAliasFor() throws NoSuchFieldException {
        Field field1 = TDict.class.getDeclaredField("field1");
        Field field2 = TDict.class.getDeclaredField("field2");

        HDict dict1 = AnnotationUtils.getAnnotation(field1, HDict.class);
        Assert.assertEquals("test1", dict1.groupCode());

        HDict dict2 = AnnotationUtils.getAnnotation(field2, HDict.class);
        Assert.assertEquals("test2", dict2.value());
    }

    @Test
    public void testValidate() {
        TDict tDict = new TDict();
        BeanValidators.validateWithException(validator, tDict);
    }

}
