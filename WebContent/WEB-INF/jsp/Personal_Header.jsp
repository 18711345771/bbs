<%@page import="com.bbs.po.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1.0">
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
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

<link href="<%=basePath%>css/cropper.min.css" rel="stylesheet">
<link href="<%=basePath%>css/sitelogo.css" rel="stylesheet">
<script src="<%=basePath%>js/cropper.min.js"></script>
<script src="<%=basePath%>js/sitelogo.js"></script>

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
									class="active"> <i class="fa fa-user fa-fw"></i> 头像设置
								</a></li>
								<li><a href="<%=basePath%>bbs/Basic_Information.action">
										<i class="fa fa-edit fa-fw"></i> 基本资料
								</a></li>
								<li><a href="<%=basePath%>bbs/Contract_Information.action">
										<i class="fa fa-comment fa-fw"></i> 联系信息
								</a></li>
								<li><a href="<%=basePath%>bbs/Education_Information.action">
										<i class="fa fa-dashboard fa-fw"></i> 教育信息
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
								<li><a href="<%=basePath%>bbs/PasswordUpdate.action"> <i
										class="fa fa-pencil-square fa-fw"></i> 修改密码
								</a></li>
								<li><a href="<%=basePath%>bbs/MobileBindQuestion.action">
										<i class="fa fa-mobile-phone fa-fw"></i> 关联手机
								</a></li>
								<li><a href="<%=basePath%>bbs/EmailBind.action"> <i
										class="fa fa-envelope-square fa-fw"></i> 邮箱认证
								</a></li>
								<li><a href="#"> <i class="fa fa-search fa-fw"></i>
										登录查询
								</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
			<!-- 左侧显示列表部分 end--> </nav>
			<!-- 列表部分  start-->
			<div id="page-wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">头像设置</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="panel panel-default">
					<div class="panel-body">
						<form class="avatar-form"
							action="<%=basePath%>bbs/fileUpload.action"
							enctype="multipart/form-data" method="post">
							<div class="modal-header">
								<h4 class="modal-title" id="avatar-modal-label">说明：&nbsp;&nbsp;&nbsp;&nbsp;[若无错误警示说明头像上传成功，此时退出并重新登录则生效，反之上传失败，截图窗口左上方顶点不能截到图外]</h4>
							</div>
							<div class="modal-body">
								<div class="avatar-body">
									<div class="avatar-upload">
										<input class="avatar-src" name="avatar_src" type="hidden">
										<input class="avatar-data" name="avatar_data" type="hidden">
										<label for="avatarInput">图片上传</label> <input
											class="avatar-input" id="avatarInput" name="avatar_file"
											type="file">
									</div>
									<div class="row">
										<div class="col-md-9">
											<div class="avatar-wrapper"></div>
										</div>
										<div class="col-md-3">
											<div class="avatar-preview preview-lg"></div>
											<div class="avatar-preview preview-md"></div>
											<div class="avatar-preview preview-sm"></div>
										</div>
									</div>
									<div class="row avatar-btns">
										<div class="col-md-9">
											<div class="btn-group">
												<button class="btn" data-method="rotate" data-option="-90"
													type="button" title="Rotate -90 degrees">
													<i class="fa fa-undo"></i> 向左旋转
												</button>
											</div>
											<div class="btn-group">
												<button class="btn" data-method="rotate" data-option="90"
													type="button" title="Rotate 90 degrees">
													<i class="fa fa-repeat"></i> 向右旋转
												</button>
											</div>
										</div>
										<div class="col-md-3">
											<button class="btn btn-success btn-block avatar-save"
												type="submit">
												<i class="fa fa-save"></i> 保存修改
											</button>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
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