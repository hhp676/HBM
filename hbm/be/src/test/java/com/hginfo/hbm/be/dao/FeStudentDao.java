package com.hginfo.hbm.be.dao;

import com.hginfo.hbm.base.entity.test.FeStudent;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.FeStudentMapper;
import org.springframework.stereotype.Repository;

/**
 * 
 */
@Repository("feStudentDao")
public class FeStudentDao extends SingleKeyBaseDao<FeStudent> {
    

    public String getMapperNamespace() {
        return FeStudentMapper.class.getName();
    }
}

