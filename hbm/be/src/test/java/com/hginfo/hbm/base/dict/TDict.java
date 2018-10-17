package com.hginfo.hbm.base.dict;

import com.hginfo.hbm.annotation.HDict;

/**
 * HDict测试实体类
 * Created by qiujingde on 2016/12/12.
 */
public class TDict {

    @HDict("test1")
    private String field1;

    @HDict(groupCode = "test2")
    private String field2;

}
