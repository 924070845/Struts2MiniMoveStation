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

		ul, li {
			padding: 0;
			margin: 0;
			list-style: none
		}
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
		<!--内容start-->
		<section class="content-header">
			<h1>简影-后台管理系统</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> 电影管理</a></li>
				<li class="active">电影列表</li>
			</ol>
		</section>
		<section class="content" id="showcontent">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">电影列表</h3>
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
						<div class="box-body table-responsive no-padding">
							<table class="table table-hover">
								<tbody>
								<tr>
									<th>编号</th>
									<th>片名</th>
									<th>片长</th>
									<th>标签</th>
									<th>地区</th>
									<th>星级</th>
									<th>上映时间</th>
									<th>添加时间</th>
									<th>操作事项</th>
								</tr>
								<tr>
									<s:iterator value="#session.movieList" var="mov" status="st">
										<%--根据当前迭代的元素的索引是否为偶数来决定是否使用背景色，其中status起关键作用--%>
								<tr <s:if test="#st.even">style="background-color: #d2d6de"</s:if>>
									<td><s:property value="#mov.movieID"/></td>
									<td><s:property value="#mov.title"/></td>
									<td><s:property value="#mov.playTime"/></td>
									<td><s:property value="#mov.labelName"/></td>
									<td><s:property value="#mov.area"/></td>
									<td><s:property value="#mov.star"/></td>
									<td><s:property value="#mov.releaseDate"/></td>
									<td><s:property value="#mov.addtime"/></td>
									<td style="text-align: center">
										<a href="selectID_MovieAction?id=<s:property value="#mov.movieID"/>" class="label label-success">编辑</a>
										&emsp;
										<a href="delete_MovieAction?id=<s:property value="#mov.movieID"/>" class="label label-danger"> 删除</a>&emsp;&emsp;
									</td>
								</tr>
								</s:iterator>
								</tr>
								</tbody>
								<span style="color:green; size: 20px; line-height: 40px"><s:actionmessage/></span>
							</table>
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
		<!--内容end-->
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