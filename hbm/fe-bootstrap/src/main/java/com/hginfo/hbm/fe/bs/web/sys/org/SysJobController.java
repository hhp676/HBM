package com.hginfo.hbm.fe.bs.web.sys.org;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysJob;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysJobService;
import com.hginfo.hbm.core.constants.Constants;
import com.hginfo.hbm.fe.bs.op.OperationResult;
import com.hginfo.hbm.fe.bs.page.Page;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hvalidate.annotation.HValidated;

/**
 *
 * Created by qiujingde on 2016/12/24.
 * @author qiujingde
 */
@Controller
@RequestMapping("/sys/org")
public class SysJobController {
    
    /**
     *
     */
    private SysJobService jobService;
    
    /**
     *
     * @param basePage 分页信息
     * @return 分页列表
     */
    @RequestMapping("jobList")
    @ResponseBody
    public Page<SysJob> jobList(BasePage<SysJob> basePage) {
        SysJob filter = new SysJob();
        basePage.parseFilterRules(filter);
        basePage.parseSortRule(filter);
        return new Page<>(jobService.getJobList(basePage, filter));
    }
    
    /**
     *
     * @return all jobs
     */
    @RequestMapping("allJobs")
    @ResponseBody
    public List<SysJob> allJobs() {
        return jobService.getAllJobs();
    }
    
    /**
     * 新增。
     * @param job job
     * @return 操作结果
     */
    @RequestMapping(value = "/addJob")
    @ResponseBody
    @UserLog(code = "addJob", name = "新增职务", engName = "addJob")
    public OperationResult addJob(@HValidated SysJob job) {
        jobService.createJob(job);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 修改。
     * @param job job
     * @return 操作结果
     */
    @RequestMapping(value = "/updJob")
    @ResponseBody
    @UserLog(code = "updateJob", name = "修改职务", engName = "updateJob")
    public OperationResult updateJob(@HValidated SysJob job) {
        jobService.editJob(job);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 删除。
     * @param jobId jobId
     * @return 操作结果
     */
    @RequestMapping(value = "/delJob")
    @ResponseBody
    @UserLog(code = "deleteJob", name = "删除职务", engName = "deleteJob")
    public OperationResult deleteGroup(long jobId) {
        jobService.deleteJob(jobId);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 职务选择页面。
     * @param request 请求
     * @return 职务选择页面
     */
    @RequestMapping(value = "/chooseSysJobView")
    public String chooseSysJobView(HttpServletRequest request) {
        String selectMode = request.getParameter("_selectMode");
        boolean singleSelect = true;
        if (Constants.SELECT_MODE_MULTIPLE.equals(selectMode)) {
            singleSelect = false;
        }
        request.setAttribute("singleSelect", singleSelect);
        return "sys/org/sysJobChoose_view";
    }
    
    /**
     * 职务选择页面数据。
     * @param basePage 分页信息
     * @return 职务选择页面分页数据。
     */
    @RequestMapping(value = "/chooseSysJobList")
    @ResponseBody
    public Page<SysJob> chooseSysJobList(BasePage<SysJob> basePage) {
        return jobList(basePage);
    }
    
    @HReference
    public void setJobService(SysJobService jobService) {
        this.jobService = jobService;
    }
    
}
