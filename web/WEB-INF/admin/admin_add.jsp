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
		<!--内容start-->

		<section class="content-header">
			<h1>简影-后台管理系统</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> 管理员管理</a></li>
				<li class="active">添加管理员</li>
			</ol>
		</section>
		<section class="content" id="showcontent">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">添加管理员</h3>
						</div>
						<form role="form" action="addAdminAction" method="post">
							<div class="box-body"  >
								<div class="form-group">
									<label for="input_name">管理员名称</label>
									<input type="text" name="adminName" class="form-control" id="input_name" placeholder="请输入管理员名称！">
									<span style="color: red"><s:fielderror fieldName="adminNameNULL"/></span>
									<span style="color: orange"><s:fielderror fieldName="adminNameERROR"/></span>
								</div>
								<div class="form-group">
									<label for="input_pwd">管理员密码</label>
									<input type="password" name="password" class="form-control" id="input_pwd" placeholder="请输入管理员密码！">
									<span style="color: red"><s:fielderror fieldName="passwordNULL"/></span>
									<span style="color: orange"><s:fielderror fieldName="passwordERROR"/></span>
								</div>
								<div class="form-group">
									<label for="input_re_pwd">管理员重复密码</label>
									<input type="password" name="reNewPassword" class="form-control" id="input_re_pwd" placeholder="请输入管理员重复密码！">
									<span style="color: red"><s:fielderror fieldName="repasswordNULL"/></span>
									<span style="color: orange"><s:fielderror fieldName="repasswordERROR"/></span>
								</div>
							</div>
							<div class="box-footer">
								<button type="submit" class="btn btn-primary">添加</button>
							</div>
						</form>
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