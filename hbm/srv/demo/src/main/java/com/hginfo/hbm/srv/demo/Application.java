/**
 * Project Name:hbm-srv
 * File Name:Application.java
 * Package Name:Application
 * Date:2017年5月17日下午4:57:32
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.srv.demo;

/**
 * ClassName:Application <br/>
 * Date: 2017年5月17日 下午4:57:32 <br/>
 * @author licheng
 * @version
 * @since V1.0.0
 * @see
 */
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableAutoConfiguration
@ComponentScan
public class Application {
    
    /**
     * Application Main.
     * @param args args
     * @since V1.0.0
     */
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
    
}
