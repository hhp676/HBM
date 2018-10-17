package com.hginfo.hdf.generator.entity;

/**
 * 代码生成相关配置。 <br />
 * Date: 2016年12月07日 上午11:11:35 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public class GeneratorConfig {

    /**
     *
     */
    private String jdbcDriverName;
    /**
     *
     */
    private String jdbcDriverUrl;
    /**
     *
     */
    private String jdbcUserName;
    /**
     *
     */
    private String jdbcPassword;
    /**
     *
     */
    private String jdbcSchema;
    /**
     *
     */
    private String packageName;
    /**
     *
     */
    private String outPath;
    /**
     * 代码作者
     */
    private String author;

    public String getJdbcDriverName() {
        return jdbcDriverName;
    }

    public void setJdbcDriverName(String jdbcDriverName) {
        this.jdbcDriverName = jdbcDriverName;
    }

    public String getJdbcDriverUrl() {
        return jdbcDriverUrl;
    }

    public void setJdbcDriverUrl(String jdbcDriverUrl) {
        this.jdbcDriverUrl = jdbcDriverUrl;
    }

    public String getJdbcUserName() {
        return jdbcUserName;
    }

    public void setJdbcUserName(String jdbcUserName) {
        this.jdbcUserName = jdbcUserName;
    }

    public String getJdbcPassword() {
        return jdbcPassword;
    }

    public void setJdbcPassword(String jdbcPassword) {
        this.jdbcPassword = jdbcPassword;
    }

    public String getJdbcSchema() {
        return jdbcSchema;
    }

    public void setJdbcSchema(String jdbcSchema) {
        this.jdbcSchema = jdbcSchema;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getOutPath() {
        return outPath;
    }

    public void setOutPath(String outPath) {
        this.outPath = outPath;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

}
