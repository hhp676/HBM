/**
* Project Name:hbm-base.
* File Name:SysJobService.java
* Package Name:com.hginfo.hbm.base.service.sys
* Date:2016年11月29日 下午3:26:55
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysJob;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

import java.util.List;

/**
* 职务表: sys_job. <br />
* service interface 层 <br />
* Date: 2016年11月29日 下午3:26:55 <br />
*
* @author qiujingde
* @since V1.0.0
*/
public interface SysJobService {

    /**
     *
     * @param jobId jobId
     * @return job
     */
    SysJob getJobById(long jobId);

    /**
     *
     * @param pageInfo pageInfo
     * @param filter   filter
     * @return job list
     */
    Page<SysJob> getJobList(BasePage<SysJob> pageInfo, SysJob filter);

    /**
     *
     * @return all jobs
     */
    List<SysJob> getAllJobs();

    /**
     *
     * @param newJob new job
     * @return saved job
     */
    SysJob createJob(SysJob newJob);

    /**
     *
     * @param job job
     * @return saved job
     */
    SysJob editJob(SysJob job);

    /**
     *
     * @param jobId jobId
     * @return deleted job
     */
    SysJob deleteJob(long jobId);

}
