<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 92407
  Date: 2018/11/27
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>简影-后台</title>
</head>
<body>

<header class="main-header">
	<a href="index.jsp" class="logo">
			<span class="logo-mini"><img src="../../static/base/images/logo.png" style="height:40px;width:40px;">电影系统</span>
		<span class="logo-lg"><img src="../../static/base/images/logo.png" style="height:40px;width:40px;">简影-后台管理系统</span>
	</a>
	<nav class="navbar navbar-static-top">
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
			<span class="sr-only">下拉菜单</span>
		</a>
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<li class="dropdown user user-menu">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<img src="../../static/admin/dist/img/user2-160x160.jpg"
							 class="user-image" alt="User Image">
						<span class="hidden-xs">${sessionScope.adminName}</span>
					</a>
					<ul class="dropdown-menu">
						<li class="user-header">
							<img src="../../static/admin/dist/img/user2-160x160.jpg"
								 class="img-circle" alt="User Image">
							<p>
								${sessionScope.adminName}
								<small>2018-1-1</small>
							</p>
						</li>
						<li class="user-footer">
							<div class="pull-left">
								<a href="updatePassword_AdminAction" class="btn btn-default btn-flat">修改密码</a>
							</div>
							<div class="pull-right">
								<a href="remove_AdminAction" class="btn btn-default btn-flat">退出系统</a>
							</div>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
</header>

<aside class="main-sidebar">
	<section class="sidebar">
		<div class="user-panel">
			<div class="pull-left image">
				<img src="../../static/admin/dist/img/user2-160x160.jpg" class="img-circle"
					 alt="User Image">
			</div>
			<div class="pull-left info">
				<s:if test="#session.type == 'root'">
					<p>Root：${sessionScope.adminName}</p>
				</s:if>
				<s:else>
					<p>管理员：${sessionScope.adminName}</p>
				</s:else>
				<a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
			</div>
		</div>
		<!--搜索栏-->
		<form  class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control" placeholder="搜索...">
				<span class="input-group-btn">
                        <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i
								class="fa fa-search"></i>
                        </button>
                    </span>
			</div>
		</form>

		<ul class="sidebar-menu">
			<li class="header">管理菜单</li>
			<li class="treeview">
				<a href="#">
					<i class="fa fa-home" aria-hidden="true"></i>
					<span>首页</span>
					<span class="label label-primary pull-right">1</span>
				</a>
				<ul class="treeview-menu">
					<li>
						<a href="index">
							<i class="fa fa-circle-o"></i> 控制面板
						</a>
					</li>
				</ul>
			</li>
			<li class="treeview">
				<a href="#">
					<i class="fa fa-tags" aria-hidden="true"></i>
					<span>标签管理</span>
					<span class="label label-primary pull-right">2</span>
				</a>
				<ul class="treeview-menu">
					<li>
						<a href="labelIndex_addAction">
							<i class="fa fa-circle-o"></i> 添加标签
						</a>
					</li>
					<li>
						<a href="selectAll_LabelAction">
							<i class="fa fa-circle-o"></i> 标签列表
						</a>
					</li>
				</ul>
			</li>
			<li class="treeview">
				<a href="#">
					<i class="fa fa-file-video-o" aria-hidden="true"></i>
					<span>电影管理</span>
					<span class="label label-primary pull-right">2</span>
				</a>
				<ul class="treeview-menu">
					<li>
						<a href="movieIndex_addAction">
							<i class="fa fa-circle-o"></i> 添加电影
						</a>
					</li>
					<li>
						<a href="selectAll_MovieAction">
							<i class="fa fa-circle-o"></i> 电影列表
						</a>
					</li>
				</ul>
			</li>
			<li class="treeview">
				<a href="#">
					<i class="fa fa-comments" aria-hidden="true"></i>
					<span>评论管理</span>
					<span class="label label-primary pull-right">1</span>
				</a>
				<ul class="treeview-menu">
					<li>
						<a href="selectAll_CommentAction">
							<i class="fa fa-circle-o"></i> 评论列表
						</a>
					</li>
				</ul>
			</li>
			<li class="treeview">
				<a href="#">
					<i class="fa fa-users" aria-hidden="true"></i>
					<span>会员管理</span>
					<span class="label label-primary pull-right">1</span>
				</a>
				<ul class="treeview-menu">
					<li>
						<a href="selectAll_UserAction">
							<i class="fa fa-circle-o"></i> 会员列表
						</a>
					</li>
				</ul>
			</li>
			<s:action name="rootAction"></s:action>
			<s:if test="#session.type=='root'">
				<li class="treeview">
					<a href="#">
						<i class="fa fa-user-circle" aria-hidden="true"></i>
						<span>管理员管理</span>
						<span class="label label-primary pull-right">2</span>
					</a>
					<ul class="treeview-menu">

						<li>
							<a href="adminIndex_addAction">
								<i class="fa fa-circle-o"></i> 添加管理员
							</a>
						</li>

						<li>
							<a href="selectAll_AdminAction">
								<i class="fa fa-circle-o"></i> 管理员列表
							</a>
						</li>
					</ul>
				</li>
			</s:if>


		</ul>
	</section>
</aside>
</body>
</html>
