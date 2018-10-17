package com.hginfo.hbm.be.sql;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by qiujingde on 2017/1/18.
 * sql 测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext-base.xml",
        "classpath:spring/applicationContext-identityid.xml",
        "classpath:spring/applicationContext-hdubbo.xml",
        "classpath:spring/applicationContext-*.xml" })
public class SqlTest {

    @Autowired
    private JdbcTemplate template;

    @Test
    public void caseSensitiveTest() {

        template.execute((ConnectionCallback<Object>) conn -> {
            String sql = "select * from sys_group";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getString("group_name_"));
                System.out.println(rs.getString("GROUP_NAME_"));
            }
            return null;
        });

    }

}
