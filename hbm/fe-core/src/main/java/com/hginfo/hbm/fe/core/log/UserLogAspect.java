package com.hginfo.hbm.fe.core.log;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.hginfo.hbm.base.entity.sys.SysUserLog;
import com.hginfo.hbm.base.service.sys.SysUserLogService;
import com.hginfo.hbm.core.constants.AspectOrderConstants;
import com.hginfo.hbm.core.constants.DictConstants;
import com.hginfo.hbm.core.utils.CurrentUserUtils;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.IpAddressUtil;
import com.hginfo.hutils.SpringContextUtil;

/**
 * 用户操作日志的处理。<br/>
 */
@Aspect
@Order(AspectOrderConstants.ORDER_USERLOG)
@Component
public class UserLogAspect {
    
    
    /**
     * 
     */
    private Log log = LogFactory.getLog(UserLogAspect.class);
    
    /**
     * UserLog的切面表达式。
     */
    private static final String USERLOG_POINT_CUT = "@annotation(userLog)";
    
    /**
     * 日志content分隔符。
     */
    private static final String USERLOG_CONTENT_SEPARATOR = " , ";
    
    /**
     * 
     */
    @HReference
    private SysUserLogService sysUserLogService;
    
    /**
     * 方法正常执行完成后，保存用户日志。
     * @param joinPoint 切点
     * @param userLog 日志注解
     */
    @AfterReturning(value = USERLOG_POINT_CUT)
    public void saveUserLogAfterReturing(JoinPoint joinPoint, UserLog userLog) {
        this.saveUserLog(userLog, joinPoint.getArgs(), DictConstants.SYSUSERLOG_RESULT_SUCCESS);
    }
    
    /**
     * 方法执行异常后，保存用户日志。
     * @param joinPoint 切点
     * @param userLog 日志注解
     * @param exception 异常
     */
    @AfterThrowing(value = USERLOG_POINT_CUT, throwing = "exception")
    public void saveUserLogAfterThrowing(JoinPoint joinPoint, UserLog userLog, Exception exception) {
        this.saveUserLog(userLog, joinPoint.getArgs(), DictConstants.SYSUSERLOG_RESULT_FAIL);
    }
    
    /**
     * 保存日志。
     * @param userLog 注解
     * @param args 方法参数
     * @param isSuccess 是否成功
     */
    private void saveUserLog(UserLog userLog, Object[] args, int isSuccess) {
        HttpServletRequest request = SpringContextUtil.getCurrentRequest();
        SysUserLog sysUserLog = new SysUserLog();
        sysUserLog.setUserId(CurrentUserUtils.getUserId());
        sysUserLog.setOperCode(userLog.code());
        sysUserLog.setOperName(userLog.name());
        sysUserLog.setEngName(userLog.engName());
        sysUserLog.setReqUri(request.getRequestURI());
        sysUserLog.setOperIp(IpAddressUtil.getClientIpv4(request));
        sysUserLog.setKey1(userLog.key1());
        sysUserLog.setKey2(userLog.key2());
        sysUserLog.setKey3(userLog.key3());
        sysUserLog.setOperRes(String.valueOf(isSuccess));
        StringBuffer contentBuf = new StringBuffer();
        for (Object arg : args) {
            // 如果不指定ContentClass，则保存除Request/Response以外的所有参数
            if (!(arg instanceof HttpServletRequest) && !(arg instanceof HttpServletResponse)) {
                if (UserLog.class.equals(userLog.contentClass())) {
                    contentBuf.append(USERLOG_CONTENT_SEPARATOR).append(JSONObject.toJSONString(arg));
                } else if (userLog.contentClass().equals(arg.getClass())) {
                    contentBuf.append(USERLOG_CONTENT_SEPARATOR).append(JSONObject.toJSONString(arg));
                }
            }
        }
        sysUserLog.setContent(contentBuf.length() > USERLOG_CONTENT_SEPARATOR.length()
            ? contentBuf.substring(USERLOG_CONTENT_SEPARATOR.length())
            : contentBuf.toString());
        try {
            sysUserLogService.add(sysUserLog);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
    }
}
