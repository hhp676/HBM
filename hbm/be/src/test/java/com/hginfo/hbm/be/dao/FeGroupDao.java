package com.hginfo.hbm.be.dao;

import com.hginfo.hbm.base.entity.test.FeGroup;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.FeGroupMapper;
import org.springframework.stereotype.Repository;

/**
 */
@Repository("feGroupDao")
public class FeGroupDao extends SingleKeyBaseDao<FeGroup> {
    
    public String getMapperNamespace() {
        return FeGroupMapper.class.getName();
    }
}

