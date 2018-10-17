package com.hginfo.hbm.fe.bs.web.demo;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.service.demo.FileDemoService;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hutils.PathUtil;
import com.hginfo.hutils.RequestUtil;
import com.hginfo.hutils.ResponseUtil;
import com.hginfo.hutils.bizobject.HgMultipartFile;
import com.hginfo.hutils.exception.BaseRuntimeException;
import com.hginfo.hutils.exception.ExceptionUtil;

/**
 * 文件上传下载处理demo.
 * ClassName: FileDemoController <br/>
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Controller
@RequestMapping("/common/demo/fileDemo")
public class FileDemoController {

    /**
     * 文件读取的缓冲字节长度。
     */
    private static final int BUFFER_SIZE = 2048;

    /**
     */
    @HReference
    private FileDemoService fileDemoService;
    
    /**
     * toFileDemoPage:跳转页面. <br/>
     *
     * @author yinyanzhen
     * @return String
     * @since V1.0.0
     */
    @RequestMapping("/toFileDemoPage")
    public String toFileDemoPage() {
        return "demo/fileDemo/fileDemo_show";
    }
    
    /**
     * toSingleUpload:跳转到单文件上传例子. <br/>
     * @author yinyanzhen
     * @return String
     * @since V1.0.0
     */
    @RequestMapping("/toSingleUpload")
    public String toSingleUpload() {
        return "demo/fileDemo/singleUploadDemo";
    }
    
    /**
     * singleFileUpload:单文件上传保存. <br/>
     * @author yinyanzhen
     * @param request request
     * @param response response
     * @since V1.0.0
     */
    @RequestMapping("/singleFileUpload")
    public void singleFileUpload(HttpServletRequest request, HttpServletResponse response) {
        //获取页面参数
        Map<String, String> vo = RequestUtil.getRequestParamMap(request);
        
        String result = "success";
        try {
            List<HgMultipartFile>  multipartList = RequestUtil.getMultipartFileList(request);
            fileDemoService.saveSingleFileUpload(vo, multipartList);
        } catch (Exception e) {
            e.printStackTrace();
            result = ExceptionUtil.getExceptionMsg(e);
        }
        ResponseUtil.renderHtml(response, result);
    }
    
    /**
     * toFilesUpload:跳转到多附件上传. <br/>
     * @author yinyanzhen
     * @return String
     * @since V1.0.0
     */
    @RequestMapping("/toFilesUpload")
    public String toFilesUpload() {
        return "demo/fileDemo/filesUpload";
    }
    
    /**
     * filesUpload:(多附件保存). <br/>
     * @author yinyanzhen
     * @param request request
     * @param response response
     * @since V1.0.0
     */
    @RequestMapping("/filesUpload")
    public void filesUpload(HttpServletRequest request, HttpServletResponse response) {
        //获取页面参数
        Map<String, String> vo = RequestUtil.getRequestParamMap(request);
        String result = "success";
        try {
            List<HgMultipartFile>  multipartList = RequestUtil.getMultipartFileList(request);
            fileDemoService.saveFilesUpload(vo, multipartList);
        } catch (Exception e) {
            e.printStackTrace();
            result = ExceptionUtil.getExceptionMsg(e);
        }
        ResponseUtil.renderHtml(response, result);
    }
    
    //************************************** 带有关联关系的附件上传start***************************/
    /**
     * toFileDemoPage:跳转到关联关系附件上传. <br/>
     *
     * @author yinyanzhen
     * @return String
     * @since V1.0.0
     */
    @RequestMapping("/toRelationFileUploadDemo")
    public String toRelationFileUploadDemo() {
        return "demo/fileDemo/relationFileUploadDemo";
    }
    
    /**
     * getDataGridFileModel:获取datagrid数据. <br/>
     *
     * @author yinyanzhen
     * @return Map
     * @since V1.0.0
     */
    @RequestMapping("/getDataGridFileModel")
    @ResponseBody
    public Map<String, Object> getDataGridFileModel() {
        //获取查询条件
        
        //demo模拟演示数据
        List<Map> rows = new ArrayList<>();
        String[] bizCodes = {"项目1", "项目2"};
        String[] modelNames = {"初验文档", "验收文档", "使用说明书"};
        for (String bizCode:bizCodes) {
            for (String modelName:modelNames) {
                Map<String, String> map = new HashMap<>();
                map.put("modelVerson", "1.0");
                map.put("bizCode", bizCode);
                map.put("modelID", modelName + "modelID");
                map.put("modelName", modelName);
                rows.add(map);
            }
        }
        
        //封装datagrid的返回数据
        Map<String, Object> returnMap = new HashMap<>();
        returnMap.put("rows", rows);
        return returnMap;
    }
    
    /**
     * relationFileUpload:关联关系的附件上传保存逻辑. <br/>
     * @author yinyanzhen
     * @param request request
     * @param response response
     * @since V1.0.0
     */
    @RequestMapping("/relationFileUpload")
    public void relationFileUpload(HttpServletRequest request, HttpServletResponse response) {
        //获取页面参数
        Map<String, String> vo = RequestUtil.getRequestParamMap(request);
        String result = "success";
        try {
            List<HgMultipartFile>  multipartList = RequestUtil.getMultipartFileList(request);
            fileDemoService.saveRelationFileUpload(vo, multipartList);
        } catch (Exception e) {
            e.printStackTrace();
            result = ExceptionUtil.getExceptionMsg(e);
        }
        ResponseUtil.renderHtml(response, result);
    }
    //*************************带有关联关系的附件上传end***************************/
    
    /**
     * downloadFile:(附件下载). <br/>
     * @author yinyanzhen
     * @param response response
     * @since V1.0.0
     */
    @RequestMapping("/downloadFile")
    public void downloadFile(HttpServletResponse response) {
        //获取参数
        File file = new File(PathUtil.getWebAppPath() + "/favicon.ico");
        response.reset();
        try {
            response.addHeader("Content-Disposition",
                    "attachment;filename=" + URLEncoder.encode("favicon.ico", "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            throw new BaseRuntimeException(e);
        }
        try (InputStream fis = new BufferedInputStream(new FileInputStream(file))) {
            try (OutputStream os = response.getOutputStream()) {
                byte[] buffer = new byte[BUFFER_SIZE];
                while (fis.read(buffer) > 0) {
                    os.write(buffer);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            //输出错误信息到页面
            ResponseUtil.renderText(response, ExceptionUtil.getExceptionMsg(e));
        }
    }
}
