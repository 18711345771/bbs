<%@page import="com.bbs.po.User"%>
<%@page import="com.bbs.po.BasicInformation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
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
<style type="text/css">
        .showorhide{
            display: none;
        }
    </style>
<script type="text/javascript"
	src="<%=basePath%>js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/area_chs.js"></script>
<link href="<%=basePath%>css/chosen.min.css" rel="stylesheet">
<style type="text/css">
.dept_select {
	min-width: 200px;
}
</style>

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/tagsinput.css" />
<script src="<%=basePath%>js/tagsinput.js" type="text/javascript"></script>
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
						<li class="nav-item"><a
							href="<%=basePath%><%=basePath%>bbs/list.action" class="nav-link">论坛</a></li>
						<li class="nav-item"><a href="<%=basePath%>#"
							class="nav-link">聚焦</a></li>
						<li class="nav-item"><a href="<%=basePath%>#"
							class="nav-link">飞控榜</a></li>
						<li class="nav-item"><a href="<%=basePath%>#"
							class="nav-link"><b class="fa fa-bars"></b></a></li>
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
									<li><a href="<%=basePath%>bbs/Basic_Information.action"
										class="active"> <i class="fa fa-edit fa-fw"></i> 基本资料
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
						<h1 class="page-header">基本资料</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="condense_panel">
								<form id="showbasicinformationform">
								<div class="form-group form-inline">
								<label for="userName">&nbsp;&nbsp;&nbsp;用户名:</label> <input
									type="text" id="userName" class="form-control"
									<%if(userinfo!=null){%> value="${UserInfo.getUsername()}"
									<%}else{ %> value="${AdminInfo.getUsername()}" <%} %>
									name="userName" readonly />
							</div>
							<div class="form-group">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别:</label>
								<div class="radio-inline">
									<label> <input type="radio" name="genderoptions"
										id="showgender0" value="secret">保密
									</label>
								</div>
								<div class="radio-inline">
									<label> <input type="radio" name="genderoptions"
										id="showgender1" value="male">男
									</label>
								</div>
								<div class="radio-inline">
									<label> <input type="radio" name="genderoptions"
										id="showgender2" value="female">女
									</label>
								</div>
							</div>
							<div class="form-group form-inline">
								<div class="membder-background addMemo-body">
									<div class="addMemo" id="iframe">
										<label>出生日期:</label><input class="form-control" type="text"
											 name="birthday" id="showJ-xl" />
										<div class="clear-both"></div>
										<iframe src="<%=basePath%>html/iframe.jsp" width="100%"
											height="600" id="iframepage" name="iframe" frameborder="0"
											scrolling="no" marginheight="0" marginwidth="0"></iframe>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label>现居住地:</label> <select id="showcountry" name="showcountry"
									class="dept_select"></select> <select id="showprovince"
									name="showprovince" class="dept_select"></select> <select id="showcity"
									name="showcity" class="dept_select"></select>
							</div>
							<div class="form-group form-inline">
								<label for="showintroduce">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;简介:</label>
								<input name="showintroduce" type="text" id="showintroduce"
									class="form-control" placeholder="一句话介绍一下自己吧，让别人更了解你"
									style="min-width: 358px;" />
							</div>
							<div class="form-group form-inline">
								<label for="showindustry">行业分类:</label> <select class="form-control"
									id="showindustry" name="showindustry" disabled>
									<option value="">-请选择-</option>
									<c:forEach items="${industryinfo }" var="row">
										<option value="${row.dict_id }"
											<c:if test="${row.dict_id==industry }">selected</c:if>>
											${row.dict_item_name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group form-inline">
								<label for="showposition">当前职位:</label> <input type="text"
									class="form-control"
									name="showposition" id="showposition">
							</div>
							<div class="tagsinput-primary form-group">
								<label for="showtag">个人标签:</label> <input name="showtagsinput"
									id="showtagsinput" class="tagsinput" data-role="tagsinput"
									value="  " placeholder="输入后回车" />
							</div>
							<button type="button" class="btn btn-primary"
								onclick="basicinformationformsubmit()">保存</button>
						</form>
						</div>
						<div class="condense_panel">
								<form id="basicinformationform">
							<div class="form-group">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别:</label>
								<div class="radio-inline">
									<label> <input type="radio" name="genderoptions"
										id="gender0" value="secret">保密
									</label>
								</div>
								<div class="radio-inline">
									<label> <input type="radio" name="genderoptions"
										id="gender1" value="male" checked>男
									</label>
								</div>
								<div class="radio-inline">
									<label> <input type="radio" name="genderoptions"
										id="gender2" value="female">女
									</label>
								</div>
							</div>
							<div class="form-group form-inline">
								<div class="membder-background addMemo-body">
									<div class="addMemo" id="iframe">
										<label>出生日期:</label><input class="form-control" type="text"
											 name="birthday" id="J-xl" />
										<div class="clear-both"></div>
										<iframe src="<%=basePath%>html/iframe.jsp" width="100%"
											height="600" id="iframepage" name="iframe" frameborder="0"
											scrolling="no" marginheight="0" marginwidth="0"></iframe>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label>现居住地:</label> <select id="country" name="country"
									class="dept_select"></select> <select id="province"
									name="province" class="dept_select"></select> <select id="city"
									name="city" class="dept_select"></select>
							</div>
							<div class="form-group form-inline">
								<label for="introduce">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;简介:</label>
								<input name="introduce" type="text" id="introduce"
									class="form-control" placeholder="一句话介绍一下自己吧，让别人更了解你"
									style="min-width: 358px;" />
							</div>
							<div class="form-group form-inline">
								<label for="industry">行业分类:</label> <select class="form-control"
									id="industry" name="industry">
									<option value="">-请选择-</option>
									<c:forEach items="${industryinfo }" var="row">
										<option value="${row.dict_id }"
											<c:if test="${row.dict_id==industry }">selected</c:if>>
											${row.dict_item_name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group form-inline">
								<label for="position">当前职位:</label> <input type="text"
									class="form-control"
									name="position" id="position">
							</div>
							<div class="tagsinput-primary form-group">
								<label for="tag">个人标签:</label> <input name="tagsinput"
									id="tagsinput" class="tagsinput" data-role="tagsinput"
									value="互联网,社区居民" placeholder="输入后回车" />
							</div>
							<button type="button" class="btn btn-primary"
								onclick="basicinformationformsubmit()">保存</button>
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		var iframe = $("#iframepage").hide();
		$("#J-xl").click(function() {
			iframe.fadeIn();
		});
		init_show('<%=userinfo.getUsername()%>');
	});
	function init_show(username){
		$.ajax({
	    	type:"POST",
	        url:"<%=basePath%>bbs/getbasicinformation.action",
	    	data:{"username":username},
	    	success:function(data){
	    		if(data!=null){
	    			if ("secret"==data.gender) {
						$("#gender0").prop("checked", true);
						$("#gender1").prop("checked", false);
						$("#gender2").prop("checked", false);
					}else
					if ("male"==data.gender) {
						$("#gender0").prop("checked", false);
						$("#gender1").prop("checked", true);
						$("#gender2").prop("checked", false);
					}else
					if ("female"==data.gender) {
						$("#gender0").prop("checked", false);
						$("#gender1").prop("checked", false);
						$("#gender2").prop("checked", true);
					}else{
						$("#gender0").prop("checked", false);
						$("#gender1").prop("checked", true);
						$("#gender2").prop("checked", false);
					}
					var birthday = data.birthday;
					$("#showJ-xl").val(birthday);
					var address =data.address?data.address.split("/"):'';
					$("#country").val(address[0]);
					$("#province").val(address[1]);
					$("#city").val(address[2]);
					$("#introduce").val(data.introduce);
					$("#industry").val(data.industry);
					$("#tagsinput").val(data.personallabels);
	    			$(".condense_panel").eq(1).addClass("showorhide").siblings().removeClass("showorhide");
	    		}else{
	    			$(".condense_panel").eq(0).addClass("showorhide").siblings().removeClass("showorhide");
	    		}
	    	}
	    });
	}
