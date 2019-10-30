<%@page import="com.bbs.po.User"%>
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

<!--验证码插件和样式-->
<link rel="stylesheet" href="<%=basePath%>css/verify.css">
<link rel="stylesheet" href="<%=basePath%>css/passwordupdate.css">
<script type="text/javascript" src="<%=basePath%>js/verify.js"></script>
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
									<li><a href="<%=basePath%>bbs/PasswordUpdate.action" class="active">
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
						<h1 class="page-header">修改密码</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="panel panel-default">
					<div class="panel-body">
						
						<div class="contact">
							<form name="form1">
								<ul>
									<li><label>当前密码：</label> <input type="text"
										name="oldPassword" onblur="checkna()" required /><span
										class="tips" id="divname">请确保当前密码填写正确</span></li>
									<li><label>新密码：</label> <input type="password"
										name="newPassword" onblur="checkpsd1()" required /><span
										class="tips" id="divpassword1">密码必须由字母和数字组成</span></li>
									<li><label>确认密码：</label> <input type="password"
										name="newPassword2" onblur="checkpsd2()" required /><span
										class="tips" id="divpassword2">两次密码需要相同</span></li>
									<li><label>验证码：</label>
										<div id="mpanel4" style="margin: 0 0 0 120px;"></div></li>
								</ul>
								<input type="submit" class="btn btn-success" value="保存" /> <input
									type="reset" class="btn btn-default" value="取消" /></b>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var flag = false;
	//验证密码 
	function checkpsd1() {
		psd1 = form1.newPassword.value;
		if (psd1.length < 8) {
			divpassword1.innerHTML = '<span class="tips_false">密码长度不能小于8位</span>';
			flag = false;
		} else {
			var regLetter = /[A-Za-z]/;
			var regNum = /[0-9]/;
			var regTeShu = new RegExp(
					"[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？+-]");
			var complex = 0;

			if (regLetter.test(psd1)) {
				++complex;
			}
			if (regNum.test(psd1)) {
				++complex;
			}
			if (regTeShu.test(psd1)) {
				++complex;
			}
			if (complex < 3) {
				divpassword1.innerHTML = '<span class="tips_false">密码必须包含数字、字母、符号中的至少3种</span>';
				flag = false;
			} else {

				divpassword1.innerHTML = '<span class="tips_true">输入正确</span>';
				flag = true;
			}

		}
	}
	//验证确认密码 
	function checkpsd2() {
		if (form1.newPassword.value != form1.newPassword2.value) {
			divpassword2.innerHTML = '<span class="tips_false">您两次输入的密码不一样</span>';
			flag = false;
		} else {
			divpassword2.innerHTML = '<span class="tips_true">输入正确</span>';
			flag = true;
		}
	}
	//验证码
	$('#mpanel4').slideVerify({
		type : 2, //类型
		vOffset : 5, //误差量,根据需求自行调整
		vSpace : 5, //间隔
		imgName : [ '1.jpg', '2.jpg' ],
		imgSize : {
			width : '400px',
			height : '200px',
		},
		blockSize : {
			width : '40px',
			height : '40px',
		},
		barSize : {
			width : '400px',
			height : '40px',
		},
		ready : function() {
		},
		success : function() {
			// alert('验证成功，添加你自己的代码！');
			//......后续操作
			if (!flag) {
				alert("请先将上述信息填写正确");
				window.location.reload();
			} else {
				$.ajax({
					type : "post",
					url : "<%=basePath%>bbs/PasswordDoUpdate.action",
					data : {
						"oldPassword" : form1.oldPassword.value,
						"newPassword" : form1.newPassword.value,
						"newPassword2" : form1.newPassword2.value
					},
					success : function(data) {
							if(data=="OK"){
								alert("密码修改成功！");
								window.location.href="<%=basePath%>bbs/autologout.action";
							}else{
								alert("您填写的“当前密码”不正确，请重新填写并确保正确！");
								window.location.reload();
							}
					}
				});
			}
		},
		error : function() {
			//alert('验证失败！');
		}

	});
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