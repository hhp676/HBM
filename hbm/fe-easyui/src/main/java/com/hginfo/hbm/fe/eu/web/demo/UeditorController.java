
package com.hginfo.hbm.fe.eu.web.demo;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.fe.eu.op.OperationResult;
import com.hginfo.hutils.EncodeUtil;
import com.hginfo.hutils.RequestUtil;

/**
 * 富文本编辑器demo控制层
 * ClassName: UeditorController <br/>.
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Controller
@RequestMapping("/common/demo/ueditor")
public class UeditorController {
    
    /**
     * 跳转到管理页面.
     *
     * @author yinyanzhen
     * @param request request
     * @return 管理页面
     * @since V1.0.0
     */
    @RequestMapping("/toDemoPage")
    public String toDemoPage(HttpServletRequest request) {
        String info = "<p><span style='color: rgb(165, 165, 165);'><strong>鸿冠信息ueditor</strong></span></p>"
            + "<p><span style='color: rgb(165, 165, 165);'>初始文本demo</span></p>";
        //设定ueditor初始值,demo
        request.setAttribute("testInfo", info);
        return "demo/ueditor/ueditorDemo_show";
    }
    
    /**
     * saveUeditorForm:(保存ueditor信息). <br/>
     * @author yinyanzhen
     * @param request request
     * @return OperationResult
     * @since V1.0.0
     */
    @RequestMapping("/saveUeditorForm")
    @ResponseBody
    public OperationResult saveUeditorForm(HttpServletRequest request) {
        Map<String, String> vo = RequestUtil.getRequestParamMap(request);
        //ueditor编辑器的信息,在后台必须反编译一次,才能获取正确的信息
        vo.put("ueditorContent", EncodeUtil.unescapeHtml4(vo.get("ueditorContent")));
        
        System.out.println(vo.get("name"));
        System.out.println(vo.get("type"));
        System.out.println(vo.get("ueditorContent"));
        
        OperationResult result = new OperationResult();
        result.setSuccess(true);
        return result;
        
    }
}
