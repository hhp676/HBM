package com.hginfo.hbm.be.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.hginfo.hbm.base.entity.TOrder;
import com.hginfo.hbm.be.mapper.base.BaseSqlMapper;

/**
* mapper 层
*/

public interface TOrderMapper extends BaseSqlMapper {
    
    public String getNameById(Integer id);
    
    public List<String> getNameList();
    
    List<TOrder> getTOrderList(TOrder tOrder);
    
    @Select("select ID_ id,CLIENTNAME_ clientname from t_order tOrder where tOrder.AMOUNT_ = #{clientname} and tOrder.CLIENTNAME_ like '%${testName}%' and tOrder.CLIENTNAME_ like '%${testName}%'")
    List<TOrder> getTOrderByAnnotation(TOrder tOrder);
}
