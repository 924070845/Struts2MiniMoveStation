<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
	<title>简影</title>
	<link rel="shortcut icon" href="../../static/base/images/logo.png">
	<link rel="stylesheet" href="../../static/base/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../static/base/css/bootstrap-movie.css">
	<link rel="stylesheet" href="../../static/base/css/animate.css">
	<!--播放页面-->
	<link rel="stylesheet" type="text/css" href="../static/jwplayer/skins/stormtrooper.css">
	<script type="text/javascript" src="../static/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" src="../static/ueditor/ueditor.all.js"></script>
	<script type="text/javascript" src="../static/ueditor/lang/zh-cn/zh-cn.js"></script>
	<script>
        SyntaxHighlighter.all();
	</script>
	<!--播放页面-->
	<style>
		.navbar-brand > img {
			display: inline;
		}

		.media {
			padding: 3px;
			border: 1px solid #ccc
		}

		.col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9 {
			padding-right: 3px;
			padding-left: 3px;
		}

		.panel-info {
			width: 750px;
			position: relative;
			display: inline-block;
		}

		.info-logo {
			display: inline-block;
			float: left;
			border: 15px solid #ccc;
		}

		.Mylogo {
			width: 280px;
			margin: 30px;
		}
	</style>
</head>

<body>
<!--顶部导航-->
<div align="center" name="Head">
	<jsp:include page="nav.jsp"/>
