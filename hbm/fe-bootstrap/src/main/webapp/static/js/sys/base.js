/**
 * base.js
 */
$ (document).ready (function ()
{
	$ ('.colorpick-btn').click (function ()
	{
		var themeColor = $ (this).css('background-color');
		GLO_UPDATE_THEME(themeColor);
		var themeName = $ (this).attr('bsColor');
		HgUtil.getJson("/sys/sysPersonal/personalSetting/update/themeColor/"+themeName,{},function(data){});
		return false;
	});
	$ ('.secondList dd').hover (function ()
	{
		$ (this).addClass ('on');
		$ (this).children ('.threeMenuBox').show ();
	}, function ()
	{
		$ (this).removeClass ('on');
		$ (this).children ('.threeMenuBox').hide ();
	});
	
	$ ('.tabul li').hover (function ()
	{
		$ (this).children ('.secondMenuBox').show ();
	}, function ()
	{
		$ (this).children ('.secondMenuBox').hide ();
	});
	

	$("#topMenu li").click(function(){
		var modelId = $(this).attr("modelId");
		var modelName = $ (this).text ();
		$("#sidebar .sidebar-menu").load(G_CTX_PATH + "/sys/common/indexLeftNavi/" + modelId);
		$("#topMenu li").removeClass("active");
		$(this).addClass("active");
	});
	
	
	$("#sidebar").on('click',"a", function() {
		var iconCls = $(this).find("i").attr("class");
    	var hgUri = $(this).attr("hgUri");
    	if (hgUri){
    		tab.commonAdd($(this).text(),hgUri,null,iconCls);
    	}
    })
    
    $("#tab-tools a.refresh").click(function(){
    	tab.refreshCurrent();
    });
	$("#tab-tools a.tab-close").click(function(){
    	tab.closeCurrent(true);
    })
    $("#tab-tools a.sidebar-toggler").click(function(){
    	$('#main-content').resize();
    })
    $("#sidebar-collapse").on('click', function () {
    	$('#main-content').resize();
    })
    
    function resize(){
		$("#main-content").css("height",$(window).height()-$("#main-content").offset().top);
	}
    $(window).resize(function() {
    	resize();
    });
    $('#main-content').resize();
	
});

function GLO_UPDATE_THEME(themeName){
	$ ('.navbar-inner').css ('background-color', themeName);
}
