<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="easyui-layout" fit=false id="icon_layout"
		style="padding: 6px;">
		<div class="tabbable">
			<ul class="nav nav-tabs" id="myTab">
				<li class="active"><a data-toggle="tab" href="#iconFontAwesome">
						FontAwesome </a></li>

				<li class="tab-red"><a data-toggle="tab" href="#iconGlyphicon">
						Glyphicon </a></li>
				<li class="tab-red"><a data-toggle="tab" href="#iconTypicons">
                        Typicons </a></li>		
				<li class="tab-red"><a data-toggle="tab" href="#iconWeather">
                        Weather </a></li>

			</ul>

			<div class="tab-content">
				<div id="iconFontAwesome" class="tab-pane in active">
					<div class="row searchhelpbar">
						<div class="col-sm-8 help-box">
							<div
								class="alert alert-info alert-radius-bordered alert-shadowed">
								<p>
									Place Font Awesome icons just about anywhere with the
									<code>&lt;i&gt;</code>
									tag.
								</p>
								<p>
									<code>
										<span class="nt">&lt;i</span> <span class="na">class=</span><span
											class="s">"fa fa-camera-retro"</span><span class="nt">&gt;&lt;/i&gt;</span>

									</code>
								</p>
							</div>
						</div>
						<div class="col-sm-4 search-box">
							<div>
								<span class="input-icon"> <input type="text"
									class="form-control" id="fontawsome-search"
									placeholder="Search"> <i
									class="glyphicon glyphicon-search circular blue"></i>
								</span>
							</div>
						</div>
					</div>
					<div class="horizontal-space space-sm"></div>
					<!--Row-->
					<div class="row">
						<div class="col-sm-12">
							<div class="widget">
								<div class="widget-header bordered-top bordered-blue">
									<span class="widget-caption">FontAwesome Icons 4.0</span>
									<div class="widget-buttons">
									</div>
								</div>
								<div class="widget-body">
									<div id="fontawesome-container">
										<section id="new">
										<h4>40 New Icons in 4.3</h4>


										<div class="row fontawesome-icon-list">



											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bed"></i> bed
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-buysellads"></i> buysellads
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cart-arrow-down"></i> cart-arrow-down
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cart-plus"></i> cart-plus
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-connectdevelop"></i> connectdevelop
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-dashcube"></i> dashcube
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-diamond"></i> diamond
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-facebook-official"></i> facebook-official
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-forumbee"></i> forumbee
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-heartbeat"></i> heartbeat
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-hotel"></i> hotel <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-leanpub"></i> leanpub
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-mars"></i> mars
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-mars-double"></i> mars-double
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-mars-stroke"></i> mars-stroke
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-mars-stroke-h"></i> mars-stroke-h
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-mars-stroke-v"></i> mars-stroke-v
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-medium"></i> medium
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-mercury"></i> mercury
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-motorcycle"></i> motorcycle
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-neuter"></i> neuter
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-pinterest-p"></i> pinterest-p
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-sellsy"></i> sellsy
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-server"></i> server
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-ship"></i> ship
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-shirtsinbulk"></i> shirtsinbulk
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-simplybuilt"></i> simplybuilt
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-skyatlas"></i> skyatlas
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-street-view"></i> street-view
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-subway"></i> subway
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-train"></i> train
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-transgender"></i> transgender
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-transgender-alt"></i> transgender-alt
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-user-plus"></i> user-plus
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-user-secret"></i> user-secret
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-user-times"></i> user-times
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-venus"></i> venus
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-venus-double"></i> venus-double
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-venus-mars"></i> venus-mars
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-viacoin"></i> viacoin
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-whatsapp"></i> whatsapp
											</div>

										</div>

										</section>
										<hr class="wide" />
										<section id="web-application">
										<h4>Web Application Icons</h4>

										<div class="row fontawesome-icon-list">



											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-adjust"></i> adjust
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-anchor"></i> anchor
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-archive"></i> archive
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-area-chart"></i> area-chart
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-arrows"></i> arrows
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-arrows-h"></i> arrows-h
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-arrows-v"></i> arrows-v
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-asterisk"></i> asterisk
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-at"></i> at
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-automobile"></i> automobile <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-ban"></i> ban
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bank"></i> bank <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bar-chart"></i> bar-chart
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bar-chart-o"></i> bar-chart-o <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-barcode"></i> barcode
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bars"></i> bars
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bed"></i> bed
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-beer"></i> beer
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bell"></i> bell
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bell-o"></i> bell-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bell-slash"></i> bell-slash
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bell-slash-o"></i> bell-slash-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bicycle"></i> bicycle
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-binoculars"></i> binoculars
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-birthday-cake"></i> birthday-cake
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bolt"></i> bolt
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bomb"></i> bomb
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-book"></i> book
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bookmark"></i> bookmark
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bookmark-o"></i> bookmark-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-briefcase"></i> briefcase
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bug"></i> bug
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-building"></i> building
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-building-o"></i> building-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bullhorn"></i> bullhorn
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bullseye"></i> bullseye
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bus"></i> bus
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cab"></i> cab <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-calculator"></i> calculator
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-calendar"></i> calendar
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-calendar-o"></i> calendar-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-camera"></i> camera
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-camera-retro"></i> camera-retro
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-car"></i> car
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-caret-square-o-down"></i>
												caret-square-o-down
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-caret-square-o-left"></i>
												caret-square-o-left
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-caret-square-o-right"></i>
												caret-square-o-right
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-caret-square-o-up"></i> caret-square-o-up
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cart-arrow-down"></i> cart-arrow-down
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cart-plus"></i> cart-plus
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cc"></i> cc
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-certificate"></i> certificate
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-check"></i> check
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-check-circle"></i> check-circle
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-check-circle-o"></i> check-circle-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-check-square"></i> check-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-check-square-o"></i> check-square-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-child"></i> child
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-circle"></i> circle
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-circle-o"></i> circle-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-circle-o-notch"></i> circle-o-notch
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-circle-thin"></i> circle-thin
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-clock-o"></i> clock-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-close"></i> close <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cloud"></i> cloud
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cloud-download"></i> cloud-download
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cloud-upload"></i> cloud-upload
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-code"></i> code
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-code-fork"></i> code-fork
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-coffee"></i> coffee
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cog"></i> cog
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cogs"></i> cogs
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-comment"></i> comment
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-comment-o"></i> comment-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-comments"></i> comments
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-comments-o"></i> comments-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-compass"></i> compass
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-copyright"></i> copyright
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-credit-card"></i> credit-card
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-crop"></i> crop
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-crosshairs"></i> crosshairs
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cube"></i> cube
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cubes"></i> cubes
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cutlery"></i> cutlery
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-dashboard"></i> dashboard <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-database"></i> database
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-desktop"></i> desktop
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-diamond"></i> diamond
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-dot-circle-o"></i> dot-circle-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-download"></i> download
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-edit"></i> edit <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-ellipsis-h"></i> ellipsis-h
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-ellipsis-v"></i> ellipsis-v
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-envelope"></i> envelope
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-envelope-o"></i> envelope-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-envelope-square"></i> envelope-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-eraser"></i> eraser
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-exchange"></i> exchange
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-exclamation"></i> exclamation
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-exclamation-circle"></i> exclamation-circle
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-exclamation-triangle"></i>
												exclamation-triangle
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-external-link"></i> external-link
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-external-link-square"></i>
												external-link-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-eye"></i> eye
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-eye-slash"></i> eye-slash
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-eyedropper"></i> eyedropper
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-fax"></i> fax
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-female"></i> female
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-fighter-jet"></i> fighter-jet
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-archive-o"></i> file-archive-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-audio-o"></i> file-audio-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-code-o"></i> file-code-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-excel-o"></i> file-excel-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-image-o"></i> file-image-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-movie-o"></i> file-movie-o <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-pdf-o"></i> file-pdf-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-photo-o"></i> file-photo-o <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-picture-o"></i> file-picture-o <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-powerpoint-o"></i> file-powerpoint-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-sound-o"></i> file-sound-o <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-video-o"></i> file-video-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-word-o"></i> file-word-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-zip-o"></i> file-zip-o <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-film"></i> film
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-filter"></i> filter
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-fire"></i> fire
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-fire-extinguisher"></i> fire-extinguisher
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-flag"></i> flag
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-flag-checkered"></i> flag-checkered
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-flag-o"></i> flag-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-flash"></i> flash <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-flask"></i> flask
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-folder"></i> folder
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-folder-o"></i> folder-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-folder-open"></i> folder-open
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-folder-open-o"></i> folder-open-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-frown-o"></i> frown-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-futbol-o"></i> futbol-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-gamepad"></i> gamepad
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-gavel"></i> gavel
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-gear"></i> gear <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-gears"></i> gears <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-genderless"></i> genderless <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-gift"></i> gift
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-glass"></i> glass
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-globe"></i> globe
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-graduation-cap"></i> graduation-cap
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-group"></i> group <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-hdd-o"></i> hdd-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-headphones"></i> headphones
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-heart"></i> heart
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-heart-o"></i> heart-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-heartbeat"></i> heartbeat
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-history"></i> history
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-home"></i> home
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-hotel"></i> hotel <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-image"></i> image <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-inbox"></i> inbox
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-info"></i> info
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-info-circle"></i> info-circle
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-institution"></i> institution <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-key"></i> key
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-keyboard-o"></i> keyboard-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-language"></i> language
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-laptop"></i> laptop
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-leaf"></i> leaf
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-legal"></i> legal <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-lemon-o"></i> lemon-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-level-down"></i> level-down
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-level-up"></i> level-up
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-life-bouy"></i> life-bouy <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-life-buoy"></i> life-buoy <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-life-ring"></i> life-ring
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-life-saver"></i> life-saver <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-lightbulb-o"></i> lightbulb-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-line-chart"></i> line-chart
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-location-arrow"></i> location-arrow
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-lock"></i> lock
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-magic"></i> magic
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-magnet"></i> magnet
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-mail-forward"></i> mail-forward <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-mail-reply"></i> mail-reply <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-mail-reply-all"></i> mail-reply-all <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-male"></i> male
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-map-marker"></i> map-marker
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-meh-o"></i> meh-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-microphone"></i> microphone
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-microphone-slash"></i> microphone-slash
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-minus"></i> minus
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-minus-circle"></i> minus-circle
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-minus-square"></i> minus-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-minus-square-o"></i> minus-square-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-mobile"></i> mobile
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-mobile-phone"></i> mobile-phone <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-money"></i> money
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-moon-o"></i> moon-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-mortar-board"></i> mortar-board <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-motorcycle"></i> motorcycle
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-music"></i> music
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-navicon"></i> navicon <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-newspaper-o"></i> newspaper-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-paint-brush"></i> paint-brush
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-paper-plane"></i> paper-plane
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-paper-plane-o"></i> paper-plane-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-paw"></i> paw
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-pencil"></i> pencil
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-pencil-square"></i> pencil-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-pencil-square-o"></i> pencil-square-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-phone"></i> phone
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-phone-square"></i> phone-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-photo"></i> photo <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-picture-o"></i> picture-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-pie-chart"></i> pie-chart
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-plane"></i> plane
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-plug"></i> plug
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-plus"></i> plus
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-plus-circle"></i> plus-circle
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-plus-square"></i> plus-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-plus-square-o"></i> plus-square-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-power-off"></i> power-off
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-print"></i> print
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-puzzle-piece"></i> puzzle-piece
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-qrcode"></i> qrcode
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-question"></i> question
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-question-circle"></i> question-circle
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-quote-left"></i> quote-left
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-quote-right"></i> quote-right
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-random"></i> random
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-recycle"></i> recycle
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-refresh"></i> refresh
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-remove"></i> remove <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-reorder"></i> reorder <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-reply"></i> reply
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-reply-all"></i> reply-all
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-retweet"></i> retweet
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-road"></i> road
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-rocket"></i> rocket
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-rss"></i> rss
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-rss-square"></i> rss-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-search"></i> search
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-search-minus"></i> search-minus
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-search-plus"></i> search-plus
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-send"></i> send <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-send-o"></i> send-o <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-server"></i> server
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-share"></i> share
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-share-alt"></i> share-alt
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-share-alt-square"></i> share-alt-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-share-square"></i> share-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-share-square-o"></i> share-square-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-shield"></i> shield
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-ship"></i> ship
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-shopping-cart"></i> shopping-cart
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-sign-in"></i> sign-in
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-sign-out"></i> sign-out
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-signal"></i> signal
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-sitemap"></i> sitemap
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-sliders"></i> sliders
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-smile-o"></i> smile-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-soccer-ball-o"></i> soccer-ball-o <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-sort"></i> sort
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-sort-alpha-asc"></i> sort-alpha-asc
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-sort-alpha-desc"></i> sort-alpha-desc
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-sort-amount-asc"></i> sort-amount-asc
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-sort-amount-desc"></i> sort-amount-desc
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-sort-asc"></i> sort-asc
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-sort-desc"></i> sort-desc
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-sort-down"></i> sort-down <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-sort-numeric-asc"></i> sort-numeric-asc
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-sort-numeric-desc"></i> sort-numeric-desc
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-sort-up"></i> sort-up <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-space-shuttle"></i> space-shuttle
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-spinner"></i> spinner
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-spoon"></i> spoon
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-square"></i> square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-square-o"></i> square-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-star"></i> star
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-star-half"></i> star-half
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-star-half-empty"></i> star-half-empty <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-star-half-full"></i> star-half-full <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-star-half-o"></i> star-half-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-star-o"></i> star-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-street-view"></i> street-view
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-suitcase"></i> suitcase
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-sun-o"></i> sun-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-support"></i> support <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-tablet"></i> tablet
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-tachometer"></i> tachometer
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-tag"></i> tag
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-tags"></i> tags
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-tasks"></i> tasks
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-taxi"></i> taxi
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-terminal"></i> terminal
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-thumb-tack"></i> thumb-tack
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-thumbs-down"></i> thumbs-down
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-thumbs-o-down"></i> thumbs-o-down
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-thumbs-o-up"></i> thumbs-o-up
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-thumbs-up"></i> thumbs-up
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-ticket"></i> ticket
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-times"></i> times
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-times-circle"></i> times-circle
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-times-circle-o"></i> times-circle-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-tint"></i> tint
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-toggle-down"></i> toggle-down <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-toggle-left"></i> toggle-left <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-toggle-off"></i> toggle-off
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-toggle-on"></i> toggle-on
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-toggle-right"></i> toggle-right <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-toggle-up"></i> toggle-up <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-trash"></i> trash
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-trash-o"></i> trash-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-tree"></i> tree
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-trophy"></i> trophy
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-truck"></i> truck
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-tty"></i> tty
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-umbrella"></i> umbrella
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-university"></i> university
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-unlock"></i> unlock
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-unlock-alt"></i> unlock-alt
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-unsorted"></i> unsorted <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-upload"></i> upload
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-user"></i> user
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-user-plus"></i> user-plus
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-user-secret"></i> user-secret
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-user-times"></i> user-times
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-users"></i> users
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-video-camera"></i> video-camera
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-volume-down"></i> volume-down
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-volume-off"></i> volume-off
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-volume-up"></i> volume-up
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-warning"></i> warning <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-wheelchair"></i> wheelchair
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-wifi"></i> wifi
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-wrench"></i> wrench
											</div>

										</div>

										</section>
										<hr class="wide" />
										<section id="transportation">
										<h4>Transportation Icons</h4>

										<div class="row fontawesome-icon-list">



											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-ambulance"></i> ambulance
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-automobile"></i> automobile <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bicycle"></i> bicycle
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bus"></i> bus
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cab"></i> cab <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-car"></i> car
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-fighter-jet"></i> fighter-jet
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-motorcycle"></i> motorcycle
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-plane"></i> plane
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-rocket"></i> rocket
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-ship"></i> ship
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-space-shuttle"></i> space-shuttle
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-subway"></i> subway
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-taxi"></i> taxi
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-train"></i> train
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-truck"></i> truck
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-wheelchair"></i> wheelchair
											</div>

										</div>

										</section>
										<hr class="wide" />
										<section id="gender">
										<h4>Gender Icons</h4>

										<div class="row fontawesome-icon-list">



											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-circle-thin"></i> circle-thin
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-genderless"></i> genderless <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-mars"></i> mars
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-mars-double"></i> mars-double
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-mars-stroke"></i> mars-stroke
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-mars-stroke-h"></i> mars-stroke-h
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-mars-stroke-v"></i> mars-stroke-v
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-mercury"></i> mercury
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-neuter"></i> neuter
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-transgender"></i> transgender
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-transgender-alt"></i> transgender-alt
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-venus"></i> venus
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-venus-double"></i> venus-double
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-venus-mars"></i> venus-mars
											</div>

										</div>

										</section>
										<hr class="wide" />
										<section id="file-type">
										<h4>File Type Icons</h4>

										<div class="row fontawesome-icon-list">



											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file"></i> file
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-archive-o"></i> file-archive-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-audio-o"></i> file-audio-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-code-o"></i> file-code-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-excel-o"></i> file-excel-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-image-o"></i> file-image-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-movie-o"></i> file-movie-o <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-o"></i> file-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-pdf-o"></i> file-pdf-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-photo-o"></i> file-photo-o <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-picture-o"></i> file-picture-o <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-powerpoint-o"></i> file-powerpoint-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-sound-o"></i> file-sound-o <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-text"></i> file-text
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-text-o"></i> file-text-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-video-o"></i> file-video-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-word-o"></i> file-word-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-zip-o"></i> file-zip-o <span
													class="text-muted">(alias)</span>
											</div>

										</div>

										</section>
										<hr class="wide" />
										<section id="spinner">
										<h4>Spinner Icons</h4>

										<div class="alert alert-success">
											<ul class="fa-ul">
												<li><i class="fa fa-info-circle fa-lg fa-li"></i> These
													icons work great with the <code>fa-spin</code> class. Check
													out the spinning icons example.</li>
											</ul>
										</div>

										<div class="row fontawesome-icon-list">



											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-circle-o-notch"></i> circle-o-notch
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cog"></i> cog
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-gear"></i> gear <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-refresh"></i> refresh
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-spinner"></i> spinner
											</div>

										</div>

										</section>
										<hr class="wide" />
										<section id="form-control">
										<h4>Form Control Icons</h4>

										<div class="row fontawesome-icon-list">



											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-check-square"></i> check-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-check-square-o"></i> check-square-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-circle"></i> circle
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-circle-o"></i> circle-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-dot-circle-o"></i> dot-circle-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-minus-square"></i> minus-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-minus-square-o"></i> minus-square-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-plus-square"></i> plus-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-plus-square-o"></i> plus-square-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-square"></i> square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-square-o"></i> square-o
											</div>

										</div>

										</section>
										<hr class="wide" />
										<section id="payment">
										<h4>Payment Icons</h4>

										<div class="row fontawesome-icon-list">



											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cc-amex"></i> cc-amex
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cc-discover"></i> cc-discover
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cc-mastercard"></i> cc-mastercard
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cc-paypal"></i> cc-paypal
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cc-stripe"></i> cc-stripe
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cc-visa"></i> cc-visa
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-credit-card"></i> credit-card
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-google-wallet"></i> google-wallet
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-paypal"></i> paypal
											</div>

										</div>

										</section>
										<hr class="wide" />
										<section id="chart">
										<h4>Chart Icons</h4>

										<div class="row fontawesome-icon-list">



											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-area-chart"></i> area-chart
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bar-chart"></i> bar-chart
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bar-chart-o"></i> bar-chart-o <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-line-chart"></i> line-chart
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-pie-chart"></i> pie-chart
											</div>

										</div>

										</section>
										<hr class="wide" />
										<section id="currency">
										<h4>Currency Icons</h4>

										<div class="row fontawesome-icon-list">



											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bitcoin"></i> bitcoin <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-btc"></i> btc
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cny"></i> cny <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-dollar"></i> dollar <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-eur"></i> eur
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-euro"></i> euro <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-gbp"></i> gbp
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-ils"></i> ils
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-inr"></i> inr
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-jpy"></i> jpy
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-krw"></i> krw
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-money"></i> money
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-rmb"></i> rmb <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-rouble"></i> rouble <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-rub"></i> rub
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-ruble"></i> ruble <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-rupee"></i> rupee <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-shekel"></i> shekel <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-sheqel"></i> sheqel <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-try"></i> try
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-turkish-lira"></i> turkish-lira <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-usd"></i> usd
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-won"></i> won <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-yen"></i> yen <span class="text-muted">(alias)</span>
											</div>

										</div>

										</section>
										<hr class="wide" />
										<section id="text-editor">
										<h4>Text Editor Icons</h4>

										<div class="row fontawesome-icon-list">



											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-align-center"></i> align-center
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-align-justify"></i> align-justify
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-align-left"></i> align-left
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-align-right"></i> align-right
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bold"></i> bold
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-chain"></i> chain <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-chain-broken"></i> chain-broken
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-clipboard"></i> clipboard
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-columns"></i> columns
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-copy"></i> copy <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cut"></i> cut <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-dedent"></i> dedent <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-eraser"></i> eraser
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file"></i> file
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-o"></i> file-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-text"></i> file-text
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-file-text-o"></i> file-text-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-files-o"></i> files-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-floppy-o"></i> floppy-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-font"></i> font
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-header"></i> header
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-indent"></i> indent
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-italic"></i> italic
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-link"></i> link
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-list"></i> list
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-list-alt"></i> list-alt
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-list-ol"></i> list-ol
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-list-ul"></i> list-ul
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-outdent"></i> outdent
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-paperclip"></i> paperclip
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-paragraph"></i> paragraph
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-paste"></i> paste <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-repeat"></i> repeat
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-rotate-left"></i> rotate-left <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-rotate-right"></i> rotate-right <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-save"></i> save <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-scissors"></i> scissors
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-strikethrough"></i> strikethrough
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-subscript"></i> subscript
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-superscript"></i> superscript
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-table"></i> table
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-text-height"></i> text-height
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-text-width"></i> text-width
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-th"></i> th
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-th-large"></i> th-large
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-th-list"></i> th-list
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-underline"></i> underline
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-undo"></i> undo
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-unlink"></i> unlink <span class="text-muted">(alias)</span>
											</div>

										</div>

										</section>
										<hr class="wide" />
										<section id="directional">
										<h4>Directional Icons</h4>

										<div class="row fontawesome-icon-list">



											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-angle-double-down"></i> angle-double-down
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-angle-double-left"></i> angle-double-left
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-angle-double-right"></i> angle-double-right
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-angle-double-up"></i> angle-double-up
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-angle-down"></i> angle-down
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-angle-left"></i> angle-left
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-angle-right"></i> angle-right
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-angle-up"></i> angle-up
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-arrow-circle-down"></i> arrow-circle-down
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-arrow-circle-left"></i> arrow-circle-left
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-arrow-circle-o-down"></i>
												arrow-circle-o-down
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-arrow-circle-o-left"></i>
												arrow-circle-o-left
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-arrow-circle-o-right"></i>
												arrow-circle-o-right
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-arrow-circle-o-up"></i> arrow-circle-o-up
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-arrow-circle-right"></i> arrow-circle-right
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-arrow-circle-up"></i> arrow-circle-up
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-arrow-down"></i> arrow-down
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-arrow-left"></i> arrow-left
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-arrow-right"></i> arrow-right
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-arrow-up"></i> arrow-up
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-arrows"></i> arrows
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-arrows-alt"></i> arrows-alt
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-arrows-h"></i> arrows-h
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-arrows-v"></i> arrows-v
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-caret-down"></i> caret-down
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-caret-left"></i> caret-left
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-caret-right"></i> caret-right
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-caret-square-o-down"></i>
												caret-square-o-down
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-caret-square-o-left"></i>
												caret-square-o-left
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-caret-square-o-right"></i>
												caret-square-o-right
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-caret-square-o-up"></i> caret-square-o-up
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-caret-up"></i> caret-up
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-chevron-circle-down"></i>
												chevron-circle-down
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-chevron-circle-left"></i>
												chevron-circle-left
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-chevron-circle-right"></i>
												chevron-circle-right
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-chevron-circle-up"></i> chevron-circle-up
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-chevron-down"></i> chevron-down
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-chevron-left"></i> chevron-left
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-chevron-right"></i> chevron-right
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-chevron-up"></i> chevron-up
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-hand-o-down"></i> hand-o-down
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-hand-o-left"></i> hand-o-left
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-hand-o-right"></i> hand-o-right
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-hand-o-up"></i> hand-o-up
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-long-arrow-down"></i> long-arrow-down
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-long-arrow-left"></i> long-arrow-left
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-long-arrow-right"></i> long-arrow-right
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-long-arrow-up"></i> long-arrow-up
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-toggle-down"></i> toggle-down <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-toggle-left"></i> toggle-left <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-toggle-right"></i> toggle-right <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-toggle-up"></i> toggle-up <span
													class="text-muted">(alias)</span>
											</div>

										</div>

										</section>
										<hr class="wide" />
										<section id="video-player">
										<h4>Video Player Icons</h4>

										<div class="row fontawesome-icon-list">



											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-arrows-alt"></i> arrows-alt
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-backward"></i> backward
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-compress"></i> compress
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-eject"></i> eject
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-expand"></i> expand
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-fast-backward"></i> fast-backward
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-fast-forward"></i> fast-forward
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-forward"></i> forward
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-pause"></i> pause
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-play"></i> play
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-play-circle"></i> play-circle
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-play-circle-o"></i> play-circle-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-step-backward"></i> step-backward
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-step-forward"></i> step-forward
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-stop"></i> stop
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-youtube-play"></i> youtube-play
											</div>

										</div>

										</section>
										<hr class="wide" />
										<section id="brand">
										<h4>Brand Icons</h4>


										<div class="row fontawesome-icon-list margin-bottom-lg">



											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-adn"></i> adn
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-android"></i> android
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-angellist"></i> angellist
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-apple"></i> apple
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-behance"></i> behance
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-behance-square"></i> behance-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bitbucket"></i> bitbucket
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bitbucket-square"></i> bitbucket-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-bitcoin"></i> bitcoin <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-btc"></i> btc
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-buysellads"></i> buysellads
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cc-amex"></i> cc-amex
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cc-discover"></i> cc-discover
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cc-mastercard"></i> cc-mastercard
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cc-paypal"></i> cc-paypal
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cc-stripe"></i> cc-stripe
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-cc-visa"></i> cc-visa
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-codepen"></i> codepen
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-connectdevelop"></i> connectdevelop
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-css3"></i> css3
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-dashcube"></i> dashcube
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-delicious"></i> delicious
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-deviantart"></i> deviantart
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-digg"></i> digg
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-dribbble"></i> dribbble
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-dropbox"></i> dropbox
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-drupal"></i> drupal
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-empire"></i> empire
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-facebook"></i> facebook
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-facebook-f"></i> facebook-f <span
													class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-facebook-official"></i> facebook-official
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-facebook-square"></i> facebook-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-flickr"></i> flickr
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-forumbee"></i> forumbee
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-foursquare"></i> foursquare
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-ge"></i> ge <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-git"></i> git
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-git-square"></i> git-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-github"></i> github
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-github-alt"></i> github-alt
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-github-square"></i> github-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-gittip"></i> gittip <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-google"></i> google
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-google-plus"></i> google-plus
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-google-plus-square"></i> google-plus-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-google-wallet"></i> google-wallet
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-gratipay"></i> gratipay
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-hacker-news"></i> hacker-news
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-html5"></i> html5
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-instagram"></i> instagram
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-ioxhost"></i> ioxhost
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-joomla"></i> joomla
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-jsfiddle"></i> jsfiddle
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-lastfm"></i> lastfm
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-lastfm-square"></i> lastfm-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-leanpub"></i> leanpub
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-linkedin"></i> linkedin
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-linkedin-square"></i> linkedin-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-linux"></i> linux
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-maxcdn"></i> maxcdn
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-meanpath"></i> meanpath
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-medium"></i> medium
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-openid"></i> openid
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-pagelines"></i> pagelines
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-paypal"></i> paypal
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-pied-piper"></i> pied-piper
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-pied-piper-alt"></i> pied-piper-alt
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-pinterest"></i> pinterest
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-pinterest-p"></i> pinterest-p
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-pinterest-square"></i> pinterest-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-qq"></i> qq
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-ra"></i> ra <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-rebel"></i> rebel
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-reddit"></i> reddit
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-reddit-square"></i> reddit-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-renren"></i> renren
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-sellsy"></i> sellsy
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-share-alt"></i> share-alt
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-share-alt-square"></i> share-alt-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-shirtsinbulk"></i> shirtsinbulk
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-simplybuilt"></i> simplybuilt
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-skyatlas"></i> skyatlas
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-skype"></i> skype
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-slack"></i> slack
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-slideshare"></i> slideshare
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-soundcloud"></i> soundcloud
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-spotify"></i> spotify
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-stack-exchange"></i> stack-exchange
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-stack-overflow"></i> stack-overflow
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-steam"></i> steam
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-steam-square"></i> steam-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-stumbleupon"></i> stumbleupon
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-stumbleupon-circle"></i> stumbleupon-circle
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-tencent-weibo"></i> tencent-weibo
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-trello"></i> trello
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-tumblr"></i> tumblr
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-tumblr-square"></i> tumblr-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-twitch"></i> twitch
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-twitter"></i> twitter
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-twitter-square"></i> twitter-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-viacoin"></i> viacoin
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-vimeo-square"></i> vimeo-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-vine"></i> vine
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-vk"></i> vk
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-wechat"></i> wechat <span class="text-muted">(alias)</span>
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-weibo"></i> weibo
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-weixin"></i> weixin
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-whatsapp"></i> whatsapp
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-windows"></i> windows
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-wordpress"></i> wordpress
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-xing"></i> xing
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-xing-square"></i> xing-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-yahoo"></i> yahoo
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-yelp"></i> yelp
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-youtube"></i> youtube
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-youtube-play"></i> youtube-play
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-youtube-square"></i> youtube-square
											</div>

										</div>

										</section>
										<hr class="wide" />
										<section id="medical">
										<h4>Medical Icons</h4>

										<div class="row fontawesome-icon-list">

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-ambulance"></i> ambulance
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-h-square"></i> h-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-heart"></i> heart
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-heart-o"></i> heart-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-heartbeat"></i> heartbeat
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-hospital-o"></i> hospital-o
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-medkit"></i> medkit
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-plus-square"></i> plus-square
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-stethoscope"></i> stethoscope
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-user-md"></i> user-md
											</div>

											<div class="fa-hover col-md-3 col-sm-4">
												<i class="fa fa-wheelchair"></i> wheelchair
											</div>

										</div>
										</section>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--Row Ends-->
				</div>

				<div id="iconGlyphicon" class="tab-pane">
                    <div class="row searchhelpbar">
                        <div class="col-sm-8 help-box">
                            <div class="alert alert-danger alert-radius-bordered alert-shadowed">
                                <p>Place Glyph icons just about anywhere with the <code>&lt;i&gt;</code> tag.</p>
                                <p>
                                    <code>
                                        <span class="nt">&lt;i</span>
                                        <span class="na">class=</span><span class="s">"glyphicon glyphicon-pencil"</span><span class="nt">&gt;&lt;/i&gt;</span>

                                    </code>
                                </p>
                            </div>
                        </div>
                        <div class="col-sm-4 search-box">
                            <div>
                                <span class="input-icon">
                                    <input type="text" class="form-control" id="glyphicon-search" placeholder="Search">
                                    <i class="glyphicon glyphicon-search circular danger"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="horizontal-space space-sm"></div>
                    <!--Row-->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="widget">
                                <div class="widget-header bordered-top bordered-red">
                                    <span class="widget-caption">Glyphicon Halflings</span>
                                    <div class="widget-buttons">
                                    </div>
                                </div>
                                <div class="widget-body">
                                    <div class="bs-glyphicons">
                                        <ul class="bs-glyphicons-list">

                                            <li>
                                                <span class="glyphicon glyphicon-asterisk"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-asterisk</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-plus"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-plus</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-euro"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-euro</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-minus"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-minus</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-cloud"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-cloud</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-envelope"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-envelope</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-pencil"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-pencil</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-glass"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-glass</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-music"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-music</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-search"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-search</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-heart"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-heart</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-star"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-star</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-star-empty"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-star-empty</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-user"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-user</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-film"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-film</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-th-large"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-th-large</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-th"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-th</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-th-list"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-th-list</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-ok"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-ok</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-remove"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-remove</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-zoom-in"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-zoom-in</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-zoom-out"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-zoom-out</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-off"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-off</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-signal"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-signal</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-cog"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-cog</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-trash"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-trash</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-home"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-home</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-file"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-file</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-time"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-time</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-road"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-road</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-download-alt"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-download-alt</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-download"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-download</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-upload"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-upload</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-inbox"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-inbox</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-play-circle"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-play-circle</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-repeat"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-repeat</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-refresh"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-refresh</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-list-alt"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-list-alt</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-lock"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-lock</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-flag"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-flag</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-headphones"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-headphones</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-volume-off"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-volume-off</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-volume-down"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-volume-down</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-volume-up"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-volume-up</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-qrcode"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-qrcode</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-barcode"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-barcode</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-tag"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-tag</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-tags"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-tags</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-book"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-book</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-bookmark"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-bookmark</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-print"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-print</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-camera"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-camera</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-font"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-font</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-bold"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-bold</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-italic"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-italic</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-text-height"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-text-height</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-text-width"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-text-width</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-align-left"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-align-left</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-align-center"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-align-center</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-align-right"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-align-right</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-align-justify"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-align-justify</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-list"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-list</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-indent-left"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-indent-left</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-indent-right"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-indent-right</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-facetime-video"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-facetime-video</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-picture"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-picture</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-map-marker"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-map-marker</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-adjust"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-adjust</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-tint"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-tint</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-edit"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-edit</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-share"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-share</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-check"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-check</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-move"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-move</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-step-backward"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-step-backward</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-fast-backward"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-fast-backward</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-backward"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-backward</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-play"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-play</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-pause"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-pause</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-stop"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-stop</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-forward"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-forward</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-fast-forward"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-fast-forward</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-step-forward"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-step-forward</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-eject"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-eject</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-chevron-left"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-chevron-left</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-chevron-right"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-chevron-right</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-plus-sign"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-plus-sign</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-minus-sign"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-minus-sign</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-remove-sign"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-remove-sign</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-ok-sign"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-ok-sign</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-question-sign"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-question-sign</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-info-sign"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-info-sign</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-screenshot"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-screenshot</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-remove-circle"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-remove-circle</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-ok-circle"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-ok-circle</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-ban-circle"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-ban-circle</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-arrow-left"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-arrow-left</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-arrow-right"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-arrow-right</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-arrow-up"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-arrow-up</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-arrow-down"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-arrow-down</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-share-alt"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-share-alt</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-resize-full"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-resize-full</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-resize-small"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-resize-small</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-exclamation-sign</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-gift"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-gift</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-leaf"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-leaf</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-fire"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-fire</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-eye-open"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-eye-open</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-eye-close"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-eye-close</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-warning-sign"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-warning-sign</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-plane"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-plane</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-calendar"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-calendar</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-random"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-random</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-comment"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-comment</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-magnet"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-magnet</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-chevron-up"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-chevron-up</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-chevron-down"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-chevron-down</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-retweet"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-retweet</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-shopping-cart"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-shopping-cart</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-folder-close"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-folder-close</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-folder-open"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-folder-open</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-resize-vertical"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-resize-vertical</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-resize-horizontal"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-resize-horizontal</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-hdd"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-hdd</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-bullhorn"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-bullhorn</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-bell"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-bell</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-certificate"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-certificate</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-thumbs-up"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-thumbs-up</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-thumbs-down"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-thumbs-down</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-hand-right"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-hand-right</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-hand-left"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-hand-left</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-hand-up"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-hand-up</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-hand-down"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-hand-down</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-circle-arrow-right"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-circle-arrow-right</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-circle-arrow-left"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-circle-arrow-left</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-circle-arrow-up"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-circle-arrow-up</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-circle-arrow-down"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-circle-arrow-down</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-globe"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-globe</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-wrench"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-wrench</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-tasks"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-tasks</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-filter"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-filter</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-briefcase"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-briefcase</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-fullscreen"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-fullscreen</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-dashboard"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-dashboard</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-paperclip"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-paperclip</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-heart-empty"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-heart-empty</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-link"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-link</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-phone"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-phone</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-pushpin"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-pushpin</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-usd"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-usd</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-gbp"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-gbp</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-sort"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-sort</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-sort-by-alphabet"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-sort-by-alphabet</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-sort-by-alphabet-alt"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-sort-by-alphabet-alt</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-sort-by-order"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-sort-by-order</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-sort-by-order-alt"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-sort-by-order-alt</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-sort-by-attributes"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-sort-by-attributes</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-sort-by-attributes-alt"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-sort-by-attributes-alt</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-unchecked"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-unchecked</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-expand"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-expand</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-collapse-down"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-collapse-down</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-collapse-up"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-collapse-up</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-log-in"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-log-in</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-flash"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-flash</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-log-out"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-log-out</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-new-window"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-new-window</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-record"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-record</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-save"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-save</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-open"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-open</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-saved"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-saved</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-import"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-import</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-export"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-export</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-send"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-send</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-floppy-disk"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-floppy-disk</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-floppy-saved"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-floppy-saved</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-floppy-remove"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-floppy-remove</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-floppy-save"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-floppy-save</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-floppy-open"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-floppy-open</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-credit-card"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-credit-card</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-transfer"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-transfer</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-cutlery"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-cutlery</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-header"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-header</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-compressed"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-compressed</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-earphone"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-earphone</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-phone-alt"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-phone-alt</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-tower"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-tower</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-stats"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-stats</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-sd-video"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-sd-video</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-hd-video"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-hd-video</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-subtitles"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-subtitles</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-sound-stereo"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-sound-stereo</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-sound-dolby"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-sound-dolby</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-sound-5-1"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-sound-5-1</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-sound-6-1"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-sound-6-1</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-sound-7-1"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-sound-7-1</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-copyright-mark"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-copyright-mark</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-registration-mark"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-registration-mark</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-cloud-download"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-cloud-download</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-cloud-upload"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-cloud-upload</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-tree-conifer"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-tree-conifer</span>
                                            </li>

                                            <li>
                                                <span class="glyphicon glyphicon-tree-deciduous"></span>
                                                <span class="glyphicon-class">glyphicon glyphicon-tree-deciduous</span>
                                            </li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Row Ends-->
                    
                </div>
                
                <div id="iconTypicons" class="tab-pane">
                    <div class="row searchhelpbar">
                        <div class="col-sm-8 help-box">
                            <div class="alert alert-warning alert-radius-bordered alert-shadowed">
                                <p>Place Typicons just about anywhere with the <code>&lt;i&gt;</code> tag.</p>
                                <p>
                                    <code>
                                        <span class="nt">&lt;i</span>
                                        <span class="na">class=</span><span class="s">"typcn typcn-camera"</span><span class="nt">&gt;&lt;/i&gt;</span>

                                    </code>
                                </p>
                            </div>
                        </div>
                        <div class="col-sm-4 search-box">
                            <div>
                                <span class="input-icon">
                                    <input type="text" class="form-control" id="typicon-search" placeholder="Search">
                                    <i class="glyphicon glyphicon-search circular warning"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="horizontal-space space-sm"></div>
                    <div class="row">
                        <div class="col-xs-12 col-md-12 col-lg-12">
                            <div class="widget">
                                <div class="widget-header bordered-top bordered-lightyellow">
                                    <span class="widget-caption">Typicons</span>
                                    <div class="widget-buttons">
                                    </div>
                                </div>
                                <div class="widget-body">
                                    <div id="typicon-preview" class="clearfix">
                                        <div class="icon">
                                            <span class="typcn typcn-adjust-brightness"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-adjust-contrast"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-anchor-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-anchor"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-archive"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-back-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-back"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-down-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-down-thick"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-down"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-forward-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-forward"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-left-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-left-thick"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-left"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-loop-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-loop"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-maximise-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-maximise"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-minimise-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-minimise"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-move-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-move"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-repeat-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-repeat"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-right-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-right-thick"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-right"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-shuffle"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-sorted-down"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-sorted-up"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-sync-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-sync"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-unsorted"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-up-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-up-thick"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-up"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-at"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-attachment-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-attachment"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-backspace-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-backspace"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-battery-charge"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-battery-full"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-battery-high"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-battery-low"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-battery-mid"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-beaker"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-beer"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-bell"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-book"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-bookmark"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-briefcase"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-brush"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-business-card"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-calculator"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-calender-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-calender"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-camera-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-camera"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-cancel-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-cancel"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chart-area-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chart-area"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chart-bar-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chart-bar"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chart-line-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chart-line"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chart-pie-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chart-pie"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chevron-left-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chevron-left"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chevron-right-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chevron-right"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-clipboard"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-cloud-storage"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-code-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-code"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-coffee"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-cog-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-cog"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-compass"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-contacts"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-credit-card"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-cross"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-css3"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-database"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-delete-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-delete"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-device-desktop"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-device-laptop"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-device-phone"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-device-tablet"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-directions"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-divide-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-divide"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-document-add"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-document-delete"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-document-text"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-document"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-download-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-download"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-dropbox"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-edit"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-eject-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-eject"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-equals-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-equals"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-export-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-export"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-eye-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-eye"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-feather"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-film"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-filter"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-flag-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-flag"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-flash-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-flash"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-flow-children"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-flow-merge"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-flow-parallel"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-flow-switch"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-folder-add"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-folder-delete"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-folder-open"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-folder"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-gift"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-globe-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-globe"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-group-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-group"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-headphones"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-heart-full-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-heart-half-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-heart-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-heart"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-home-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-home"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-html5"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-image-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-image"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-infinity-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-infinity"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-info-large-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-info-large"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-info-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-info"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-input-checked-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-input-checked"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-key-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-key"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-keyboard"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-leaf"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-lightbulb"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-link-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-link"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-location-arrow-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-location-arrow"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-location-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-location"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-lock-closed-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-lock-closed"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-lock-open-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-lock-open"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-mail"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-map"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-eject-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-eject"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-fast-forward-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-fast-forward"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-pause-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-pause"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-play-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-play-reverse-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-play-reverse"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-play"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-record-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-record"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-rewind-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-rewind"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-stop-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-stop"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-message-typing"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-message"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-messages"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-microphone-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-microphone"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-minus-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-minus"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-mortar-board"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-news"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-notes-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-notes"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-pen"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-pencil"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-phone-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-phone"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-pi-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-pi"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-pin-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-pin"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-pipette"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-plane-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-plane"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-plug"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-plus-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-plus"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-point-of-interest-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-point-of-interest"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-power-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-power"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-printer"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-puzzle-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-puzzle"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-radar-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-radar"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-refresh-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-refresh"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-rss-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-rss"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-scissors-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-scissors"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-shopping-bag"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-shopping-cart"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-at-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-dribbble-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-dribbble"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-facebook-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-facebook"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-flickr-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-flickr"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-github-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-github"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-google-plus-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-google-plus"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-instagram-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-instagram"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-last-fm-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-last-fm"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-linkedin-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-linkedin"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-pinterest-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-pinterest"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-skype-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-skype"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-tumbler-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-tumbler"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-twitter-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-twitter"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-vimeo-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-vimeo"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-youtube-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-youtube"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-sort-alphabetically-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-sort-alphabetically"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-sort-numerically-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-sort-numerically"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-spanner-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-spanner"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-spiral"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-star-full-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-star-half-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-star-half"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-star-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-star"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-starburst-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-starburst"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-stopwatch"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-support"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-tabs-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-tag"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-tags"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-th-large-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-th-large"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-th-list-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-th-list"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-th-menu-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-th-menu"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-th-small-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-th-small"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-thermometer"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-thumbs-down"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-thumbs-ok"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-thumbs-up"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-tick-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-tick"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-ticket"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-time"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-times-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-times"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-trash"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-tree"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-upload-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-upload"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-user-add-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-user-add"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-user-delete-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-user-delete"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-user-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-user"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-vendor-android"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-vendor-apple"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-vendor-microsoft"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-video-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-video"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-volume-down"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-volume-mute"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-volume-up"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-volume"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-warning-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-warning"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-watch"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-waves-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-waves"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-weather-cloudy"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-weather-downpour"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-weather-night"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-weather-partly-sunny"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-weather-shower"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-weather-snow"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-weather-stormy"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-weather-sunny"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-weather-windy-cloudy"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-weather-windy"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-wi-fi-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-wi-fi"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-wine"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-world-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-world"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-zoom-in-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-zoom-in"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-zoom-out-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-zoom-out"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-zoom-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-zoom"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                      </div>
                </div>
                
                <div id="iconWeather" class="tab-pane">
                    <div class="row searchhelpbar">
                        <div class="col-sm-8 help-box">
                            <div class="alert alert-success alert-radius-bordered alert-shadowed">
                                <p>Place weather icons just about anywhere with the <code>&lt;i&gt;</code> tag.</p>
                                <p>
                                    <code>
                                        <span class="nt">&lt;i</span>
                                        <span class="na">class=</span><span class="s">"wi-day-rain-mix"</span><span class="nt">&gt;&lt;/i&gt;</span>

                                    </code>
                                </p>
                            </div>
                        </div>
                        <div class="col-sm-4 search-box">
                            <div>
                                <span class="input-icon">
                                    <input type="text" class="form-control" id="weathericon-search" placeholder="Search">
                                    <i class="glyphicon glyphicon-search circular success"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="horizontal-space space-sm"></div>
                    <!--Row-->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="widget">
                                <div class="widget-header bordered-top bordered-palegreen">
                                    <span class="widget-caption">Weather Icons</span>
                                    <div class="widget-buttons">
                                    </div>
                                </div>
                                <div class="widget-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h4>New in V1.2</h4>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-smoke"></i></div>
                                                <div class="class">wi-smoke</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-dust"></i></div>
                                                <div class="class">wi-dust</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-snow-wind"></i></div>
                                                <div class="class">wi-snow-wind</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-day-snow-wind"></i></div>
                                                <div class="class">wi-day-snow-wind</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-snow-wind"></i></div>
                                                <div class="class">wi-night-snow-wind</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-alt-snow-wind"></i></div>
                                                <div class="class">wi-night-alt-snow-wind</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-day-sleet-storm"></i></div>
                                                <div class="class">wi-day-sleet-storm</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-sleet-storm"></i></div>
                                                <div class="class">wi-night-sleet-storm</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-alt-sleet-storm"></i></div>
                                                <div class="class">wi-night-alt-sleet-storm</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-day-snow-thunderstorm"></i></div>
                                                <div class="class">wi-day-snow-thunderstorm</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-snow-thunderstorm"></i></div>
                                                <div class="class">wi-night-snow-thunderstorm</div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-alt-snow-thunderstorm"></i></div>
                                                <div class="class">wi-night-alt-snow-thunderstorm</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-solar-eclipse"></i></div>
                                                <div class="class">wi-solar-eclipse</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-lunar-eclipse"></i></div>
                                                <div class="class">wi-lunar-eclipse</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-meteor"></i></div>
                                                <div class="class">wi-meteor</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-hot"></i></div>
                                                <div class="class">wi-hot</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-hurricane"></i></div>
                                                <div class="class">wi-hurricane          </div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-smog"></i></div>
                                                <div class="class">wi-smog</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-alien"></i></div>
                                                <div class="class">wi-alien</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-snowflake-cold"></i></div>
                                                <div class="class">wi-snowflake-cold</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-stars"></i></div>
                                                <div class="class">wi-stars</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-partly-cloudy"></i></div>
                                                <div class="class">night-partly-cloudy</div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-moon-full"></i></div>
                                                <div class="class">wi-moon-full</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-moon-waxing-gibbous"></i></div>
                                                <div class="class">wi-moon-waxing-gibbous</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-moon-waxing-quarter"></i></div>
                                                <div class="class">wi-moon-waxing-quarter</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-moon-waxing-crescent"></i></div>
                                                <div class="class">wi-moon-waxing-crescent</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-moon-young"></i></div>
                                                <div class="class">wi-moon-young</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-moon-new"></i></div>
                                                <div class="class">wi-moon-new</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-moon-old"></i></div>
                                                <div class="class">wi-moon-old</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-moon-waning-crescent"></i></div>
                                                <div class="class">wi-moon-waning-crescent</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-moon-waning-quarter"></i></div>
                                                <div class="class">wi-moon-waning-quarter</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-moon-waning-gibbous"></i></div>
                                                <div class="class">wi-moon-waning-gibbous</div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="wide" />
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h4>Day / Sunny</h4>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-day-cloudy-gusts"></i></div>
                                                <div class="class">wi-day-cloudy-gusts</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-day-cloudy-windy"></i></div>
                                                <div class="class">wi-day-cloudy-windy</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-day-cloudy"></i></div>
                                                <div class="class">wi-day-cloudy</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-day-fog"></i></div>
                                                <div class="class">wi-day-fog</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-day-hail"></i></div>
                                                <div class="class">wi-day-hail</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-day-lightning"></i></div>
                                                <div class="class">wi-day-lightning</div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-day-rain-mix"></i></div>
                                                <div class="class">wi-day-rain-mix</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-day-rain-wind"></i></div>
                                                <div class="class">wi-day-rain-wind</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-day-rain"></i></div>
                                                <div class="class">wi-day-rain</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-day-showers"></i></div>
                                                <div class="class">wi-day-showers</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-day-snow"></i></div>
                                                <div class="class">wi-day-snow</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-day-sprinkle"></i></div>
                                                <div class="class">wi-day-sprinkle</div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-day-sunny-overcast"></i></div>
                                                <div class="class">wi-day-sunny-overcast</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-day-sunny"></i></div>
                                                <div class="class">wi-day-sunny</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-day-storm-showers"></i></div>
                                                <div class="class">wi-day-storm-showers</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-day-thunderstorm"></i></div>
                                                <div class="class">wi-day-thunderstorm</div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="wide" />
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h4>Neutral / Cloudy</h4>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-cloudy-gusts"></i></div>
                                                <div class="class">wi-cloudy-gusts</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-cloudy-windy"></i></div>
                                                <div class="class">wi-cloudy-windy</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-cloudy"></i></div>
                                                <div class="class">wi-cloudy</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-fog"></i></div>
                                                <div class="class">wi-fog</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-hail"></i></div>
                                                <div class="class">wi-hail</div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-lightning"></i></div>
                                                <div class="class">wi-lightning</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-rain-mix"></i></div>
                                                <div class="class">wi-rain-mix</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-rain-wind"></i></div>
                                                <div class="class">wi-rain-wind</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-rain"></i></div>
                                                <div class="class">wi-rain</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-showers"></i></div>
                                                <div class="class">wi-showers</div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-snow"></i></div>
                                                <div class="class">wi-snow</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-sprinkle"></i></div>
                                                <div class="class">wi-sprinkle</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-storm-showers"></i></div>
                                                <div class="class">wi-storm-showers</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-thunderstorm"></i></div>
                                                <div class="class">wi-thunderstorm</div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="wide" />
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h4>Night / Moons</h4>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-alt-cloudy-gusts"></i></div>
                                                <div class="class">wi-night-alt-cloudy-gusts</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-alt-cloudy-windy"></i></div>
                                                <div class="class">wi-night-alt-cloudy-windy</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-alt-hail"></i></div>
                                                <div class="class">wi-night-alt-hail</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-alt-lightning"></i></div>
                                                <div class="class">wi-night-alt-lightning</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-alt-rain-mix"></i></div>
                                                <div class="class">wi-night-alt-rain-mix</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-alt-rain-wind"></i></div>
                                                <div class="class">wi-night-alt-rain-wind</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-alt-rain"></i></div>
                                                <div class="class">wi-night-alt-rain</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-alt-showers"></i></div>
                                                <div class="class">wi-night-alt-showers</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-alt-snow"></i></div>
                                                <div class="class">wi-night-alt-snow</div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-alt-sprinkle"></i></div>
                                                <div class="class">wi-night-alt-sprinkle</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-alt-storm-showers"></i></div>
                                                <div class="class">wi-night-alt-storm-showers</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-alt-thunderstorm"></i></div>
                                                <div class="class">wi-night-alt-thunderstorm</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-clear"></i></div>
                                                <div class="class">wi-night-clear</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-cloudy-gusts"></i></div>
                                                <div class="class">wi-night-cloudy-gusts</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-cloudy-windy"></i></div>
                                                <div class="class">wi-night-cloudy-windy</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-cloudy"></i></div>
                                                <div class="class">wi-night-cloudy</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-hail"></i></div>
                                                <div class="class">wi-night-hail</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-lightning"></i></div>
                                                <div class="class">wi-night-lightning</div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-rain-mix"></i></div>
                                                <div class="class">wi-night-rain-mix</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-rain-wind"></i></div>
                                                <div class="class">wi-night-rain-wind</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-rain"></i></div>
                                                <div class="class">wi-night-rain</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-showers"></i></div>
                                                <div class="class">wi-night-showers</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-snow"></i></div>
                                                <div class="class">wi-night-snow</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-sprinkle"></i></div>
                                                <div class="class">wi-night-sprinkle</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-storm-showers"></i></div>
                                                <div class="class">wi-night-storm-showers</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-thunderstorm"></i></div>
                                                <div class="class">wi-night-thunderstorm</div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="wide" />
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h4>Miscellaneous Weather </h4>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-celsius"></i></div>
                                                <div class="class">wi-celcius</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-cloud-down"></i></div>
                                                <div class="class">wi-cloud-down</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-cloud-refresh"></i></div>
                                                <div class="class">wi-cloud-refresh</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-cloud-up"></i></div>
                                                <div class="class">wi-cloud-up</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-cloud"></i></div>
                                                <div class="class">wi-cloud</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-degrees"></i></div>
                                                <div class="class">wi-degrees</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-down-left"></i></div>
                                                <div class="class">wi-down-left</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-down"></i></div>
                                                <div class="class">wi-down</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-fahrenheit"></i></div>
                                                <div class="class">wi-fahrenheit</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-horizon-alt"></i></div>
                                                <div class="class">wi-horizon-alt</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-horizon"></i></div>
                                                <div class="class">wi-horizon</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-left"></i></div>
                                                <div class="class">wi-left</div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-lightning"></i></div>
                                                <div class="class">wi-lightning</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-night-fog"></i></div>
                                                <div class="class">wi-night-fog</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-refresh-alt"></i></div>
                                                <div class="class">wi-refresh-alt</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-refresh"></i></div>
                                                <div class="class">wi-refresh</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-right"></i></div>
                                                <div class="class">wi-right</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-sprinkles"></i></div>
                                                <div class="class">wi-sprinkles</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-strong-wind"></i></div>
                                                <div class="class">wi-strong-wind</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-sunrise"></i></div>
                                                <div class="class">wi-sunrise</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-sunset"></i></div>
                                                <div class="class">wi-sunset</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-thermometer-exterior"></i></div>
                                                <div class="class">wi-thermometer-exterior</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-thermometer-internal"></i></div>
                                                <div class="class">wi-thermometer-internal</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-thermometer"></i></div>
                                                <div class="class">wi-thermometer</div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-tornado"></i></div>
                                                <div class="class">wi-tornado</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-up-right"></i></div>
                                                <div class="class">wi-up-right</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-up"></i></div>
                                                <div class="class">wi-up</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-wind-east"></i></div>
                                                <div class="class">wi-wind-east</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-wind-north-east"></i></div>
                                                <div class="class">wi-wind-north-east</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-wind-north-west"></i></div>
                                                <div class="class">wi-wind-north-west</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-wind-north"></i></div>
                                                <div class="class">wi-wind-north</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-wind-south-east"></i></div>
                                                <div class="class">wi-wind-south-east</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-wind-south-west"></i></div>
                                                <div class="class">wi-wind-south-west</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-wind-south"></i></div>
                                                <div class="class">wi-wind-south</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-wind-west"></i></div>
                                                <div class="class">wi-wind-west</div>
                                            </div>
                                            <div class="weathericons">
                                                <div class="icon"><i class="wi wi-windy"></i></div>
                                                <div class="class">wi-windy</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Row Ends-->
                    
                </div>

			</div>
		</div>


	</div>
	<script type="text/javascript"
		src="${ctx}/static/js/sys/icon/sysIcon_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>