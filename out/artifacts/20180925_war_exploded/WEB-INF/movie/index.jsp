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
<!--热门电影-->
<section id="hotmovie" style="margin-top:76px">
	<div class="container">
		<div class="row wow fadeInRight" data-wow-delay="0.6s">
			<div class="row">
				<iframe class="wow fadeIn" width="100%" height="375px" frameborder=0 scrolling=no
						src="../../index-animation/animation.html"></iframe>
			</div>
		</div>
	</div>
</section>
<!--热门电影-->

<s:action name="selectAll_MovieAction" executeResult="false"></s:action>

<!--电影列表-->
<section id="movielist">
	<div class="container">
		<div class="row wow fadeIn" data-wow-delay="0.6s">
			<div class="col-md-12 table-responsive">
				<table class="table text-left table-bordered" id="movietags">
					<tr>
						<td style="width:10%;">电影标签</td>
						<td style="width:90%;">
							<s:iterator value="#session.movieList" var="mov" status="st">
							<a class="label label-info" style="margin:4px auto;">
								<span class="glyphicon glyphicon-tag"></span>&nbsp;${mov.labelName}</a>&nbsp;
							</s:iterator>
					</tr>
					<tr>
						<td>电影星级</td>
						<td>
							<a class="label label-warning"><span class="glyphicon glyphicon-star"></span>&nbsp;一星</a>&nbsp;
							<a class="label label-warning"><span class="glyphicon glyphicon-star"></span>&nbsp;二星</a>&nbsp;
							<a class="label label-warning"><span class="glyphicon glyphicon-star"></span>&nbsp;三星</a>&nbsp;
							<a class="label label-warning"><span class="glyphicon glyphicon-star"></span>&nbsp;四星</a>&nbsp;
							<a class="label label-warning"><span class="glyphicon glyphicon-star"></span>&nbsp;五星</a>
						</td>
					</tr>
					<tr>
						<td>上映时间</td>
						<td>
							<a class="label label-default"><span class="glyphicon glyphicon-time"></span>&nbsp;最近</a>&nbsp;
							<a class="label label-default"><span class="glyphicon glyphicon-time"></span>&nbsp;2016</a>&nbsp;
							<a class="label label-default"><span class="glyphicon glyphicon-time"></span>&nbsp;2017</a>&nbsp;
							<a class="label label-default"><span class="glyphicon glyphicon-time"></span>&nbsp;2018</a>&nbsp;
							<a class="label label-default"><span class="glyphicon glyphicon-time"></span>&nbsp;更早</a>&nbsp;
						</td>
					</tr>
					<tr>
						<td>播放数量</td>
						<td>
							<a class="label label-success"><span class="glyphicon glyphicon-arrow-down"></span>&nbsp;从高到底</a>&nbsp;
							<a class="label label-danger"><span class="glyphicon glyphicon-arrow-up"></span>&nbsp;从低到高</a>
						</td>
					</tr>
					<tr>
						<td>评论数量</td>
						<td>
							<a class="label label-success"><span class="glyphicon glyphicon-arrow-down"></span>&nbsp;从高到底</a>&nbsp;
							<a class="label label-danger"><span
									class="glyphicon glyphicon-arrow-up"></span>&nbsp;从低到高</a>
						</td>
					</tr>
				</table>
			</div>

			<s:iterator value="#session.movieList" var="mov" status="st">

				<div class="col-md-3" style="width: 20%;">
					<div class="movielist text-center">
						<!--<img data-original="holder.js/262x166"
								 class="img-responsive lazy center-block" alt="">-->
							<%--<img src="movie_cover/${mov.logo}" class="img-responsive center-block" alt="">--%>
						<img style="width: 200px; height: 285px" src="/movie_cover/${mov.logo}"
							 class="img-responsive center-block" alt="">
						<div class="text-left" style="margin-left:auto;margin-right:auto;width:200px">
							<span style="color:#999;font-style: italic;">${mov.title}</span><br>
								<%--给出电影相对应的星级start--%>
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


									<%--<span class="glyphicon glyphicon-star-empty" style="color:#FFD119"></span>--%>
									<%--给出电相对应的星级end--%>
							</div>
						</div>
						<a href="selectIDMovieAction?id=<s:property value="#mov.movieID"/>" class="btn btn-primary" style="width: 205px" target="_blank"
						   role="button"><span
								class="glyphicon glyphicon-play"></span>&nbsp;详情</a>
					</div>
				</div>

			</s:iterator>
			<div class="col-md-12">
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
</section>
<!--电影列表-->
<!--底部页脚-->
<div align="center" name="Head">
	<jsp:include page="footer.jsp"/>
</div>
<%--底部页脚--%>

</body>
</html>
