package com.hginfo.hbm.fe.core.entity;

import java.io.Serializable;
import java.util.List;

/**
 * easyui-ComBoTree所需工具类.
 * ClassName: ComBoTreeModel <br/>
 * @author yinyanzhen
 * @version 
 * @since V1.0.0
 */
public class ComboTreeModel implements Serializable {
    private static final long serialVersionUID = 6449713189657648105L;
    /**
     * 节点值.
     */
    private Long id;  
    /**
     * 节点名称.
     */
    private String text;  
    /**
     * 节点编码(辅助字段,非必选).
     */
    private String code;
    /**
     * 子节点.
     */
    private List<ComboTreeModel> children;
    
    public Long getId() {
        return id;
    }


    public void setId(Long id) {
        this.id = id;
    }


    public String getText() {
        return text;
    }
    
    public void setText(String text) {
        this.text = text;
    }
    
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public List<ComboTreeModel> getChildren() {
        return children;
    }
    
    public void setChildren(List<ComboTreeModel> children) {
        this.children = children;
    }  
    
}
