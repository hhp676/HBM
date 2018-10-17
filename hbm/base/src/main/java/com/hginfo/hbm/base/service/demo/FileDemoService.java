package com.hginfo.hbm.base.service.demo;

import com.hginfo.hutils.bizobject.HgMultipartFile;

import java.util.List;
import java.util.Map;
/**
 * 
 * ClassName: FileDemoService .<br/>
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
public interface FileDemoService {
    
    /**
     * saveSingleFileUpload:单文件上传. <br/>
     *
     * @author yinyanzhen
     * @param vo vo
     * @param multipartList 可序列化的文件请求list
     * @since V1.0.0
     */
    void saveSingleFileUpload(Map<String, String> vo, List<HgMultipartFile> multipartList);
    
    /**
     * 
     * saveFilesUpload:(多附件保存). <br/>
     * @author yinyanzhen
     * @param vo vo
     * @param multipartList 可序列化的文件请求list
     * @since V1.0.0
     */
    void saveFilesUpload(Map<String, String> vo, List<HgMultipartFile>  multipartList);
    
    /**
     * saveRelationFileUpload:带有对应关系的多附件保存. <br/>
     *
     * @author yinyanzhen
     * @param vo vo
     * @param multipartList 可序列化的文件请求list
     * @since V1.0.0
     */
    void saveRelationFileUpload(Map<String, String> vo, List<HgMultipartFile>  multipartList);
}
