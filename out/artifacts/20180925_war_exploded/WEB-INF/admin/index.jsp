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
		<!--内容-->
		<section class="content-header">
			<h1>简影-后台管理系统</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
				<li class="active">控制面板</li>
			</ol>
		</section>
		<section class="content" id="showcontent">
			<div class="row">
				<div class="col-md-6">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">内存使用率</h3>
						</div>
						<div class="box-body" id="meminfo" style="height:600px;"></div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">系统设置</h3>
						</div>
						<form >
							<div class="box-body" style="height:600px;">
								<div class="form-group">
									<label for="input_speed">限制速率大小</label>
									<input type="text" class="form-control" id="input_speed" placeholder="请输入限制速率！"
										   value="512">
								</div>
								<div class="form-group">
									<label for="input_mem">限制内存大小</label>
									<input type="text" class="form-control" id="input_mem" placeholder="请输入限制内存！"
										   value="10m">
								</div>
								<div class="form-group">
									<label for="input_num">限制客户端数量</label>
									<input type="text" class="form-control" id="input_num" placeholder="请输入限制客户端数量！"
										   value="4">
								</div>
								<div class="form-group">

									<a href="" class="btn btn-primary">保存并重启服务</a>
								</div>
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
<script src="../../static/admin/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="../../static/admin/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js" charset="UTF-8"></script>
<script src="../../static/js/echarts.min.js"></script>
<script>
    var myChart = echarts.init(document.getElementById('meminfo'));
    option = {
        backgroundColor: "white",
        tooltip: {
            formatter: "{a} <br/>{b} : {c}%"
        },
        toolbox: {
            feature: {
                restore: {},
                saveAsImage: {}
            }
        },
        series: [{
            name: '内存使用率',
            type: 'gauge',
            detail: {
                formatter: '{value}%'
            },
            data: [{
                value: 50,
                name: '内存使用率'
            }]
        }]
    };
    setInterval(function () {
        option.series[0].data[0].value = (Math.random() * 100).toFixed(2) - 0;
        myChart.setOption(option, true);
    }, 2000);

</script>

</body>
</html>