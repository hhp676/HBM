(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else if (typeof module === "object" && module.exports) {
		module.exports = factory( require( "jquery" ) );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: ZH (Chinese, 中文 (Zhōngwén), 汉语, 漢語)
 */
$.extend( $.validator.messages, {
	required: "必填",
	remote: "请修正此字段",
	email: "邮件格式不符合(用户名@域名)",
	url: "无效的网址",
	date: "无效的日期",
	dateISO: "日期格式错误",
	number: "请输入有效数字",
	digits: "只能输入整数",
	creditcard: "错误的信用卡号码",
	equalTo: "输入值不相同",
	extension: "无效的后缀",
	maxlength: $.validator.format( "最多 {0}字符" ),
	minlength: $.validator.format( "最少{0}字符" ),
	rangelength: $.validator.format( "长度需要在{0}到 {1}之间" ),
	range: $.validator.format( "数值必须在{0}到{1}之间" ),
	max: $.validator.format( "最大值为:{0}" ),
	min: $.validator.format( "最小值为:{0}" )
} );

}));