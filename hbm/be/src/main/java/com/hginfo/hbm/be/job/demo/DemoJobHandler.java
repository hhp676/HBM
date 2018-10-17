package com.hginfo.hbm.be.job.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hginfo.hbm.base.service.sys.SysConfigService;
import com.xxl.job.core.biz.model.ReturnT;
import com.xxl.job.core.handler.IJobHandler;
import com.xxl.job.core.handler.annotation.JobHander;
import com.xxl.job.core.log.XxlJobLogger;


/**
 * 任务Handler的一个Demo（Bean模式）
 * 
 * 开发步骤：
 * 1、继承 “IJobHandler” ；
 * 2、装配到Spring，例如加 “@Service” 注解；
 * 3、加 “@JobHander” 注解，注解value值为新增任务生成的JobKey的值;多个JobKey用逗号分割;
 * 4、执行日志：需要通过 "XxlJobLogger.log" 打印执行日志；
 * 
 */
@JobHander(value="demoJobHandler")
@Service
public class DemoJobHandler extends IJobHandler {
    
    @Autowired
    private SysConfigService sysConfigService;

	@Override
	public ReturnT<String> execute(String... params) throws Exception {
		XxlJobLogger.log("XXL-JOB, Bean模式.");
		XxlJobLogger.log("通过Service获取的系统名称为：" + sysConfigService.getProperty("sysName"));
		return ReturnT.SUCCESS;
	}
	
}
