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

	</style>
</head>

<body>
<!--顶部导航-->
<div align="center" name="Head">
	<jsp:include page="nav.jsp"/>
</div>
<!--顶部导航-->
<!--内容-->
<div class="container" style="margin-top:76px">
	<div class="row">
		<div class="col-md-12">
			<ol class="breadcrumb" style="margin-top:6px;">
				<li>与"xxx"有关的电影，共x部</li>
			</ol>
		</div>
		<s:iterator value="#session.movieList" var="mov" status="st">
		<div class="col-md-12" style="margin-bottom: 6px">
			<div class="media">
				<div class="media-left">
					<a href="play.jsp">
						<img style="width: 100px;height: 143px" class="media-object" src="/movie_cover/${mov.logo}"
							 alt="${mov.title}">
					</a>
				</div>
				<div class="media-body">
					<h4 class="media-heading" style="margin: 10px">${mov.title}
						<a href="selectIDMovieAction?id=<s:property value="#mov.movieID"/>" class="label label-primary pull-right">
							<span class="glyphicon glyphicon-play"></span>详情</a></h4>
					<p style="width: 750px;margin-left: 10px;display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 3;overflow: hidden;">
						<br>${mov.info}
					</p>
				</div>
			</div>
		</div>
		</s:iterator>
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
<!--内容-->
<!--底部页脚-->
<div align="center" name="Head" style="margin-top: 250px">
	<jsp:include page="footer.jsp"/>
</div>
<%--底部页脚--%>
</body>
</html>
