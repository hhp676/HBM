

/**
* Project Name:hbm-be.
* File Name:SysJobServiceImpl.java
* Package Name:com.hginfo.hbm.be.service.impl.sys
* Date:2016年11月29日 下午3:43:44
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.be.service.impl.sys;

import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hutils.exception.BaseRuntimeException;
import com.hginfo.hbm.base.entity.sys.SysJob;
import com.hginfo.hbm.base.entity.sys.SysPosition;
import com.hginfo.hbm.base.service.sys.SysJobService;
import com.hginfo.hbm.be.dao.sys.SysJobDao;
import com.hginfo.hbm.be.service.base.BizService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

/**
* 职务表: sys_job. <br />
* service impl 层 <br />
* Date: 2016年11月29日 下午3:43:44 <br />
*
* @author qiujingde
* @since V1.0.0
*/
@HService
public class SysJobServiceImpl extends BizService<SysJob, SysJobDao> implements SysJobService {
    @Autowired
    private SysPositionServiceImpl sysPositionService;

    @Override
    public SysJob getJobById(long jobId) {
        return get(jobId);
    }

    @Override
    public Page<SysJob> getJobList(BasePage<SysJob> pageInfo, SysJob filter) {
        SysJob verifiedFilter = filter == null ? new SysJob() : filter;
        verifiedFilter.setIsDelete(0);

        return getPageList(pageInfo, verifiedFilter);
    }

    @Override
    public List<SysJob> getAllJobs() {
        SysJob filter = new SysJob();
        filter.setIsDelete(0);
        return getList(filter);
    }

    @Override
    public SysJob createJob(SysJob newJob) {
        add(newJob);
        return newJob;
    }

    @Override
    public SysJob editJob(SysJob job) {
        update(job);
        return job;
    }

    @Override
    public SysJob deleteJob(long jobId) {
        SysPosition sysPosition = new SysPosition();
        sysPosition.setJobId(jobId);
        sysPosition.setIsDelete(0);
        if (sysPositionService.getDao().getList(sysPosition).size() > 0) {
            throw new BaseRuntimeException("该职位被使用中,不能删除!");
        }
        SysJob job = get(jobId);
        delete(jobId);
        return job;
    }
}
