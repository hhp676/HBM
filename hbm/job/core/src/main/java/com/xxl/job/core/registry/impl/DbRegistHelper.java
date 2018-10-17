package com.xxl.job.core.registry.impl;

import javax.sql.DataSource;

import com.xxl.job.core.registry.RegistHelper;
import com.xxl.job.core.util.DBUtil;

/**
 * Created by xuxueli on 16/9/30.
 */
public class DbRegistHelper implements RegistHelper {
    
    private DataSource dataSource;
    
    private String dbType;
    
    @Override
    public int registry(String registGroup, String registryKey, String registryValue) {
        
        String updateSql = "";
        String insertSql = "";
        
        if (dbType == null || dbType.length() == 0) {
            dbType = DBUtil.getDbType(dataSource);
        }
        
        if (DBUtil.ORACLE.equals(dbType)) {
            updateSql = "UPDATE JOB_TRIGGER_REGISTRY SET update_time_ = sysdate WHERE registry_group_ = ? AND registry_key_ = ? AND registry_value_ = ?";
            insertSql = "INSERT INTO JOB_TRIGGER_REGISTRY( id_, registry_group_ , registry_key_ , registry_value_, update_time_) VALUES(seq_job_trigger_registry_id.nextval , ? , ? , ?, sysdate)";
        } else {
            updateSql = "UPDATE JOB_TRIGGER_REGISTRY SET update_time_ = NOW() WHERE registry_group_ = ? AND registry_key_ = ? AND registry_value_ = ?";
            insertSql = "INSERT INTO JOB_TRIGGER_REGISTRY( registry_group_ , registry_key_ , registry_value_, update_time_) VALUES(? , ? , ?, NOW())";
        }
        
        
        int ret = DBUtil.update(dataSource, updateSql, new Object[]{registGroup, registryKey, registryValue});
        if (ret<1) {
            ret = DBUtil.update(dataSource, insertSql, new Object[]{registGroup, registryKey, registryValue});
        }
        return ret;
    }
    
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }
    
}
