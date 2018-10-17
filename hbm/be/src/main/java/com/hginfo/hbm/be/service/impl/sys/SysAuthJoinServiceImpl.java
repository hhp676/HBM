/*
 * Project Name:hbm-be.
 * File Name:SysAuthJoinServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2017年03月09日 下午3:26:46
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysAuthJoin;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.service.sys.SysAuthJoinService;
import com.hginfo.hbm.be.dao.sys.SysAuthJoinDao;
import com.hginfo.hbm.be.service.base.RelService;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 系统权限关联表: sys_auth_join. <br />
 * service impl 层 <br />
 * Date: 2017年03月09日 下午3:26:46 <br />
 *
 * @author shichenqun
 * @since V1.0.0
 */
@HService
public class SysAuthJoinServiceImpl extends RelService<SysAuthJoin, SysAuthJoinDao>
        implements SysAuthJoinService {
    
    
    @Override
    public Page<SysAuthJoin> getMainAuthPageList(BasePage<SysAuthJoin> pageInfo, SysAuthJoin filter,
        String... loadProps) {
        return super.getPageList("getMainAttachList", pageInfo, filter, loadProps);
    }
    
    @Override
    public void saveMainAuthJoinList(Long mainAuthId, Long[] attachAuthIds) {
        
        if (mainAuthId != null && attachAuthIds != null) {
            SysAuthJoin vo = new SysAuthJoin();
            vo.setMainAuthId(mainAuthId);
            List<SysAuthJoin> joinList = this.getList(vo);
            for (SysAuthJoin join : joinList) {
                this.delete(join.getId());
            }
            SysAuthJoin join;
            for (Long attachAuthId : attachAuthIds) {
                if(attachAuthId != null){
                    
                    join = new SysAuthJoin();
                    join.setMainAuthId(mainAuthId);
                    join.setAttachAuthId(attachAuthId);
                    this.add(join);
                }
            }
        }
    }
    
    @Override
    public void saveAttachAuthJoinList(Long attachAuthId, Long[] mainAuthIds) {
        if (attachAuthId != null && mainAuthIds != null) {
            SysAuthJoin vo = new SysAuthJoin();
            vo.setAttachAuthId(attachAuthId);
            List<SysAuthJoin> joinList = this.getList(vo);
            for (SysAuthJoin join : joinList) {
                this.delete(join.getId());
            }
            SysAuthJoin join;
            for (Long mainAuthId : mainAuthIds) {
                join = new SysAuthJoin();
                join.setMainAuthId(mainAuthId);
                join.setAttachAuthId(attachAuthId);
                this.add(join);
            }
        }
    }

    @Override
    public void deleteBatch(Long[] ids) {
        if (ids != null && ids.length > 0) {
            for (Long id : ids) {
                if(id != null){
                    this.delete(id);
                }
            }
        }
    }
}
