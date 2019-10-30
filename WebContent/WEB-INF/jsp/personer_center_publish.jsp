<%@page import="com.bbs.po.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1.0">
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>bootstrap/js/bootstrap.js"></script>
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="<%=basePath%>css/articledetails.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
<title>个人中心</title>
</head>
<body onload="loadpage()">
	<div class="container">
		<div class="row">
			<div class="col-12 col-sm-12 col-md-12 col-lg-12">
				<div class="navbar navbar-expand-sm bg-dark navbar-dark">
					<a class="nav navbar-brand" href="#" data-toggle="collapse">Logo</a>
					<ul class="nav navbar-nav">
						<li class="active nav-item"><a
							href="<%=basePath%>bbs/list.action" class="nav-link">论坛</a></li>
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
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-sm-12 col-md-12 col-lg-12">
				<ul class="nav nav-tabs nav-justified" id="mytab">
					<li class="nav-item" onclick="topersonarticle()"><a
						class="nav-link" href="#my_article" data-toggle="tab"
						id="myarticle">我的帖子</a></li>
					<li class="nav-item" onclick="tomyreply()"><a class="nav-link"
						href="#my_reply" data-toggle="tab" id="myviewcount">我的回复</a></li>
					<li class="nav-item" onclick="tomyfootstep()"><a
						class="nav-link" href="#my_footstep" data-toggle="tab"
						id="myfootstep">我的足迹</a></li>
					<li class="active nav-item"><a class="nav-link"
						href="#my_publish" data-toggle="tab" id="mypublish">我要发帖</a></li>
				</ul>
				<div class="tab-content" id="mytabcontent">
					<div class="tab-pane fade" id="my_publish">
						<div class="panel panel-default">
							<div class="panel-body">
								<div
									style="margin: 50px auto 20px auto; width: 90%; font-size: 18px;">
									<form id="rootform">
										<input type="hidden" id="PublishUserArticleId"
											name="publishUserArticleId" />
										<div class="form-group">
											<label for="PublishUserArticleType">帖子类型</label> <select
												name="publishUserArticleType" id="PublishUserArticleType">
												<option value="">--请选择--</option>
												<c:forEach items="${article_type}" var="item">
													<option value="${item.dict_id}"
														<c:if test="${item.dict_id==publishUserArticleType }">selected</c:if>>
														${item.dict_item_name}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group" style="width: 30%;">
											<label for="PublishUserArticleEditorNo">帖子板块</label> <select
												name="publishUserArticleEditorNo"
												id="PublishUserArticleEditorNo">
												<option value="">--请选择--</option>
												<c:forEach items="${article_editorNo}" var="item">
													<option value="${item.dict_id}"
														<c:if test="${item.dict_id==publishUserArticleEditorNo }">selected</c:if>>
														${item.dict_item_name}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label for="PublishUserArticleTitle">帖子主题</label> <input
												type="text" class="form-control"
												name="publishUserArticleTitle" id="PublishUserArticleTitle"
												placeholder="请填入帖子主题" />
										</div>
										<div class="form-group">
											<label for="PublishUserArticleContext">帖子内容</label>
											<textarea name="publishUserArticleContext"
												id="PublishUserArticleContext" cols="80" rows="8"></textarea>
										</div>
										<div class="form-group">
											<input id="publish_btn" type="submit" class="btn btn-primary"
												value="发表根帖" onclick="publishuserarticle()" />
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function loadpage(){
		$("#mypublish").click();
	}
	function tomyreply(){
		window.location.href="<%=basePath%>bbs/myreply.action";
	}
	function tomyfootstep(){
		window.location.href="<%=basePath%>bbs/myfootstep.action";
	}
	function topersonarticle(){
		window.location.href="<%=basePath%>bbs/personarticle.action";
	}
	function publishuserarticle(){
		var pa_Type = $("#PublishUserArticleType").val();
		var pa_EditorNo = $("#PublishUserArticleEditorNo").val();
		var pa_Title = $("#PublishUserArticleTitle").val();
		var pa_Context = $("#PublishUserArticleContext").val();
		
		if(pa_Type&&pa_EditorNo&&pa_Title&&pa_Context){
			$.ajax(
					{
						type:"get",
						url:"<%=basePath%>bbs/startpublish.action",
						data:$("#rootform").serialize(),
						async:false,
						success:function(data){
							if(data=="OK"){
								$("#PublishUserArticleId").val("");
								$("#PublishUserArticleType").val("");
								$("#PublishUserArticleEditorNo").val("");
								$("#PublishUserArticleTitle").val("");
								$("#PublishUserArticleContext").val("");
								if(confirm("根帖发表成功!可以到我的帖子查看")){
									window.location.href="<%=basePath%>bbs/personarticle.action";
								}
							} else {
								alert("根帖发表失败！");
							}
						}
					});
		} else {
			alert("请先将上述内容填写完整！");
		}
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