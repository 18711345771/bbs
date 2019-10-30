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

<link rel="stylesheet" href="<%=basePath%>css/experiencevalue.css">
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
									<li><a href="<%=basePath%>bbs/ExperienceValue.action" class="active">
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
						<h1 class="page-header">经验值</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<label>我的经验值:</label> <span class="">LV2</span>
								<h6>用户经验值是用户每天登录活跃情况的体现</h6>
								<div style="margin-left: 50px;">
									<label>活跃天数:</label> <span>21天</span>
								</div>
								<div style="margin-left: 50px;">
									<label>升级还需:</label> <span>15天</span>
								</div>
								<p>
									<label>经验值计算规则:</label>经验值是根据用户活跃天数确定的，用户只需每天登录天涯社区，就可以获得活跃天数，从而获取经验值
								</p>
								<table class="table-responsive table-bordered table">
									<thead style="background-color: #f1f8fe">
										<tr>
											<td>经验值</td>
											<td>图标</td>
											<td>活跃天</td>
											<td>经验值</td>
											<td>图标</td>
											<td>活跃天</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td><span class="label label-1">&nbsp;&nbsp;LV1</span></td>
											<td>0</td>
											<td>52</td>
											<td><span class="label label-52">LV52</span></td>
											<td>5916</td>
										</tr>
										<tr>
											<td>4</td>
											<td><span class="label label-4">&nbsp;&nbsp;LV4</span></td>
											<td>60</td>
											<td>56</td>
											<td><span class="label label-56">LV56</span></td>
											<td>6820</td>
										</tr>
										<tr>
											<td>8</td>
											<td><span class="label label-8">&nbsp;&nbsp;LV8</span></td>
											<td>196</td>
											<td>60</td>
											<td><span class="label label-60">LV60</span></td>
											<td>7788</td>
										</tr>
										<tr>
											<td>12</td>
											<td><span class="label label-12">LV12</span></td>
											<td>396</td>
											<td>65</td>
											<td><span class="label label-65">LV65</span></td>
											<td>9088</td>
										</tr>
										<tr>
											<td>18</td>
											<td><span class="label label-18">LV18</span></td>
											<td>816</td>
											<td>68</td>
											<td><span class="label label-68">LV68</span></td>
											<td>9916</td>
										</tr>
										<tr>
											<td>22</td>
											<td><span class="label label-22">LV22</span></td>
											<td>1176</td>
											<td>72</td>
											<td><span class="label label-72">LV72</span></td>
											<td>11076</td>
										</tr>
										<tr>
											<td>26</td>
											<td><span class="label label-26">LV26</span></td>
											<td>1600</td>
											<td>76</td>
											<td><span class="label label-76">LV76</span></td>
											<td>12300</td>
										</tr>
										<tr>
											<td>30</td>
											<td><span class="label label-30">LV30</span></td>
											<td>2088</td>
											<td>80</td>
											<td><span class="label label-80">LV80</span></td>
											<td>13588</td>
										</tr>
										<tr>
											<td>35</td>
											<td><span class="label label-35">LV35</span></td>
											<td>2788</td>
											<td>86</td>
											<td><span class="label label-86">LV86</span></td>
											<td>15640</td>
										</tr>
										<tr>
											<td>38</td>
											<td><span class="label label-38">LV38</span></td>
											<td>3256</td>
											<td>90</td>
											<td><span class="label label-90">LV90</span></td>
											<td>17088</td>
										</tr>
										<tr>
											<td>42</td>
											<td><span class="label label-42">LV42</span></td>
											<td>3936</td>
											<td>94</td>
											<td><span class="label label-94">LV94</span></td>
											<td>18600</td>
										</tr>
										<tr>
											<td>46</td>
											<td><span class="label label-46">LV46</span></td>
											<td>4680</td>
											<td>98</td>
											<td><span class="label label-98">LV98</span></td>
											<td>20176</td>
										</tr>
										<tr>
											<td colspan="6">1.经验值推出时，我们会根据用户注册时间和登录次数给予对应的天数和经验值<br>2.用户经验值特权即将推出，经验值越高拥有的特权越多越丰富，敬请期待！
											</td>
										</tr>
									</tbody>
								</table>
								<p>
									<label>活跃天计算规则:</label>
								</p>
								<table class="table-bordered table table-responsive"
									style="text-align: center">
									<thead>
										<tr>
											<td><label>规则</label></td>
											<td><label>活跃天</label></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>每天只需登陆一次</td>
											<td>1</td>
										</tr>
										<tr>
											<td colspan="2" rowspan="2"
												style="color: #9a9a9a; font-size: 10px; padding: 20px 0;">目前暂不支持任何升级加速特权，当天多次登录、长时间在线等行为都不会增加活跃天数。</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
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