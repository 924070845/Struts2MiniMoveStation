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
	<link rel="stylesheet" href="../../static/base/css/upload-face.css">
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
			<a href="" class="list-group-item active">
				<span class="glyphicon glyphicon-user"></span>&nbsp;会员中心
			</a>
			<a href="comPwd_UserAction" class="list-group-item">
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
				<s:iterator value="#session.userList" var="u" status="st">
					<form role="form" action="userAction" method="post" enctype="multipart/form-data">
						<fieldset>
							<div class="form-group">
								<label for="input_name"><span class="glyphicon glyphicon-user"></span>&nbsp;用户名</label>
								<input id="input_name" class="form-control" placeholder="用户名" name="username" type="text"
									   readonly autofocus value="<s:property value="username" />">
							</div>
							<div class="col-md-12" id="error_name"></div>
							<div class="form-group">
								<label for="input_email"><span
										class="glyphicon glyphicon-envelope"></span>&nbsp;邮箱</label>
								<input id="input_email" class="form-control" placeholder="邮箱" name="email" type="email"
									   autofocus value="<s:property value="email"/>">
								<span style="color: red"><s:fielderror fieldName="emailNULL"/></span>
								<span style="color: orange"><s:fielderror fieldName="emailERROR"/></span>
							</div>
							<div class="col-md-12" id="error_email"></div>
							<div class="form-group">
								<label for="input_phone"><span class="glyphicon glyphicon-phone"></span>&nbsp;手机</label>
								<input id="input_phone" class="form-control" placeholder="手机" name="phone" type="text"
									   autofocus value="<s:property value="phone"/>">
								<span style="color: red"><s:fielderror fieldName="phoneNULL"/></span>
								<span style="color: orange"><s:fielderror fieldName="phoneERROR"/></span>
							</div>
							<div class="col-md-12" id="error_phone"></div>
							<div class="form-group">
								<label><span class="glyphicon glyphicon-picture"></span>&nbsp;头像</label>
								<div class="con4">
									<canvas id="cvs" width="200" height="200"></canvas>
									<span class="btn upload">选择头像
										<input type="file" class="upload_pic" id="upload" name="face"/>
									</span>
								</div>


								<%--<input id="input_face" class="form-control"  type="hidden" autofocus>--%>
							</div>
							<div class="col-md-12" id="error_face"></div>
							<div class="col-md-12" id="error_info"></div>
							<input type="submit" class="btn btn-success" value="提交">
						</fieldset>
					</form>
				</s:iterator>
			</div>
		</div>
	</div>
</div>
<!--内容-->
<!--底部页脚-->
<div align="center" name="Head">
	<jsp:include page="footer.jsp"/>
</div>
<%--底部页脚--%>
<%--用于上传头像部分的js脚本开始--%>
<script src="../../static/base/js/upload-face.js"></script>
</body>
</html>
