package com.hginfo.hbm.base.service.sys.task;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.task.SysTask;
import com.hginfo.hbm.base.entity.sys.task.SysTaskDo;

/**
 * task对外暴漏接口: SysTaskWebService. <br/>
 * @author yinyanzhen
 */
public interface SysTaskWebService {
    
    /**
     * addSysTask:(保存任务信息). <br/>
     * @param sysTasks sysTasks
     */
    void addSysTask(List<SysTask> sysTasks);
    
    /**
     * doSysTask:(办理任务). <br/>
     * @param sysTaskDos sysTaskDos
     */
    void doSysTask(List<SysTaskDo> sysTaskDos);
    
    /**
     * delTasks:(删除任务). <br/>
     * @param sysTaskDos sysTaskDos
     */
    void deleteTasks(List<SysTaskDo> sysTaskDos);
    
    /**
     * doReplaceTaskHandlers:(变更办理人). <br/>
     * @param sysTasks sysTasks
     */
    void doReplaceTaskHandlers(List<SysTask> sysTasks);
    
    /**
     * doReplaceTaskHandlers:(获取任务信息). <br/>
     * @param businessId businessId
     * @return SysTask SysTask
     */
    SysTask getTaskByBuinessId(Long businessId);
    
}
