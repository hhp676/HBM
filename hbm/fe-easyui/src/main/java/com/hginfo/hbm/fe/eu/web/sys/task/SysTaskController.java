/*
 * Project Name:hbm-base.
 * File Name:SysTaskController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2017年06月08日 下午2:44:48
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.eu.web.sys.task;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.task.SysTask;
import com.hginfo.hbm.base.entity.sys.task.SysTaskHandleLog;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.task.SysTaskHandleLogService;
import com.hginfo.hbm.base.service.sys.task.SysTaskService;
import com.hginfo.hbm.base.service.sys.task.SysTaskWebService;
import com.hginfo.hbm.fe.core.shiro.session.SessionUtils;
import com.hginfo.hbm.fe.eu.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

/**
 * 任务: SysTaskController. <br/>
 * date: 2017年6月8日 下午3:18:54 <br/>
 *
 * @author yinyanzhen
 * @version 
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/sysTask")
public class SysTaskController {
    /**
     */
    private static final Log LOG = LogFactory.getLog(SysTaskController.class);
    /**
     * Service。
     */
    @HReference
    private SysTaskService service;
    /**
     * 加载Spring容器内websocket封装.
     */
    @Autowired
    private SimpMessagingTemplate msgTemplate;
    /**
     * 任务中心日志service.
     */
    @HReference
    private SysTaskHandleLogService taskLogService;
    /**
     */
    @HReference
    private SysTaskWebService sysTaskWebSerice;
    
    /**
     * 测试任务添加,测试通过.
     * @return OperationResult OperationResult
     */
    /*@RequestMapping("/testDoTask")
    public OperationResult testDoTask() {
        OperationResult result = OperationResult.DEFAULT_SUCCESS;
        SysTask sysTask = new SysTask();
        sysTask.setBusinessId(1L);
        sysTask.setTaskTypeCode("tasktype1");
        sysTask.setTaskName("接口调用任务添加!");
        sysTask.setCrossDomainAppUrl(""); 
        sysTask.setTaskHandleUrl("");
        sysTask.setTaskViewUrl("");
        sysTask.setTaskCrtTime(new Date());
        sysTask.setTaskEndTime(new Date());
        sysTask.setDescr("testsetsetset");
        
        List<Long> sysTaskHandlerIds = Arrays.asList(new Long[]{1L});
        List<String> newsTypeCodes = Arrays.asList(new String[]{"SYS_NEWS"});
        List<Integer> newsDoNodes = Arrays.asList(new Integer[]{0, 1});
        
        SysNews.UserNew userNew = new SysNews().new UserNew();
        userNew.setUserId(2L);
        userNew.setNewsTypeCode("SYS_NEWS");
        userNew.setTitle("测试信息title");
        userNew.setContent("测试信息正文");
        sysTask.getBo().setSysTaskHandlerIds(sysTaskHandlerIds);
        sysTask.getBo().setNewsTypeCodes(newsTypeCodes);
        sysTask.getBo().setNewsDoNodes(newsDoNodes);
        sysTask.getBo().setUserNews(Arrays.asList(new SysNews.UserNew[]{userNew}));
        
        
        sysTaskWebSerice.addSysTask(Arrays.asList(sysTask));
        return result;
    }*/
    
    /**
     * 测试任务办理.测试通过.
     * @return OperationResult
     */
    /*@RequestMapping("/doSysTask")
    public OperationResult doSysTask() {
        SysTaskDo sysTaskDo = new SysTaskDo();
        sysTaskDo.setBusinessId(1L);
        sysTaskDo.setUserId(1L);
        sysTaskDo.setUserNews(new ArrayList<>());
        sysTaskWebSerice.doSysTask(Arrays.asList(new SysTaskDo[]{sysTaskDo}));
        return OperationResult.DEFAULT_SUCCESS;
    }*/
    /**
     * sendTaskWebSocket:(任务中心推送websocket消息). <br/>
     * @author yinyanzhen
     * @since V1.0.0
     */
    /*@PostConstruct
    public void init() {
        int timer = Integer.valueOf(HProfileUtil.getProperty("sysTaskWebSocketTimer"));
        if (timer > NumberUtil.INTEGER_ZERO) {
            new Thread(new Runnable() {
                public void run() {
                    while (true) {
                        try {
                            //循环中,设定循环时间间隔
                            Thread.sleep(timer * 1000);
                            Date startTime = DateTimeUtil.addSeconds(new Date(), -timer);
                            //获取有新任务的人员id
                            List<Map> userIdMaps = taskLogService.getAfterDateNewTaskUserIds(startTime);
                            for (Map userIdMap : userIdMaps) {
                                String userId = StringUtil.obj2String(userIdMap.get("userId"));
                                //消息发送至对应的信道中
                                msgTemplate.convertAndSend("/topic/taskWebSocket/" + userId, 
                                    String.valueOf(userIdMap.get("count")));
                            }
                        } catch (Exception e) {
                            e.printStackTrace();  
                            LOG.error(e.getMessage());
                        }
                    }
                }
            }).start();
        }
    }*/

    /**
     * 列表页面。
     * @return sys_dict viewId
     * @param request request
     */
    @RequestMapping(value = "/view")
    public String view(HttpServletRequest request) {
        request.setAttribute("userId", SessionUtils.getUserId());
        return "sys/task/sysTask_view";
    }

    /**
    * 分页数据。
    * @param pageInfo 分页信息
    * @param filter filter
    * @return 字典组分页数据
    */
    @RequestMapping(value = "/getDoTasklist")
    @ResponseBody
    public Page<SysTask> getDoTasklist(BasePage<SysTask> pageInfo, SysTask filter) {
        filter.setTaskStatus("0");
        filter.getBo().setDoHandlerId(SessionUtils.getUserId());
        return new Page<>(service.getPageList(pageInfo, filter, "sysTaskType"));
    }
    
    /**
     * getTaskInfoById:(id查询任务信息). <br/>
     * @author yinyanzhen
     * @param filter filter
     * @return OperationResult OperationResult
     * @since V1.0.0
     */
    @RequestMapping("/getTaskInfoById")
    @ResponseBody
    public SysTask getTaskInfoById(SysTask filter) {
        return service.get(filter.getId());
    }
    
    /****************************************已办任务***************************************/
    /**
     * toTaskHistoryView:(这里用一句话描述这个方法的作用). <br/>
     * @author yinyanzhen
     * @return String String
     * @since V1.0.0
     */
    @RequestMapping("/taskHistoryView")
    public String taskHistoryView() {
        return "sys/task/sysTaskHistory_view";
    }

    /**
    * 分页数据。
    * @param pageInfo 分页信息
    * @param filter filter
    * @return 字典组分页数据
    */
    @RequestMapping(value = "/getHistoryTasklist")
    @ResponseBody
    public Page<SysTask> getHistoryTasklist(BasePage<SysTask> pageInfo, SysTask filter) {
        filter.setTaskStatus("1");
        filter.getBo().setHistoryHandlerId(SessionUtils.getUserId());
        return new Page<>(service.getPageList(pageInfo, filter, "sysTaskType"));
    }
    
    /**
     * taskCrossDomainWin:(跨域弹窗办理方式). <br/>
     * @author yinyanzhen
     * @param request request
     * @param url url
     * @return view view
     * @since V1.0.0
     */
    @RequestMapping("/taskCrossDomainWin")
    public String taskCrossDomainWin(HttpServletRequest request, String url) {
        request.setAttribute("url", url);
        return "sys/task/sysTaskCrossDomain_win";
    }
    
    /**
     * 分页数据。
     * @param pageInfo 分页信息
     * @param filter filter
     * @return 分页数据
     */
     @RequestMapping(value = "/getSysTaskLogList")
     @ResponseBody
     public Page<SysTaskHandleLog> getSysTaskLogList(BasePage<SysTaskHandleLog> pageInfo, SysTaskHandleLog filter) {
         return new Page<>(taskLogService.getPageList(pageInfo, filter));
     }
}
