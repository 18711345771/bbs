<%@page import="com.bbs.po.User"%>
<%@page import="com.bbs.po.ContractInformation"%>
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
<script type="text/javascript"
	src="<%=basePath%>bootstrap/js/bootstrap.js"></script>
<script src="<%=basePath%>bootstrap/js/jquery-1.11.3.min.js"></script>
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
					<a class="nav navbar-brand" href="<%=basePath%>#"
						data-toggle="collapse">Logo</a>
					<ul class="nav navbar-nav">
						<li class="nav-item"><a href="<%=basePath%>bbs/list.action"
							class="nav-link">论坛</a></li>
						<li class="nav-item"><a href="<%=basePath%>#"
							class="nav-link">聚焦</a></li>
						<li class="nav-item"><a href="<%=basePath%>#"
							class="nav-link">飞控榜</a></li>
						<li class="nav-item"><a href="<%=basePath%>#"
							class="nav-link"><b class="fa fa-bars"></b></a></li>
					</ul>
					<!--</div>-->
					<%!boolean login_flag = false;%>
					<%
						ContractInformation contractinfo=(ContractInformation)request.getAttribute("ContractInfo");
						User userinfo = (User) request.getSession().getAttribute("UserInfo");
						User admininfo = (User) request.getSession().getAttribute("AdminInfo");
						if (userinfo != null) {
							login_flag=true;
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
							login_flag=true;
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
									<li><a href="<%=basePath%>bbs/Contract_Information.action" class="active">
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
				<!-- 左侧显示列表部分 end-->
			</nav>
			<!-- 列表部分  start-->
			<div id="page-wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">联系信息</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="panel panel-default">
					<div class="panel-body">
						<form id="contractinformationform">
							<div class="form-group form-inline">
								<label for="userName">真实姓名:</label> <input type="text"<%if(contractinfo!=null){ %>
								value="<%=contractinfo.getRealname() %>"<%} %>	id="realname" class="form-control" name="realname" />
							</div>
							<div class="form-group form-inline">
								<label for="telephone">联系电话:</label> <input type="text"<%if(contractinfo!=null){ %>
								value="<%=contractinfo.getTelephone() %>"<%} %>
									id="telephone" class="form-control" name="telephone" />
							</div>
							<div class="form-group form-inline">
								<label for="address">通信地址:</label> <input type="text"<%if(contractinfo!=null){ %>
								value="<%=contractinfo.getLinkaddress() %>"<%} %>
									id="linkaddress" class="form-control" name="linkaddress"
									placeholder="60个字以内哦" />
							</div>
							<div class="form-group form-inline">
								<label for="address">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮编:</label>
								<input type="text"<%if(contractinfo!=null){ %>
								value="<%=contractinfo.getEmailcode() %>"<%} %> id="emailcode" class="form-control"
									name="emailcode" />
							</div>
							<button type="button" class="btn btn-primary" onclick="saveContractInformation()"
								style="margin: 0 10%;">保存</button>
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
	function saveContractInformation(){
		var _loginflag=<%=login_flag%>;
		if(_loginflag){
			$.ajax({
				type:"post",
				url:"<%=basePath%>bbs/savecontractinformation.action",
				data:$("#contractinformationform").serialize(),
				async:false,
				success:function(data){
					$("#realname").val(data.realname);
					$("#telephone").val(data.telephone);
					$("#linkaddress").val(data.linkaddress);
					$("#emailcode").val(data.emailcode);
					alert("联系信息上传保存成功！");
				}
			})
		}else{
			alert("您还没登陆，不能上传个人信息！");
		}
	}
</script>
</html>