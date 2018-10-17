package com.hginfo.hbm.be.service.impl.sys.task;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hbm.base.entity.sys.news.SysNews;
import com.hginfo.hbm.base.entity.sys.news.SysNewsTemplete;
import com.hginfo.hbm.base.entity.sys.news.SysNewsType;
import com.hginfo.hbm.base.entity.sys.task.SysTask;
import com.hginfo.hbm.base.entity.sys.task.SysTaskDo;
import com.hginfo.hbm.base.entity.sys.task.SysTaskHandleLog;
import com.hginfo.hbm.base.entity.sys.task.SysTaskHandler;
import com.hginfo.hbm.base.entity.sys.task.SysTaskNewsTemplete;
import com.hginfo.hbm.base.entity.sys.task.SysTaskType;
import com.hginfo.hbm.base.service.sys.task.SysTaskWebService;
import com.hginfo.hbm.be.freemarker.BeFreeMarkerFactory;
import com.hginfo.hbm.be.freemarker.FreeMarkerUtil;
import com.hginfo.hbm.be.service.impl.sys.SysUserServiceImpl;
import com.hginfo.hbm.be.service.impl.sys.news.SysNewsServiceImpl;
import com.hginfo.hbm.be.service.impl.sys.news.SysNewsTypeServiceImpl;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hutils.CollectionsUtil;
import com.hginfo.hutils.exception.BaseRuntimeException;

import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * task对外暴漏接口: SysTaskWebService. <br/>
 * @author yinyanzhen
 */
@HService
public class SysTaskWebServiceImpl implements SysTaskWebService {
    /**
     * 消息表记录消息来源.
     */
    private static final String NEWS_FROM = "sysTask";
    /**
     */
    @Autowired
    private SysUserServiceImpl sysUserService;
    /**
     */
    @Autowired
    private SysTaskServiceImpl          taskService;
    /**
     */
    @Autowired
    private SysTaskTypeServiceImpl          taskTypeService;
    /**
     */
    @Autowired
    private SysTaskNewsTempleteServiceImpl taskNewsTempleteService;
    /**
     */
    @Autowired
    private SysTaskHandlerServiceImpl   taskHandlerService;
    /**
     */
    @Autowired
    private SysTaskHandleLogServiceImpl taskHandleLogService;
    /**
     */
    @Autowired
    private SysNewsServiceImpl newsService;
    /**
     */
    @Autowired
    private SysNewsTypeServiceImpl newsTypeService;
    /**
     */
    @Autowired
    private BeFreeMarkerFactory freeMarkerFactory;
    
    /**
     * 添加任务信息,
     * 添加办理人信息
     * 读取任务办理人消息通知方式,获取消息模版(freemaker模版拼接消息)将添加时的通知以及办理时的通知全部存库,
     * 非办理人的通知消息,不需要模版拼接,可以原样保存, 消息方式为外部发送的,获取接收人手机号,邮箱地址
     * 添加消息主表信息
     * 添加消息(系统内外表信息,系统外部消息时,需要等待定时任务处理)
     * 添加任务办理日志.
     */
    @Override
    public void addSysTask(List<SysTask> sysTasks) {
      //获取全部的消息类型
        SysNewsType filter = new SysNewsType();
        filter.setIsDelete(0);
        List<SysNewsType> newsTypes = newsTypeService.getAllList(filter);
        for (SysTask task : sysTasks) {
            SysTask taskFilter = new SysTask();
            taskFilter.setBusinessId(task.getBusinessId());
            if (taskService.getList(taskFilter).size() > 0) {
                throw new BaseRuntimeException("任务添加失败,该业务id当前存在对应的任务信息!");
            }
            //保存任务信息,并返回处理后的task,用于后续处理
            task = saveTaskInfo(task);
            //保存任务消息
            saveTaskNews(task, newsTypes);
            //保存任务处理日志
            saveSysTaskHandleLog(task.getId(), null, new Date(), "0", "任务新增");
        }
    }
    
