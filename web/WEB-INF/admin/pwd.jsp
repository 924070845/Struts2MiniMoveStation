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
				<li><a href="#"><i class="fa fa-dashboard"></i> 个人资料</a></li>
				<li class="active">修改密码</li>
			</ol>
		</section>
		<section class="content" id="showcontent">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">修改密码</h3>
						</div>
						<form role="form" action="updateAdminPasswordAdmin">
							<div class="box-body">
								<div class="form-group">
									<s:fielderror fieldName="oldPasswordERROR" style="color:red;margin-left: 20px"/>
									<label for="input_pwd">旧密码</label>
									<input type="password" class="form-control" name="oldPassword" id="input_pwd"
										   placeholder="请输入旧密码！">
									<span style="color: red"><s:fielderror fieldName="oldpasswordNULL"/></span>
								</div>

								<div class="form-group">
									<label for="input_newpwd">新密码</label>
									<input type="password" class="form-control" name="newPassword" id="input_newpwd"
										   placeholder="请输入新密码！">
									<span style="color: red"><s:fielderror fieldName="passwordNULL"/></span>
									<span style="color: orange"><s:fielderror fieldName="passwordERROR"/></span>
								</div>

								<div class="form-group">
									<label for="input_newpwd">重复新密码</label>
									<input type="password" class="form-control" name="reNewPassword" id="input_renewpwd"
										   placeholder="请再次输入新密码！">
									<span style="color: red"><s:fielderror fieldName="repasswordNULL"/></span>
									<span style="color: orange"><s:fielderror fieldName="repasswordERROR"/></span>
								</div>

							</div>
							<div class="box-footer">
								<input type="submit" class="btn btn-primary" value="修改">
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