package com.hginfo.hbm.srv;

import org.springframework.context.annotation.Bean;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * 使用注解的方式来扫描API。
 */
@EnableSwagger2
public class MySwaggerConfig {
    
    /**
     * 
     */
    public static final String MEDIA_TYPE_JSON_OR_XML = "application/json, application/xml";
    
    /**
     * 
     */
    public static final String PROJECT_NAME           = "SRV-SPRING";
    
    /**
     * 
     */
    public static final String PROJECT_DESC           = "SRV-SPRING API DOCUMENT";
    
    /**
     * 
     */
    public static final String PROJECT_MAIL           = "xxx@hongguaninfo.com";
    
    /**
     * 
     */
    public static final String PROJECT_LICENSE        = "MTA License";
    
    /**
     * 
     */
    public static final String PROJECT_LURL           = "MTA API License URL";
    
    /**
     * 
     */
    public static final String PROJECT_API_VERSION    = "0.0.1";
    
    /**
     * customDocket.
     * @return Docket Docket
     * @since V1.0.0
     */
    @Bean
    public Docket docket() {
        return new Docket(DocumentationType.SWAGGER_2).apiInfo(apiInfo())
            .select()
            .apis(RequestHandlerSelectors.basePackage("com.hginfo.hbm.srv.rest"))
            .paths(PathSelectors.any()).build();
    }
    
    /**
     * apiInfo.
     * @author licheng
     * @return ApiInfo
     * @since V1.0.0
     */
    private ApiInfo apiInfo() {
        return new ApiInfoBuilder().title(PROJECT_NAME).description(PROJECT_DESC)
            .contact(new Contact("authorName", "authorUrl", PROJECT_MAIL)).license(PROJECT_LICENSE)
            .licenseUrl(PROJECT_LURL).version(PROJECT_API_VERSION).build();
    }
}