    /**
     * 更新任务信息
     * 读取任务办理人消息通知方式,获取消息模版(freemaker模版拼接消息)
     * 非办理人的通知消息,不需要模版拼接,可以原样保存, 消息方式为外部发送的,获取接收人手机号,邮箱地址.
     * 添加任务办理日志
     */
    @Override
    public void doSysTask(List<SysTaskDo> sysTaskDos) {
        //获取全部的消息类型
        SysNewsType filter = new SysNewsType();
        filter.setIsDelete(0);
        List<SysNewsType> newsTypes = newsTypeService.getAllList(filter);
        
        for (SysTaskDo sysTaskDo : sysTaskDos) {
            //更新任务办理信息
            SysTask systask = this.getTaskByBuinessId(sysTaskDo.getBusinessId());
            if (systask == null || systask.getIsDelete() == 1) {
                throw new BaseRuntimeException("任务不存在,无法办理!");
            }
            if ("1".equals(systask.getTaskStatus())) {
                //已被办理过的任务,自动跳过,不再进行办理动作
                continue;
            }
            systask.setTaskStatus("1");
            taskService.update(systask);
            //任务办理消息处理
            saveNewsForDoTask(systask, sysTaskDo, newsTypes);
            
            //记录办理日志
            saveSysTaskHandleLog(systask.getId(), sysTaskDo.getUserId(), new Date(), 
                "1", "任务办理" + sysTaskDo.getDescr());
        }
    }
    
    /**
     * 更新任务信息
     * 读取任务办理人消息通知方式,获取消息模版(freemaker模版拼接消息)
     * 非办理人的通知消息,不需要模版拼接,可以原样保存, 消息方式为外部发送的,获取接收人手机号,邮箱地址.
     * 添加任务办理日志.
     */
    @Override
    public void deleteTasks(List<SysTaskDo> sysTaskDos) {
        //获取全部的消息类型
        SysNewsType filter = new SysNewsType();
        filter.setIsDelete(0);
        List<SysNewsType> newsTypes = newsTypeService.getAllList(filter);
        
        for (SysTaskDo sysTaskDo : sysTaskDos) {
            SysTask systask = this.getTaskByBuinessId(sysTaskDo.getBusinessId());
            //不存在任务,已经删除任务,不做处理
            if (systask == null || systask.getIsDelete() == 1) {
                throw new BaseRuntimeException("任务不存在,无法办理!");
            }
            if ("1".equals(systask.getTaskStatus())) {
                //已被办理过的任务,自动跳过,不再进行删除动作
                continue;
            }
            taskService.delete(systask);
            
            //任务删除消息处理
            saveNewsForDelTask(systask, sysTaskDo, newsTypes);
            //保存任务处理日志
            saveSysTaskHandleLog(systask.getId(), sysTaskDo.getUserId(), new Date(), "2", "任务删除");
        }
    }
    
    /**
     * 添加任务办理日志
     * 读取任务办理人消息通知方式,通知新增办理人员以及被去除的办理人员.
     */
    @Override
    public void doReplaceTaskHandlers(List<SysTask> sysTasks) {
        //获取全部的消息类型
        SysNewsType filter = new SysNewsType();
        filter.setIsDelete(0);
        List<SysNewsType> newsTypes = newsTypeService.getAllList(filter);
        for (SysTask sysTask : sysTasks) {
            SysTask systask = this.getTaskByBuinessId(sysTask.getBusinessId());
            //不存在任务,已经删除任务,不做处理
            if (systask == null || systask.getIsDelete() == 1) {
                throw new BaseRuntimeException("任务不存在,无法处理!");
            }
            if ("1".equals(systask.getTaskStatus())) {
                //已被办理过的任务,自动跳过,不再进行删除动作
                continue;
            }
            //删除原办理人
            SysTaskHandler handler = new SysTaskHandler();
            handler.setTaskId(sysTask.getId());
            taskHandlerService.deleteBatch(handler);
            //添加新办理人
            for (Long taskHandlerId : sysTask.getBo().getSysTaskHandlerIds()) {
                SysTaskHandler taskHandler = new SysTaskHandler();
                taskHandler.setUserId(taskHandlerId);
                taskHandler.setTaskId(sysTask.getId());
                taskHandlerService.add(taskHandler);
            }
            
            //变更办理人,消息处理
            saveSysNewsForReplaceHandler(systask, newsTypes);
            //保存任务处理日志
            saveSysTaskHandleLog(sysTask.getId(), null, new Date(), "3", "变更办理人");
        }
    }
    
