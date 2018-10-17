package com.hginfo.hbm.be.service;

import org.junit.Test;

import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by aseara on 2016/11/25.
 *
 */
public class BaseServiceTest {

    /**
     * 测试泛型类的子类是否能够获取对应的泛型类
     */
    @Test
    public void test() {
        List<Integer> iList = new ArrayList<Integer>(){ };

        ParameterizedType type = (ParameterizedType)iList.getClass().getGenericSuperclass();
        System.out.println(type.getActualTypeArguments()[0]);
    }

}
