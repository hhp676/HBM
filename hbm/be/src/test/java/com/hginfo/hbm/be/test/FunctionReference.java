/*
 * Project Name:hbm-be
 * File Name:FunctionReference.java
 * Package Name:com.hginfo.hbm.be.test
 * Date:2016年11月30日下午3:10:55
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.test;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.function.Function;

import org.mockito.Mockito;
import org.mockito.invocation.InvocationOnMock;

import com.hginfo.hbm.base.entity.TDept;

import javassist.NotFoundException;

/**
 * FunctionReference.
 * ClassName:FunctionReference <br/>
 * Date: 2016年11月30日 下午3:10:55 <br/>
 * @author licheng
 * @version
 * @since V1.0.0
 * @see
 */
public class FunctionReference {
    
    public static void main(String[] args) throws NotFoundException {
        
        TDept entity = new TDept();
        entity.setId(123L);
        fun(entity::getDeptId);
    }
    
    public static void fun(FunctionInterface c) throws NotFoundException {
        Method[] methods = c.getClass().getDeclaredMethods();
        Field[] fields = c.getClass().getDeclaredFields();
        for (Method method : methods) {
            System.out.println(method.getName());
        }
        
        for (Field field : fields) {
            System.out.println(field.getName());
        }
        
        System.out.println(c.test());
        System.out.println(c.getClass().getName());
        System.out.println(c);
        Runnable x = () -> System.out.println("1");
    }

    @SuppressWarnings("unchecked")
    private static <T> String ttt(final Function<T, ?> getter) {
        final Method[] method = new Method[1];
        getter.apply((T) Mockito.mock(TDept.class,
            Mockito.withSettings().invocationListeners(
                    methodInvocationReport ->
                            method[0] = ((InvocationOnMock) methodInvocationReport.getInvocation()).getMethod())));
        return method[0].getName();
    }
    
}
