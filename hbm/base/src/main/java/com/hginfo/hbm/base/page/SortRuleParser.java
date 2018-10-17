package com.hginfo.hbm.base.page;

import com.hginfo.hbm.base.meta.FieldMeta;
import com.hginfo.hbm.base.meta.TableMeta;
import com.hginfo.hutils.StringUtil;

/**
 * 解析排序条件
 * Created by qiujingde on 2016/12/20.
 * @author qiujingde
 */
public final class SortRuleParser {

    /**
     * 防止实例化。
     */
    private SortRuleParser() { }

    /**
     * 转换为sql条件。
     * @param sort 要排序的字段
     * @param order 排序顺序
     * @param meta entity表元数据
     * @return 对应的sql条件
     */
    static String parse(String sort, String order, TableMeta meta) {
        if (StringUtil.isBlank(sort)) {
            return null;
        }
        FieldMeta field = meta.getDbField(sort);
        if (field == null) {
            return null;
        }
        return field.getTableAlias() + "." + field.getDbFieldName() + " " + order;
    }

}
