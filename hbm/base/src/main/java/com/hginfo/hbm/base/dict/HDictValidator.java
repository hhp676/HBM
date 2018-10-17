package com.hginfo.hbm.base.dict;

import java.util.List;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.hginfo.hbm.annotation.HDict;
import com.hginfo.hbm.base.entity.sys.SysDictItem;
import com.hginfo.hbm.base.service.sys.SysDictService;
import com.hginfo.hutils.SpringContextUtil;
import com.hginfo.hutils.StringUtil;

/**
 * HDict注解的验证列。<br />
 * Created by qiujingde on 2016/12/12.
 */
public class HDictValidator implements ConstraintValidator<HDict, Object> {

    /**
     *
     */
    private SysDictService dictService;

    /**
     *
     */
    private String groupCode;
    /**
     *
     */
    private String subGroupCode;
    /**
     *
     */
    private long priority;

    @Override
    public void initialize(HDict constraintAnnotation) {
        groupCode = constraintAnnotation.groupCode();
        subGroupCode = constraintAnnotation.subGroupCode();
        priority = constraintAnnotation.priority();
        subGroupCode = "".equals(subGroupCode) ? null : subGroupCode;

        dictService = SpringContextUtil.getBean(SysDictService.class);
    }

    @Override
    public boolean isValid(Object value, ConstraintValidatorContext context) {
        // 空值不验证。
        if (value == null || StringUtil.isBlank(value.toString())) {
            return true;
        }

        List<SysDictItem> dictItems = priority == 0 ? dictService.getItemList(groupCode, subGroupCode)
                : dictService.getItemList(groupCode, subGroupCode, priority);
        return dictItems.stream().anyMatch(item -> value.toString().equals(item.getItemValue()));
    }

}
