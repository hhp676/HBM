package com.hginfo.hbm.be.freemarker;

import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Map;

import com.hginfo.hutils.Constants;

import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * ClassName: FreeMarkerUtil. <br/>
 * @author yinyanzhen
 * @since V1.0.0
 */
public final class FreeMarkerUtil {
    /**
     * 
     */
    private FreeMarkerUtil() {
    }
    
    /**
     * generateHtmlFromFtl:(与模板内容转换对象). <br/>
     * @author yinyanzhen
     * @param temp 模版
     * @param map 与模板内容转换对象
     * @return 转换好的正文信息
     * @throws IOException IOException
     * @throws TemplateException TemplateException
     * @since V1.0.0
     */
    @SuppressWarnings("deprecation")
    public static String generateHtmlFromFtl(Template temp, Map<String, Object> map)
        throws IOException, TemplateException {
        Writer out = new StringWriter(Constants.FILE_READ_BUFFER_SIZE);
        temp.setEncoding("utf-8");
        temp.process(map, out);
        return out.toString();
    }
}
