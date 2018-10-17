package com.hginfo.hbm.fe.core.spring;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.hginfo.hbm.fe.core.shiro.session.SessionUtils;

/**
 * 自定义上传类,实现上传进度读取.
 * ClassName: CustomMultipartResolver <br/>
 * date: 2017年8月1日 上午9:49:11 <br/>
 *
 * @author yinyanzhen
 * @version 
 * @since V1.0.0
 */
public class CustomMultipartResolver extends CommonsMultipartResolver {
    
    /**
     * 覆写上传接收方法,加入进度条.
     * @author yinyanzhen
     */
    @Override
    public MultipartParsingResult parseRequest(HttpServletRequest request)
        throws MultipartException {
        String encoding = determineEncoding(request);
        FileUpload fileUpload = prepareFileUpload(encoding);
        //拦截器内直接取用request参数取不到,需要转换一次
        String para = request.getParameter("submitToken");
        //上传的参数内未书写submitToken时,不添加进度逻辑
        if (para == null) {
            ProgressListener progressListener = new ProgressListener() {
                public void update(long pBytesRead, long pContentLength, int pItems) {
                    float tmp = (float) pBytesRead;
                    float percentage = tmp / pContentLength * 100;
                    //将进度值写入到session内
                    SessionUtils.getSession().setAttribute(para, percentage);
                    //当进度到达100时,保留1秒后删除
                    if (percentage == 100.00) {
                        SessionUtils.getSession().removeAttribute(para);
                    }
                }
            };
            fileUpload.setProgressListener(progressListener);
        }
        try {
            List<FileItem> fileItems = ((ServletFileUpload) fileUpload).parseRequest(request);
            return parseFileItems(fileItems, encoding);
        } catch (FileUploadBase.SizeLimitExceededException ex) {
            throw new MaxUploadSizeExceededException(fileUpload.getSizeMax(), ex);
        } catch (FileUploadException ex) {
            throw new MultipartException("Could not parse multipart servlet request", ex);
        }
    }
}
