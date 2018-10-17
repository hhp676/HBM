package com.hginfo.hdf.generator.web;

import com.hginfo.hdf.generator.entity.GeneratorConfig;
import com.hginfo.hdf.generator.entity.Table;
import com.hginfo.hdf.generator.service.GeneratorService;
import com.hginfo.hdf.generator.service.MetaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 *
 */
@Controller
public class IndexController {
    /**
     *
     */
    private GeneratorService genService;
    /**
     *
     */
    private MetaService metaService;
    /**
     *
     */
    private GeneratorConfig defaultConfig;

    /**
     * index页面。
     * @since 1.0.0
     * @param model model
     * @param message message
     * @param session session
     * @return viewId
     */
    @RequestMapping(value = "/")
    public String home(Model model, String message, HttpSession session) {
        GeneratorConfig config = (GeneratorConfig) session.getAttribute("config");
        model.addAttribute("config", config == null ? defaultConfig : config);
        model.addAttribute("message", message);
        return "index";
    }

    /**
     * 选择要生成代码的表。
     * @param model    model
     * @param conf     conf
     * @param session   session
     * @return viewId
     * @throws Exception 异常
     */
    @RequestMapping("/chooseTable")
    public String chooseTable(Model model, GeneratorConfig conf, HttpSession session) throws Exception {
        session.setAttribute("config", conf);
        Set<Table> tables = metaService.getTables(conf).getTables();
        session.setAttribute("allTables", tables);
        model.addAttribute("tables", tables);
        return "chooseTable";
    }

    /**
     * 代码生成。
     * @param config        生成配置
     * @param allTables     所有表
     * @param checkAll      选中所有表
     * @param tableName     手动选择的表
     * @param request       request
     * @return  viewId
     * @throws Exception 异常
     */
    @RequestMapping("/gen")
    public ModelAndView generator(
            @SessionAttribute GeneratorConfig config, @SessionAttribute List<Table> allTables,
            boolean checkAll, String[] tableName,  HttpServletRequest request) throws Exception {

        List<Table> choseTables = checkAll ? allTables : new ArrayList<>();
        if (!checkAll) {
            Set<String> choseTableNames = new HashSet<>(Arrays.asList(tableName));
            allTables.stream().filter(table ->  choseTableNames.contains(table.getTableName()))
                    .forEach(choseTables::add);
        }

        choseTables.forEach(table -> {
            table.setModule(request.getParameter("__module_" + table.getClassName()));
            table.setBizTable("1".equals(request.getParameter("__base_" + table.getClassName())));
            table.setTableAlias(request.getParameter("__alias_" + table.getClassName()));
        });

        genService.doGenerator(config, choseTables);
        return new ModelAndView("redirect:/?message=create ok!");
    }

    @Autowired
    public void setGenService(GeneratorService genService) {
        this.genService = genService;
    }

    @Autowired
    public void setMetaService(MetaService metaService) {
        this.metaService = metaService;
    }

    @Autowired
    public void setDefaultConfig(GeneratorConfig defaultConfig) {
        this.defaultConfig = defaultConfig;
    }
}
