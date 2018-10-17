
package com.hginfo.hbm.fe.bs.web.sys;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.hginfo.hbm.base.entity.sys.SysAttachment;
import com.hginfo.hbm.base.entity.sys.SysFile;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysAttachmentService;
import com.hginfo.hbm.base.service.sys.SysFileService;
import com.hginfo.hbm.fe.bs.op.OperationResult;
import com.hginfo.hbm.fe.bs.page.Page;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.RequestUtil;
import com.hginfo.hutils.ResponseUtil;
import com.hginfo.hutils.bizobject.HgMultipartFile;

/**
 * 系统文件Controller。 <br />
 * controller 层 <br />
 * Date: 2016年12月19日 上午10:03:54 <br />
 *
 * @author mahonghua
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/sysFile")
public class SysFileController {
    
    /**
     *
     */
    private static final Log             LOG                    = LogFactory
        .getLog(SysFileController.class);
    /**
     *
     */
    private static final OperationResult DEFAULT_SUCCESS_RESULT = new OperationResult();
    /**
     * 由byte换算为10B。
     */
    private static final int             B_INT                  = 1024 * 10;
    /**
     * 系统文件Service。
     */
    private SysFileService               fileService;
    /**
     * 系统附件Service。
     */
    private SysAttachmentService         attachmentService;
    
    /**
     * 系统文件管理菜单。
     * @return sys_file viewId
     */
    
    @RequestMapping(value = "/view")
    public String showSysFile() {
        return "sys/file/showSysFile_view";
    }
    
    /**
     * 系统文件分页数据。
     * @param pageInfo 分页信息
     * @param formFilter 过滤条件
     * @return 系统文件分页数据
     */
    @RequestMapping(value = "/fileList")
    @ResponseBody
    public Page<SysAttachment> fileList(BasePage<SysAttachment> pageInfo,
        SysAttachment formFilter) {
        SysAttachment filter = new SysAttachment();
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        Page<SysAttachment> page = new Page<>(
            attachmentService.getPageList(pageInfo, filter, "sysFile"));
        return page;
    }
    
    /****************webUploader文件上传.**************************************/
    
    /***.
     * webUpload:上传信息
     * @return 返回页面  
     * @since V1.0.0
     */
    @RequestMapping("/webUpload")
    public String webUpload() {
        return "sys/file/showSysFile_webUpload";
    }
    
    /**.
     * 
     * 功能：webuploader文件上传
     * @param multipartFile 传递文件
     * @param request request
     * @param response response
     * @throws Exception 抛出异常
     */
    @RequestMapping(value = "/upload")
    public void upload(@RequestParam("fileData") MultipartFile multipartFile,
        HttpServletRequest request, HttpServletResponse response) throws Exception {
        //获取页面传递的参数
        Map<String, String> vo = RequestUtil.getRequestParamMap(request);
        /** 拼成完整的文件保存路径加文件 **/
        // 上传文件
        List<HgMultipartFile> multipartList = RequestUtil.getMultipartFileList(request);
        SysFile addFile = fileService.createUploadFile(multipartList);
        
        ResponseUtil.renderJson(response, JSON.toJSONString(addFile), "encoding:UTF-8");
    }
    
    /**.
     * 更新附件 名称和描述
     * @param fileId 文件信息ID
     * @param attId attId
     * @param request  request
     * @return 返回处理结果
     */
    @RequestMapping(value = "/updateAttach")
    @ResponseBody
    @UserLog(code = "updateAttach", name = "修改附件", engName = "updateAttach")
    public OperationResult updateAttach(final long fileId, final long attId,
        final HttpServletRequest request) {
        SysFile sysFile = fileService.getById(fileId);
        SysAttachment sysAttachment = attachmentService.getById(attId);
        if (sysFile != null && sysAttachment != null) {
            String attName = request.getParameter("attName");
            sysAttachment.setAttName(attName);
            
            String descr = request.getParameter("descr");
            sysFile.setDescr(descr);
            fileService.updateFileAndAttachment(sysFile, sysAttachment);
        }
        
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**.
     * 删除附件
     * @param fileId 文件信息ID
     * @param attId  附件信息ID
     * @return 返回处理结果
     */
    @RequestMapping(value = "/deleteAttach")
    @ResponseBody
    @UserLog(code = "deleteAttach", name = "删除附件", engName = "deleteAttach")
    public OperationResult deleteAttach(long fileId, long attId) {
        
        //1、逻辑删除附件数据 2、删除文件 3、更新附件数据的附件状态为已删除
        fileService.deleteSysAttachFile(fileId, attId);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**.
     * 文件下载
     * @param fileId 文件信息ID
     * @param attId attId
     * @param request request
     * @param response response
     */
    @RequestMapping(value = "/downFile/{fileId}/{attId}")
    public void downFile(@PathVariable long fileId, @PathVariable long attId,
        HttpServletRequest request, HttpServletResponse response) {
        InputStream fis = null;
        OutputStream outputStream = null;
        
        try {
            SysFile attach = fileService.getById(fileId);
            SysAttachment sysAttachment = attachmentService.getById(attId);
            String path = attach.getRelativePath();
            File file = new File(path);
            if (!file.exists()) {
                // 不存在
                System.out.println("文件不存在：" + file);
                ResponseUtil.renderText(response, "文件不存在", "encoding:UTF-8");
                return;
            }
            response.reset();
            String fileNameDown = "";
            String browserUserAgent = request.getHeader("User-Agent").toUpperCase();
            String fileNameBiz = sysAttachment.getAttName(); //文件业务名
            if (browserUserAgent.indexOf("MSIE") > 0 || browserUserAgent.indexOf("TRIDENT") > 0) {
                fileNameDown = URLEncoder.encode(fileNameBiz, "UTF-8");
                fileNameDown = fileNameDown.replace("+", "%20"); //处理IE中空格转换为加号(+)的问题
            } else {
                fileNameDown = new String(fileNameBiz.getBytes("UTF-8"), "ISO-8859-1");
            }
            response.setHeader("Content-Disposition",
                "attachment; filename=\"" + fileNameDown + "\"");
            response.addHeader("Content-Length", "" + file.length());
            response.setContentType("application/octet-stream");
            outputStream = new BufferedOutputStream(response.getOutputStream());
            fis = new BufferedInputStream(new FileInputStream(path));
            byte[] buffer = new byte[B_INT];
            while (fis.read(buffer) > 0) {
                outputStream.write(buffer);
            }
        } catch (Exception e) {
            e.printStackTrace();
            ResponseUtil.renderText(response, "文件下载失败", "encoding:UTF-8");
        } finally {
            try {
                if (outputStream != null) {
                    outputStream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                if (fis != null) {
                    fis.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    
    /**
     * 
     * 关于弹出框. <br/>
     *
     * @param sysFile 
     * @param request 
     * @param response 
     * @param model 
     * @return biz_about
     */
    @RequestMapping(value = "/aboutDialogView")
    public String aboutDialogView(SysFile sysFile, HttpServletRequest request,
        HttpServletResponse response, Model model) {
        Long fileId = sysFile.getFileId();
        SysAttachment sysAttachment = attachmentService.getById(fileId);
        model.addAttribute("biz", sysAttachment);
        return "sys/biz_about";
    }
    
    @HReference
    public void setFileService(SysFileService fileService) {
        this.fileService = fileService;
    }
    
    @HReference
    public void setAttachmentService(SysAttachmentService attachmentService) {
        this.attachmentService = attachmentService;
    }
}
