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
	<link rel="stylesheet" href="../../static/base/css/nav-face.css">
	<style>
		.navbar-brand > img {
			display: inline;
		}

	</style>
	<style>
		.media {
			padding: 3px;
			border: 1px solid #ccc
		}
		ul, li {
			padding: 0;
			margin: 0;
			list-style: none
		}

	</style>
</head>

<body>
<!--导航-->
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<!--小屏幕导航按钮和logo-->
		<div class="navbar-header">
			<button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a href="index" class="navbar-brand" style="width:250px;">
				<img src="../../static/base/images/logo.png" style="height:30px;margin-right: 10px">&nbsp;简&nbsp;▪&nbsp;影
			</a>
		</div>
		<!--小屏幕导航按钮和logo-->
		<!--导航-->
		<div class="navbar-collapse collapse">
			<form action="getTitleMovieAction" method="post" class="navbar-form navbar-left" role="search" style="margin-top:18px;">
				<div class="form-group input-group">
					<input type="text" class="form-control" name="title" placeholder="请输入电影名！">

					<span class="input-group-btn">
                        <%--<a  href="search.jsp"><span class="glyphicon glyphicon-search"></span>&nbsp;搜索</a>--%>
						<input type="submit" class="btn btn-default" value="&nbsp;搜索&nbsp;">
                    </span>
				</div>
				<span style="color: red"><s:fielderror fieldName="titleNULL"/></span>
			</form>
			<ul class="nav navbar-nav navbar-right" style="width: 530px;margin-right: -80px;">
				<li>
					<a class="curlink" href="index"><span class="glyphicon glyphicon-film"></span>&nbsp;电影</a>
				</li>
				<li>
					<a class="curlink" href="loginIndex_UserAction"><span class="glyphicon glyphicon-log-in"></span>&nbsp;登录</a>
				</li>
				<li>
					<a class="curlink" href="registerIndex_UserAction"><span class="glyphicon glyphicon-plus"></span>&nbsp;注册</a>
				</li>
				<li>
					<a class="curlink" href="remove_UserAction"><span class="glyphicon glyphicon-log-out"></span>&nbsp;退出</a>
				</li>
				<li>
					<a class="curlink" href="select_UserAction"><span class="glyphicon glyphicon-user"></span>&nbsp;个人中心</a>
				</li>
				<li>
					<div class="glyphicon nav-face" ><img style="width: 45px;height:45px; border-radius: 50%" src='/face/${sessionScope.path}' alt=""></div>
				</li>
			</ul>
		</div>
		<!--导航-->

	</div>
</nav>
<!--导航-->
<!--内容-->
<div class="container">
</div>
<!--内容-->

</body>
</html>
