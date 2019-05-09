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
	<link rel="stylesheet" href="../../static/base/css/upload-logo.css">

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
		<!--内容-->
		<section class="content-header">
			<h1>简影-后台管理系统</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> 电影管理</a></li>
				<li class="active">添加电影</li>
			</ol>
		</section>
		<section class="content" id="showcontent">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">添加电影</h3>
						</div>
						<%--有上传内容的表单必须加下面那句话--%>
						<form action="insertMovieAction" method="post" enctype="multipart/form-data">
							<div class="box-body">
								<div class="form-group">
									<label for="input_title">片名</label>
									<input type="text" class="form-control" name="title" id="input_title"
										   placeholder="请输入片名！">
									<span style="color: red"><s:fielderror fieldName="titleNULL"/></span>
									<span style="color: orange"><s:fielderror fieldName="titleERROR"/></span>
								</div>
								<div class="form-group">
									<label for="input_info">介绍</label>
									<textarea class="form-control" name="info" rows="10" id="input_info"></textarea>
									<span style="color: red"><s:fielderror fieldName="infoNULL"/></span>
									<span style="color: orange"><s:fielderror fieldName="infoERROR"/></span>
								</div>
								<div class="form-group">
									<label>封面</label>
									<div class="con4">
										<span style="color: red"><s:fielderror fieldName="logoNULL"/></span>
										<canvas id="cvs" width="200" height="285"
												style="border-color: #d2d6de"></canvas>
										<span class="btn upload">选择封面
										<input type="file" class="upload_pic" id="upload" name="cover"/>
									</span>
									</div>

									<%--上传封面结束--%>
								</div>

								<div class="form-group">
									<label for="input_star">星级</label>
									<select class="form-control" id="input_star" name="star">
										<option value="1">1星</option>
										<option value="2">2星</option>
										<option value="3">3星</option>
										<option value="4">4星</option>
										<option value="5">5星</option>
									</select>
								</div>
								<%--调用执行action，使得select时，列表中必有值--%>
								<s:action name="selectAll_LabelAction" executeResult="false"></s:action>

								<div class="form-group">
									<label>标签</label>
									<s:select list="#session.labelList"
											  class="form-control"
											  id="input_tag"
											  name="label_id"
											  listKey="labelID"
											  listValue="labelName">
									</s:select>
								</div>
								<div class="form-group">
									<label for="input_area">地区</label>
									<input type="text" class="form-control" name="area" id="input_area"
										   placeholder="请输入地区！">
									<span style="color: red"><s:fielderror fieldName="areaNULL"/></span>
									<span style="color: orange"><s:fielderror fieldName="areaERROR"/></span>
								</div>
								<div class="form-group">
									<label for="input_length">片长</label>
									<input type="text" class="form-control" name="playTime" id="input_length"
										   placeholder="请输入片长！">
									<span style="color: red"><s:fielderror fieldName="playTimeNULL"/></span>
									<span style="color: orange"><s:fielderror fieldName="playTimeERROR"/></span>
								</div>
								<div class="form-group">
									<label for="input_release_time">上映时间</label>
									<input type="text" class="form-control" name="releaseDate" id="input_release_time"
										   placeholder="请选择上映时间！">
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
<script src="../../static/base/js/upload-logo.js"></script>

<!--播放页面-->
<script src="../static/jwplayer/jwplayer.js"></script>
<script type="text/javascript">
    jwplayer.key = "P9VTqT/X6TSP4gi/hy1wy23BivBhjdzVjMeOaQ==";

</script>
<script type="text/javascript">
    jwplayer("moviecontainer").setup({
        flashplayer: "../static/jwplayer/jwplayer.flash.swf",
        playlist: [{
            file: "../static/video/htpy.mp4",
            title: "环太平洋"
        }],
        modes: [{
            type: "html5"
        }, {
            type: "flash",
            src: "../static/jwplayer/jwplayer.flash.swf"
        }, {
            type: "download"
        }],
        skin: {
            name: "vapor"
        },
        "playlist.position": "left",
        "playlist.size": 200,
        height: 250,
        width: 387,
    });

</script>
<script>
    $(document).ready(function () {
        $('#input_release_time').datepicker({
            autoclose: true,
            format: 'yyyy-mm-dd',
            language: 'zh-CN',
        });
    });

</script>

</body>
</html>