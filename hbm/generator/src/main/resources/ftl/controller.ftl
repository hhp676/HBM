/*
 * Project Name:hbm-base.
 * File Name:${meta.className}${ControllerSuffix}.java
 * Package Name:${pkgName}.${controllerFolder}
 * Date:${currentDate}
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package ${pkgName}.${controllerFolder};

import ${pkgName}.${entityFolder}.${meta.className};
import com.hginfo.hbm.base.page.BasePage;
import ${pkgName}.${serviceFolder}.${meta.className}${ServiceSuffix};
import com.hginfo.hbm.fe.eu.op.OperationResult;
import com.hginfo.hbm.fe.eu.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hvalidate.annotation.HValidated;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import static com.hginfo.hbm.fe.eu.web.sys.ControllerConstants.DEFAULT_SUCCESS_RESULT;

/**
 * ${meta.className}Controller:${meta.tableDesc}。 <br />
 * controller 层 <br />
 * Date: 2016年12月2日 上午10:03:54 <br />
 *
 * @author ${author}
 * @since V1.0.0
 */
@Controller
@RequestMapping("/${meta.module}/${meta.className}")
public class ${meta.className}${ControllerSuffix} {

    /**
     *
     */
    private static final Log LOG = LogFactory.getLog(${meta.className}${ControllerSuffix}.class);

    /**
     * Service。
     */
    private ${meta.className}${ServiceSuffix} service;

    /**
     * 列表页面。
     * @return sys_dict viewId
     */
    @RequestMapping(value = "/view")
    public String view() {
        return "${meta.module}/${meta.className}/${meta.className}_view";
    }

    /**
    * 分页数据。
    * @param pageInfo 分页信息
    * @return 字典组分页数据
    */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Page<${meta.className}> list(BasePage<${meta.className}> pageInfo) {
        ${meta.className} filter = new ${meta.className}();
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(service.getPageList(pageInfo, filter));
    }

    /**
    * 新增。
    * @param entity entity
    * @return 操作结果
    */
    @RequestMapping(value = "/add")
    @ResponseBody
    public OperationResult add(@HValidated ${meta.className} entity) {
        service.add(entity);
        return DEFAULT_SUCCESS_RESULT;
    }

    /**
    * 修改。
    * @param entity entity
    * @return 操作结果
    */
    @RequestMapping(value = "/upd")
    @ResponseBody
    public OperationResult update(@HValidated ${meta.className} entity) {
        service.update(entity);
        return DEFAULT_SUCCESS_RESULT;
    }

    /**
    * 删除。
    * @param id id
    * @return 操作结果
    */
    @RequestMapping(value = "/del")
    @ResponseBody
    public OperationResult deleteGroup(long id) {
        service.delete(id);
        return DEFAULT_SUCCESS_RESULT;
    }

    @HReference
    public void setService(${meta.className}${ServiceSuffix} service) {
        this.service = service;
    }

}
