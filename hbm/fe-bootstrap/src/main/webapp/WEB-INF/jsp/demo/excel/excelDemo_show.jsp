<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>excel相关demo</title>
</head>
<body>
	<div class="easyui-layout" fit=true>
		<div data-options="region:'center',title:'excel相关demo',border:false" style="padding: 0px; ">
		  <div style="width: 900px;margin: 10px;border: 1px solid;">
              <strong>demo内容：</strong>excel相关动作 1.get参数传递 2.excel绘制下载　3.excel导入后台读取<br/>
              <strong>适 用 场 景：</strong>excel数据导入,导出<br/>
              <strong>使 用 说 明：</strong>点击[绘制]查看导出示例,选择文件后点击[导入]查看导入示例<br/>
              <strong>注 意 事 项：</strong>详见开发手册及代码
          </div>
		  <fieldset style="width: 910px;">
		      <legend>根据条件导出excel</legend>
			  <form id="excelSearchForm" class="hgform">
				<table width="100%" class="hgtable">
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
					</tr>
					<tr>
					  <td colspan="6" align="right">
						<a href="javascript:void(0);" class="btn btn-success" onclick="downloadDrawExcel();" ><i class="fa fa-file-excel-o"></i>绘制复杂excel</a>
						<a href="javascript:void(0);" class="btn btn-success" onclick="downloadDataExcel();" ><i class="fa fa-file-excel-o"></i>绘制简单数据集excel</a>
					  </td>
					</tr>
				</table>
			 </form>
		  </fieldset>
		  <fieldset style="width: 910px;">
		      <legend>导入excel</legend>
		      <form class="hgform">
			      <table width="100%">
			          <tr>
			              <td align="center">
			                  <span class="file-input btn btn-block btn-default btn-file">
                                                选择excel <input type="file" id="excelFile" name="excelFile">
                              </span>
	                          <a href="javascript:void(0);" class="btn btn-success" onclick="importExcelData();" ><i class="fa fa-file-excel-o"></i>导入excel</a>
			              </td>
			          </tr>
			          <tr>
			              <td align="right">
			                  <label style="color: red;">本导入demo,对应后台只解析前两列数据,其中第二列是时间格式yyyy/MM/dd</label>
			              </td>
			          </tr>
			      </table>
		      </form>
		  </fieldset>
		</div>
	</div>
	<script type="text/javascript">
		//导出复杂excel
		function downloadDrawExcel(){
			var formSerialize=$("#excelSearchForm").serialize();
			var url=G_CTX_PATH + "/common/demo/excel/downloadDrawExcel";
			
			HgUtil.open(url, formSerialize);
		}
		
		//导出简单excel,
		function downloadDataExcel(){
			//导出时,由于参数的传递方式的问题,尽量使用serialize来处理,该方式默认参数转码一次,后台可以防乱码
			var formSerialize=$("#excelSearchForm").serialize();
			var url=G_CTX_PATH + "/common/demo/excel/downloadDataExcel";
			HgUtil.open(url,formSerialize);
		}
		
		//导入excel数据
		function importExcelData(){
			var obj=$("#excelFile");
            if(obj == null || obj.val() == '' || obj.val() == undefined){
                HgUi.notice("请先选择excel文件!");
                return false;
            }
			
		    var submitUrl = G_CTX_PATH+"/common/demo/excel/importExcelData";
            
            $.messager.confirm("确认", "确认提交吗?", function(r){
                if (r){
                    $.messager.progress({
                        title:"稍等",
                        msg:"正在提交..."
                    });
                    $.ajaxFileUpload({ 
                        url:submitUrl,     
                        secureuri:false,  
                        type: 'POST',
                        data:{'param1':'参数1'},        //传递参数
                        fileElementId:"excelFile",  //文件选择框的id属性 
                        dataType:'text',            
                        success:function(result){
                            $.messager.progress("close");
                            if (result == "success") {
                                $.messager.alert("提示","操作成功!","info",function(){
                                    
                                });
                            }else {
                                $.messager.alert("提示","操作失败!"+result,"error");
                            }       
                        },
                        error:function(data, status, e){ //服务器响应失败时的处理函数 
                            $.messager.progress("close");
                            $.messager.alert("提示","操作失败!","info");
                        }     
                    });
                }
            });
		}
	</script>
</body>
</html>