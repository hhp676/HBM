package com.hginfo.hbm.fe.core.json;

import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.ToStringSerializer;
import com.alibaba.fastjson.support.config.FastJsonConfig;

/**
 * json转化，Long输出为字符串。
 * Created by qiujingde on 2016/12/14.
 */
public class HbmFastJsonConfig extends FastJsonConfig {

    /**
     * 初始化。
     */
    public HbmFastJsonConfig() {
        // 输出key时是否使用双引号,默认为true
        // 是否输出值为null的字段,默认为false
        setSerializerFeatures(SerializerFeature.QuoteFieldNames,
                SerializerFeature.WriteMapNullValue,
                SerializerFeature.DisableCircularReferenceDetect);
        this.getSerializeConfig().put(Long.class, ToStringSerializer.instance);
    }

}


