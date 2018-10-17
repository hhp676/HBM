<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Viewport metatags -->
<meta name="HandheldFriendly" content="true" />
<meta name="MobileOptimized" content="320" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/error/dandelion.css"  media="screen" />
<title>error</title>

</head>
<body>
	<!-- Main Wrapper. Set this to 'fixed' for fixed layout and 'fluid' for fluid layout' -->
	<div id="da-wrapper" class="fluid" style="background-image:url(${ctx}/static/images/error/blueprint.png);">
        <!-- Content -->
        <div id="da-content" >
            <!-- Container -->
            <div class="da-container clearfix" >
            	<div id="da-error-wrapper"  >
                	<h1 class="da-error-heading">${msg }！</h1>
                </div>
            </div>
        </div>
    </div>
    <style  >
 
body {
    background-color: #f2f2f2;
    color: #444;
    font: 12px/1.5 'Helvetica Neue',Arial,Helvetica,sans-serif;
    background-image:url(${ctx}/static/images/error/blueprint.png);
}
div#da-wrapper, div#da-wrapper.fluid {
    width: 100%;
}
div#da-wrapper {
    height: auto;
    min-height: 100%;
    position: relative;
    min-width: 320px;
}
 
a, abbr, acronym, address, applet, article, aside, audio, b, big, blockquote, body, canvas, caption, center, cite, code, dd, del, details, dfn, dialog, div, dl, dt, em, embed, fieldset, figcaption, figure, font, footer, form, h1, h2, h3, h4, h5, h6, header, hgroup, hr, html, i, iframe, img, ins, kbd, label, legend, li, mark, menu, meter, nav, object, ol, output, p, pre, progress, q, rp, rt, ruby, s, samp, section, small, span, strike, strong, sub, summary, sup, table, tbody, td, tfoot, th, thead, time, tr, tt, u, ul, var, video, xmp {
    border: 0;
    margin: 0;
    padding: 0;
    font-size: 100%;
}
 
 
div#da-wrapper .da-container, div#da-wrapper.fluid .da-container {
    width: 96%;
    margin: auto;
     height: auto;
}
div#da-error-wrapper {
     
    padding: 80px 0;
    margin: auto;
    position: relative;
     height: auto;
}
 
 
div#da-error-wrapper .da-error-heading {
    color: #e15656;
    text-align: center;
    font-size: 24px;
    font-family: Georgia,"Times New Roman",Times,serif;
}
 
</style>
</body>
</html>