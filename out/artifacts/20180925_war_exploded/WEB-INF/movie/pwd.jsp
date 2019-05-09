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

		.col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9 {
			padding-right: 3px;
			padding-left: 3px;
		}

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
	<div class="col-md-3">
		<div class="list-group">
			<a href="select_UserAction" class="list-group-item">
				<span class="glyphicon glyphicon-user"></span>&nbsp;会员中心
			</a>
			<a href="" class="list-group-item active">
				<span class="glyphicon glyphicon-lock"></span>&nbsp;修改密码
			</a>
			<a href="selectPersonal_CommentAction" class="list-group-item">
				<span class="glyphicon glyphicon-comment"></span>&nbsp;评论记录
			</a>
			<a href="NonePublicAction" class="list-group-item">
				<span class="glyphicon glyphicon-heart"></span>&nbsp;收藏电影
			</a>
		</div>
	</div>
	<div class="col-md-9">
		<div class="panel panel-warning">
			<div class="panel-heading">
				<h3 class="panel-title"><span class="glyphicon glyphicon-map-marker"></span>&nbsp;会员中心</h3>
			</div>
			<div class="panel-body">
				<form role="form" action="updatePasswordAction" method="post">
					<fieldset>
						<div class="form-group">
							<s:fielderror fieldName="oldPasswordERROR" style="color:red;margin-left: 20px"/>
							<label for="input_oldpwd"><span class="glyphicon glyphicon-lock"></span>&nbsp;旧密码</label>
							<input id="input_oldpwd" class="form-control" placeholder="旧密码" name="oldPassword"
								   type="password" autofocus>
							<span style="color: red"><s:fielderror fieldName="oldpasswordNULL"/></span>
						</div>
						<div class="col-md-12" id="error_oldpwd"></div>
						<div class="form-group">
							<label for="input_newpwd"><span class="glyphicon glyphicon-lock"></span>&nbsp;新密码</label>
							<input id="input_newpwd" class="form-control" placeholder="新密码" name="newPassword"
								   type="password" autofocus>
							<span style="color: red"><s:fielderror fieldName="passwordNULL"/></span>
							<span style="color: orange"><s:fielderror fieldName="passwordERROR"/></span>
						</div>
						<div class="col-md-12" id="error_newpwd"></div>
						<div class="form-group">
							<label for="input_newpwd"><span class="glyphicon glyphicon-lock"></span>&nbsp;重复新密码</label>
							<input id="input_renewpwd" class="form-control" placeholder="重复新密码" name="reNewPassword"
								   type="password" autofocus>
							<span style="color: red"><s:fielderror fieldName="repasswordNULL"/></span>
							<span style="color: orange"><s:fielderror fieldName="repasswordERROR"/></span>
						</div>
						<div class="col-md-12" id="error_renewpwd"></div>

						<input type="submit" value="修改密码" class="btn btn-success glyphicon glyphicon-edit" >
					</fieldset>

				</form>
			</div>
		</div>
	</div>
</div>
<!--内容-->
<!--底部页脚-->
<div align="center" name="Head" style="margin-top: 283px;">
	<jsp:include page="footer.jsp"/>
</div>
<%--底部页脚--%>
</body>
</html>
