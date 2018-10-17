<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>pdf相关demo</title>
</head>
<body>
    <div class="easyui-layout" style="height: 700px;">
        <div data-options="region:'center',title:'pdf绘制导出demo',border:false" style="padding: 0px; ">
           <div style="width: 900px;margin: 10px;border: 1px solid;">
              <strong>demo内容：</strong>pdf相关演示 1.get参数传递 2.pdf绘制下载<br/>
              <strong>适 用 场 景：</strong>pdf导出<br/>
              <strong>使 用 说 明：</strong>输入参数,点击[绘制下载]按钮,查看示例<br/>
              <strong>注 意 事 项：</strong>详见开发手册及代码
          </div>
          <form id="pdfSearchForm" class="hgform">
            <table class="hgtable">
                <tr>
                    <td align="right">条件1：</td>
                    <td>
                        <input type="text" name="paramA" value="测试">
                    </td>
                    <td align="right">条件2：</td>
                    <td>
                        <input type="text" name="paramB" value="测试1">
                    </td>
                    <td align="right">条件3：</td>
                    <td>
                        <input type="text" name="paramC" value="测试2">
                    </td>
                 <td>
                        <a href="javascript:void(0);" class="a_blue"
                            onclick="downloadDrawPdf();"><em>pdf绘制下载</em></a>
                 </td>
                </tr>
            </table>
         </form>
        </div>
    </div>
    <script type="text/javascript">
        //导出pdf
        function downloadDrawPdf(){
            var params=$("#pdfSearchForm").serialize();
            var url=G_CTX_PATH + "/common/demo/pdf/downloadDrawPdf";
            HgUtil.open(url,params);
        }
    </script>
</body>
</html>