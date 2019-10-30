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
<style type="text/css">
.pointsRule { display: inline-block; font-size: 16px; margin:0 auto;width:100%;height:120px; }
.pointsRule span { float: left; display: inline-block; }
.pointsRule ul { list-style: none; margin: 0; padding: 0; display: inline-block; float: left; width: 100%; }
.pointsRule ul li { display: list-item; text-align: center; float: left; margin: 10px 5px 0; background: #e3e3e3; border-top: 1px solid #e3e3e3; height: 45px; position: relative }
.pointsRule ul li:first-child { border-left: 1px solid #e3e3e3; background: #e3e3e3; }
.pointsRule ul li:last-child { }
.pointsRule ul li a { display: block; padding: 8px 0; cursor: pointer; }
.pointsRule ul li span { vertical-align: middle; height: 24px; line-height: 25px; display: inline-block; overflow: hidden; text-align: center; margin:0 20px; }
.pointsRule ul li i { float: right; border: #e3e3e3 solid; border-width: 1px 1px 0 0; width: 32px; height: 32px; margin: -2px -17px 0px 10px; top: 2px; transform: rotate(45deg); -webkit-transform: rotate(45deg); background: url("") #e3e3e3;-moz-transform: rotate(45deg); /* Firefox浏览器 */-ms-transform: rotate(45deg); }
.pointsRule ul li em.before { border: #e3e3e3 solid; border-width: 1px 1px 0 0; width: 32px; height: 32px; transform: rotate(45deg); -webkit-transform: rotate(45deg); float: left; margin: -2px 10px 0px -17px; top: 2px; background: url("") #fff; }
/*.pointsRule ul li.green{ background:#1da02b;}*/

.feature_tour{width:552px;margin:50px auto 0 auto;}
.feature_tour .mask{margin:20px 0px 0px 0px;width:100%;position:relative;height:300px;overflow:hidden;background:#fff;box-shadow:0 -2px 3px -2px rgba(0,0,0,0.2), 0 2px 2px rgba(0,0,0,0.1);border-radius:6px 6px 6px 6px;}
.feature_tour .mask .maskcon{width:5000px}
.feature_tour .mask .maskcon .innercon{float:left;width:552px;}
</style>
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
						CurrentStates curstates = (CurrentStates) request.getAttribute("currentStates");
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
									<li><a href="<%=basePath%>bbs/Personal_Header.action">
											<i class="fa fa-user fa-fw"></i> 头像设置
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
									<li><a href="<%=basePath%>bbs/EmailBind.action"
										class="active"> <i class="fa fa-envelope-square fa-fw"></i>
											邮箱认证
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
						<div class="pointsRule">
							<span>欢迎成为VIP！</span>
							<ul id="list">
								<li style="z-index: 3;" class="green"><a><span>1.累计购物积分</span><i></i></a></li>
								<li style="z-index: 2"><a><em class="before"></em><span>2.兑换购物积分</span><i></i></a></li>
								<li style="z-index: 1"><a><em class="before"></em><span>3.使用积分抵用电子礼券</span></a></li>
							</ul>
						</div>
						<div class="feature_tour">
							<div class="mask">
								<div class="maskcon">
									<div id="con1" class="innercon">步骤一</div>
									<div id="con2" class="innercon">步骤二</div>
									<div id="con3" class="innercon">步骤三</div>
								</div>
							</div>
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
window.onload = function () {
	var lis = document.getElementById("list").getElementsByTagName("li");
	var conInnerConWidth=$(".innercon").width();
	$('#list i').attr("style", "background-color:");
	function chose(index){
		if(index<=lis.length-1){
			lis[index].style.color = "#fff";//字体颜色变白
			lis[index].style.backgroundColor = "#f45438";//背景颜色变红
			$(lis[index]).find('i').eq(0).attr("style", "background-color:#f45438");
			$(".maskcon").animate({marginLeft:-index*conInnerConWidth+"px"});
			for (ii = 0; ii < index; ii++) {
				lis[ii].style.backgroundColor = "#1da02b";//被点击之前的li背景色变深绿
				$(lis[ii]).find('i').eq(0).attr("style", "background-color:#1da02b");
			}    
		}
	}
	chose(2);
}
function userlogout(){
	if(confirm('确定要退出吗？')){
		$.post(
				"<%=basePath%>bbs/userlogout.action",
				function(data){
		            if(data =="OK"){
		                alert("账号已成功注销!");
		                window.location.href="<%=basePath%>bbs/list.action";
				} else {
					alert("账号注销失败!");
				}
			});
		}
	}
</script>
</html>