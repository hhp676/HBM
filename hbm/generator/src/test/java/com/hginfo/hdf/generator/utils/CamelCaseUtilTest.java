package com.hginfo.hdf.generator.utils;

import org.junit.Test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.junit.Assert.*;

/**
 * 正则测试
 * Created by qiujingde on 2016/12/20.
 */
public class CamelCaseUtilTest {

    @Test
    public void replaceTest() {

        String str = "a_b_c_";

        Pattern p = Pattern.compile("(?:^|_)(.?)");
        Matcher m = p.matcher(str.toLowerCase());
        StringBuffer sb = new StringBuffer();
        while (m.find()) {
            m.appendReplacement(sb, m.group(1).toUpperCase());
        }
        m.appendTail(sb);

        System.out.println(sb.toString());

    }

}