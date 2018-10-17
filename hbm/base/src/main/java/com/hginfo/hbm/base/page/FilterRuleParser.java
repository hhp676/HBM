package com.hginfo.hbm.base.page;

import java.io.IOException;
import java.util.List;
import java.util.Properties;

import com.alibaba.fastjson.JSONObject;
import com.hginfo.hbm.base.meta.FieldMeta;
import com.hginfo.hbm.base.meta.TableMeta;
import com.hginfo.hutils.StringUtil;
import com.hginfo.hutils.exception.BaseRuntimeException;

/**
 * easyui表头过滤条件解析器。<br />
 * Created by qiujingde on 2016/12/19.
 * @author qiujingde
 */
final class FilterRuleParser {

    /**
     * 私有构造方法，防止FilterRuleParser被实例化。
     */
    private FilterRuleParser() { }
    /**
     */
    private static String DB_TYPE;

    /**
     * 转换为sql条件。
     * @param filterRules easyUI表头过滤json串
     * @param meta entity表元数据
     * @return 对应的sql条件
     */
    static String parse(String filterRules, TableMeta meta) {
        if (StringUtil.isBlank(filterRules)) {
            return null;
        }

        List<FilterRule> rules = JSONObject.parseArray(filterRules, FilterRule.class);

        StringBuilder sb = new StringBuilder();
        rules.stream().filter(rule -> {
            FieldMeta field = meta.getDbField(rule.getField());
            return field != null;
        }).forEach(rule -> {
            FieldMeta field = meta.getDbField(rule.getField());
            sb.append("AND ").append(field.getTableAlias()).append(".").append(field.getDbFieldName());
            boolean isStringField = String.class.isAssignableFrom(field.getFieldType());
            boolean isOracle = "oracle".equals(getDbType());
            sb.append(FilterOpParser.getFilterOpSql(rule.getOp(), StringUtil.trim(rule.getValue()), isStringField, isOracle));
        });

        return sb.toString();
    }

    public static String getDbType() {
        if (DB_TYPE == null) {
            Properties pro = new Properties();
            try {
                pro.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("env.properties"));
            } catch (IOException e1) {
                throw new BaseRuntimeException(e1.getMessage());
            }
            DB_TYPE = pro.getProperty("jdbc.dataSourceType");
        }
        return DB_TYPE;
    }
}