</script>
<script type="text/javascript">
	var areaObj = [];
	function initLocation(e) {
		var a = 0;
		for ( var m in e) {
			areaObj[a] = e[m];
			var b = 0;
			for ( var n in e[m]) {
				areaObj[a][b++] = e[m][n];	
			}
			a++;

		}
	}
</script>

<script type="text/javascript" src="<%=basePath%>js/location_chs.js"></script>
<script type="text/javascript">
	var country = '';
	for (var a = 0; a <= _areaList.length - 1; a++) {
		var objContry = _areaList[a];
		country += '<option value="' + objContry + '" a="' + (a + 1) + '">'
				+ objContry + '</option>';
	}
	$("#country")
			.html(country)
			.chosen()
			.change(
					function() {
						var a = $("#country").find(
								"option[value='" + $("#country").val() + "']")
								.attr("a");
						var _province = areaObj[a];
						var province = '';
						for ( var b in _province) {
							var objProvince = _province[b];
							if (objProvince.n) {
								province += '<option value="'+objProvince.n+'" b="'+b+'">'
										+ objProvince.n + '</option>';
							}
						}
						if (!province) {
							province = '<option value="0" b="0">------</option>';
						}
						$("#province")
								.html(province)
								.chosen()
								.change(
										function() {
											var b = $("#province").find(
													"option[value='"
															+ $("#province")
																	.val()
															+ "']").attr("b");
											var _city = areaObj[a][b];
											var city = '';
											for ( var c in _city) {
												var objCity = _city[c];
												if (objCity.n) {
													city += '<option value="'+objCity.n+'">'
															+ objCity.n
															+ '</option>';
												}
											}
											if (!city) {
												var city = '<option value="0">------</option>';
											}
											$("#city").html(city).chosen()
													.change();
											$(".dept_select").trigger(
													"chosen:updated");
										});
						$("#province").change();
						$(".dept_select").trigger("chosen:updated");
					});
	$("#country").change();
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
	function basicinformationformsubmit(){
		console.log($("#basicinformationform").serialize());
		$.ajax({
			type:"post",
			url:"<%=basePath%>bbs/savebasicinformation.action",
			data : $("#basicinformationform").serialize(),
			async : false,
			success : function(data) {
				if(data==OK){
					alert("保存修改成功！");
					window.loacation.reload();
				}
			}
		});
	}

</script>
</html>