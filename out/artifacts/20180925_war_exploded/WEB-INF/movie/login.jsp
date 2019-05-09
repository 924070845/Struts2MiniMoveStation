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
<div align="center" name="Head" >
	<jsp:include page="nav.jsp"/>
</div>
<!--顶部导航-->

<!--内容-->
<div class="container" style="margin-top:120px;">
	<div class="row" style="margin-top: 65px;">
		<div class="col-md-4 col-md-offset-4">
			<div class="panel panel-primary" style="margin-bottom: 150px;">
				<div class="panel-heading">
					<h3 class="panel-title"><span class="glyphicon glyphicon-log-in"></span>&nbsp;会员登录</h3>
				</div>
				<div class="panel-body">
					<div style="text-align: center; color: red"><s:actionerror/></div>
					<div style=" color: red"><s:fielderror fieldName="username_password_ERROR"/></div>
					<form role="form" action="loginAction" method="post">
						<fieldset>
							<div class="form-group">
								<label for="input_contact"><span
										class="glyphicon glyphicon-user"></span>&nbsp;账号</label>
								<input id="input_contact" class="form-control input-lg" placeholder="用户名"
									   name="username" type="text" autofocus>
								<span style="color: red"><s:fielderror fieldName="usernameNULL"/></span>
							</div>
							<div class="col-md-12" id="error_contact"></div>
							<div class="form-group">
								<label for="input_password"><span
										class="glyphicon glyphicon-lock"></span>&nbsp;密码</label>
								<input id="input_password" class="form-control input-lg" placeholder="密码"
									   name="password" type="password" value="">
								<span style="color: red"><s:fielderror fieldName="passwordNULL"/></span>
							</div>
							<div class="col-md-12" id="error_password"></div>
							<input type="submit" class="btn btn-lg btn-success btn-block" value="登录">
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!--内容-->

<!--底部页脚-->
<div align="center" name="Head" style="    margin-top: 82px;">
	<jsp:include page="footer.jsp"/>
</div>
<%--底部页脚--%>
</body>
</html>
