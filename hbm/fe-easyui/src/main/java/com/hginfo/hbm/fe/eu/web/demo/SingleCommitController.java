package com.hginfo.hbm.fe.eu.web.demo;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.fe.core.interceptor.RepeatSubmitToken;
import com.hginfo.hbm.fe.eu.op.OperationResult;
import com.hginfo.hutils.RequestUtil;

/**
 * ClassName: SingleCommitController .<br/>
 * @author yinyanzhen
 * @since V1.0.0
 */
@Controller
@RequestMapping("/common/demo/singleCommit")
public class SingleCommitController {
    
    /**
     * toSingleCommit:(页面跳转). <br/>
     * @author yinyanzhen
     * @return 页面
     * @since V1.0.0
     */
    @RequestMapping("/toSingleCommit")
    public String toSingleCommit() {
        return "demo/singleCommit/singleCommitDemo_show";
    }
    
    /**
     * saveSingleCommit:(单次提交后台demo). <br/>
     * @author yinyanzhen
     * @param request request
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping("/saveSingleCommit")
    @ResponseBody
    @RepeatSubmitToken(removeToken = true)
    public OperationResult saveSingleCommit(HttpServletRequest request) {
        Map<String, String> vo = RequestUtil.getRequestParamMap(request);
        //TODO
        
        OperationResult result = new OperationResult();
        result.setSuccess(false);
        result.setData("模拟提交失败!");
        return result;
    }
}
