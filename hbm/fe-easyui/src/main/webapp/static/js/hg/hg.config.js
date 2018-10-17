/**
 * hongguaninfo config
 * 
 * @author cecily yu
 */

 
(function(){
	
	
	
	if (typeof(HgConfig) == "undefined") 
	HgConfig = {
			//前端统一缓存时间10min
			GOL_CACHE_TIME : 10*60*1000 
	};
	
	
	
	
	/*********************************UI 参数配置*****************************************
	 * 
	 * 
	 * 
	 * 
	 *************************************************************************************/
	// 提交遮罩
	$.blockUI.defaults = $.extend({}, $.blockUI.defaults, {
		message : "<img src='" + G_CTX_PATH
				+ "/static/images/icons/loading1.gif'/>",
		css : {
			border : 'none',
			padding : '15px',
			width : "20px",
			top : "0px",
			left : "0px",
			opacity : 1
		},
		overlayCSS : {
			backgroundColor : '#ddd',
			opacity : 0.6,
			cursor : 'wait'
		}
	});

	/**
	 * validate 兼容easyui
	 */
	$(document).on("keydown","form.hgform input",function(e){
		$(this).parents("td:eq(0)").find("label.error").remove();
	});

	//设置ajax
	$.ajaxSetup({
		timeout: 60000//设置超时时间
	});
	
	/**
	 * 通用AJAX异常错误处理  
	 */
	$(document).ajaxError(function( event, XMLHttpRequest, settings, thrownError ) {
		var ajaxErrors = [];
		ajaxErrors[0] = ajaxError0;//超时
		ajaxErrors[401] = ajaxError401;
		ajaxErrors[403] = ajaxError403;	
		ajaxErrors[404] = ajaxError404;
		ajaxErrors[500] = ajaxError500;
		if (ajaxErrors[XMLHttpRequest.status]){
			ajaxErrors[XMLHttpRequest.status].apply(this,arguments);
		}else{
            ajaxError0.apply(this,arguments);
		}
	});
	
	/**
	 * 超时
	 */
	function ajaxError0( event, jqxhr, settings, thrownError ){
		//存在错误处理方法时,进行调用
		if (!settings.error){
			HgUi.error("后台无响应,请求失败!");
			HgUtil.defaultAjaxError.call(this,XMLHttpRequest,'',thrownError, function(){});
			return false;
		}
	}
	
	/**
	 * 未授权：登录超时或已退出
	 */
	function ajaxError401( event, jqxhr, settings, thrownError ){
		HgUi.alert('您的会话已结束！',function () {
            window.location.href = G_CTX_PATH;
        });
		
	}
	
	/**
	 * 当前URL未授权，弹出警告框。
	 */
	function ajaxError403( event, jqxhr, settings, thrownError ){
		if ($(".messager-window .window-header .panel-title:contains('错误')").length==0){
			var responseJson = JSON.parse(jqxhr.responseText);
			HgUi.error(responseJson.message,function(){});
		}
	}
	
	/**
	 * 404：提示请求资源不存在。
	 */
	function ajaxError404( event, XMLHttpRequest, settings, thrownError ){
		if (!settings.error){
			HgUtil.defaultAjaxError.call(this,XMLHttpRequest,'',thrownError, function(){});
		}
	}
	
	/**
	 * 异常处理
	 */
	function ajaxError500( event, XMLHttpRequest, settings, thrownError ){
		if (!settings.error){
			HgUtil.defaultAjaxError.call(this,XMLHttpRequest,'',thrownError,function(){});
		}
	}
	
	/**
	 * AJAX完成处理：删除防重复提交记录。
	 */
	$(document).ajaxComplete(function(event, xhr, settings ){
		if (window.GLO_SUBMIT_LIST){
			try{
				var url = settings.url.substr(window.G_CTX_PATH.length);
				url = url.split("?etc=")[0];
				for(var index in window.GLO_SUBMIT_LIST){
					if (window.GLO_SUBMIT_LIST[index]['url'] == url){
						var opObj = window.GLO_SUBMIT_LIST[index]['opObj'];
						if ($(opObj)){
				    		if ($(opObj).linkbutton){
				    			$(opObj).linkbutton("enable");
				    		}else{
				    			$(opObj).attr("disabled","")
				    		}
				    	}
						delete window.GLO_SUBMIT_LIST[index];
						//console.log(url);
					}
				}
			}catch(error){
				
			}
		}
	})
	
})();