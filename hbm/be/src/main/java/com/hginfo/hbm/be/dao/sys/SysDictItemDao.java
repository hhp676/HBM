/*
 * Project Name:hbm-be.
 * File Name:SysDictItemDao.java
 * Package Name:com.hginfo.hbm.be.dao.sys
 * Date:2016年11月29日 下午2:54:28
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.dao.sys;

import com.hginfo.hbm.base.entity.sys.SysDictItem;
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import com.hginfo.hbm.be.mapper.sys.SysDictItemMapper;
import org.springframework.stereotype.Repository;

/**
 * 系统字典项表: sys_dict_item. <br />
 * dao 层 <br />
 * Date: 2016年11月29日 下午2:54:28 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@Repository
public class SysDictItemDao extends SingleKeyBaseDao<SysDictItem> implements SysDictItemMapper {

}
