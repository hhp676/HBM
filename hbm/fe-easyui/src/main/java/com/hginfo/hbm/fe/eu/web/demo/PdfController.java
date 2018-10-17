package com.hginfo.hbm.fe.eu.web.demo;

import java.awt.Color;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hginfo.hutils.FileUtil;
import com.hginfo.hutils.PathUtil;
import com.hginfo.hutils.PdfUtils;
import com.hginfo.hutils.ResponseUtil;
import com.hginfo.hutils.exception.BaseRuntimeException;
import com.hginfo.hutils.exception.ExceptionUtil;
import com.lowagie.text.BadElementException;
import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfWriter;

/**
 * pdf导出demo.
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@Controller
@RequestMapping("/common/demo/pdf")
public class PdfController {
    
    /**
     * 页面跳转.
     *
     * @author yinyanzhen
     * @return 页面
     * @since V1.0.0
     */
    @RequestMapping("/toPdfDemoPage")
    public String toPdfDemoPage() {
        return "demo/pdf/pdfDemo_show";
    }
    
    /**
     * 绘制复杂的excel进行下载 .<br/>
     * @author yinyanzhen
     * @param vo vo
     * @param response response
     * @since V1.0.0
     */
    @RequestMapping("/downloadDrawPdf")
    public void downloadDrawPdf(@RequestParam Map<String, String> vo, HttpServletResponse response) {

        String pdfFilePath = PathUtil.getWebAppPath() + "test.pdf";
        File file = new File(pdfFilePath);
        if (!file.exists()) {
            FileUtil.createFile(file.getPath(), null);
        }
        try {
            //绘制Pdf文件
            drawPdfFile(vo, pdfFilePath);
            
            //输出
            response.reset();
            response.addHeader("Content-Disposition",
                    "attachment;filename=" + URLEncoder.encode("pdfdemo.pdf", "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            //输出错误信息到页面
            ResponseUtil.renderText(response, ExceptionUtil.getExceptionMsg(e));
        }

        try (InputStream fis = new BufferedInputStream(new FileInputStream(pdfFilePath))) {
            try (OutputStream os = response.getOutputStream()) {
                byte[] buffer = new byte[2048];
                while (fis.read(buffer) > 0) {
                    os.write(buffer);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            //输出错误信息到页面
            ResponseUtil.renderText(response, ExceptionUtil.getExceptionMsg(e));
        }
    }
    
    /**
     * 绘制pdf文件,保存到指定路径.
     *
     * @author yinyanzhen
     * @param vo vo
     * @param pdfFilePath pdfFilePath
     * @since V1.0.0
     */
    private void drawPdfFile(Map vo, String pdfFilePath) {
        
        //创建一个文档对象纸张大小为A4
        Document doc = new Document(PageSize.A4, 50, 50, 50, 50);
        //设置要输出到磁盘上的文件名称
        PdfWriter writer;
        try {
            writer = PdfWriter.getInstance(doc, new FileOutputStream(new File(pdfFilePath)));
        } catch (DocumentException | FileNotFoundException e) {
            throw new BaseRuntimeException(e);
        }
        //设置文档创建日期
        doc.addCreationDate();
        //添加页脚
        doc.setFooter(PdfUtils.getPdfHeaderFooter(0, Element.ALIGN_CENTER));
        
        //打开文档开始写内容
        doc.open();
        
        //构建一段落
        Paragraph par3 = new Paragraph("pdf生成Demo", PdfUtils.chineseFont(14));
        //设置局中对齐
        par3.setAlignment(Element.ALIGN_CENTER);
        //添加到文档
        try {
            doc.add(par3);
        } catch (DocumentException e) {
            throw new BaseRuntimeException(e);
        }

        Cell cell;
        
        //声明表格宽度值
        int widths[] = {10, 90 };
        Table table = PdfUtils.getPdfTable(widths, 1, 5, Element.ALIGN_CENTER,
            Element.ALIGN_MIDDLE);
        
        //添加图片
        String imgPath = PathUtil.getWebAppPath() + "static/images/user_96px.png";
        Image image;
        try {
            image = Image.getInstance(imgPath);
        } catch (BadElementException | IOException e) {
            throw new BaseRuntimeException(e);
        }
        //设置图片大小
        image.scaleAbsolute(50, 30);
        try {
            cell = new Cell(image);
        } catch (BadElementException e) {
            throw new BaseRuntimeException(e);
        }
        table.addCell(cell);

        try {
            cell = new Cell(new Phrase("标题行,右侧为图片插入示例", PdfUtils.chineseFont(20)));
        } catch (BadElementException e) {
            throw new BaseRuntimeException(e);
        }
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setVerticalAlignment(Element.ALIGN_CENTER);
        table.addCell(cell);
        
        //以下代码的作用是创建100行数据,其中每行有四列,列依次为 编号 姓名 性别 备注
        for (int i = 1; i <= 10; i++) {
            
            //设置编号单元格
            try {
                cell = new Cell(new Phrase(String.valueOf(i), PdfUtils.chineseFont(8)));
            } catch (BadElementException e) {
                throw new BaseRuntimeException(e);
            }
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell);
            
            //设置姓名单元格
            try {
                cell = new Cell(new Phrase("表格输出" + i, PdfUtils.chineseFont(8)));
            } catch (BadElementException e) {
                throw new BaseRuntimeException(e);
            }
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell);
        }
        try {
            doc.add(table);
        } catch (DocumentException e) {
            throw new BaseRuntimeException(e);
        }

        int hws2[] = {20, 80 };
        Table table2 = PdfUtils.getPdfTable(hws2, 1, 5, Element.ALIGN_CENTER, Element.ALIGN_TOP);

        try {
            cell = new Cell(new Phrase("cell合并", PdfUtils.chineseFont(8)));
        } catch (BadElementException e) {
            throw new BaseRuntimeException(e);
        }
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setBorderColor(Color.red);
        cell.setRowspan(3);
        table2.addCell(cell);

        try {
            cell = new Cell(new Phrase((String)vo.get("paramA"), PdfUtils.chineseFont(20)));
        } catch (BadElementException e) {
            throw new BaseRuntimeException(e);
        }
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setVerticalAlignment(Element.ALIGN_CENTER);
        cell.setBorderColor(Color.red);
        table2.addCell(cell);

        try {
            cell = new Cell(new Phrase((String)vo.get("paramB"), PdfUtils.chineseFont(20)));
        } catch (BadElementException e) {
            throw new BaseRuntimeException(e);
        }
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setVerticalAlignment(Element.ALIGN_CENTER);
        cell.setBorderColor(Color.red);
        table2.addCell(cell);

        try {
            cell = new Cell(new Phrase((String)vo.get("paramC"), PdfUtils.chineseFont(20)));
        } catch (BadElementException e) {
            throw new BaseRuntimeException(e);
        }
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setVerticalAlignment(Element.ALIGN_CENTER);
        cell.setBorderColor(Color.red);
        table2.addCell(cell);

        try {
            doc.add(table2);
        } catch (DocumentException e) {
            throw new BaseRuntimeException(e);
        }

        doc.close();
        writer.close();
    }
    
}
