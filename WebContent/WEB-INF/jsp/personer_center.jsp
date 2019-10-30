<%@page import="com.bbs.po.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
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
					<li class="nav-item"><a class="nav-link" href="#my_article"
						data-toggle="tab" id="myarticle">我的帖子</a></li>
					<li class="active nav-item" onclick="tomyreply()"><a
						class="nav-link" href="#my_reply" data-toggle="tab"
						id="myviewcount">我的回复</a></li>
					<li class="active nav-item" onclick="tomyfootstep()"><a
						class="nav-link" href="#my_footstep" data-toggle="tab"
						id="myfootstep">我的足迹</a></li>
					<li class="active nav-item" onclick="tomypublish()"><a
						class="nav-link" href="#my_publish" data-toggle="tab"
						id="mypublish">我要发帖</a></li>
				</ul>
				<div class="tab-content" id="mytabcontent">
					<div class="tab-pane fade" id="my_article">
						<div class="panel panel-default">
							<div class="panel-body">
								<div
									class="table-responsive-lg table-responsive-md table-responsive-sm table-responsive">
									<table class="table table-hover table-striped table-bordered">
										<thead>
											<tr>
												<th>帖子</th>
												<th>点击</th>
												<th>回复</th>
												<th>版块</th>
												<th>内容</th>
												<th>时间</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${page.rows}" var="row_a">
												<tr>
													<td>${row_a.title}</td>
													<td>${row_a.viewcount}</td>
													<td>${row_a.replycount}</td>
													<td>${row_a.editorNo}</td>
													<td>${row_a.context}</td>
													<td>${row_a.datatime}</td>
													<td><a href="#" data-target="#editor_pane"
														data-toggle="modal" class="btn btn-success btn-sm"
														onclick="editor(${row_a.id})">修改</a> <a href="#"
														class="btn btn-danger btn-sm"
														onclick="deletemyarticle(${row_a.id})">删除</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="col-md-12 text-left">
									<itheima:page
										url="${pageContext.request.contextPath }/bbs/personarticle.action" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="editor_pane" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">编辑窗口</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<form action="" id="edit_personarticle_form">
							<input type="hidden" id="edit_personarticle_id"
								name="edit_personarticle_id" />
							<div class="form-group">
								<label for="edit_title">帖子标题</label> <input type="text"
									class="form-control" id="edit_title" placeholder="帖子标题"
									name="edit_title">
							</div>
							<div class="form-group">
								<label for="edit_editorNo">帖子版块</label> <select
									class="form-control" id="edit_editorNo" name="edit_editorNo">
									<option value="">--请选择--</option>
									<c:forEach items="${personarticle_editorNo}" var="item">
										<option value="${item.dict_id}"
											<c:if test="${item.dict_id == edit_editorNo}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label for="edit_context">帖子内容</label>
								<textarea rows="4" cols="40" id="edit_context"
									name="edit_context"></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary"
							onclick="updatepersonarticle()">保存修改</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function loadpage(){
			$("#myarticle").click();
	}
	function tomyreply(){
		window.location.href="<%=basePath%>bbs/myreply.action";
	}
	function tomyfootstep(){
		window.location.href="<%=basePath%>bbs/myfootstep.action";
	}
	function tomypublish(){
		window.location.href="<%=basePath%>bbs/mypublish.action";
	}
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
	function editor(id){
		$.ajax({
	        type:"post",
	        url:"<%=basePath%>bbs/getOneArticle.action",
	        data:{"id":id},
	        success:function(data) {
	        	$("#edit_personarticle_id").val(data.id);
	            $("#edit_title").val(data.title);
	            $("#edit_editorNo").val(data.editorNo);
	            $("#edit_context").val(data.context);
	        }
	    });
	}
	function updatepersonarticle(){
		$.post(
				"<%=basePath%>bbs/updatepersonarticle.action",
				$("#edit_personarticle_form").serialize(),
				function(data){
				if(data =="OK"){
					alert("我的帖子信息更新成功！");
					window.location.reload();
				}else{
					alert("我的帖子信息更新失败！");
					window.location.reload();
				}
		});
	}
	function deletemyarticle(id){
		if(confirm("确定要删除该帖吗？")){
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
</script>
</html>