    /**
     * saveSysNewsForReplaceHandler:(保存变更办理人相关消息). <br/>
     * @author yinyanzhen
     * @param sysTask sysTask
     * @param newsTypes newsTypes
     * @throws TemplateException 
     * @throws IOException 
     * @since V1.0.0
     */
    private void saveSysNewsForReplaceHandler(SysTask sysTask, List<SysNewsType> newsTypes) {
        SysNews newsFilter = new SysNews();
        newsFilter.setBizId(sysTask.getId());
        newsFilter.setNewsFrom(NEWS_FROM);
        //查询消息节点为删除时消息
        newsFilter.setNewsDoNode(1);
        //查询办理时是否需要向办理人发送消息
        List<SysNews> sysNewsList = newsService.getList(newsFilter, "sysNewsTemplete");
        //变更时,不需要给办理人发送信息时,直接返回,不处理
        if (sysNewsList == null || sysNewsList.size() == 0) {
           return; 
        }
        SysTaskHandler taskHandlerFilter = new SysTaskHandler();
        taskHandlerFilter.setTaskId(sysTask.getId());
        //获取原办理人列表
        List<SysTaskHandler> oldTaskHandlerList = taskHandlerService.getList(taskHandlerFilter);
        List<Long> oldUserIds = CollectionsUtil.extractToList(oldTaskHandlerList, "userId");
        //新增的办理人列表
        List<Long> addUserIds = CollectionsUtil.
            subtract(sysTask.getBo().getSysTaskHandlerIds(), oldUserIds);
        //移除掉的办理人列表
        List<Long> removeUserIds = CollectionsUtil.
            subtract(oldUserIds, sysTask.getBo().getSysTaskHandlerIds());
        for (SysNews sysNews : sysNewsList) {
            //模版信息
            SysNewsTemplete newsTemplete = sysNews.getSysNewsTemplete();
            //获取使用的freemaker模版
            Template temp = freeMarkerFactory.getTemplate(newsTemplete.getFreemakerPath());
            
            //遍历办理人
            for (Long addUserId : addUserIds) {
                SysUser sysUser = sysUserService.getUserById(addUserId);
                Map<String, Object> freeMakerMap = new HashMap<>();
                freeMakerMap.put("user", sysUser);
                freeMakerMap.put("task", sysTask);
                freeMakerMap.put("isHandler", 0);
                String newsContent = null;
                try {
                    newsContent = FreeMarkerUtil.generateHtmlFromFtl(temp, freeMakerMap);
                } catch (Exception e) {
                    e.printStackTrace();
                    newsContent = "读取消息模版失败,不能获取到消息正文!";
                }
                //保存消息明细信息
                newsService.saveNewsDetail(sysNews.getSysNewsType().getIsIn(), sysNews.getId(), sysUser, 
                    newsTemplete, "任务新增提醒:" + sysTask.getTaskName(), newsContent);
            }
            //遍历办理人
            for (Long addUserId : removeUserIds) {
                SysUser sysUser = sysUserService.getUserById(addUserId);
                Map<String, Object> freeMakerMap = new HashMap<>();
                freeMakerMap.put("user", sysUser);
                freeMakerMap.put("task", sysTask);
                freeMakerMap.put("isHandler", 1);
                String newsContent = null;
                try {
                    newsContent = FreeMarkerUtil.generateHtmlFromFtl(temp, freeMakerMap);
                } catch (Exception e) {
                    e.printStackTrace();
                    newsContent = "读取消息模版失败,不能获取到消息正文!";
                }
                //保存消息明细信息
                newsService.saveNewsDetail(sysNews.getSysNewsType().getIsIn(), sysNews.getId(), sysUser, 
                    newsTemplete, "任务办理人注销提醒:" + sysTask.getTaskName(), newsContent);
            }
            //更新当前消息初始化标记为1
            sysNews.setIsInit(1);
            //更新消息信息
            newsService.update(sysNews);
        }
    }
    