</div>
<!--顶部导航-->
<!--内容-->
<%--从action中获取电影信息--%>
<s:action name="selectIDMovieAction" executeResult="false"></s:action>
<s:iterator value="#session.movieList" var="mov" status="st">
<div class="container" style="margin-top:76px">
	<div class=" panel-logo info-logo Myinfo">
		<img class="Mylogo" src="/movie_cover/${mov.logo}" alt="">
	</div>
	<div class="row">
		<div class="col-md-8">
			<div id="moviecontainer"></div>
		</div>
		<div class="col-md-4" style="height:500px;">

			<div class="panel panel-info info-content Myinfo">
				<div class="panel-heading">
					<h3 class="panel-title"><span class="glyphicon glyphicon-facetime-video"></span>&nbsp;电影介绍</h3>
				</div>
				<div class="panel-body" style="height:459px;">
					<table class="table">
						<tr>
							<td style="width:30%;color:#ccc;font-weight:bold;font-style:italic;">
								<span class="glyphicon glyphicon-film"></span>&nbsp;片名
							</td>
							<td>${mov.title}</td>
						</tr>
						<tr>
							<td style="color:#ccc;font-weight:bold;font-style:italic;">
								<span class="glyphicon glyphicon-tag"></span>&nbsp;标签
							</td>
							<td>${mov.labelName}</td>
						</tr>
						<tr>
							<td style="color:#ccc;font-weight:bold;font-style:italic;">
								<span class="glyphicon glyphicon-time"></span>&nbsp;片长
							</td>
							<td>${mov.playTime}</td>
						</tr>
						<tr>
							<td style="color:#ccc;font-weight:bold;font-style:italic;">
								<span class="glyphicon glyphicon-map-marker"></span>&nbsp;地区
							</td>
							<td>${mov.area}</td>
						</tr>
						<tr>
							<td style="color:#ccc;font-weight:bold;font-style:italic;">
								<span class="glyphicon glyphicon-star"></span>&nbsp;星级
							</td>
							<td>
								<div>
									<s:if test="#mov.star==1">
										<span class="glyphicon glyphicon-star" style="color:#FFD119"></span>
										<span class="glyphicon glyphicon-star-empty" style="color:#FFD119"></span>
										<span class="glyphicon glyphicon-star-empty" style="color:#FFD119"></span>
										<span class="glyphicon glyphicon-star-empty" style="color:#FFD119"></span>
										<span class="glyphicon glyphicon-star-empty" style="color:#FFD119"></span>
									</s:if>
									<s:if test="#mov.star==2">
										<span class="glyphicon glyphicon-star" style="color:#FFD119"></span>
										<span class="glyphicon glyphicon-star" style="color:#FFD119"></span>
										<span class="glyphicon glyphicon-star-empty" style="color:#FFD119"></span>
										<span class="glyphicon glyphicon-star-empty" style="color:#FFD119"></span>
										<span class="glyphicon glyphicon-star-empty" style="color:#FFD119"></span>
									</s:if>

									<s:if test="#mov.star==3">
										<span class="glyphicon glyphicon-star" style="color:#FFD119"></span>
										<span class="glyphicon glyphicon-star" style="color:#FFD119"></span>
										<span class="glyphicon glyphicon-star" style="color:#FFD119"></span>
										<span class="glyphicon glyphicon-star-empty" style="color:#FFD119"></span>
										<span class="glyphicon glyphicon-star-empty" style="color:#FFD119"></span>
									</s:if>
									<s:if test="#mov.star==4">
										<span class="glyphicon glyphicon-star" style="color:#FFD119"></span>
										<span class="glyphicon glyphicon-star" style="color:#FFD119"></span>
										<span class="glyphicon glyphicon-star" style="color:#FFD119"></span>
										<span class="glyphicon glyphicon-star" style="color:#FFD119"></span>
										<span class="glyphicon glyphicon-star-empty" style="color:#FFD119"></span>
									</s:if>
									<s:if test="#mov.star==5">
										<span class="glyphicon glyphicon-star" style="color:#FFD119"></span>
										<span class="glyphicon glyphicon-star" style="color:#FFD119"></span>
										<span class="glyphicon glyphicon-star" style="color:#FFD119"></span>
										<span class="glyphicon glyphicon-star" style="color:#FFD119"></span>
										<span class="glyphicon glyphicon-star" style="color:#FFD119"></span>
									</s:if>
								</div>
							</td>
						</tr>
						<tr>
							<td style="color:#ccc;font-weight:bold;font-style:italic;">
								<span class="glyphicon glyphicon-calendar"></span>&nbsp;上映时间
							</td>
							<td>${mov.releaseDate}</td>
						</tr>
						<tr>
							<td style="color:#ccc;font-weight:bold;font-style:italic;">
								<span class="glyphicon glyphicon-play"></span>&nbsp;播放数量
							</td>
							<td>1000</td>
						</tr>
						<tr>
							<td style="color:#ccc;font-weight:bold;font-style:italic;">
								<span class="glyphicon glyphicon-comment"></span>&nbsp;评论数量
							</td>
							<td>1000</td>
						</tr>
						<tr>
							<td style="color:#ccc;font-weight:bold;font-style:italic;">
								<span class="glyphicon glyphicon-picture"></span>&nbsp;影片介绍
							</td>
							<td>
								<p style="display: -webkit-box;
								-webkit-box-orient: vertical;
								-webkit-line-clamp: 7;
								overflow: hidden;">
									&emsp;&emsp;${mov.info}
								</p>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		</s:iterator>

		<div class="col-md-12" style="margin-top:6px;">
			<div class="panel panel-danger">
				<div class="panel-heading">
					<h3 class="panel-title"><span class="glyphicon glyphicon-comment"></span>&nbsp;电影评论</h3>
				</div>
				<div class="panel-body">
					<div class="alert alert-danger alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">×</span>
							<span class="sr-only">Close</span>
						</button>
						<s:if test="#session.username==null">
							<strong>请先<a href="loginIndex_UserAction" target="_blank" class="text-info">登录</a>，才可浏览与参与评论！</strong>
						</s:if>
						<s:else>
							<strong>欢迎,&emsp;${sessionScope.username}</strong>
						</s:else>
					</div>
					<ol class="breadcrumb" style="margin-top:6px;">
					</ol>
					<form role="form" action="InsertCommentAction" method="post" style="margin-bottom:6px;">
						<div class="form-group">
							<div>
								<label for="input_content">内容</label>
								<textarea id="input_content" name="content" style="width: 1075px;height: 100px"></textarea>
							</div>
							<span style="color: red"><s:fielderror fieldName="contentNULL"/></span>
							<span style="color:green; size: 20px; line-height: 40px">${commentSUCCESS}</span>
							<div class="col-xs-12" id="error_content"></div>
						</div>
						<input type="submit" class="btn btn-success" id="btn-sub" value="提交评论">
						&nbsp;
						<a class="btn btn-danger" id="btn-col"><span class="glyphicon glyphicon-heart"></span>&nbsp;收藏电影</a>
					</form>
					<s:action name="selectID_CommentAction"></s:action>
					<br><span class="comment-author">全部评论：<span>共&nbsp;<s:property value="#session.commentAllListSize"/>&nbsp;条记录</span></span><br><br>
					<ul class="commentList">

						<s:iterator value="#session.commentList" var="comm" status="st">
							<span class="comment-author"> <s:property value="#st.index+1"/></span>
							<li class="item cl">

								<a>
									<i class="avatar size-L radius">
										<img style="width: 50px; height: 50px" alt="50x50" src="/face/${comm.user_face}" class="img-circle" style="border:1px solid #abcdef;">
									</i>
								</a>
								<div class="comment-main">
									<header class="comment-header">
										<div class="comment-meta">
											<a class="comment-author">${comm.userName}</a>
											评论于 <span>${comm.addtime}</span>
										</div>
									</header>
									<div class="comment-body">
										<p>${comm.content}</p>
									</div>
								</div>
							</li>
						</s:iterator>
					</ul>

					<div class="col-md-12 text-center">
						<nav aria-label="Page navigation">
							<ul class="pagination">
								<li>
									<a href="#" aria-label="First">
										<span aria-hidden="true">首页</span>
									</a>
								</li>
								<li>
									<a href="#" aria-label="Previous">
										<span aria-hidden="true">上一页</span>
									</a>
								</li>
								<li><a href="#">1&nbsp;/&nbsp;10</a></li>
								<li>
									<a href="#" aria-label="Next">
										<span aria-hidden="true">下一页</span>
									</a>
								</li>
								<li>
									<a href="#" aria-label="Last">
										<span aria-hidden="true">尾页</span>
									</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--内容-->
