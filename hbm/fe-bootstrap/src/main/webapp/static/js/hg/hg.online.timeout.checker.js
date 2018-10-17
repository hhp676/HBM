/**
 * 用户在线活跃检测，超过设置时间自动退出。
 */

var onlineTimeoutChecker = {};
/**
 * 初始化用户活跃检测对象
 */
onlineTimeoutChecker.init = function (activeTimeoutNumber)
{
	onlineTimeoutChecker.container = "body";
	onlineTimeoutChecker.cookieName = "lastActiveTime";
	onlineTimeoutChecker.configValue = activeTimeoutNumber;
	onlineTimeoutChecker.updateLastActiveTime ();
}

/**
 * 获取用户最后活跃时间
 */
onlineTimeoutChecker.getLastActiveTime = function ()
{
	var lastActiveTime = parseInt ($.cookie (onlineTimeoutChecker.cookieName));
	return lastActiveTime;
}

/**
 * 更新用户最后活跃时间
 */
onlineTimeoutChecker.updateLastActiveTime = function ()
{
	var now = (new Date ()).getTime ();
	$.cookie (onlineTimeoutChecker.cookieName, now,
	{
		expires : 7
	});
	// console.debug("setLastActiveTime--" + now);
}

/**
 * 用户活跃检测
 */
onlineTimeoutChecker.intervalFunction = function ()
{
	var now = (new Date ()).getTime ();
	if (now - onlineTimeoutChecker.getLastActiveTime () > onlineTimeoutChecker.configValue * 1000)
	{
		// 执行退出操作
		$.get (G_CTX_PATH + "/logout?etc=" + new Date ().getTime (), {}, function ()
		{
			onlineTimeoutChecker.callback();
		});
		//console.debug ("active timeout!--" + now);
		clearInterval (onlineTimeoutChecker.intervalID);
		return;
	}
	$ (onlineTimeoutChecker.container).one ("mousemove", function ()
	{
		onlineTimeoutChecker.updateLastActiveTime ();
	})
}