    /**
     * getTaskByBuinessId:(业务id获取任务信息). <br/>
     * @author yinyanzhen
     * @param businessId
     * @return SysTask SysTask
     * @since V1.0.0
     */
    @Override
    public SysTask getTaskByBuinessId(Long businessId) {
        SysTask sysTask = new SysTask();
        sysTask.setBusinessId(businessId);
        sysTask.setIsDelete(0);
        return taskService.getOne(sysTask);
        
    }

    /**
     * saveTaskInfo:(保存任务). <br/>
     * @author yinyanzhen
     * @param task task
     * @return  SysTask SysTask
     * @since V1.0.0
     */
    private SysTask saveTaskInfo(SysTask task) {
        //code获取任务类型
        SysTaskType taskType = new SysTaskType();
        taskType.setTaskTypeCode(task.getTaskTypeCode());
        taskType.setIsDelete(0);
        taskType = taskTypeService.getOne(taskType);
        //获取任务主键
        task.setId(taskService.getDao().getIdentityid());
        task.setTaskTypeId(taskType.getId());
        task.setTaskStatus("0");
        //保存任务
        taskService.getDao().save(task);
        for (Long taskHandlerId : task.getBo().getSysTaskHandlerIds()) {
            SysTaskHandler taskHandler = new SysTaskHandler();
            taskHandler.setUserId(taskHandlerId);
            taskHandler.setTaskId(task.getId());
            taskHandlerService.add(taskHandler);
        }
        return task;
    }

    /**
     * saveTaskNews:(保存任务发送消息). <br/>
     * @author yinyanzhen
     * @param task task
     * @param newsTypes newsTypes
     * @since V1.0.0
     */
    private void saveTaskNews(SysTask task, List<SysNewsType> newsTypes) {
        
        //保存办理人通知消息
        //遍历通知类型编码
        for (String newsTypeCode : task.getBo().getNewsTypeCodes()) {
            //匹配获取通知类型
            SysNewsType newsType = null;
            for (SysNewsType newsTypetemp : newsTypes) {
                if (newsTypetemp.getNewsTypeCode().equals(newsTypeCode)) {
                    newsType = newsTypetemp;
                }
            }
            //遍历处理节点
            for (int newsDoNode : task.getBo().getNewsDoNodes()) {
                SysTaskNewsTemplete sysTaskNewsTempleteFilter = new SysTaskNewsTemplete();
                sysTaskNewsTempleteFilter.setNewsTypeId(newsType.getId());
                sysTaskNewsTempleteFilter.setNewsDoNode(newsDoNode);
                sysTaskNewsTempleteFilter.setTaskTypeId(task.getTaskTypeId());
                //查询模版表,对应模版
                SysTaskNewsTemplete sysTaskNewsTemplete = 
                    taskNewsTempleteService.getOne(sysTaskNewsTempleteFilter, "sysNewsTemplete");
                //模版信息
                SysNewsTemplete newsTemplete = sysTaskNewsTemplete.getSysNewsTemplete();
                //获取使用的freemaker模版
                Template temp = freeMarkerFactory.getTemplate(newsTemplete.getFreemakerPath());
                //信息节点为新增动作时,需要设定详细消息,并进行发送
                if (newsDoNode == 0) {
                    //保存消息配置信息
                    SysNews sysNews = newsService.saveSysNews(newsType.getId(), sysTaskNewsTemplete.getNewsTempleteId(), NEWS_FROM,
                        newsDoNode, task.getId(), 1, 0);
                    //遍历办理人
                    for (Long userId : task.getBo().getSysTaskHandlerIds()) {
                        SysUser user = sysUserService.getUserById(userId);
                        //
                        Map<String, Object> freeMakerMap = new HashMap<>();
                        freeMakerMap.put("user", user);
                        freeMakerMap.put("task", task);
                        String newsContent = null;
                        try {
                            newsContent = FreeMarkerUtil.generateHtmlFromFtl(temp, freeMakerMap);
                        } catch (Exception e) {
                            e.printStackTrace();
                            newsContent = "获取消息模版失败,不能获取到正文!";
                        }
                        //保存任务信息
                        newsService.saveNewsDetail(newsType.getIsIn(), sysNews.getId(), user, newsTemplete,
                            "任务新增提醒", newsContent);
                    }
                } else {
                    //保存消息配置信息_其它环节不进行初始化
                    newsService.saveSysNews(newsType.getId(), sysTaskNewsTemplete.getNewsTempleteId(), NEWS_FROM,
                        newsDoNode, task.getId(), 0, 0);
                }
            }
        }
        //保存业务通知消息
        for (SysNews.UserNew userNew : task.getBo().getUserNews()) {
            for (SysNewsType newsType : newsTypes) {
                if (newsType.getNewsTypeCode().equals(userNew.getNewsTypeCode())) {
                    //保存消息配置信息
                    SysNews sysNews = newsService.
                        saveSysNews(newsType.getId(), null, NEWS_FROM, null, task.getId(), 1, 0);
                    
                    SysUser user = sysUserService.getUserById(userNew.getUserId());
                    //保存任务详细信息
                    newsService.saveNewsDetail(newsType.getIsIn(), sysNews.getId(), user, null, 
                        userNew.getTitle(), userNew.getContent());
                }
            }
        }
    }
    
