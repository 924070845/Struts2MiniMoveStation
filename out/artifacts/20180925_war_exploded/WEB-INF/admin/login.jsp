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
	<link rel="stylesheet" href="../../static/admin/dist/css/AdminLTE.min.css">
	<link rel="stylesheet" href="../../static/admin/plugins/iCheck/square/blue.css">
	<style>
		.login-page{
			background-image: url(../../static/admin/images/地球.jpg);
		}
		.login-box-body{
			opacity: 0.7;
			border-radius: 10px;
			/*margin-top: 80px;*/
		}
		.login-logo{
			margin-top: 140px;
		}
		input{
			opacity: 1;
		}
		b{
			color: lightgrey;
			opacity: 0.7;
		}
	</style>
</head>
<body class="hold-transition login-page">
<div class="login-box">
	<div class="login-logo">
		<a href=""><b>简&nbsp;▪&nbsp;影&nbsp;后台管理系统</b></a>
	</div>
	<div class="login-box-body">
		<p class="login-box-msg"></p>
		<div style="text-align: center; color: red"><s:actionerror/></div>
		<div style=" color: red"><s:fielderror fieldName="adminName_password_ERROR"/></div>
		<form action="adminLoginAction" method="post" id="form-data">
			<div class="form-group has-feedback">
				<input name="adminName" type="text" class="form-control" placeholder="请输入账号！" value="">
				<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				<div class="col-md-12" id="input_user"></div>
				<span style="color: red"><s:fielderror fieldName="adminNameNULL"/></span>
			</div>
			<div class="form-group has-feedback">
				<input name="password" type="password" class="form-control" placeholder="请输入密码！" value="">
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				<div class="col-md-12" id="input_pwd"></div>
				<span style="color: red"><s:fielderror fieldName="passwordNULL"/></span>
			</div>
			<div class="row">
				<div class="col-xs-8">
				</div>
				<div class="col-xs-4">
					<input id="btn-sub" type="submit" class="btn btn-primary btn-block btn-flat" value="登录" >
				</div>
			</div>
		</form>
	</div>
</div>
<script src="../../static/admin/plugins/jQuery/jQuery-2.2.0.min.js"></script>
<script src="../../static/admin/bootstrap/js/bootstrap.min.js"></script>
<script src="../../static/admin/plugins/iCheck/icheck.min.js"></script>
</body>
</html>
