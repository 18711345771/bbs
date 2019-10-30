<%@page import="com.bbs.po.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="flycoon" uri="http://itheima.com/commonflycoon/"%>
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
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>bootstrap/js/bootstrap.js"></script>
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="<%=basePath%>css/articledetails.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
<title>飞控社区论坛发帖</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-12 col-sm-12 col-md-12 col-lg-12"
				style="min-width: 200px;">
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
					<form action="<%=basePath%>bbs/topublish_0.action" method="get"
						class="navbar-form navbar-left form-inline" role="search">
						<div class="form-group">
							<input name="limitedstr" type="text" class="form-control"
								placeholder="搜帖、搜类型、搜版块">
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary">搜搜看</button>
						</div>
					</form>
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
							onclick="adminlogout()" style="font-size: 10px;">[退出登录]</a></li>
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
				<div
					style="margin: 50px auto 20px auto; width: 90%; font-size: 18px;">
					<form id="rootform" onreset="clearthisform()">
						<input type="hidden" id="PublishArticleId" name="publishArticleId" />
						<div class="form-group">
							<label for="PublishArticleType">帖子类型</label> 
							<select
								name="publishArticleType" id="PublishArticleType">
								<option value="">--请选择--</option>
								<c:forEach items="${article_type}" var="item">
									<option value="${item.dict_id}"
										<c:if test="${item.dict_id==publishArticleType }">selected</c:if>>
										${item.dict_item_name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group" style="width: 30%;">
							<label for="PublishArticleEditorNo">帖子板块</label> <select
								name="publishArticleEditorNo" id="PublishArticleEditorNo">
								<option value="">--请选择--</option>
								<c:forEach items="${article_editorNo}" var="item">
									<option value="${item.dict_id}"
										<c:if test="${item.dict_id==publishArticleEditorNo }">selected</c:if>>
										${item.dict_item_name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="PublishArticleTitle">帖子主题</label> <input type="text"
								class="form-control" name="publishArticleTitle"
								id="PublishArticleTitle" placeholder="请填入帖子主题" />
						</div>
						<div class="form-group">
							<label for="PublishArticleContext">帖子内容</label>
							<textarea name="publishArticleContext" id="PublishArticleContext"
								cols="80" rows="8"></textarea>
						</div>
						<div class="form-group">
							<input id="publish_btn" type="submit" class="btn btn-primary"
								value="发表根帖" onclick="publishrootarticle()" /> <input
								id="update_btn" type="button" class="btn btn-primary"
								value="提交修改" disabled onclick="updaterootarticle()" /> <input
								type="reset" class="btn btn-primary" value="清除" />
						</div>
					</form>
				</div>
				<div
					class="table-responsive-lg table-responsive-md table-responsive-sm table-responsive">
					<table class="table table-hover table-striped table-bordered">
						<thead>
							<tr>
								<th>帖子类型</th>
								<th>帖子版块</th>
								<th>帖子主题</th>
								<th>帖子内容</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${rootarticles.rows}" var="row">
								<tr>
									<td>${row.type}</td>
									<td>${row.editorNo}</td>
									<td>${row.title}</td>
									<td>${row.context}</td>
									<td><a href="#" class="btn btn-success btn-sm"
										onclick="editor(${row.id})">修改</a> <a href="#"
										class="btn btn-danger btn-sm"
										onclick="deleterootarticle(${row.id})">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-md-12 text-left">
					<flycoon:page
						url="${pageContext.request.contextPath }/bbs/topublish_0.action" />
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function publishrootarticle(){
		var pa_Type = $("#PublishArticleType").val();
		var pa_EditorNo = $("#PublishArticleEditorNo").val();
		var pa_Title = $("#PublishArticleTitle").val();
		var pa_Context = $("#PublishArticleContext").val();
		
		if(pa_Type&&pa_EditorNo&&pa_Title&&pa_Context){
			$.ajax(
					{
						type:"get",
						url:"<%=basePath%>bbs/publishrootarticle.action",
						data:$("#rootform").serialize(),
						async: false,
						success:function(data){
							if(data=="OK"){
								alert("根帖发表成功！");
								$("#PublishArticleId").val("");
								$("#PublishArticleType").val("");
								$("#PublishArticleEditorNo").val("");
								$("#PublishArticleTitle").val("");
								$("#PublishArticleContext").val("");
								window.location.href="<%=basePath%>bbs/topublish_0.action";
							}else{
								alert("根帖发表失败！");
							}
						}
					}
			);
		}else{
			alert("请先将上述内容填写完整！");
		}
	}
	function updaterootarticle(){
		$.ajax(
			{
				type:"post",
				url:"<%=basePath%>bbs/updaterootarticle.action",
				data:{
					"PublishArticleId":$("#PublishArticleId").val(),
					"PublishArticleType":$("#PublishArticleType").val(),
					"PublishArticleEditorNo":$("#PublishArticleEditorNo").val(),
					"PublishArticleTitle":$("#PublishArticleTitle").val(),
					"PublishArticleContext":$("#PublishArticleContext").val()
				},
				success:function(data){
						if(data=="OK"){
							alert("修改成功!");
							window.location.reload();
						}else{
							alert("修改失败!");
						}
				}
			}
		);
	}
	function editor(id){
		$("#publish_btn").attr("disabled","disabled");
		$("#update_btn").removeAttr("disabled");
		$.ajax({
	        type:"post",
	        url:"<%=basePath%>bbs/getOneArticle.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#PublishArticleId").val(data.id);
	            $("#PublishArticleType").val(data.type);
	            $("#PublishArticleEditorNo").val(data.editorNo);
	            $("#PublishArticleTitle").val(data.title);
	            $("#PublishArticleContext").val(data.context);
	        }
	    });
	}
	function deleterootarticle(id){
		if(confirm("确定要删除该根帖吗？")){
			$.ajax({
		        type:"post",
		        url:"<%=basePath%>bbs/deleterootarticle.action",
		        data:{"id":id},
		        success:function(data) {
		        	if(data=="OK"){
						alert("删除成功!");
						window.location.reload();
					}else{
						alert("删除失败!");
					}
		        }
		    });
		}
	}
	function clearthisform(){
		/* $("#PublishArticleId").val("");
		$("#PublishArticleType").val("");
		$("#PublishArticleEditorNo").val("");
		$("#PublishArticleTitle").val("");
		$("#PublishArticleContext").val(""); */ 
		$("#publish_btn").removeAttr("disabled");
		$("#update_btn").attr("disabled","disabled");
	}
	function adminlogout(){
		if(confirm("确定退出登录吗？")){
			window.location.href="${pageContext.request.contextPath }/bbs/adminlogout.action";
		}
	}
</script>
</html>