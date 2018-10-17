/**
 * hongguaninfo common components
 * 
 * @author shichengqun
 */

 
(function(){
	
	
	
	if (typeof(HgCommon) == "undefined") {
		HgCommon = {};
	}
	
	/**
	 * 开启websocket,
	 * @param client websocket客户端
	 * @param destination 订阅地址
	 * @param callback 订阅,消息取得后回调函数
	 * @author yinyanzhen
	 */
	HgCommon.webSocketConnect = function(client,destination, callback){
		//不存在client时创建
		if (!client){
			var websocket = new SockJS(G_CTX_PATH+"/sockjs/stomp");
			client = Stomp.over(websocket);
		}
		client.connect({}, function () {
			client.subscribe(destination, function (msg) {
				callback(client,msg);
			});
		}, function(error) {
			//掉线重连
	        if (!client.connected) {
	        	setTimeout(function() {
	        		HgCommon.webSocketConnect(client,destination,callback);
	            }, 10 * 1000);
	        }
		})
	}
	
	/**
	 * 编辑用户
	 * @userId 
	 * @callback : callback()，无参数
	 */
	HgCommon.editSysUser = function (userId, callback) {
		return new HgUi.window({
			id : "userDetailWin",
			width : 920,
			height : 600,
			title : "修改用户",
			iconCls : "fa fa-edit",
			url : "/sys/sysUser/detail/view/edit/"+userId,
			editCallback : callback
		});
	};
	
	/**
	 * 编辑用户
	 * @userId 
	 * @callback : callback()，无参数
	 */
	HgCommon.delSysUser = function (userId, callback) {
		$.messager.confirm("确认删除", "确认删除此用户?<br/>该动作将同时删除该用户设置的关联信息!", function(r){
			if (r) {
				HgUtil.getJson("/sys/sysUser/delUser",{userId:userId},function(data){
					$("#userDetailWin").window("close");
					HgUi.ok("删除成功!",function(){
						if (callback) {
							callback();
						}
					});	
				});
				
			}
		});
	};
	
	
	
})();