<%--
  Created by IntelliJ IDEA.
  User: 92407
  Date: 2018/11/22
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>底部</title>
</head>
<body>

<!--底部-->
<footer style="background-color: #89959c;color: white">
	<div class="container" >
		<div class="row">
			<div class="col-md-12" >
				<p>
					©&nbsp;2018&nbsp;Struts_minimovie_static.com&emsp;详情请联系：&nbsp;924070845@qq.com
				</p>
			</div>
		</div>
	</div>
</footer>
<!--底部-->
<script src="../../static/base/js/jquery.min.js"></script>
<script src="../../static/base/js/bootstrap.min.js"></script>
<script src="../../static/base/js/jquery.singlePageNav.min.js"></script>
<script src="../../static/base/js/wow.min.js"></script>
<script src="../static/lazyload/jquery.lazyload.min.js"></script>
<script src="//cdn.bootcss.com/holder/2.9.4/holder.min.js"></script>
<script>
    $(function () {
        new WOW().init();
    })

</script>
<script>
    $(document).ready(function () {
        $("img.lazy").lazyload({
            effect: "fadeIn"
        });
    });

</script>
</body>
</html>
