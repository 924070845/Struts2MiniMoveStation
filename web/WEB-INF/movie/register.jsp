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
<div class="container" style="margin-top:120px">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title"><span class="glyphicon glyphicon-plus"></span>&nbsp;会员注册</h3>
				</div>
				<div class="panel-body">
					<form role="form" method="post" action="registerAction">
						<fieldset>
							<div style=" color: red"><s:fielderror fieldName="Duplicate_username"/></div>
							<div class="form-group">
								<label for="input_name"><span class="glyphicon glyphicon-user"></span>&nbsp;用户名</label>
								<input id="input_name" class="form-control input-lg" placeholder="用户名" name="username"
									   type="text" autofocus>
								<span style="color: red"><s:fielderror fieldName="usernameNULL"/></span>
								<span style="color: orange"><s:fielderror fieldName="usernameERROR"/></span>
							</div>
							<div class="col-md-12" id="error_name"></div>
							<div class="form-group">
								<label for="input_email"><span
										class="glyphicon glyphicon-envelope"></span>&nbsp;邮箱</label>
								<input id="input_email" class="form-control input-lg" placeholder="邮箱" name="email"
									   type="email" autofocus>
								<span style="color: red"><s:fielderror fieldName="emailNULL"/></span>
								<span style="color: orange"><s:fielderror fieldName="emailERROR"/></span>
							</div>
							<div class="col-md-12" id="error_email"></div>
							<div class="form-group">
								<label for="input_phone"><span class="glyphicon glyphicon-phone"></span>&nbsp;手机</label>
								<input id="input_phone" class="form-control input-lg" placeholder="手机" name="phone"
									   type="text" autofocus>
								<span style="color: red"><s:fielderror fieldName="phoneNULL"/></span>
								<span style="color: orange"><s:fielderror fieldName="phoneERROR"/></span>
							</div>
							<div class="col-md-12" id="error_phone"></div>

							<div class="form-group">
								<label for="input_password"><span
										class="glyphicon glyphicon-lock"></span>&nbsp;密码</label>
								<input id="input_password" class="form-control input-lg" placeholder="密码"
									   name="password" type="password" value="">
								<span style="color: red"><s:fielderror fieldName="passwordNULL"/></span>
								<span style="color: orange"><s:fielderror fieldName="passwordERROR"/></span>
							</div>
							<div class="col-md-12" id="error_password"></div>
							<div class="form-group">
								<label for="input_repassword"><span
										class="glyphicon glyphicon-lock"></span>&nbsp;确认密码</label>
								<input id="input_repassword" class="form-control input-lg" placeholder="确认密码"
									   name="rePassword" type="password" value="">
								<span style="color: red"><s:fielderror fieldName="repasswordNULL"/></span>
								<span style="color: orange"><s:fielderror fieldName="repasswordERROR"/></span>
							</div>
							<div class="col-md-12" id="error_repassword"></div>
							<input type="submit" value="注册" class="btn btn-lg btn-success btn-block">
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!--内容-->
<!--底部页脚-->
<div align="center" name="Head" style="margin-top: 19px;">
	<jsp:include page="footer.jsp"/>
</div>
<%--底部页脚--%>
</body>
</html>
