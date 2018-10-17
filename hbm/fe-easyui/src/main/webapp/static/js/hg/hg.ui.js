/**
 * hongguaninfo ui wrap
 * 
 * @author cecily yu
 */
(function(){
	if (typeof(HgUi) == "undefined") window.HgUi = {};

	/****************************************************************************************************************
	 * 提示框
	 ***************************************************************************************************************/
	HgUi.ok = function(msg, callback) {
		var okMsg = new StringBuffer();
		okMsg.append("<img src='"+G_CTX_PATH+"/static/images/ok.png' style='float: left;'/>");
		okMsg.append("<div style='float: left;padding-left: 5px;width:220px;margin-top: 10px;'>" + msg+ "</div>");
		$.messager.alert("提示", okMsg.toString(), null, callback);
		$('.messager-window .panel-tool-close').click(callback);
	};

	HgUi.error = function(msg, callback) {
		var okMsg = new StringBuffer();
		okMsg.append("<img src='"+G_CTX_PATH+"/static/images/error.png' style='float: left;'/>");
		okMsg.append("<div style='float: left;padding-left: 5px;width:220px;margin-top: 10px;'>" + msg + "</div>");
		$.messager.alert("错误", okMsg.toString(), null, callback);
        $('.messager-window .panel-tool-close').click(callback);
	};

	HgUi.notice = function (msg, callback) {
        var okMsg = new StringBuffer();
        okMsg.append("<div class=\"messager-icon messager-info\" style='float: left;'></div>");
        okMsg.append("<div style='float: left;padding-left: 5px;width:210px;margin-top: 10px;'>" + msg+ "</div>");
        $.messager.alert("通知", okMsg.toString(), null, callback);
        $('.messager-window .panel-tool-close').click(callback);
    };
    
    HgUi.alert = function(msg, callback) {
		var okMsg = new StringBuffer();
		okMsg.append("<img src='"+G_CTX_PATH+"/static/images/alert.png' style='float: left;'/>");
		okMsg.append("<div style='float: left;padding-left: 5px;width:220px;margin-top: 10px;'>" + msg+ "</div>");
		$.messager.alert("提示", okMsg.toString(), null, callback);
        $('.messager-window .panel-tool-close').click(callback);
	};
	
	HgUi.confirm = function(title,msg,callback){
		$.messager.confirm(title, "<div style='margin-top:10px'>"+msg+"</div>",callback);
	}
    
	/****************************************************************************************************************
	 * tab组件
	 * 包含的tab方法：add,commonAdd,closeCurrent,closeAll
	 ****************************************************************************************************************/
	HgUi.Tab = function(tabId) {
		if (!tabId) {
			this.tab = $("#tab");
		} else {
			this.tab = $("#"+tabId);
		}		
	};

	/**
	 * 增加一个tab(不覆盖相同标题的)
	 * @param title
	 * @param url
	 * @param type
	 * @param icon
	 */
	HgUi.Tab.prototype.add = function(title, url, type, icon) {
		var addObj = {title : title, closable : true};
		if (icon) addObj.icon = icon;
		this.tab.tabs("add", addObj);
		if (type == 'iframe') {
			var subtab = tab.tabs('getSelected');
			var content = '<iframe scrolling="auto" frameborder="0"  src="'
					+ url + '" style="width:100%;height:100%;"></iframe>';
			this.tab.tabs('update', {
				tab : subtab,
				options : {
					content : content
				}
			});
		} else {
			url = G_CTX_PATH + url;
			this.tab.tabs('getSelected').panel("refresh", url);
		}
	};


	/**
	 *  增加一个tab(覆盖相同标题的)
	 * @param title
	 * @param url
	 * @param type
	 * @param icon
	 */
	HgUi.Tab.prototype.commonAdd = function(title, url, type, icon) {
		if (this.tab.tabs("exists", title)) {
			this.tab.tabs("select", title);
		} else {
			this.add(title, url, type, icon);
		}
	};
	
	
	/**
	 * 关闭当前的tab选项卡
	 * @param isRemainOne 是否留下仅有的一个
	 */
	HgUi.Tab.prototype.closeCurrent = function(isRemainOne) {
		var currentTab = this.tab.tabs('getSelected');
		var currentIndex = this.tab.tabs('getTabIndex',currentTab);
		if (isRemainOne) {
			if (currentIndex != 0) {
				this.tab.tabs("close",currentIndex);
			}
		} else {
			this.tab.tabs("close",currentIndex);
		}
		this.tab.tabs("select",currentIndex-1);	
	};

	/**
	 * 关闭所有tab的选项卡
	 * @param isRemainOne 是否留下仅有的一个
	 */
	HgUi.Tab.prototype.closeAll =  function(isRemainOne) {
		var titles = [];
		var tab = this.tab;
		var tabs = this.tab.tabs("tabs");
		HgUi.confirm("关闭确认", "是否关闭所有的选项卡？",function(r){
			if(r){
				for (var i=0;i<tabs.length;i++) {
					if (isRemainOne) {
						if (i!=0) {
							titles.push(tabs[i].panel('options').title);  
						}
					}			
				}
				for(i=0;i<titles.length;i++){
					tab.tabs('close', titles[i]);  
		        }
			}
		})
	};
	
	/**
	 * 刷新当前选项卡
	 */
	HgUi.Tab.prototype.refreshCurrent = function() {
		this.tab.tabs('getSelected').panel("refresh");
	};
	
	/****************************************************************************************************************
	 * datagrid组件
	 * 包含的datagrid方法：
	 ****************************************************************************************************************/	
	/**
	 * 表格
	 * @param gridId 表格id
	 * 
	 */
	HgUi.Datagrid = function(gridId) {
		this.grid = $("#"+gridId);
		this.isEditing = false;
		this.editingIndex = 0;
		this.selectedRow = null;
		this.toolbar = null;
		this.insertRow = {};
		this.options =  {};
		this.mode = null;
		this.makeSubmitData = null;
		//是否校验行编辑模式的双击修改权限。
		this.checkUpdateAuth = false;
	};

	/**
	 * 初始化设置
	 */
	HgUi.Datagrid.prototype.init = function() {
		var me = this;
		var initOpts = {
				remoteFilter:true,
				filterPosition:"top",
				filterBtnIconCls:"icon-filter",
				//默认菜单对象名。
				defaultContextMenuId:"rowContextMenu",
				//是否显示关于菜单。
				contextMenuAboutHidden:false,
				//提示列
				tipCells:[]
		};
		if (this.options) {
			//保存按钮
			me.options.saveBtn = me.toolbar ? me.toolbar.find("[tag=save]") : [];
			//修改按钮
			me.options.updateBtn = me.toolbar ? me.toolbar.find("[tag=update]") : [];
			$.extend(initOpts,me.options);
			if (this.options.isShowContextMenu) { //右键菜单
				initOpts.onRowContextMenu = this.rowContextMenu;
			}
			initOpts.onClickCell = function(rowIndex, field, value) {
				me.onClickCell.call(me,rowIndex, field, value);
				if (me.options.onClickCell) {
					me.options.onClickCell(rowIndex, field, value);
				}
			};
			initOpts.onSelect = function(index,row) {
				if (me.mode == 'rowEdit') {
					//行自动保存
					if (me.isEditing) {
						if (me.editingIndex != index) {
							//如果有保存按钮，则支持行编辑保存
							if (me.options.saveBtn.length > 0) {
								HgUi.confirm("确认保存", "是否保存编辑状态的数据？",function(r){
									if(r){
										me.options.saveBtn.click();
									}
								})
							}
						}
					}										
				}
				if (me.options.onSelect) {
					me.options.onSelect(index,row);
				}
			};
			initOpts.onLoadSuccess = function(data) {
				me.isEditing = false;
				me.editingIndex = 0;
				me.showGridCellTip.call(me,initOpts.tipCells);
				if (me.options.onLoadSuccess) {
					me.options.onLoadSuccess(data);
				}				
			};
			initOpts.onResizeColumn = function(field,width) {
				me.onResizeColumn.call(me,field,width);
				if (me.options.onResizeColumn) {
					me.options.onResizeColumn(field,width);
				}
			};
			initOpts.onBeforeLoad = function(param) {
				$(me.grid).parents(".easyui-datagrid-layout").show();
//				if (me.isEditing == true) {
//					me.showMsgbox("alert","有一条数据正在编辑状态，请先保存或撤销!",300);
//					return false;
//				}
				if (me.options.onBeforeLoad) {
					return me.options.onBeforeLoad(param);
				}
				return true;
			};
			initOpts.onBeginEdit = function(index,row) {
				if (me.options.onBeginEdit) {
					me.options.onBeginEdit(index,row);
				}
			};
			
			//行编辑模式下
			if (this.mode == 'rowEdit') {
				initOpts.onDblClickCell = function(index, field){
					me.onDblClickCell.call(me,index,field);
				}
			}
		}
		this.grid.datagrid(initOpts);
	};
	
	/**
	 * 行编辑模式下的双击事件
	 * @param index
	 * @param field
	 */
	HgUi.Datagrid.prototype.onDblClickCell = function(index, field) {
		//允许自定义允许编辑之前事件
		if (this.options.onDblClickCell && !this.options.onDblClickCell(index, field)){
			return;
		}
		
		//如果 校验双击修改权限 且 没有修改按钮，则不支持行编辑
		if (this.checkUpdateAuth && this.options.updateBtn.length < 1) {
			return;
		}
		
		if (this.isEditing == false) {		
			var editRow = this.grid.datagrid("getRows")[index];
			if (editRow && editRow.isFinal == 1){
				this.showMsgbox("alert","本条记录不可修改!",180);
				return;
			}
			this.editingIndex = index;			
			this.grid.datagrid("beginEdit", index);
			this.isEditing = true;
		} else {
			this.showMsgbox("alert","有一条数据未保存!",180);
		}
	};
	
	/**
	 * 默认绑定的工具条事件
	 */
	HgUi.Datagrid.prototype.bindDefaultToolbarEvent = function() {
		if (!this.toolbar) return;
		var me = this;
		//绑定新增
		this.toolbar.find("[tag=add]").click(function(){
			var inforow = me.grid.datagrid('getSelected');
			if(inforow){
				me.grid.datagrid('clearSelections');
			}
			if (me.isEditing == false) {
				me.grid.datagrid("insertRow", {index : 0,row : me.insertRow});
				me.editingIndex = 0;
				me.grid.datagrid("beginEdit", 0);
				me.focusFirstEditEle.apply(me);
				me.isEditing = true;
			} else {
				me.showMsgbox("alert","有一条数据未保存!",180);
			}
		});
		//绑定撤销
		this.toolbar.find("[tag=undo]").click(function(){
			if(me.isEditing == true){
				me.grid.datagrid('rejectChanges');
				me.isEditing = false;
			} else {
				me.showMsgbox("alert","没有需要撤销的数据!",180);
			}
		});
		//绑定保存
		this.toolbar.find("[tag=save]").click(function(){
			if(me.isEditing == false){
				me.showMsgbox("alert","没有需要保存的数据!",180);
			}
		});
	};
	
	/**
	 * 单元格点击事件。
	 * @param rowIndex
	 * @param field
	 * @param value
	 */
	HgUi.Datagrid.prototype.onClickCell = function(rowIndex, field, value) {
		
	}
	
	HgUi.Datagrid.prototype.onResizeColumn = function(field,width){
		//console.log("resize");
	}
	
	/**
	 * 通用右键菜单
	 * @param e
	 * @param rowIndex
	 * @param rowData
	 */
	HgUi.Datagrid.prototype.rowContextMenu = function(e, rowIndex, rowData){
		e.preventDefault();
		if (rowIndex == -1){
			return;
		}
		if (rowIndex != $(this).datagrid('getRowIndex',$(this).datagrid('getSelected'))){
			$(this).datagrid('selectRow',rowIndex);
		}
		var me = $(this).datagrid("options");
		//var opts = $(this).datagrid('columns');
		var id = rowData.id;
		var contextMenuObj = $('#'+me.defaultContextMenuId);
		var copyCellId = "contextMenuCopyCell";
		var copyRowId = "contextMenuCopyRow";
		var aboutId = "contextMenuAbout";
		
		removeMenuItem(contextMenuObj,copyCellId);
		contextMenuObj.menu('appendItem', {
			id : copyCellId,
        	text: '复制单元格数据',
        	iconCls: 'icon_info',
        });
		//console.log(e);
		var text = $(e.target).hasClass("datagrid-cell")?$(e.target).html():" ";
		HgUtil.bindClipboard($('#'+copyCellId), text);
		
		removeMenuItem(contextMenuObj,copyRowId);
		contextMenuObj.menu('appendItem', {
			id : copyRowId,
        	text: '复制行数据',
        	iconCls: 'icon_info',
        });
		var clipData = "";
		for(var key=0; key<me.columns[0].length; key++){
			if (!me.columns[0][key].hidden){
				var text = HgUtil.getValueByKey(rowData, me.columns[0][key].field);
				if (me.columns[0][key].formatter){
					text = me.columns[0][key].formatter(text,rowData,rowIndex);
				}
				clipData += ((clipData.length ==0) ? "":" ; ") + (text?text:"");
			}
		}
		HgUtil.bindClipboard($('#'+copyRowId), clipData);
		
		removeMenuItem(contextMenuObj,aboutId);
		if (!me.contextMenuAboutHidden && me.aboutUrl){
			contextMenuObj.menu('appendItem', {
				id : aboutId,
	        	text: '关于本条记录',
	        	iconCls: 'icon_info',
	        	onclick: function(){
	        		HgUtil.aboutDialog(me.aboutUrl,{
	        			id:rowData.id
	        		});
	        	}
	        });
		}

		contextMenuObj.menu('show', {
			left:e.pageX,
		    top:e.pageY
		});
	};
	
	var removeMenuItem = function(contextMenuObj , id){
		var item = contextMenuObj.menu('getItem', contextMenuObj.find('#' + id));
		if (item.id){
			contextMenuObj.menu('removeItem' , contextMenuObj.find('#' + id) );
		}
	}
	

	/**
	 * 显示提示框
	 * @param type
	 * @param message
     * @param width
	 */
	HgUi.Datagrid.prototype.showMsgbox = function(type,message,width) {
		var str = new StringBuffer();
		str.append("<div style='float:left;'>");
		if (type == 'alert') {
			str.append("<img  src='"+ G_CTX_PATH + "/static/images/alert.gif'/>");
		} else if (type == 'error') {
			str.append("<img  src='"+ G_CTX_PATH + "/static/images/cancel.gif'/>");
		}
		str.append("</div>");
		str.append("<div style='float:left;'>");
		str.append("    &nbsp;"+message);
		str.append("</div>");
		
		this.grid.datagrid("getPanel").block({
			message : str.toString(),
			overlayCSS : {backgroundColor : "#fff;",opacity : 0},
			css : {padding : '10px',width : width+"px",height : "20px",top : "0px", left : "0px", color : "red", border : 'solid red 2px',backgroundColor : "#fff;", opacity : 1},
			fadeIn : 1000,
			timeout : 1500
		});
	};
	
	/**
	 * 生成合并单元格的数组
	 * @param field 需要合并的列名称
	 */
	HgUi.Datagrid.prototype.crtMergeCellsAry = function(field) {
		var mergeAry = [];
		var dataAry = [];
		this.grid.datagrid({});
		this.grid.datagrid("getPanel").find("tr.datagrid-row").each(function(){
			var index = $(this).attr("datagrid-row-index");
			var thisTagId = $(this).find("td[field='"+field+"']").text();
			if (thisTagId) {
				dataAry.push({index:index,tagId:thisTagId});
			}
			
		});
		var total = dataAry.length;
		var index = 0
		for (var i=index;i<total;i++) {
			var rowspan = 1;
			for (var j=i+1;j<total;j++) {
				if (dataAry[j].tagId == dataAry[i].tagId) {
					rowspan = rowspan+1;
				}
				
			}
			mergeAry.push({index:i,rowspan:rowspan});
			index = i+rowspan;
		}
		
		return mergeAry;
	};
	
	/**
     * EasyUI DataGrid根据字段动态合并单元格,
     * @author yinyanzhen
     * @param tTable 直接输入datagrid的jquery对象:$("#xxlayout #xxdatagrid")
     * @param colList 要合并的列字符串,用逗号分隔(例如："name,code"),由前向后合并
     */
     HgUi.mergeDatagridCellsByFieldsStr=function (tTable, colList) {
         var ColArray = colList.split(",");
         var TableRowCnts = tTable.datagrid("getRows").length;
         var tmpA;
         var tmpB;
         var PerTxt = "";
         var CurTxt = "";
         for (j = ColArray.length - 1; j >= 0; j--) {
             PerTxt = "";
             tmpA = 1;
             tmpB = 0;

             for (i = 0; i <= TableRowCnts; i++) {
                 if (i == TableRowCnts) {
                     CurTxt = "";
                 }
                 else {
                     CurTxt = tTable.datagrid("getRows")[i][ColArray[j]];
                 }
                 if (PerTxt == CurTxt) {
                     tmpA += 1;
                 }
                 else {
                     tmpB += tmpA;
                     
                     tTable.datagrid("mergeCells", {
                         index: i - tmpA,
                         field: ColArray[j],//合并字段
                         rowspan: tmpA,
                         colspan: null
                     });
                     tTable.datagrid("mergeCells", { //根据ColArray[j]进行合并
                         index: i - tmpA,
                         field: "Ideparture",
                         rowspan: tmpA,
                         colspan: null
                     });
                    
                     tmpA = 1;
                 }
                 PerTxt = CurTxt;
             }
         }
     }

	/**
	 * 获取编辑行表单数据
	 */
	HgUi.Datagrid.prototype.getEditorsData = function(){
		var data={};
		var editors = this.grid.datagrid('getEditors',this.editingIndex );
		for(var i = 0; i < editors.length; i++){
			var editor = editors[i];
			eval("data['"+editor.field+"'] = $(editor.target)."+editor.type+"('getValue')");
		}
		return data;
	};
	
	/**
	 * 编辑行第一个ele获取焦点
	 */
	HgUi.Datagrid.prototype.focusFirstEditEle = function(){
		var editors = this.grid.datagrid('getEditors',this.editingIndex );
		var firstEditor = editors[0];
		$(firstEditor.target).next('span').find('input').focus();	
	};
	
	/**
	 * 获取编辑行表单数据（指定获取哪些字段）
	 * @param fields [field1,field2,...]
	 */
	HgUi.Datagrid.prototype.getEditorData = function(fields){
		var data={};
		for(var i in fields){
			var editor = this.grid.datagrid('getEditor', {
				index : this.editingIndex,
				field : fields[i]
			});
			eval("data['"+editor.field+"'] = $(editor.target)."+editor.type+"('getValue')");
		}
		return data;
	};
	/**
	 * 单选弹窗时显示"双击选择"
	 */
	HgUi.Datagrid.prototype.tipDblClick = function(){
		var gridTd = this.grid.datagrid("getPanel").find(".datagrid-row td");
		gridTd.tooltip({
			content : "<span style='color:green;'>双击选择</span>"
		});
	};
	
	
	//cell显示提示框
	HgUi.Datagrid.prototype.showGridCellTip = function(fieldNames) {
		if (!(fieldNames instanceof Array)){
			return;
		}
		for (var index in fieldNames){
			var fieldName = fieldNames[index];
			var cellObj = this.grid.datagrid("getPanel").find(".datagrid-body td[field='" + fieldName + "']");
			HgUi.showCellObjTip(cellObj);
		}
	};
	
	/**
	 * cell对象上显示tip
	 */
	HgUi.showCellObjTip = function(cellObj) {
		var width = cellObj.width();
		cellObj.each(function(i) {
			var text = $(this).text();
			//将字符转译,防脚本攻击yyzh
			text = text.replace(/[<>&"]/g,function(c){return {'<':'&lt;','>':'&gt;','&':'&amp;','"':'&quot;'}[c];});
			var cellObj = $(this).children()[0];
			if (text && cellObj.offsetWidth < cellObj.scrollWidth) {
				var content = "<div style='width:"+width+"px;word-wrap: break-word; word-break: normal; '>"+text+"</div>";
				$(this).tooltip({
					content : content,
					position :"top",
					onShow:function(){
						var tip_ = $(this);
						tip_.tooltip('tip').unbind().bind('mouseenter', function(){
							tip_.tooltip('show');
						}).bind('mouseleave', function(){
							tip_.tooltip('hide');
						});
					}
				});
			}
		});
	}
	
	/**
	 * datagrid显示cell tip
	 * gridId:唯一
	 */
	HgUi.showGridCellTip = function(gridId, fieldNames) {
		if (!(fieldNames instanceof Array)){
			return;
		}
		for (var index in fieldNames){
			var fieldName = fieldNames[index];
			var cellObj = $("#" + gridId).datagrid("getPanel").find(".datagrid-body td[field='" + fieldName + "']");
			HgUi.showCellObjTip(cellObj);
		}
	};
	
	/****************************************************************************************************************
	 * Window组件
	 ****************************************************************************************************************/
	HgUi.window = function(option) {
		var defaults = {
			width : 600,
			height : 400,
			modal : true,
			minimizable : false,
			maximizable : false,
			collapsible : false,
			resizable : false,
			iconCls : "icon_auto_colorful__editmenu"
		};
		var _$winObj = $("#" + option.id);
		if (_$winObj.length == 0) {
			_$winObj = $("<div id='" + option.id + "'></div>");
		}
		var _$winOpts = $.extend({}, defaults, option || {});
		//弹窗关闭时同时销毁该窗体 
		_$winOpts.onClose = function() {
			if(option.onClose){
				option.onClose();
			}
			$("#" + option.id).window('destroy');
		}
		var win = _$winObj.window(_$winOpts).window("open");
		if (option.url)
			win.window("refresh", G_CTX_PATH + option.url);
		return win;
	};
	
	/**
	 * 根据layOutId,关闭弹窗
	 * @param layOutId
	 */
	HgUi.closeWinByLayOutId = function(layOutId){
		$("#"+layOutId).layout().parent().window("close");
	};

	/****************************************************************************************************************
	 * Dialog组件
	 ****************************************************************************************************************/
	HgUi.dialog = function(option) {
		var defaults = {
			width : 600,
			height : 400,
			modal : true,
			minimizable : false,
			maximizable : false,
			collapsible : false,
			resizable : false,
			iconCls : "icon_browser_16"
		};
		var _$dialogObj = $("#" + option.id);
		if (_$dialogObj.length == 0) {
			_$dialogObj = $("<div id='" + option.id + "'></div>");
		}
		option = $.extend({}, defaults, option || {});
		if (option.url && !option.href){
			option.href = G_CTX_PATH + option.url;
		}
		return _$dialogObj.dialog(option);
	};

	/**
	 * 绑定查询栏的折叠和隐藏
	 */
	HgUi.toggleSearchBar = function(parentId,showCallback,hideCallback) {
		$("#"+parentId+" [tag=expandQuery]").click(function() {
			var queryDiv = $("#"+parentId+" [tag=queryDiv]");
			if (queryDiv.is(":hidden")) {
                queryDiv.show(function() {
					if (showCallback) showCallback();
				});
				$(this).linkbutton({
					text : "收起查询"
				});
			} else {
                queryDiv.hide(function() {
					if (hideCallback) hideCallback();
				});
				$(this).linkbutton({
					text : "展开查询"
				});
			}
		});
		
	};

	HgUi.showIconsWin = function(callback) {
		var chooseIconUrl = "/sys/sysIcon/chooseIconView";
		var chooseIconWin = new HgUi.window({
			id:"chooseIconWin",
			width:700,
			height:480,
			title:"选择图标",
			iconCls:'icon_receive',
			url:chooseIconUrl
		});
		window.sysIconsWinListCallback = callback;
	};
	
	/**
	 * easyui datebox 拓展
	 */
	HgUi.dateboxButtons = $.extend([], $.fn.datebox.defaults.buttons);
	HgUi.dateboxButtons.splice(1, 0, {
		text : '清空',
		handler : function(target) {
			$(target).datebox("setValue", "");
			$(this).closest("div.combo-panel").panel("close");
		}
	});
	
})();



