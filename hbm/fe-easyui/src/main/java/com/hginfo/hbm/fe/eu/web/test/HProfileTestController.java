package com.hginfo.hbm.fe.eu.web.test;

import com.hginfo.hbm.core.annotation.HProfile;
import org.springframework.stereotype.Controller;

/**
 * Created by qiujingde on 2016/12/8.
 *
 */
@Controller
public class HProfileTestController {

    /**
     *
     */
    @HProfile("code")
    private String config;

}
