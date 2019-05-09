<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>简影-后台</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="shortcut icon" href="../../static/base/images/logo.png">
	<link rel="stylesheet" href="../../static/admin/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../static/fonts/css/font-awesome.min.css">
	<link rel="stylesheet" href="../static/ionicons/css/ionicons.min.css">
	<link rel="stylesheet" href="../../static/admin/dist/css/AdminLTE.min.css">
	<link rel="stylesheet" href="../../static/admin/dist/css/skins/_all-skins.min.css">
	<link rel="stylesheet" type="text/css" href="../../static/admin/plugins/datepicker/datepicker3.css">
	<style>
		* {
			font-family: "Microsoft YaHei";
		}

		.table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
			vertical-align: middle;
			text-align: center;
		}
		ul,li{ padding:0;margin:0;list-style:none}
	</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
	<!--顶部导航-->
	<div name="Head">
		<jsp:include page="header.jsp"/>
	</div>
	<!--顶部导航-->

	<div class="content-wrapper">
		<!--内容-->
		<section class="content-header">
			<h1>简影-后台管理系统</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> 评论管理</a></li>
				<li class="active">评论列表</li>
			</ol>
		</section>
		<section class="content" id="showcontent">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">评论列表</h3>
							<div class="box-tools">

								<div class="input-group input-group-sm" style="width: 150px;">
									<input type="text" name="table_search" class="form-control pull-right"
										   placeholder="请输入关键字...">

									<div class="input-group-btn">
										<button type="submit" class="btn btn-default"><i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
						<span class="comment-author">&emsp;全部评论：<span>共&nbsp;<s:property value="#session.commentsAllList"/>&nbsp;条记录</span></span><br>

						<div class="box-body box-comments" style="font-size: 16px">
							<s:iterator value="#session.commentList" var="comm" status="st">
								<span class="comment-author"> <s:property value="#st.index+1"/></span>
								<div class="box-comment">
									<img class="img-circle img-sm"
										 src="/face/${comm.user_face}" alt="User Image">
									<div class="comment-text">
                                    <span class="username">
                                        ${comm.userName}
                                        <span class="text-muted pull-right">
                                            <i class="fa fa-calendar" aria-hidden="true"></i>
                                            &nbsp;
                                            ${comm.addtime}
                                        </span>
                                    </span>
										关于电影<a src="">${comm.movieName}</a>的评论：
										<span style="color: #3c8cbb">${comm.content}</span>
										<br><a href="deleteUser_CommentAction?id=<s:property value="#comm.commentID"/>" class="label label-danger pull-right">删除</a>
									</div>
								</div>
							</s:iterator>
						</div>
						<div class="box-footer clearfix">
							<ul class="pagination pagination-sm no-margin pull-right">
								<li><a href="#">首页</a></li>
								<li><a href="#">上一页</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">下一页</a></li>
								<li><a href="#">尾页</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--内容-->
	</div>
	<!--底部页脚-->
	<div align="center" name="Head">
		<jsp:include page="footer.jsp"/>
	</div>
	<%--底部页脚--%>
</div>
<script src="../../static/admin/plugins/jQuery/jQuery-2.2.0.min.js"></script>
<script src="../../static/admin/bootstrap/js/bootstrap.min.js"></script>
<script src="../../static/admin/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../../static/admin/plugins/fastclick/fastclick.js"></script>
<script src="../../static/admin/dist/js/app.min.js"></script>
<script src="../../static/admin/dist/js/demo.js"></script>
<script src="//cdn.bootcss.com/holder/2.9.4/holder.min.js"></script>
<script src="../../static/admin/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="../../static/admin/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js" charset="UTF-8"></script>


</body>
</html>