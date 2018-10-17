package com.hginfo.hbm.be.dao;

import com.hginfo.hbm.base.entity.test.FeGroupStudent;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.FeGroupStudentMapper;
import org.springframework.stereotype.Repository;

/**
 */
@Repository("feGroupStudentDao")
public class FeGroupStudentDao extends SingleKeyBaseDao<FeGroupStudent> {
    

    public String getMapperNamespace() {
        return FeGroupStudentMapper.class.getName();
    }
}

