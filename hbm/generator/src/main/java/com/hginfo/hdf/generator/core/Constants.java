package com.hginfo.hdf.generator.core;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 * 静态常量类。 <br />
 * Date: 2016年12月07日 上午11:11:35 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public final class Constants {

    /**
     * 私有构造方法，防止实例被创建。
     */
    private Constants() { }

    /**
     *
     */
    public static final DateFormat DATE_FORMAT = new SimpleDateFormat("yyyy年MM月dd日 ah:mm:ss");
    /**
     *
     */
    public static final String ENTITY_PKG = "base.entity";
    /**
     *
     */
    public static final String MAPPER_PKG = "be.mapper";
    /**
     *
     */
    public static final String DAO_PKG = "be.dao";
    /**
     *
     */
    public static final String SERVICE1_PKG = "base.service";
    /**
     *
     */
    public static final String SERVICE2_PKG = "be.service.impl";
    /**
     *
     */
    public static final String CONTROLLER_PKG = "fe.eu.web";
    /**
     *
     */
    public static final String MAPPER_SUFFIX = "Mapper";
    /**
     *
     */
    public static final String DAO_SUFFIX = "Dao";
    /**
     *
     */
    public static final String SERVICE1_SUFFIX = "Service";
    /**
     *
     */
    public static final String SERVICE2_SUFFIX = "ServiceImpl";
    /**
     *
     */
    public static final String CONTROLLER_SUFFIX = "Controller";
    /**
     *
     */
    public static final String TYPE_STRING = "String";
    /**
     *
     */
    public static final String TYPE_FLOAT = "java.math.BigDecimal";
    /**
     *
     */
    public static final String TYPE_INTEGER = "Integer";
    /**
     *
     */
    public static final String TYPE_LONG = "Long";
    /**
     *
     */
    public static final String TYPE_TIMESTAMP = "TIMESTAMP";
}