    /**
     * saveNewsForDoTask:(任务办理时消息处理). <br/>
     * @author yinyanzhen
     * @param systask systask
     * @param sysTaskDo sysTaskDo
     * @param newsTypes newsTypes
     * @throws TemplateException 
     * @throws IOException 
     * @since V1.0.0
     */
    private void saveNewsForDoTask(SysTask systask, SysTaskDo sysTaskDo, List<SysNewsType> newsTypes) {
        SysNews newsFilter = new SysNews();
        newsFilter.setBizId(systask.getId());
        newsFilter.setNewsFrom(NEWS_FROM);
        //查询消息节点为删除时消息
        newsFilter.setNewsDoNode(1);
        //查询办理时是否需要向办理人发送消息
        List<SysNews> sysNewsList = newsService.getList(newsFilter, "sysNewsType", "sysNewsTemplete");
        for (SysNews sysNews : sysNewsList) {
            //模版信息
            SysNewsTemplete newsTemplete = sysNews.getSysNewsTemplete();
            //获取使用的freemaker模版
            Template temp = freeMarkerFactory.getTemplate(newsTemplete.getFreemakerPath());
            //查询任务所有办理人
            SysTaskHandler sysTaskHandlerFilter = new SysTaskHandler();
            sysTaskHandlerFilter.setTaskId(systask.getId());
            List<SysTaskHandler> handlerList = taskHandlerService.getList(sysTaskHandlerFilter, "sysUser");
            //遍历办理人
            for (SysTaskHandler handler : handlerList) {
                Map<String, Object> freeMakerMap = new HashMap<>();
                freeMakerMap.put("user", handler.getSysUser());
                freeMakerMap.put("task", systask);
                freeMakerMap.put("sysTaskDo", sysTaskDo);
                String newsContent = null;
                try {
                    newsContent = FreeMarkerUtil.generateHtmlFromFtl(temp, freeMakerMap);
                } catch (Exception e) {
                    e.printStackTrace();
                    newsContent = "读取消息模版失败,不能获取到消息正文!";
                }
                //保存消息明细信息
                newsService.saveNewsDetail(sysNews.getSysNewsType().getIsIn(), sysNews.getId(), handler.getSysUser(), 
                    newsTemplete, "任务办理提醒:" + systask.getTaskName(), newsContent);
            }
            //更新当前消息初始化标记为1
            sysNews.setIsInit(1);
            //更新消息信息
            newsService.update(sysNews);
        }
        //办理时,业务发送消息处理
        for (SysNews.UserNew userNews : sysTaskDo.getUserNews()) {
            //匹配获取消息类型
            SysNewsType newsType = null;
            for (SysNewsType newsTypeTemp : newsTypes) {
                if (newsTypeTemp.getNewsTypeCode().equals(userNews.getNewsTypeCode())) {
                    newsType = newsTypeTemp;
                }
            }
            //设定消息配置信息,业务通知,不存在模版与对应环节信息
            SysNews sysNews = newsService.saveSysNews(newsType.getId(), null, NEWS_FROM, null, systask.getId(), 1, 0);
            SysUser user = sysUserService.getUserById(userNews.getUserId());
            //保存消息明细信息
            newsService.saveNewsDetail(newsType.getIsIn(), sysNews.getId(), user, null,
                userNews.getTitle(), userNews.getContent());
        }
    }
    /**
     * saveNewsForDelTask:(任务删除时消息处理). <br/>
     * @author yinyanzhen
     * @param systask systask
     * @param sysTaskDo sysTaskDo
     * @param newsTypes newsTypes
     * @throws TemplateException 
     * @throws IOException 
     * @since V1.0.0
     */
    private void saveNewsForDelTask(SysTask systask, SysTaskDo sysTaskDo, List<SysNewsType> newsTypes) {
        SysNews newsFilter = new SysNews();
        newsFilter.setBizId(systask.getId());
        newsFilter.setNewsFrom(NEWS_FROM);
        //查询消息节点为删除时消息
        newsFilter.setNewsDoNode(2);
        //查询办理时是否需要向办理人发送消息
        List<SysNews> sysNewsList = newsService.getList(newsFilter, "sysNewsTemplete");
        for (SysNews sysNews : sysNewsList) {
            //模版信息
            SysNewsTemplete newsTemplete = sysNews.getSysNewsTemplete();
            //获取使用的freemaker模版
            Template temp = freeMarkerFactory.getTemplate(newsTemplete.getFreemakerPath());
            //查询任务所有办理人
            SysTaskHandler sysTaskHandlerFilter = new SysTaskHandler();
            sysTaskHandlerFilter.setTaskId(systask.getId());
            List<SysTaskHandler> handlerList = taskHandlerService.getList(sysTaskHandlerFilter, "sysUser");
            //遍历办理人
            for (SysTaskHandler handler : handlerList) {
                Map<String, Object> freeMakerMap = new HashMap<>();
                freeMakerMap.put("user", handler.getSysUser());
                freeMakerMap.put("task", systask);
                freeMakerMap.put("sysTaskDo", sysTaskDo);
                String newsContent = null;
                try {
                    newsContent = FreeMarkerUtil.generateHtmlFromFtl(temp, freeMakerMap);
                } catch (Exception e) {
                    e.printStackTrace();
                    newsContent = "读取消息模版失败,不能获取到消息正文!";
                }
                //保存消息明细信息
                newsService.saveNewsDetail(sysNews.getSysNewsType().getIsIn(), sysNews.getId(), handler.getSysUser(), 
                    newsTemplete, "任务删除提醒:" + systask.getTaskName(), newsContent);
            }
            //更新当前消息初始化标记为1
            sysNews.setIsInit(1);
            //更新消息信息
            newsService.update(sysNews);
        }
        //删除时,业务发送消息处理
        for (SysNews.UserNew userNews : sysTaskDo.getUserNews()) {
            //匹配获取消息类型
            SysNewsType newsType = null;
            for (SysNewsType newsTypeTemp : newsTypes) {
                if (newsTypeTemp.getNewsTypeCode().equals(userNews.getNewsTypeCode())) {
                    newsType = newsTypeTemp;
                }
            }
            //设定消息配置信息,业务通知,不存在模版与对应环节信息
            SysNews sysNews = newsService.saveSysNews(newsType.getId(), null, NEWS_FROM, null, systask.getId(), 1, 0);
            SysUser user = sysUserService.getUserById(userNews.getUserId());
            //保存消息明细信息
            newsService.saveNewsDetail(newsType.getIsIn(), sysNews.getId(), user, null,
                userNews.getTitle(), userNews.getContent());
        }
    }

    

    /**
     * saveSysTaskHandleLog:(保存任务处理日志). <br/>
     * @author yinyanzhen
     * @param taskId taskId
     * @param userId userId
     * @param taskHandleTime taskHandleTime
     * @param taskHandleType taskHandleType
     * @param descr descr
     * @since V1.0.0
     */
    private void saveSysTaskHandleLog(Long taskId, Long userId, Date taskHandleTime, 
        String taskHandleType, String descr) {
        SysTaskHandleLog handleLog = new SysTaskHandleLog();
        handleLog.setTaskId(taskId);
        handleLog.setUserId(userId);
        handleLog.setTaskHandleTime(taskHandleTime);
        handleLog.setTaskHandleType(taskHandleType);
        taskHandleLogService.add(handleLog);
    }
}
