$(function() {
	//2017-03-08 使用个性化设置的主题
	var nowTheme = G_THEME_COLOR;
	/*var nowTheme = $.cookie('easyuiThemeName');
	if (nowTheme) {
		changeThemeFun(nowTheme);
	}*/ 
	
	//背景皮肤切换
	$('.colorList dd').mouseenter(function() {
		var $bgcolor = $(this).children('span').css('background-color');
		$(this).children('span').css("border-color", $bgcolor);
	});

	$('.colorList dd').mouseleave(function() {
		$(this).children('span').css("border-color", "#fff");
	});
	
	$('#colorSelect').hover(function(){
		$('.bgSet').show();
	});
	
	$("body").click(function(){
		$('.bgSet').hide();
	});
	$(".colorList dd").each(function(){
		var value = $(this).find("span").attr("value");
		if (value == nowTheme) {
			$(this).addClass("activeColor").siblings().removeClass("activeColor");
		}
	});

	$('.colorList dd').click(function() {
		$(this).addClass("activeColor").siblings().removeClass("activeColor");
		$('.bgSet').hide();
		var theme = $(this).find("span").attr("value");
		editColor(theme);
		changeThemeFun(theme);
	});
		
	
	function changeThemeFun(theme) {
		var link = $('#easyuiTheme');
		link.attr('href', G_CTX_PATH + '/plugins/jquery-easyui/themes/' + theme
				+ '/easyui.css');

		//2017-03-08 使用个性化设置的主题
		/*$.cookie('easyuiThemeName', theme, {
			expires : 7
		});*/
	}
	
	function editColor(theme) {
		var submitUrl = "/sys/sysPersonal/personalSetting/update/themeColor/" + theme;
		HgUtil.post(submitUrl, {}, function(data) {
			if (!data.success) {
			} else {
				var sysUserProfileGrid = new HgUi.Datagrid("sysUserProfile_grid");
				sysUserProfileGrid.grid.datagrid('reload');
			}
		});
	}

});
