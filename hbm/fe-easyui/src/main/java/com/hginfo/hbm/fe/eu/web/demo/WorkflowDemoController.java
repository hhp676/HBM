package com.hginfo.hbm.fe.eu.web.demo;

import static com.hginfo.hbm.fe.eu.web.sys.ControllerConstants.DEFAULT_SUCCESS_RESULT;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.fe.eu.op.OperationResult;
import com.hginfo.hbpm.api.entity.HbpmProcessDefinition;
import com.hginfo.hbpm.api.service.HbpmProcessDefinitionService;
import com.hginfo.hbpm.api.service.HbpmProcessInstanceService;
import com.hginfo.hdubbo.annotation.HReference;

/**
 * workflow demo.
 */
@Controller
@RequestMapping("/common/demo/workflowDemo")
public class WorkflowDemoController {

    @HReference
    private HbpmProcessInstanceService processInstanceService;
    
    @HReference
    private HbpmProcessDefinitionService processDefinitionService;
    
    /**
     * 工作流demo
     */
    @RequestMapping("/workflowDemoView")
    public String workflowDemoView(Model model) {
        HbpmProcessDefinition filter = new HbpmProcessDefinition();
        filter.setLatest(true);
        List<HbpmProcessDefinition> defList = processDefinitionService.getProcessDefinitionList(filter);
        model.addAttribute("defList", defList);
        
        return "demo/workflow/workflow_show";
    }
    
    /**
     * 工作流demo
     */
    @RequestMapping("/startProcessByKey")
    @ResponseBody
    public OperationResult startProcessByKey(String defKey) {
        Map<String, Object> var = new HashMap<>();
        var.put("process_desc", "通过demo发起");
        processInstanceService.startProcessByProcessDefinitionKey(defKey, null, var);
        return DEFAULT_SUCCESS_RESULT;
    }
    
}
