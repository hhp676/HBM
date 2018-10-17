package com.hginfo.hbm.be.dao;

import java.util.List;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.hginfo.hbm.base.entity.TOrder;
import com.hginfo.hbm.be.dao.base.MBaseDao;
import com.hginfo.hbm.be.mapper.TOrderMapper;

/**
* dao 层
*/
@SuppressWarnings("unchecked")
@Repository("tOrderDao")
public class TOrderDao extends MBaseDao<TOrder, Integer> implements TOrderMapper {
    
    @Override
    public String getMapperNamesapce() {
        return TOrderMapper.class.getName();
    }
    
    public String getNameById(Integer id) {
        return getMapperByType(TOrderMapper.class).getNameById(id);
    }
    
    @Cacheable(cacheNames = "CACHE_AUTH_ARVIABLE", key = "'TORDER_NAME_LIST'")
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
