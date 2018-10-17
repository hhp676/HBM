/**
 * hognguaninfo util 
 * 
 * @author cecily yu
 */

(function(){
    if (typeof(HgUtil) == "undefined") HgUtil = {};

    /**
     *  get请求   ajax获取json数据  
     *  @param path 请求路径 data 请求参数 callback 回调函数
     */
    HgUtil.get = function(path, data, success, error) {
    	data = HgUtil.encodeURI(data);
    	return $.ajax({
		    "url": G_CTX_PATH + path + "?etc=" + new Date().getTime(),
		    "type": "GET",
		    "data": data,
		    "success": success,
		    "error": error
		})
    };
    
    /**
     *  get请求   ajax获取json数据  
     *  @param path 请求路径 data 请求参数 callback 回调函数
     */
    HgUtil.getJson = function(path, data, success, error) {
    	data = HgUtil.encodeURI(data);
    	return $.ajax({
		    "url": G_CTX_PATH + path + "?etc=" + new Date().getTime(),
		    "type": "GET",
		    "dataType": "json",
		    "data": data,
		    "success": success,
		    "error": error
		})
    };
    
    /**
     * 对象进行两次URI编码。
     */
    HgUtil.encodeURI =function(data) {
    	if (typeof(data)=="object"){
    		for (var key in data){
    			data[key] = HgUtil.encodeURI(data[key]);
    		}
    		return data;
    	}else{
    		return (encodeURI(data));
    	}
    };

    /**
     * post请求 ajax获取json数据  
     * @param path 请求路径 data 请求参数 callback 回调函数
     */
	HgUtil.post = function(path, data, success, error) {
		return $.ajax({
		    "url": G_CTX_PATH + path + "?etc=" + new Date().getTime(),
		    "type": "POST",
		    "data": data,
		    "success": success,
		    "error": error
		})
	};
    
    HgUtil.ajax = function(settings){
        settings.url =  G_CTX_PATH + settings.url + "?etc=" + new Date().getTime();
        return $.ajax(settings);
    };
    
    /**
     * 上传文件校验
     * @param fileInputId 文件选择框ID
     * @param suffixs 允许的文件名后缀数组(数组值,需要是大写)
     * @return returnMap flag=true为校验通过,否则参见msg信息
     * @author yinyanzhen
     */
    HgUtil.FileCheck = function(fileIDArray, suffixs){
    	var returnMap ={};
    	returnMap.flag = true;
    	var fileSizeTotal = 0;
    	for(var i=0; i < fileIDArray.length; i++){
    		fileSizeTotal += $("#"+fileIDArray[i])[0].files[0].size;
    		var fileName = $("#"+fileIDArray[i]).val();
    		if(suffixs != null && suffixs.length>0){
    			var fileExt = fileName.substring(fileName.lastIndexOf('.') + 1).toUpperCase();
    			var index = $.inArray(fileExt,suffixs);
    			if(index == -1){
    				returnMap.flag=false;
    				returnMap.msg ='上传文件格式只允许为：' + suffixs.toString() + ' 格式';
    				return returnMap;
    			}
    		}
    	}
    	if(fileSizeTotal > HG_FILE_MAX_SIZE){
    		returnMap.flag=false;
    		returnMap.msg ='上传文件大小最大为：' + HG_FILE_MAX_SIZE/1024/1024 + 'MB';
    		return returnMap;
    	}
    	return returnMap;
    };
    
    /**
     * 弹出新的window窗口
     * @author yinyanzhen
     * @param path 请求地址
     * @param formSerialize 传入参数必须是form.serialize得来的参数字符串
     */
    HgUtil.open = function(url,formSerialize){
    	url=window.encodeURI(url+"?"+formSerialize);
    	//serialize默认会将参数转码一次,在此只需再转一次
    	window.open(url);
    };
    
    /**
     * 跳转到新页面,或文件下载
     * @author yinyanzhen
     * @param path 请求地址
     * @param formSerialize 传入参数必须是form.serialize得来的参数字符串
     */
    HgUtil.locationHref = function(url,formSerialize){
    	url=window.encodeURI(url+"?"+formSerialize);
    	//serialize默认会将参数转码一次,在此只需再转一次
    	window.location.href=url;
    };
    
    /**
     * 参数由数组转map,DataGrid参数以及ajaxfileupload等js方法所需均是map形势
     * @author yinyanzhen
     * @param formSerializeArray 传入参数为数组,可以由form.serializeArray得来
     */
    HgUtil.paramArrayToMap = function(formSerializeArray){
    	var params={};
    	for(var i=0;i<formSerializeArray.length;i++){
            var e =formSerializeArray[i];
            if(e.value!=null&&e.value.length>0){
                params[e.name] = e.value;
            }
        }
    	return params;
    };
    
    /**
     * 参数Map,遍历去除前后空格
     * @author yinyanzhen
     */
    HgUtil.paramMapTrim = function (paramMap){
    	for(var paramKey in paramMap){
    		paramMap[paramKey]=$.trim(paramMap[paramKey]);
    	}
    	return paramMap;
	};
    
    /**
     * 为指定的form,装入防重复提交token值
     * 存在时重设值,不存在时添加
     * @author yinyanzhen
     * @param form '#formID'
     */
    HgUtil.initSubmitToken = function(form) {
    	HgUtil.post("/initSubmitToken", {}, function(data) {
    		var obj=$(form+' #submitToken');
    		//存在时重设值,不存在时添加
    		if(obj!=null && obj.val()!='' && obj.val()!=undefined){
    			$(form+' #submitToken').val(data.data);
    		}else{
    			$(form).append("<input type='hidden' id='submitToken' name='submitToken' value='"+data.data+"'/>");
    		}
    	});
    };
    
    /**
     * 异步获取字典项map
     */
    HgUtil.getDictItemMap = function(groupCode) {
        var itemMap = [];
        HgUtil.ajax({
            url:"/sys/common/sysDict/itemList/"+groupCode,
            success:function(data){
                for (ri in data) {
                    var row = data[ri];
                    itemMap.push({"itemValue":row["itemValue"],"itemName":row["itemName"]});
                }
            },
            async:false
        });
        return itemMap;
    };

    var GOL_DICT_CACHE;
    
    /**
     * 获取字典项集合，10min缓存
     * modified by qiujingde: 将缓存时间从3秒改成10分钟。
     */
    HgUtil.getDictItemMapUseCache = function(groupCode){
        var dictGroupTimeKey = "ctime";
        var dictGroupDataKey = "data";
        GOL_DICT_CACHE = (typeof(GOL_DICT_CACHE) == "undefined")?{}:GOL_DICT_CACHE;
        if (GOL_DICT_CACHE[groupCode] && (new Date().getTime()- GOL_DICT_CACHE[groupCode][dictGroupTimeKey])< HgConfig.GOL_CACHE_TIME){
            return GOL_DICT_CACHE[groupCode][dictGroupDataKey];
        }
        var itemMap = HgUtil.getDictItemMap(groupCode);
        var dictGroup = {};
        dictGroup[dictGroupTimeKey] = new Date().getTime();
        dictGroup[dictGroupDataKey] = itemMap;
        GOL_DICT_CACHE[groupCode] = dictGroup;
        return itemMap;
    };
    
    /**
     * 获取字典项COMBOBOX数据对象
     */
    HgUtil.getDictComboboxData = function(groupCode){
        var comboboxData = [];
        var itemMap = HgUtil.getDictItemMapUseCache(groupCode);
        for(var key  in itemMap){
            comboboxData.push({
                text: itemMap[key]['itemName'],
                value: itemMap[key]['itemValue']
            });
        }
        return comboboxData;
    };

    /**
     * 返回groupCode对应的datagrid或treegrid字段的formatter方法
     * @param groupCode     字典组code
     * @returns {Function}  key到text的转换方法
     */
    HgUtil.fieldFormatterFunc = function(groupCode) {
        return function (value) {
            return HgUtil.getDictItemName(groupCode, value);
        }
    };
    
    /**
     * 获取字典值
     */
    HgUtil.getDictItemName = function(groupCode,itemValue){
        var itemMap = HgUtil.getDictItemMapUseCache(groupCode);
        for(var key  in itemMap){
            if (itemMap[key]['itemValue'] && itemMap[key]['itemValue']==itemValue){
                return itemMap[key]['itemName'];
            }
        }
        return "";
    };
    
    HgUtil.formatToDate = function(value) {
        if (value == null || value == '') {
            return '';
        }
        var dt;
        if (value instanceof Date) {
            dt = value;
        } else {
            dt = new Date(value);

        }
        return dt.format("yyyy-MM-dd"); //扩展的Date的format
    };
    
    HgUtil.formatToDateTime = function(value) {
    	if (value == null || value == '') {
    		return '';
    	}
    	var dt;
    	if (value instanceof Date) {
    		dt = value;
    	} else {
    		dt = new Date(value);
    		
    	}
    	return dt.format("yyyy-MM-dd hh:mm:ss"); //扩展的Date的format
    };
    
    HgUtil.defaultAjaxError = function(XMLHttpRequest, textStatus, thrownError, callback){
        if (XMLHttpRequest.status==500){
            var responseJson = JSON.parse(XMLHttpRequest.responseText);
            //console.log(responseJson.data);
            //TODO 防止重复弹窗
            HgUi.error(responseJson.data,callback);
        } else if (XMLHttpRequest.status==404){
        	//TODO 防止重复弹窗
            HgUi.error('请求资源不存在！' , callback);
        } else if (XMLHttpRequest.status==403){
            HgUi.error('无权限访问！' , callback);
        } else  {
            //TODO 防止重复弹窗
            HgUi.error('后台无响应,请求失败!' , callback);
        }
    };
    
    /**
     * 将数值四舍五入(保留2位小数)后格式化成金额形式
     * 
     * @param num  数值(Number或者String)
     * @return 金额格式的字符串,如'1,234,567.45'
     * @type String
     */
    HgUtil.formatCurrency = function(num) {
        num = num.toString().replace(/\$|\,/g, '');
        if (isNaN(num))
            num = "0";
        sign = (num == (num = Math.abs(num)));
        num = Math.floor(num * 100 + 0.50000000001);
        cents = num % 100;
        num = Math.floor(num / 100).toString();
        if (cents < 10)
            cents = "0" + cents;
        for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
            num = num.substring(0, num.length - (4 * i + 3)) + ','
                    + num.substring(num.length - (4 * i + 3));
        return (((sign) ? '' : '-') + num + '.' + cents);
    };
    
    
    /**
     *  判断是否是有效的日期时间格式字符串
     *  @param strDataTime 时间字符串
     */
    HgUtil.isDataString = function(strDataTime){
        var timeFilter = /^[1-9][0-9]-(0?[1-9]|1[0|1|2])-(0?[1-9]|[1|2][0-9]|3[0|1])s(0?[1-9]|1[0-9]|2[0-3]):(0?[0-9]|[1|2|3|4|5][0-9]):(0?[0-9]|[1|2|3|4|5][0-9])$/;
        return timeFilter.test(strDataTime);
    };
    
    
    /**
     * 校验
     * @param type 类型
     * @param value 值
     */
    HgUtil.validate = function(type,value) {
        var returnObj = {result:true};
        if (type == "mobile") {
            var length = value.length;
            var mobile = /^(1\d{10})$/;
            if (length == 0||(length == 11 && mobile.test(value))){
                return returnObj;
            } else {
                returnObj.msg = "手机号码格式错误";
                returnObj.result = false;
                return returnObj;
            }
            
        }
    };
    
    
    /**
     * 计算总分页页码
     * @param totalCount 总条数
     * @param pageSize 每页条数
     * @return int 总页码数
     */
    HgUtil.calPageTotalNum = function(totalCount, pageSize) {
        var totalNum = 0;
        if (totalCount % pageSize == 0) {
            totalNum = totalCount / pageSize;
        } else {
            totalNum = parseInt(totalCount / pageSize) + 1;
        }
        return totalNum;
    };

    /**
     * 弹窗选择系统用户
     * @param mode       单选/多选，single/multiple
     * @param data       请求数据
     * @param callback   回调函数：callback(row)，row为选择用户的js对象
     */
    HgUtil.chooseSysUser = function (callback, mode, data) {
        if (!callback) {
            $.messager.alert("提示","功能不完整，未定义操作！","warning");
        }
        HgUi.window({
            id:"sysUserChooseWin",
            title:"人员列表",
            url:"/sys/sysUser/winView",
            width:"1000",
            height:"600",
            queryParams:$.extend({}, {_selectMode : mode ? mode : 'single'}, data || {})
        });
        window.sysUserWinListCallback = callback;
    };
    
    /**
     * 弹窗选择系统角色
     * @param mode       单选/多选，single/multiple
     * @param data       请求数据
     * @param callback   回调函数：callback(row)，row为选择角色的js对象
     */
    HgUtil.chooseSysRole = function (callback, mode, data) {
        if (!callback) {
            $.messager.alert("提示","功能不完整，未定义操作！","warning");
        }
        
        HgUi.window({
        	id:"sysRoleChooseWin",
        	title:"角色列表",
    		url:"/sys/sysRole/winView",
    		width:"1000",
            height:"600",
    		queryParams:$.extend({}, {_selectMode : mode ? mode : 'single'}, data || {})
    	});
        window.sysRoleWinListCallback = callback;
    };
    
    /**
	 * 弹窗选择系统权限
     * @param data       请求数据
     * @param callback   回调函数：callback(checkedAuthIds,rows)，checkedAuthIds为选择权限的ID数组;rows为选择行数据。
     */
	HgUtil.chooseSysAuth = function (data, callback) {
		var dialogId = "sysAuthManageDialog";
		if (!callback) {
            $.messager.alert("提示","功能不完整，未定义操作！","warning");
		}
		var authManage = new sysAuthManage(data.authType,"dialog");
		window.dialogAuthManage = authManage;
		window.dialogAuthManageData = data.queryParams||{};
		HgUi.dialog({
			id:dialogId,
			url:"/sys/sysAuthMenu/authManageDialogView",
			queryParams:{id:"dialog"},
			width:500,
			height:550,
			title:"权限管理",
			buttons:[{
	            text:'提交',
	            width:'70',
	            group:'ok',
	            handler:function(){
	            	authManage.onSave(callback);
	            	HgUi.ok("保存成功!",function(){
	            		$('#'+dialogId).dialog('close');
					});	
	            }
	        },{
	            text:'关闭',
	            width:'70',
	            group:'cancel',
	            handler:function(){
	            	$('#'+dialogId).dialog('close');
	            }
	        }]
		});		
		
    };
    
    /**
     * 弹窗选择数据权限变量 -- 单选
     * @param data       请求数据
     * @param callback   回调函数：callback(row)，row为选择数据权限变量的js对象
     */
    HgUtil.chooseDauthVariable = function (data, callback) {
        if (!callback) {
            $.messager.alert("提示","功能不完整，未定义操作！","warning");
        }
        HgUi.window({
        	id:"dauthVariableChooseWin",
        	title:"数据权限变量列表",
        	width:850,
        	height:400,
    		url:"/sys/dauthVariable/chooseVariableView",
    		queryParams:data
    	});
        window.sysDauthVariableChooseWinCallback = callback;
    };
    
    /**
     * 弹窗选择职务
     * @param mode       单选/多选，single/multiple
     * @param data       请求数据
     * @param callback   回调函数：callback(row)，row为选择数据权限变量的js对象
     */
    HgUtil.chooseSysJob = function (mode, data, callback) {
        if (!callback) {
            $.messager.alert("提示","功能不完整，未定义操作！","warning");
        }
        HgUi.window({
        	id:"sysJobChooseWin",
        	title:"职务列表",
        	width:850,
        	height:400,
    		url:"/sys/org/chooseSysJobView",
    		queryParams:$.extend({}, {_selectMode : mode ? mode : 'single'}, data || {})
    	});
        window.sysJobChooseWinCallback = callback;
    };

    /**
     * 弹窗选择岗位
     * @param mode       单选/多选，single/multiple
     * @param data       参数数据
     * @param callback   回调函数：callback(checkedPositionIds,rows)，checkedPositionIds为选择岗位的ID数组;rows为选择行数据。
     */
    HgUtil.chooseSysPosition = function (mode, data, callback) {
        if (!callback) {
            $.messager.alert("提示","功能不完整，未定义操作！","warning");
        }
        var dialogId = "chooseSysPositionDialog";
        window.chooseSysPositionTree = {};
        window.chooseSysPositionTree.mode = mode ? mode : 'single';
        window.chooseSysPositionTree.paramData = data;
        HgUi.dialog({
            id:dialogId,
            url:"/sys/org/chooseSysPositionView",
            width:600,
            height:600,
            title:"岗位管理",
            buttons:[{
                text:'保存',
                width:'70',
	            group:'ok',
                handler:function(){
                    window.chooseSysPositionTree.onSave(callback);
                    $('#'+dialogId).dialog('close');
                }
            },{
                text:'关闭',
                width:'70',
	            group:'cancel',
                handler:function(){
                    $('#'+dialogId).dialog('close');
                }
            }]
        });
    };

    /**
     * 弹窗选择小组
     * @param data       参数数据
     * @param callback   回调函数：callback(checkedGroupIds,rows)，checkedGroupIds为选择小组的ID数组;rows为选择行数据。
     */
    HgUtil.chooseSysGroup = function (data, callback) {
        if (!callback) {
            $.messager.alert("提示","功能不完整，未定义操作！","warning");
        }
        var dialogId = "chooseSysGroupDialog";
        window.chooseSysGroupTree = {};
        window.chooseSysGroupTree.paramData = data;
        HgUi.dialog({
            id:dialogId,
            url:"/sys/org/chooseSysGroupView",
            width:600,
            height:600,
            title:"小组管理",
            buttons:[{
                text:'保存',
                width:'70',
	            group:'ok',
                handler:function(){
                    window.chooseSysGroupTree.onSave(callback);
                    $('#'+dialogId).dialog('close');
                }
            },{
                text:'关闭',
                width:'70',
	            group:'cancel',
                handler:function(){
                    $('#'+dialogId).dialog('close');
                }
            }]
        });
    };
    
    
    /**
     * 判断是否有authcode权限，无缓存
     */
    HgUtil.hasAuth = function (authCode) {
    	var _hasAuth = false;
    	if (authCode) {
    		HgUtil.ajax({
    			url:"/sys/common/hasAuth/"+authCode,
    			success:function(data){
    				if (data.hasAuth) {
    					_hasAuth = true;
    				}
    			},
    			async:false
    		});
    	}
    	return _hasAuth;
    };
    
    var GOL_AUTHCHECK_CACHE;//权限校验缓存
    
    /**
     * 判断是否有authcode权限，10min缓存
     */
    HgUtil.hasAuthUseCache = function(authCode){
        var authCheckTimeKey = "crtime";
        var authCheckDataKey = "data";
        GOL_AUTHCHECK_CACHE = (typeof(GOL_AUTHCHECK_CACHE) == "undefined")?{}:GOL_AUTHCHECK_CACHE;
        if (GOL_AUTHCHECK_CACHE[authCode] && (new Date().getTime() - GOL_AUTHCHECK_CACHE[authCode][authCheckTimeKey]) < HgConfig.GOL_CACHE_TIME){
            return GOL_AUTHCHECK_CACHE[authCode][authCheckDataKey];
        }
        var hasAuthFlag = HgUtil.hasAuth(authCode);
        var authCheck = {};
        authCheck[authCheckTimeKey] = new Date().getTime();
        authCheck[authCheckDataKey] = hasAuthFlag;
        GOL_AUTHCHECK_CACHE[authCode] = authCheck;
        return hasAuthFlag;
    };
    
    /**
     * 查看用户详情
     * @callbackName 修改/删除用户后的回调方法名称，callbackName(type)，type:edit/del
     * @userIdProp 查看用户的Id字段名。
     */
    HgUtil.userInfoDetail = function (callbackName, userIdProp, isDeleteProp) {
        return function (val, row) {
        	var _userId = row.userId;
        	if (userIdProp) {
        		_userId = row[userIdProp];
        	}
        	if(!_userId){
        		return "";
        	}
        	if (isDeleteProp){
        		var isDeletePropArr = isDeleteProp.split(".");
        		var _isDeleteProp = row;
        		for(var i=0; i<isDeletePropArr.length;i++){
        			_isDeleteProp = _isDeleteProp[isDeletePropArr[i]];
        		}
        		if (_isDeleteProp == 1){
        			return val;
        		}
        	}
        	return HgUtil.detailViewHref({
        		id : "sysUserInfoDetailWin",
            	name : val,
            	title : "用户详情",
            	authCode : "common:sysUserDetail",
            	url : "/common/sysUser/detail/" + _userId,
            	callbackName : callbackName,
            	width : 920,
        		height : 360
            });
        };
    };
    /**
     * datagrid表格显示跳转详情的链接。
     * @param name: 超链接显示的名称
     * @param authCode: 空：不校验是否有权限  有值：校验是否有权限
     * @param url: 详情URL
     * @param authCheckCache: true/false；true:(默认)校验权限时会使用缓存，false:校验权限时不使用缓存
     */
    HgUtil.detailViewHref = function (options) {
    	var opts = $.extend({}, {authCheckCache:true}, options || {});
    	var html = "";
    	if(opts.name){
    		var hasAuth = true;//默认有权限
        	if (opts.authCode) {
        		hasAuth = opts.authCheckCache ? HgUtil.hasAuthUseCache(opts.authCode) : HgUtil.hasAuth(opts.authCode);
        	}
        	if (hasAuth) {
        		var _optsStr = JSON.stringify(opts);
        		html = "<a href='javascript:HgUtil.detailView(" + _optsStr + ");'>" + opts.name + "</a>";
        	} else {
        		return opts.name;
        	}
    	}
    	return html;
    };
    
    
    /**
     * 查看详情。
     * @param options 参数，下面为详细说明
     * 		  type: win/tab；win:(默认)以弹窗查看详情，tab：以选项卡查看详情
     *        url: 查看详情URL
     *        callbackName：修改/删除成功的回调函数名称；具体调用需要各个功能单独实现，只是提供参数
     * 		  
     */
    HgUtil.detailView = function (options) {
    	var opts = $.extend({}, {type:'win',iconCls:"icon_info" }, options || {});
    	
    	if (opts.type == 'win') {
    		new HgUi.window({
    			id : opts.id,
    			width : opts.width,
    			height : opts.height,
    			title : opts.title,
    			iconCls : opts.iconCls,
    			url : opts.url,
    			callbackName : opts.callbackName
    		});
    	}
    };
    
    
    /**
     * TODO 隐藏或移除本方法
     * 弹窗右键关于本条记录
     * @param dialogId        弹窗ID
     * @param sumbitUrl       请求URL，由于业务不同，controller层要提供本条信息业务查询的方法，并返回统一页面entity_about.jsp
     * @param data            请求参数
     */
    HgUtil.aboutDialog = function (sumbitUrl, data) {
    	var dialogId = "bizabout";
        HgUi.dialog({
            id:dialogId,
            url:sumbitUrl,
            queryParams:data,
            iconCls:'icon_auto_colorful__about',
            width:400,
            height:400,
            title:"关于本条记录",
            buttons:[{
                text:'关闭',
                width:'70',
	            group:'cancel',
                handler:function(){
                    $('#'+dialogId).dialog('close');
                }
            }]
        });
    };
    
    
    /**
     * JS防重复提交。
     * @param btnObj 操作对象
     * @param url 请求地址
     * @param tagName 名称，可选参数，如果不填则自动使用url路径。
     * @return 检测通过
     */
    HgUtil.repeatSubmitCheck = function(opObj, url ,tagName){
    	if (!window.GLO_SUBMIT_LIST){
    		window.GLO_SUBMIT_LIST = {};
    	}
    	if (!tagName){
    		tagName = url;
    	}
    	if (window.GLO_SUBMIT_LIST.hasOwnProperty(tagName)){
    		return false;
    	}
    	window.GLO_SUBMIT_LIST[tagName] = {"opObj":opObj,"url":url};
    	if ($(opObj)){
    		$(opObj).attr("disabled","disabled");
    		$(opObj).addClass("a_btn_disabled")
    	}
    	return true;
    };
    
    /**
     * 绑定对象点击事件为复制到剪贴板。
     */
    HgUtil.bindClipboard = function(obj, text){
    	if (window.clipboardData) {
    		$(obj).click(function(){
    			window.clipboardData.clearData();  
                window.clipboardData.setData("Text", text);
    		});
            return;
        }
    	var clipCell = new ZeroClipboard(obj);
		clipCell.on("copy", function(e){
			e.clipboardData.setData("text/plain", text);
		});
    };
    
    /**
     * 获取数组值，支持.分隔多级索引
     */
    HgUtil.getValueByKey = function(array, key){
    	var keys = key.split(".");
    	var curValue = array;
    	for(var index=0; index<keys.length; index++){
    		if (curValue == null){
    			break;
    		}
    		curValue = curValue[keys[index]];
    	}
    	return curValue;
    };
    
    /**
     * 字符串类
     */    
    StringBuffer = function(str) {
        this.tmp = [];
    };
    StringBuffer.prototype.append = function(value) {
        this.tmp.push(value);
        return this;
    };
    StringBuffer.prototype.clear = function() {
        tmp.length = 1;
    };
    StringBuffer.prototype.toString = function() {
        return this.tmp.join('');
    };

    /**
     *数组类拓展
     */
    //2017-03-24 Array不扩展原型方法，IE8下for in时会循环出。
    /*Array.prototype.find = function(val) {
        for (var i = 0, len = this.length; i < len; i++) {
            if (this[i] == val) {
                return this[i];
            }
        }
        return null;
    }*/
    /*if (!Array.prototype.indexOf) {  
    	Array.prototype.indexOf = function(elt , from) {  
    		var len = this.length >>> 0;    
    		var from = Number(arguments[1]) || 0;  
    		from = (from < 0)  ? Math.ceil(from) : Math.floor(from);  
    		if (from < 0)  from += len;   
    		for (; from < len; from++) {  
    			if (from in this &&  this[from] === elt)  return from;  
    		}  
    		return -1;  
    	};  
    }*/
    
    
    /**
     * Date类拓展
     * @param format
     * @returns
     */
    Date.prototype.format = function(format) {
        var o = {
            "M+": this.getMonth() + 1, // month
            "d+": this.getDate(), // day
            "h+": this.getHours(), // hour
            "m+": this.getMinutes(), // minute
            "s+": this.getSeconds(), // second
            "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
            "S": this.getMilliseconds()
            // millisecond
        };
        if (/(y+)/.test(format))
            format = format.replace(RegExp.$1, (this.getFullYear() + "")
                .substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(format))
                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        return format;
    };
    
    
    /**
     * 提供浏览器检测的模块，方法复制于ueditor的UE.browser
     */
    HgUtil.browser = function(){
        var agent = navigator.userAgent.toLowerCase(),
            opera = window.opera,
            browser = {
            /**
             * @property {boolean} ie 检测当前浏览器是否为IE
             * @example
             * ```javascript
             * if ( UE.browser.ie ) {
             *     console.log( '当前浏览器是IE' );
             * }
             * ```
             */
            ie		:  /(msie\s|trident.*rv:)([\w.]+)/.test(agent),

            /**
             * @property {boolean} opera 检测当前浏览器是否为Opera
             * @example
             * ```javascript
             * if ( UE.browser.opera ) {
             *     console.log( '当前浏览器是Opera' );
             * }
             * ```
             */
            opera	: ( !!opera && opera.version ),

            /**
             * @property {boolean} webkit 检测当前浏览器是否是webkit内核的浏览器
             * @example
             * ```javascript
             * if ( UE.browser.webkit ) {
             *     console.log( '当前浏览器是webkit内核浏览器' );
             * }
             * ```
             */
            webkit	: ( agent.indexOf( ' applewebkit/' ) > -1 ),

            /**
             * @property {boolean} mac 检测当前浏览器是否是运行在mac平台下
             * @example
             * ```javascript
             * if ( UE.browser.mac ) {
             *     console.log( '当前浏览器运行在mac平台下' );
             * }
             * ```
             */
            mac	: ( agent.indexOf( 'macintosh' ) > -1 ),

            /**
             * @property {boolean} quirks 检测当前浏览器是否处于“怪异模式”下
             * @example
             * ```javascript
             * if ( UE.browser.quirks ) {
             *     console.log( '当前浏览器运行处于“怪异模式”' );
             * }
             * ```
             */
            quirks : ( document.compatMode == 'BackCompat' )
        };

        /**
        * @property {boolean} gecko 检测当前浏览器内核是否是gecko内核
        * @example
        * ```javascript
        * if ( UE.browser.gecko ) {
        *     console.log( '当前浏览器内核是gecko内核' );
        * }
        * ```
        */
        browser.gecko =( navigator.product == 'Gecko' && !browser.webkit && !browser.opera && !browser.ie);

        var version = 0;

        // Internet Explorer 6.0+
        if ( browser.ie ){

            var v1 =  agent.match(/(?:msie\s([\w.]+))/);
            var v2 = agent.match(/(?:trident.*rv:([\w.]+))/);
            if(v1 && v2 && v1[1] && v2[1]){
                version = Math.max(v1[1]*1,v2[1]*1);
            }else if(v1 && v1[1]){
                version = v1[1]*1;
            }else if(v2 && v2[1]){
                version = v2[1]*1;
            }else{
                version = 0;
            }

            browser.ie11Compat = document.documentMode == 11;
            /**
             * @property { boolean } ie9Compat 检测浏览器模式是否为 IE9 兼容模式
             * @warning 如果浏览器不是IE， 则该值为undefined
             * @example
             * ```javascript
             * if ( UE.browser.ie9Compat ) {
             *     console.log( '当前浏览器运行在IE9兼容模式下' );
             * }
             * ```
             */
            browser.ie9Compat = document.documentMode == 9;

            /**
             * @property { boolean } ie8 检测浏览器是否是IE8浏览器
             * @warning 如果浏览器不是IE， 则该值为undefined
             * @example
             * ```javascript
             * if ( UE.browser.ie8 ) {
             *     console.log( '当前浏览器是IE8浏览器' );
             * }
             * ```
             */
            browser.ie8 = !!document.documentMode;

            /**
             * @property { boolean } ie8Compat 检测浏览器模式是否为 IE8 兼容模式
             * @warning 如果浏览器不是IE， 则该值为undefined
             * @example
             * ```javascript
             * if ( UE.browser.ie8Compat ) {
             *     console.log( '当前浏览器运行在IE8兼容模式下' );
             * }
             * ```
             */
            browser.ie8Compat = document.documentMode == 8;

            /**
             * @property { boolean } ie7Compat 检测浏览器模式是否为 IE7 兼容模式
             * @warning 如果浏览器不是IE， 则该值为undefined
             * @example
             * ```javascript
             * if ( UE.browser.ie7Compat ) {
             *     console.log( '当前浏览器运行在IE7兼容模式下' );
             * }
             * ```
             */
            browser.ie7Compat = ( ( version == 7 && !document.documentMode )
                    || document.documentMode == 7 );

            /**
             * @property { boolean } ie6Compat 检测浏览器模式是否为 IE6 模式 或者怪异模式
             * @warning 如果浏览器不是IE， 则该值为undefined
             * @example
             * ```javascript
             * if ( UE.browser.ie6Compat ) {
             *     console.log( '当前浏览器运行在IE6模式或者怪异模式下' );
             * }
             * ```
             */
            browser.ie6Compat = ( version < 7 || browser.quirks );

            browser.ie9above = version > 8;

            browser.ie9below = version < 9;

            browser.ie11above = version > 10;

            browser.ie11below = version < 11;

        }

        // Gecko.
        if ( browser.gecko ){
            var geckoRelease = agent.match( /rv:([\d\.]+)/ );
            if ( geckoRelease )
            {
                geckoRelease = geckoRelease[1].split( '.' );
                version = geckoRelease[0] * 10000 + ( geckoRelease[1] || 0 ) * 100 + ( geckoRelease[2] || 0 ) * 1;
            }
        }

        /**
         * @property { Number } chrome 检测当前浏览器是否为Chrome, 如果是，则返回Chrome的大版本号
         * @warning 如果浏览器不是chrome， 则该值为undefined
         * @example
         * ```javascript
         * if ( UE.browser.chrome ) {
         *     console.log( '当前浏览器是Chrome' );
         * }
         * ```
         */
        if (/chrome\/(\d+\.\d)/i.test(agent)) {
            browser.chrome = + RegExp['\x241'];
        }

        /**
         * @property { Number } safari 检测当前浏览器是否为Safari, 如果是，则返回Safari的大版本号
         * @warning 如果浏览器不是safari， 则该值为undefined
         * @example
         * ```javascript
         * if ( UE.browser.safari ) {
         *     console.log( '当前浏览器是Safari' );
         * }
         * ```
         */
        if(/(\d+\.\d)?(?:\.\d)?\s+safari\/?(\d+\.\d+)?/i.test(agent) && !/chrome/i.test(agent)){
        	browser.safari = + (RegExp['\x241'] || RegExp['\x242']);
        }


        // Opera 9.50+
        if ( browser.opera )
            version = parseFloat( opera.version() );

        // WebKit 522+ (Safari 3+)
        if ( browser.webkit )
            version = parseFloat( agent.match( / applewebkit\/(\d+)/ )[1] );

        /**
         * @property { Number } version 检测当前浏览器版本号
         * @remind
         * <ul>
         *     <li>IE系列返回值为5,6,7,8,9,10等</li>
         *     <li>gecko系列会返回10900，158900等</li>
         *     <li>webkit系列会返回其build号 (如 522等)</li>
         * </ul>
         * @example
         * ```javascript
         * console.log( '当前浏览器版本号是： ' + UE.browser.version );
         * ```
         */
        browser.version = version;

        /**
         * @property { boolean } isCompatible 检测当前浏览器是否能够与UEditor良好兼容
         * @example
         * ```javascript
         * if ( UE.browser.isCompatible ) {
         *     console.log( '浏览器与UEditor能够良好兼容' );
         * }
         * ```
         */
        browser.isCompatible =
            !browser.mobile && (
            ( browser.ie && version >= 6 ) ||
            ( browser.gecko && version >= 10801 ) ||
            ( browser.opera && version >= 9.5 ) ||
            ( browser.air && version >= 1 ) ||
            ( browser.webkit && version >= 522 ) ||
            false );
        return browser;
    }();

})();
