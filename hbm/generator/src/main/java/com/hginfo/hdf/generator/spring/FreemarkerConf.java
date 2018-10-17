package com.hginfo.hdf.generator.spring;

import freemarker.template.Configuration;
import freemarker.template.TemplateException;
import org.springframework.context.annotation.Bean;

import java.io.IOException;

/**
 * Created by 邱境德 on 2016/6/1.
 *
 */
@org.springframework.context.annotation.Configuration
public class FreemarkerConf {

    /**
     * freemarker Configuration.
     * @throws TemplateException freemarker 解析异常
     * @throws IOException io异常
     * @return freemarker configuration
     */
    @Bean(name = "hgWifiWsFreemarkerConfiguration")
    public Configuration conf() throws TemplateException, IOException {
        Configuration cfg = new Configuration(Configuration.VERSION_2_3_23);
        cfg.setClassForTemplateLoading(FreemarkerConf.class, "\\ftl");

        cfg.setSettings(getClass().getResourceAsStream("/freemarker.properties"));
        return cfg;
    }

}
