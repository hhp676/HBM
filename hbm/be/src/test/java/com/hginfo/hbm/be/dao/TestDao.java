
package com.hginfo.hbm.be.dao;

import com.hginfo.hbm.base.entity.TOrder;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.TOrderMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("testDao")
public class TestDao extends SingleKeyBaseDao<TOrder> implements TOrderMapper {

    @Override
    public String getMapperNamespace() {
        return TOrderMapper.class.getName();
    }
    
    public String getNameById(Integer id){
        return getMapperByType(TOrderMapper.class).getNameById(id);
    }
    
    
    public List<String> getNameList() {
        return getMapperByType(TOrderMapper.class).getNameList();
    }
    
    public List<String> getNameListNoCache() {
        return getMapperByType(TOrderMapper.class).getNameList();
    }

    @Override
    public List<TOrder> getTOrderList(TOrder tOrder) {
        return getMapperByType(TOrderMapper.class).getTOrderList(tOrder);
    }

    @Override
    public List<TOrder> getTOrderByAnnotation(TOrder tOrder) {
        return getMapperByType(TOrderMapper.class).getTOrderByAnnotation(tOrder);
    }
    
}

