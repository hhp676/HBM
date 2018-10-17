
package com.hginfo.hbm.fe.mc.web.demo;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.poi.hssf.usermodel.HSSFBorderFormatting;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hutils.EncodeUtil;
import com.hginfo.hutils.ExcelUtil;
import com.hginfo.hutils.RequestUtil;
import com.hginfo.hutils.ResponseUtil;
import com.hginfo.hutils.StringUtil;
import com.hginfo.hutils.exception.ExceptionUtil;

/**
 * excel相关操作demo.
 * 
 * @author yinyanzhen
 * @since V1.0.0
 */
@Controller
@RequestMapping("/common/demo/excel")
public class ExcelController {

    /**
     * 跳转到管理页面.
     * @author yyzh
     * @return 管理页面
     * @since V1.0.0
     */
    @RequestMapping("/toExcelDemoPage")
    public String toExcelDemoPage() {
        return "demo/excel/excelDemo_show";
    }

    /**
     * 绘制复杂的excel进行下载 <br/>.
     * 
     * @author yinyanzhen
     * @param request request
     * @param response response
     * @since V1.0.0
     */
    @RequestMapping("/downloadDrawExcel")
    public void downloadDrawExcel(HttpServletRequest request, 
            HttpServletResponse response) {
        Map<String, String> vo = RequestUtil.getRequestParamMap(request);
        OutputStream os = null;
        try {
            HSSFWorkbook wb = drawExcel(vo);
            // 输出
            response.reset();
            response.addHeader("Content-Disposition", "attachment;filename=\""
            		+ encodeFilename(request.getHeader("USER-AGENT"),"验收报告.xls") + "\"");
            os = response.getOutputStream();
            wb.write(os);
        } catch (Exception e) {
            e.printStackTrace();
            //输出错误信息到页面
            ResponseUtil.renderText(response, ExceptionUtil.getExceptionMsg(e));
        } finally {
            try {
                if (os != null) {
                    os.flush();
                    os.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 绘制简单的excel进行下载 <br/>.
     *
     * @author yinyanzhen
     * @param request request
     * @param response response
     * @since V1.0.0
     */
    @RequestMapping("/downloadDataExcel")
    public void downloadDataExcel(HttpServletRequest request, 
            HttpServletResponse response) {
        Map<String, String> vo = RequestUtil.getRequestParamMap(request);
        OutputStream os = null;
        try {

            // Map结果集,导出excel,start
             /*List<Map> dataList = new ArrayList<Map>();
             for (int i = 0; i < 9; i++) {
             Map map = new HashMap();
             map.put("code", "code" + i);
             map.put("name", "name" + i);
             map.put("status", "name" + i);
             dataList.add(map);
             }
             // excel列标题 
             String[] header = { "编号","名称","状态" }; 
             //excel列属性
             String[] dataIndex = { "code", "name", "status" };
             HSSFWorkbook wb = ExcelUtil.drawMapListExcel(dataList, header,
             dataIndex);*/
            // Map结果集,导出excel,end

            // 实体类结果集,导出excel start
            List<Object> userList = new ArrayList<Object>();
            for (int i = 0; i < 9; i++) {
                SysUser user = new SysUser();
                user.setUserName("用户名" + 1);
                user.setCrtTime(new Date());
                userList.add(user);
            }
            // excel列标题
            String[] header = {"用户名", "时间" };
            // excel列属性
            String[] dataIndex = {"userName", "crtTime" };
            HSSFWorkbook wb = ExcelUtil.drawClassListExcel(userList, 
                    SysUser.class, header, dataIndex);
            // 实体类结果集,导出excel end

            // 输出
            response.reset();
            response.addHeader("Content-Disposition", "attachment;filename=\""
            		+ encodeFilename(request.getHeader("USER-AGENT"),"简单数据集.xls") + "\"");
            os = response.getOutputStream();
            wb.write(os);
        } catch (Exception e) {
            e.printStackTrace();
            //输出错误信息到页面
            ResponseUtil.renderText(response, ExceptionUtil.getExceptionMsg(e));
        } finally {
            try {
                if (os != null) {
                    os.flush();
                    os.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * excel数据导入.
     *
     * @author yinyanzhen
     * @param request request
     * @param response response
     * @since V1.0.0
     */
    @RequestMapping("/importExcelData")
    public void importExcelData(HttpServletRequest request, 
               HttpServletResponse response) {
        // 获取参数Map
        Map<String, String> vo = RequestUtil.getRequestParamMap(request);

        //获取文件
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile multipartFile = multipartRequest.getFile("excelFile");
        
        String result = "";
        try {
            String[] propertys = {"userName", "crtTime" };
            // excel文件获取Map类型数据集
            List<Map> userList = ExcelUtil.getExcelMapList(multipartFile, propertys);
            // excel文件获取实体Bean数据集
//            List<SysUser> userList = ExcelUtil.getExcelClassList(multipartFile, 
//                       SysUser.class, propertys);
//            System.out.println(JSONArray.toJSONString(userList));

            // 获取到数据list后,抛给service,进行逻辑校验,以及保存操作.
            // TODO
            result = "success";
        } catch (Exception e) {
            e.printStackTrace();
            result = ExceptionUtil.getExceptionMsg(e);
        }
        ResponseUtil.renderHtml(response, result);
    }

    /**
     * 复杂Excel绘制demo.
     * 
     * @author yinyanzhen
     * @param vo vo
     * @return HSSFWorkbook
     * @throws Exception Exception
     * @since V1.0.0
     */
    private HSSFWorkbook drawExcel(Map<String, String> vo) throws Exception {
        // TODO 根据参数vo进行查询,获取数据封装
        HSSFWorkbook wb = new HSSFWorkbook();
        // excel内创建sheet页面
        HSSFSheet sheet = wb.createSheet("验收报告");
        // 定义每行高度
        Integer[] heights = new Integer[] {20, 30, 21, 23, 20, 20, 20, 20,
                20, 25, 50, 50, 50, 50 };
        int heightRate = 13;
        // 设置每列宽度
        Integer[] widths = new Integer[] {50, 175, 175, 160, 170, 195, 150 };
        for (int i = 0; i < widths.length; i++) {
            sheet.setColumnWidth(i, widths[i] * 25);
        }
        // 字体
        HSSFFont fBorder = wb.createFont();
        // 加粗
        fBorder.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);

        // 样式对象
        HSSFCellStyle styleHeader = wb.createCellStyle();
        // 水平居中
        styleHeader.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        styleHeader.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        styleHeader.setWrapText(true);
        // 字体
        HSSFFont fHeader = wb.createFont();

        // 使用工具类,进行属性拷贝,定义第二个属性对象值
        BeanUtils.copyProperties(fHeader, fBorder);
        fHeader.setFontHeightInPoints((short) 16);
        styleHeader.setFont(fHeader);

        // 样式对象
        HSSFCellStyle styleBorder = wb.createCellStyle();
        styleBorder.setBorderTop(HSSFBorderFormatting.BORDER_THIN);
        styleBorder.setBorderBottom(HSSFBorderFormatting.BORDER_THIN);
        styleBorder.setBorderLeft(HSSFBorderFormatting.BORDER_THIN);
        styleBorder.setBorderRight(HSSFBorderFormatting.BORDER_THIN);
        styleBorder.setAlignment(HSSFCellStyle.ALIGN_LEFT);
        styleBorder.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        styleBorder.setWrapText(true);
        styleBorder.setFont(fBorder);
        // 行号
        int rowNum = 0;
        // 第0行空值
        rowNum++;
        HSSFRow row1 = sheet.createRow((short) rowNum);
        row1.setHeight((short) (heights[rowNum]* heightRate));

        // Region参数说明,参数1是起始行号,参数2是合并至行数,参数3是起始列号,4是合并列至
        sheet.addMergedRegion(new CellRangeAddress(
                rowNum, rowNum, (short) 0, (short) (0 + 4)));
        // Region参数说明,参数1是起始行号,参数2是合并至行数,参数3是起始列号,4是合并列数
        sheet.addMergedRegion(new CellRangeAddress(
                rowNum, rowNum, (short) 5, (short) (5 + 1)));
        String[] rowData1 = {"（信息系统运营部）项目执行情况报告", "", "", "", "", "日期:", "" };
        for (int i = 0; i < rowData1.length; i++) {
            HSSFCell cell = row1.createCell(i);
            cell.setCellValue(new HSSFRichTextString(rowData1[i]));
            cell.setCellStyle(styleHeader);
        }

        // 第二行数据:序号/技术项目服务名称
        rowNum++;
        HSSFRow row2 = sheet.createRow((short) rowNum);
        row2.setHeight((short) (heights[rowNum] * heightRate));
        // CellRangeAddress参数说明,参数1是起始行号,参数2是合并至行数,参数3是起始列号,4是合并列至
        sheet.addMergedRegion(new CellRangeAddress(
                rowNum, rowNum, (short) 1, (short) (1 + 5)));
        String[] rowData2 = {"序号", "技术服务项目名称:", "", "", "", "", "" };
        for (int i = 0; i < rowData2.length; i++) {
            HSSFCell cell = row2.createCell(i);
            cell.setCellValue(new HSSFRichTextString(rowData2[i]));
            cell.setCellStyle(styleBorder);
        }
        // 第三行:1/技术服务方(签约)
        rowNum++;
        HSSFRow row3 = sheet.createRow((short) rowNum);
        row3.setHeight((short) (heights[rowNum] * heightRate));
        // Region参数说明,参数1是起始行号,参数2是合并至行数,参数3是起始列号,4是合并列至
        sheet.addMergedRegion(new CellRangeAddress(
                rowNum, rowNum, (short) 1, (short) (1 + 5)));
        String[] rowData3 = {"1", "技术服务方(签约):", "", "", "", "", "" };
        for (int i = 0; i < rowData3.length; i++) {
            HSSFCell cell = row3.createCell(i);
            cell.setCellValue(new HSSFRichTextString(rowData3[i]));
            cell.setCellStyle(styleBorder);
        }
        // 第四行:2/技术服务方(签约)
        rowNum++;
        HSSFRow row4 = sheet.createRow((short) rowNum);
        row4.setHeight((short) (heights[rowNum] * heightRate));
        // Region参数说明,参数1是起始行号,参数2是合并至行数,参数3是起始列号,4是合并列至
        sheet.addMergedRegion(new CellRangeAddress(
                rowNum, rowNum, (short) 1, (short) (1 + 1)));
        sheet.addMergedRegion(new CellRangeAddress(
                rowNum, rowNum, (short) 3, (short) (3 + 3)));
        String[] rowData4 = {"2", "采购订单号:", "", "考核单位:", "", "", "" };
        for (int i = 0; i < rowData4.length; i++) {
            HSSFCell cell = row4.createCell(i);
            cell.setCellValue(new HSSFRichTextString(rowData4[i]));
            cell.setCellStyle(styleBorder);
        }
        // 第五行:
        rowNum++;
        HSSFRow row5 = sheet.createRow((short) rowNum);
        row5.setHeight((short) (heights[rowNum] * heightRate));
        String[] rowData5 = {"3", "付款总笔数:", null, 
                "本次付款第几笔:", null, "合同履行完毕付款:", null };
        for (int i = 0; i < rowData5.length; i++) {
            HSSFCell cell = row5.createCell(i);
            cell.setCellValue(new HSSFRichTextString(rowData5[i]));
            cell.setCellStyle(styleBorder);
        }
        // 第六行:
        rowNum++;
        HSSFRow row6 = sheet.createRow((short) rowNum);
        row6.setHeight((short) (heights[rowNum] * heightRate));
        String[] rowData6 = {"4", "考核周期:", "", "开始时间:", "", "结束时间:", "" };
        for (int i = 0; i < rowData6.length; i++) {
            HSSFCell cell = row6.createCell(i);
            cell.setCellValue(new HSSFRichTextString(rowData6[i]));
            cell.setCellStyle(styleBorder);
        }
        // 第七行:
        rowNum++;
        HSSFRow row7 = sheet.createRow((short) rowNum);
        row7.setHeight((short) (heights[rowNum] * heightRate));
        String[] rowData7 = {"5", "此次应付款金额:", "",
                "剩余未付金额:", "", "项目总金额:", "" };
        for (int i = 0; i < rowData7.length; i++) {
            HSSFCell cell = row7.createCell(i);
            cell.setCellValue(new HSSFRichTextString(rowData7[i]));
            cell.setCellStyle(styleBorder);
        }
        // 第八行:
        rowNum++;
        HSSFRow row8 = sheet.createRow((short) rowNum);
        row8.setHeight((short) (heights[rowNum] * heightRate));
        // Region参数说明,参数1是起始行号,参数2是合并至行数,参数3是起始列号,4是合并列至
        sheet.addMergedRegion(new CellRangeAddress(
                rowNum, rowNum, (short) 2, (short) (2 + 1)));
        sheet.addMergedRegion(new CellRangeAddress(
                rowNum, rowNum, (short) 5, (short) (5 + 1)));
        String[] rowData8 = {"6", "考核方式:", "", "", "扣款周期:", "", "" };
        for (int i = 0; i < rowData8.length; i++) {
            HSSFCell cell = row8.createCell(i);
            cell.setCellValue(new HSSFRichTextString(rowData8[i]));
            cell.setCellStyle(styleBorder);
        }
        // 第九行:
        rowNum++;
        HSSFRow row9 = sheet.createRow((short) rowNum);
        row9.setHeight((short) (heights[rowNum] * heightRate));
        // Region参数说明,参数1是起始行号,参数2是合并至行数,参数3是起始列号,4是合并列至
        sheet.addMergedRegion(new CellRangeAddress(
                rowNum, rowNum, (short) 2, (short) (2 + 1)));
        sheet.addMergedRegion(new CellRangeAddress(
                rowNum, rowNum, (short) 5, (short) (5 + 1)));
        String[] rowData9 = {"7", "此次考核得分:", "", "", "是否扣款:", "", "" };
        for (int i = 0; i < rowData9.length; i++) {
            HSSFCell cell = row9.createCell(i);
            cell.setCellValue(new HSSFRichTextString(rowData9[i]));
            cell.setCellStyle(styleBorder);
        }
        // 第十行:
        rowNum++;
        HSSFRow row10 = sheet.createRow((short) rowNum);
        row10.setHeight((short) (heights[rowNum] * heightRate));
        // Region参数说明,参数1是起始行号,参数2是合并至行数,参数3是起始列号,4是合并列至
        sheet.addMergedRegion(new CellRangeAddress(
                rowNum, rowNum, (short) 1, (short) (1 + 3)));
        sheet.addMergedRegion(new CellRangeAddress(
                rowNum, rowNum + 1, (short) 5, (short) (5 + 1)));
        String[] rowData10 = {"8", "简述扣款原因:", "", "", "",
                        "附件列表及张数:\n" + "   □ 服务情况报告            共__页\n"
                        + "   □ 考核扣分详情            共__页\n"
                        + "   □ 维护验收报告            共__页\n"
                        + "   □ 其它________  	          共__页",
                "" };
        for (int i = 0; i < rowData10.length; i++) {
            HSSFCell cell = row10.createCell(i);
            cell.setCellValue(new HSSFRichTextString(rowData10[i]));
            cell.setCellStyle(styleBorder);
        }

        // 第十一行:
        rowNum++;
        HSSFRow row11 = sheet.createRow((short) rowNum);
        row11.setHeight((short) (heights[rowNum] * heightRate));
        // Region参数说明,参数1是起始行号,参数2是合并至行数,参数3是起始列号,4是合并列至
        sheet.addMergedRegion(new CellRangeAddress(
                rowNum, rowNum, (short) 1, (short) (1 + 3)));
        String[] rowData11 = {"9", "简述需服务方改进内容:", "", "", "", "", "" };
        for (int i = 0; i < rowData11.length; i++) {
            HSSFCell cell = row11.createCell(i);
            cell.setCellValue(new HSSFRichTextString(rowData11[i]));
            cell.setCellStyle(styleBorder);
        }
        // 第十二行:
        rowNum++;
        HSSFRow row12 = sheet.createRow((short) rowNum);
        row12.setHeight((short) (heights[rowNum] * heightRate));
        // Region参数说明,参数1是起始行号,参数2是合并至行数,参数3是起始列号,4是合并列至
        sheet.addMergedRegion(new CellRangeAddress(
                rowNum, rowNum, (short) 1, (short) (1 + 1)));
        sheet.addMergedRegion(new CellRangeAddress(
                rowNum, rowNum, (short) 3, (short) (3 + 1)));
        sheet.addMergedRegion(new CellRangeAddress(
                rowNum, rowNum, (short) 5, (short) (5 + 1)));
        String[] rowData12 = {"10", "考核单位意见:\n(须签字)", "",
                "考核单位意见:\n(须签字)", "", "考核单位意见:\n(须签字)", "" };
        for (int i = 0; i < rowData12.length; i++) {
            HSSFCell cell = row12.createCell(i);
            cell.setCellValue(new HSSFRichTextString(rowData12[i]));
            cell.setCellStyle(styleBorder);
        }
        // 第十三行:
        rowNum++;
        HSSFRow row13 = sheet.createRow((short) rowNum);
        row13.setHeight((short) (heights[rowNum] * heightRate));
        // Region参数说明,参数1是起始行号,参数2是合并至行数,参数3是起始列号,4是合并列至
        sheet.addMergedRegion(new CellRangeAddress(
                rowNum, rowNum, (short) 1, (short) (1 + 1)));
        sheet.addMergedRegion(new CellRangeAddress(
                rowNum, rowNum, (short) 3, (short) (3 + 1)));
        sheet.addMergedRegion(new CellRangeAddress(
                rowNum, rowNum, (short) 5, (short) (5 + 1)));
        String[] rowData13 = {"11", "考核单位领导意见:\n(须签字盖章)", "",
                "考核单位领导意见:\n(须签字盖章)", "", "考核单位领导意见:\n(须签字盖章)", "" };
        for (int i = 0; i < rowData13.length; i++) {
            HSSFCell cell = row13.createCell(i);
            cell.setCellValue(new HSSFRichTextString(rowData13[i]));
            cell.setCellStyle(styleBorder);
        }
        return wb;
    }
    
    /**
     * 文件名编码处理，IE采用URL编码，火狐Safari等采用iso编码避免中文乱码
     * @param userAgent
     * @param filename
     * @param unicode
     * @return
     */
    private String encodeFilename(String userAgent, String filename){
    	if(StringUtil.isEmpty(userAgent)){
    		return null;
    	}
    	userAgent = userAgent.toUpperCase();
    	if(userAgent.contains("MSIE")
    			|| userAgent.contains("TRIDENT")){
    		filename = EncodeUtil.urlEncode(filename);
    		filename = filename.replace("+", "%20");//处理IE中空格转换为加号(+)的问题
        } else {
        	filename = EncodeUtil.utf82iso(filename);
        }
    	return filename;
    }
}
