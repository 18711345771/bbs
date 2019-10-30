<%@page import="com.bbs.po.User"%>
<%@page import="com.bbs.po.CurrentStates"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=basePath%>bootstrap/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>bootstrap/js/bootstrap.js"></script>
<script src="<%=basePath%>bootstrap/js/metisMenu.min.js"></script>
<script src="<%=basePath%>bootstrap/js/sb-admin-2.js"></script>
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=basePath%>bootstrap/css/metisMenu.min.css"
	rel="stylesheet">
<link href="<%=basePath%>bootstrap/css/sb-admin-2.css" rel="stylesheet">
<link href="<%=basePath%>bootstrap/css/font-awesome.min.css"
	rel="stylesheet">
<title>个人中心-我的风格</title>
</head>
<body>
	<div class="container">
		<div id="wrapper">
			<!-- 导航栏部分 -->
			<nav class="navbar navbar-default navbar-static-top"
				role="navigation" style="margin-bottom: 0">
				<div class="navbar-header">
					<a class="nav navbar-brand" href="#" data-toggle="collapse">Logo</a>
					<ul class="nav navbar-nav">
						<li class="nav-item"><a href="<%=basePath%>bbs/list.action"
							class="nav-link">论坛</a></li>
						<li class="nav-item"><a href="#" class="nav-link">聚焦</a></li>
						<li class="nav-item"><a href="#" class="nav-link">飞控榜</a></li>
						<li class="nav-item"><a href="#" class="nav-link"><b
								class="fa fa-bars"></b></a></li>
					</ul>
					<!--</div>-->
					<%
						CurrentStates curstates=(CurrentStates)request.getAttribute("currentStates");
						User userinfo = (User) request.getSession().getAttribute("UserInfo");
						User admininfo = (User) request.getSession().getAttribute("AdminInfo");
						if (userinfo != null) {
					%>
					<ul class="nav navbar-nav navbar-right pull-right" id="userinfobar">
						<li class="nav-item"><a
							href="<%=basePath%>bbs/Personal_Header.action" class="nav-link"><img
								alt="" src="<%=basePath %>${UserInfo.getHeadicon()}"
								style="border-radius: 20px; width: 20px; height: 20px;"></a></li>
						<li class="nav-item"><a
							href="<%=basePath%>bbs/personarticle.action" class="nav-link"
							style="font-size: 10px;">账号:${UserInfo.getUsername()}</a></li>
						<li class="nav-item"><a href="#" class="nav-link"
							style="font-size: 10px;">登录时间:${UserInfo.getDatetime()}</a></li>
						<li class="nav-item"><a href="#" class="nav-link"
							onclick="userlogout()" style="font-size: 10px;">[退出登录]</a></li>
					</ul>
					<%
						} else if (admininfo != null) {
					%>
					<ul class="nav navbar-nav navbar-right pull-right" id="userinfobar">
						<li class="nav-item"><a href="#" class="nav-link"><img
								alt="" src="<%=basePath%>${AdminInfo.getHeadicon()}"
								style="border-radius: 20px; width: 20px; height: 20px;"></a></li>
						<li class="nav-item"><a
							href="<%=basePath%>bbs/topublish_0.action" class="nav-link"
							style="font-size: 10px;">账号:${AdminInfo.getUsername()}[管理员]</a></li>
						<li class="nav-item"><a href="#" class="nav-link"
							style="font-size: 10px;">登录时间:${AdminInfo.getDatetime()}</a></li>
						<li class="nav-item"><a href="#" class="nav-link"
							onclick="userlogout()" style="font-size: 10px;">[退出登录]</a></li>
					</ul>
					<%
						} else {
					%>
					<ul class="nav navbar-nav navbar-right pull-right" id="userinfobar">
						<li class="nav-item"><a href="#" data-toggle="modal"
							data-target="#login_regist" class="nav-link"
							onclick="getLoginPane()">登录</a></li>
						<li class="nav-item"><a href="#" data-toggle="modal"
							data-target="#login_regist" class="nav-link"
							onclick="getRegistPane()">注册</a></li>
					</ul>
					<%
						}
					%>
				</div>
				<!-- 左侧显示列表部分 start-->
				<div class="navbar-default sidebar" role="navigation">
					<div class="sidebar-nav navbar-collapse">
						<ul class="nav">
							<li><img src="<%=basePath%>img/personalresource.png" alt=""
								style="width: 151px; height: 52px;">
								<ul class="nav" id="side-menu1">
									<li><a href="<%=basePath%>bbs/Personal_Header.action"
										> <i class="fa fa-user fa-fw"></i> 头像设置
									</a></li>
									<li><a href="<%=basePath%>bbs/Basic_Information.action">
											<i class="fa fa-edit fa-fw"></i> 基本资料
									</a></li>
									<li><a href="<%=basePath%>bbs/Contract_Information.action">
											<i class="fa fa-comment fa-fw"></i> 联系信息
									</a></li>
									<li><a
										href="<%=basePath%>bbs/Education_Information.action"> <i
											class="fa fa-dashboard fa-fw"></i> 教育信息
									</a></li>
									<li><a href="<%=basePath%>bbs/ExperienceValue.action">
											<i class="fa fa-certificate fa-fw"></i> 经验值
									</a></li>
								</ul></li>
							<li><img src="<%=basePath%>img/safecenter.png" alt=""
								style="width: 151px; height: 52px;">
								<ul class="nav" id="side-menu">
									<li><a href="<%=basePath%>bbs/CurrentStates.action"> <i
											class="fa fa-barcode fa-fw"></i> 当前状态
									</a></li>
									<li><a href="<%=basePath%>bbs/PasswordUpdate.action">
											<i class="fa fa-pencil-square fa-fw"></i> 修改密码
									</a></li>
									<li><a href="<%=basePath%>bbs/MobileBindQuestion.action">
											<i class="fa fa-mobile-phone fa-fw"></i> 关联手机
									</a></li>
									<li><a href="<%=basePath%>bbs/EmailBind.action" class="active"> <i
											class="fa fa-envelope-square fa-fw"></i> 邮箱认证
									</a></li>
									<li><a href="#"> <i class="fa fa-search fa-fw"></i>
											登录查询
									</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
				<!-- 左侧显示列表部分 end-->
			</nav>
			<!-- 列表部分  start-->
			<div id="page-wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">绑定邮箱</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="panel panel-default">
					<div class="panel-body">
						<div>
							<span><label style="font-size: 20px; font-weight: normal"><%if(curstates.getEmailidenstate()==0){ %>您还未绑定邮箱<%}else{ %>您已绑定邮箱:<%=curstates.getEmailiden() %><%} %></label></span>
							<h5 style="margin-bottom: 50px;"><%if(curstates.getEmailidenstate()==0){ %>为了您的方便及账号安全，建议您前去 <a href="<%=basePath%>bbs/EmailDoBind.action">绑定邮箱</a><%}else{ %>已经不使用这个邮箱？&nbsp;&nbsp;<a
									href="<%=basePath%>bbs/EmailChange.action">更换邮箱</a> <%} %>
							</h5>
						</div>
						<div>
							<hr>
						</div>
						<div>
							<span style="font-size: 20px; font-weight: normal">常见问题</span>
						</div>
						<div>
							<table class="table table-borderless table-responsive">
								<tbody>
									<tr>
										<td>
											<div class="flip divhead">
												<span style="font-size: 14px; font-weight: bolder;">为什么要绑定邮箱？</span><i
													class="fa fa-caret-down"
													style="float: right; font-size: x-large;"></i>
											</div>
											<div class="contentpanel">
												绑定邮箱后，您可以使用邮箱登录飞控社区，即便用户名忘记了都没有关系，而且在密码遗忘或者账号被盗时，您都能快速取回账号。所以，为了您的方便及账号安全，我们强烈建议您绑定邮箱，并且不能取消绑定功能，敬请谅解。
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="flip current">
												<span style="font-size: 14px; font-weight: bolder;">如何用邮箱登录飞控社区？</span><i
													class="fa fa-caret-down"
													style="float: right; font-size: x-large;"></i>
											</div>
											<div class="contentpanel">直接输入邮箱名称与对应密码即可登录飞控社区。</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="flip divhead">
												<span style="font-size: 14px; font-weight: bolder;">一个邮箱能否绑定多个账号？</span><i
													class="fa fa-caret-down"
													style="float: right; font-size: x-large;"></i>
											</div>
											<div class="contentpanel">抱歉，一个邮箱只能绑定一个账号。</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="flip divhead">
												<span style="font-size: 14px; font-weight: bolder;">绑定的邮箱忘了，要如何更改？</span><i
													class="fa fa-caret-down"
													style="float: right; font-size: x-large;"></i>
											</div>
											<div class="contentpanel">
												首先请您再看一下绑定邮箱，尝试回忆一下它的全称。如果您还是没有想起来，可以点击客服申诉尝试找回邮箱。</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<style type="text/css">
.contentpanel {
	display: none;
	font-size: 14px;
	padding-left: 10px;
}

.divhead {
	background-color: #f7f7f7;
	padding: 5px 10px 5px 10px;
	cursor: pointer;
}

.current {
	background-color: #ffffff;
	padding: 5px 10px 5px 10px;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".contentpanel:eq(1)").show();
		$(".flip").click(
				function() {
					$(this).removeClass("divhead").addClass("current").next(
							".contentpanel").slideDown();
					$(this).children("i").removeClass("fa-caret-up").addClass(
							"fa-caret-down");
					$(this).parents("tr").siblings().find(".flip").removeClass(
							"current").addClass("divhead")
							.next(".contentpanel").slideUp();
					$(this).parents("tr").siblings().find("i").removeClass(
							"fa-caret-down").addClass("fa-caret-up");
				})
	})
function userlogout(){
	if(confirm('确定要退出吗？')){
		$.post(
				"<%=basePath%>bbs/userlogout.action",
				function(data){
		            if(data =="OK"){
		                alert("账号已成功注销!");
		                window.location.href="<%=basePath%>bbs/list.action";
		            }else{
		                alert("账号注销失败!");
		            }
		        });
	}
}
</script>
</html>