package com.hginfo.hbm.fe.eu.web.test;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;

import com.hginfo.hbm.base.entity.test.FeGroupStudent;
import com.hginfo.hbm.base.entity.test.FeUser;
import com.hginfo.hbm.base.service.sys.SysTokenService;
import com.hginfo.hbm.base.service.test.FeUserService;
import com.hginfo.hbm.core.exception.BizException;
import com.hginfo.hbm.core.utils.CurrentUserUtils;
import com.hginfo.hbm.core.utils.I18nUtil;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.exception.BaseException;
import com.hginfo.hvalidate.annotation.HValidated;
import com.hginfo.hvalidate.group.Insert;

@Controller
public class TestController {
    
    private static Log      log = LogFactory.getLog(TestController.class);
    
    @Autowired
    CookieLocaleResolver    resolver;
    
    @HReference
    private FeUserService   feUserService;
    
    @HReference
    private SysTokenService sysTokenService;
    
    @RequestMapping(value = "/index2")
    public String index2() {
        
        return "index";
    }
    
    @RequestMapping(value = "/test/testJson")
    @ResponseBody
    public Map testJson(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("aa", "bb");
        map.put("bb", null);
        map.put("cc", I18nUtil.getMessage("base.welcome") + I18nUtil.getMessage("base.copy"));
        Map<String, Object> map1 = new HashMap<String, Object>();
        map1.put("map1-a1", "map1-a");
        map1.put("map1-b1", "map1-b");
        
        Map<String, Object> map2 = new HashMap<String, Object>();
        map2.put("map2-a1", "map2-a");
        map2.put("map2-b1", "map2-b");
        
        map1.put("map2", map2);
        map.put("map1", map1);
        
        return map;
    }
    
    /**
     * 测试jsp.
     * @return  String
     */
    @RequestMapping(value = "/test/testJSP")
    public String testJSP() {
        return "test/testJSP";
    }
    
    /**
     * 测试freemarkview.
     * @return ModelAndView
     */
    @RequestMapping(value = "/test/testFTL")
    public ModelAndView testFTL() {
        System.out.println("testFTL");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("message", "Spring+FreeMaker");
        return new ModelAndView("testFTL", map);
    }
    
    /**
     * 语言切换.
     * @param request request
     * @param response response
     * @param language language
     */
    @RequestMapping("/test/language")
    @ResponseBody
    public void language(HttpServletRequest request, HttpServletResponse response,
        String language) {
        
        if ("zh_cn".equals(language)) {
            resolver.setLocale(request, response, Locale.CHINA);
        } else if ("en".equals(language)) {
            resolver.setLocale(request, response, Locale.ENGLISH);
        } else {
            resolver.setLocale(request, response, Locale.CHINA);
        }
    }
    
    /**
     * 测试异常.
     * @throws BizException 
     */
    @RequestMapping(value = "/test/testEx")
    public void testEx() throws BizException {
        System.out.println(1 / 0);
        //throw new BizException("aaaaaa");
    }
    
    /**
     * 测试testValid.
     * @return Map
     * @param testName testName
     * @param o FeUser 
     * @param o1 FeUser
     */
    @RequestMapping(value = "/test/testValid/{testName}")
    @ResponseBody
    public Map testValid(@PathVariable("testName") String testName,
        @HValidated(Insert.class) FeUser o, FeUser o1) {
        
        /*if (result.hasErrors()) {
            log.info("Result object：" + result.getObjectName());
            log.info("Result field：" + result.getFieldError().getField());
            log.info("Result message：" + result.getFieldError().getDefaultMessage());
            List<ObjectError>  list = result.getAllErrors();  
            for(ObjectError error: list){  
            	log.info("error object：" + error.getObjectName());
            	if(error.getCodes() != null && error.getCodes().length > 0){
            		for(String code : error.getCodes()){
            			log.info("error code：" + code);
            		}
            	}
            	if(error.getArguments() != null && error.getArguments().length > 0){
            		for(Object args : error.getArguments()){
            			log.info("error arguments：" + args);
            		}
            	}
            	log.info("error message：" + error.getDefaultMessage());
            } 
        }*/
        return new HashMap();
    }
    /***
     * 
     * @param o1 FeUser
     * @return Map
     * @throws BaseException BaseException
     */
    @RequestMapping(value = "/test/testServiceValid")
    @ResponseBody
    public Map testValid(FeUser o1) throws BaseException {
        
        feUserService.testValid(o1, o1);
        
        return new HashMap();
    }
    
    @RequestMapping(value = "/test/testServiceNoValid")
    @ResponseBody
    public Map test(HttpServletRequest request, FeUser o) {
        
        feUserService.test();
        
        feUserService.test("test");
        
        feUserService.add(o);
        
        feUserService.update(o);
        
        feUserService.delete(o);
        
        System.out.println(CurrentUserUtils.getUserId());
        
        return new HashMap();
    }
    
    @RequestMapping(value = "/test/testDubboEx")
    @ResponseBody
    public Map testDubboEx(HttpServletRequest request, FeUser o) {
        feUserService.testEx();
        return new HashMap();
    }
    
    @RequestMapping(value = "/test/testSaveUser")
    @ResponseBody
    public Map testSaveUser(HttpServletRequest request) {
        Map<String, Object> map = new HashMap();
        map.put("sysToken", sysTokenService.createToken(5L));
        return map;
    }
    
    @RequestMapping(value = "/test/testGetDao")
    @ResponseBody
    public Map testGetDao() {
        
        feUserService.testGetDao();
        
        return new HashMap<>();
    }
    
    @RequestMapping(value = "/test/testCompositeObject")
    @ResponseBody
    public FeGroupStudent testCompositeObject(@HValidated FeGroupStudent groupStudent) {
        System.out.println("groupStudent:" + groupStudent);
        return groupStudent;
    }
    
}