<!--底部页脚-->
<div align="center" name="Head">
	<jsp:include page="footer.jsp"/>
</div>
<%--底部页脚--%>
<script src="../../static/base/js/jquery.min.js"></script>
<script src="../../static/base/js/bootstrap.min.js"></script>
<script src="../../static/base/js/jquery.singlePageNav.min.js"></script>
<script src="../../static/base/js/wow.min.js"></script>
<script src="../static/lazyload/jquery.lazyload.min.js"></script>
<script src="//cdn.bootcss.com/holder/2.9.4/holder.min.js"></script>
<!--播放页面-->
<script src="../static/jwplayer/jwplayer.js"></script>
<script>
    var ue = UE.getEditor('input_content', {
        toolbars: [
            ['fullscreen', 'emotion', 'preview', 'link']
        ],
        initialFrameWidth: "100%",
        initialFrameHeight: "100",
    });
</script>
<script type="text/javascript">
    jwplayer.key = "P9VTqT/X6TSP4gi/hy1wy23BivBhjdzVjMeOaQ==";
</script>
<script type="text/javascript">
    jwplayer("moviecontainer").setup({
        flashplayer: "../static/jwplayer/jwplayer.flash.swf",
        playlist: [{
            file: "../static/video/htpy.mp4",
            title: "环太平洋"
        }],
        modes: [{
            type: "html5"
        }, {
            type: "flash",
            src: "../static/jwplayer/jwplayer.flash.swf"
        }, {
            type: "download"
        }],
        skin: {
            name: "vapor"
        },
        "playlist.position": "left",
        "playlist.size": 400,
        height: 500,
        width: 774,
    });
</script>
<!--播放页面-->
<script>
    $(function () {
        new WOW().init();
    })
</script>
<script>
    $(document).ready(function () {
        $("img.lazy").lazyload({
            effect: "fadeIn"
        });
    });
</script>
</body>
</html>
