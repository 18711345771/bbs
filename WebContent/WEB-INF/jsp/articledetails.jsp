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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- 引入 Bootstrap -->
<script type="text/javascript"
	src="<%=basePath%>bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" href="<%=basePath%>bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>css/articledetails.css">
<link rel="stylesheet"
	href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
<title>飞控社区帖子详情页面</title>
</head>
<body style="background: url(<%=basePath %>img/bk.jpg)  repeat; background-size:100% 100%;">
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
					<!--</div>-->
					<%!boolean login_flag = false;%>
					<%
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
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-sm-12 col-md-12 col-lg-12">
				<ol class="breadcrumb">
					<li><a href="<%=basePath%>bbs/list.action">飞控论坛</a></li>
					<li><img src="<%=basePath%>img/right.png" alt=""
						style="padding: 2px 2px 5px 2px"></li>
					<li><a href="#">工程内业资料</a></li>
					<li><img src="<%=basePath%>img/right.png" alt=""
						style="padding: 2px 2px 5px 2px"></li>
					<li><a href="#">问答</a></li>&nbsp;&nbsp;
					<li><a href="#">[我要提问]</a></li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2 col-lg-2"></div>
			<div class="col-12 col-sm-12 col-md-8 col-lg-8">
				<div
					style="margin: 0 auto; width: 100%; background-color: #4178b0; text-align: center;">
					<span style="color: white; font-size: 20px; font-weight: bolder;">${root_article_details.title}</span><br />
				</div>
			</div>
			<div class="col-md-2 col-lg-2"></div>
		</div>
		<div class="row">
			<div class="col-md-2 col-lg-2"></div>
			<div class="col-12 col-sm-12 col-md-8 col-lg-8">
				<div style="margin: 30px auto; width: 100%; text-align: center;">
					<span style="font-size: 10px; color: #333333"><img alt="" src="<%=basePath%>${root_article_details.wheadicon}" style="width:40px;height:40px;border-radius:25px;">&nbsp;&nbsp;楼主：<a href="">${root_article_details.writer}</a>&nbsp;&nbsp;${root_article_details.datatime}&nbsp;&nbsp;点击：${root_article_details.viewcount}&nbsp;&nbsp;回复：${root_article_details.replycount}
					</span>
				</div>
			</div>
			<div class="col-md-2 col-lg-2"></div>
		</div>
		<div class="row">
			<div class="col-md-2 col-lg-2"></div>
			<div class="col-12 col-sm-12 col-md-8 col-lg-8">
				<div style="margin: 10px auto; width: 100%; text-align: center;">
					<!-- 导航条功能以后再加 -->
					<!-- <span style="font-size: 10px;color: #333333">导航条</span> -->
				</div>
			</div>
			<div class="col-md-2 col-lg-2"></div>
		</div>
		<div class="row">
			<div class="col-12 col-sm-12 col-md-12 col-lg-12">
				<div
					style="margin: 0 auto 20px auto; width: 90%; background-color: #eeeeee; font-size: 18px;">
					<p>${root_article_details.context}</p>
					<div class="article_footer">
						<ul>
							<li><a href="#">举报</a></li>
							<li><a href="#">分享</a></li>
							<li><a href="#">邀请回答</a></li>
							<li><a href="#MyRootTextarea">我要回答</a></li>
						</ul>
					</div>
				</div>
				<div
					style="margin: 0 auto 20px auto; width: 90%; background-color: #eeeeee; font-size: 18px;">
					<div>
						<span><h4>${root_article_details.replycount}个回答</h4></span>
					</div>
					<div class="table-responsive">
						<table class="table table-no-border">
							<tbody>
								<c:forEach items="${child_articles.rows}" var="row">
									<tr>
										<td>
											<div>
												<div
													style="margin-bottom: 10px; width: 45px; height: 45px; text-align: center; background-color: #dcdcdc; cursor: pointer">
													<em class="fa fa-thumbs-o-up"></em>
													<div style="font-size: 10px; margin-top: -5px;">16</div>
												</div>
												<div>
													<img alt="" src="<%=basePath %>${row.wheadicon}" style="width:40px; height:40px;border-radius:25px;"> 
													<span style="font-size: 10px;">${row.writer}&nbsp;${row.datatime}</span>
													<div>${row.context}</div>
													<div class="panel panel-default">
														<div class="panel-heading">
															<div class="panel-title">
																<div class="reply_footer">
																	<ul>
																		<!-- id号命名规则：XXXX_i,其中i为根帖id号 -->
																		<li><a href="#collapse_${row.id}"
																			id="comment_${row.id}" onclick="isLogin(${row.id})">评论（${row.replycount}）</a></li>
																		<li><a href="#">收藏</a></li>
																		<li><a href="#">举报</a></li>
																		<!-- <li><a href="">24.2飞控分</a></li>
                                                    <li><a href="">2019-07-18&nbsp;10:32:49&nbsp;编辑更新</a></li> -->
																	</ul>
																</div>
															</div>
														</div>
														<div id="collapse_${row.id}"
															class="panel-collapse collapse in">
															<div class="panel-body">
																<div class="table-responsive"
																	style="width: 90%; float: right;">
																	<!--第1条父帖的第1页的第1个子评论内的table-->
																	<table class="table table-no-border">
																		<c:forEach items="${child_child_list_articles}"
																			var="child_child_list_articles_row">
																			<c:forEach
																				items="${child_child_list_articles_row.rows}"
																				var="child_child_articles_row">
																				<tbody>
																					<c:if
																						test="${child_child_articles_row.pid==row.id }">
																						<tr>
																							<td>
																								<!-- <a href="#"></a> 作者链接以后再加--> <span
																								style="font-size: 10px;"><img alt="" src="<%=basePath %>${child_child_articles_row.wheadicon}" style="width:40px; height:40px;border-radius:25px;"> ${child_child_articles_row.writer }</span>
																								<div>${child_child_articles_row.context}</div>
																								<div class="reply_footer">
																									<ul>
																										<li><a href="javascript:void(0)"
																											id="comment_${child_child_articles_row.id}"
																											onclick="startcomment(${child_child_articles_row.id})">评论</a></li>
																										<!--第1条父帖的第1页的第1个子评论内的第1个子评论-->
																										<li><a href="#">收藏</a></li>
																										<li><a href="#">举报</a></li>
																										<!-- <li><a href="">24.2飞控分</a></li>
                                                                        <li><a href="">2019-07-18&nbsp;10:32:49&nbsp;编辑更新</a></li> -->
																									</ul>
																								</div>
																							</td>
																						</tr>
																					</c:if>
																				</tbody>
																			</c:forEach>
																		</c:forEach>
																	</table>
																	<div>
																		<form action="" id="form_${row.id}">
																			<div class="form-group">
																				<textarea name="MyCommentArea_context"
																					id="commentarea_${row.id}" cols="85" rows="5"></textarea>
																			</div>
																			<div class="form-group">
																				<input type="button" class="btn btn-primary"
																					value="发表" onclick="addArticle(${row.id})" />
																			</div>
																		</form>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div
					style="margin: 0 auto 20px auto; width: 90%; background-color: #eeeeee; font-size: 18px;">
					<div style="margin: 0 auto; width: 452px;">
						<form id="root_article_form" action="">
							<div class="form-group">
								<textarea name="MyRootTextarea"
									id="roottextarea_${root_article_details.id}" cols="43" rows="8"
									onfocus="getFocusEvent(${root_article_details.id})">this is value</textarea>
							</div>
							<div class="form-group">
								<input id="publish_btn_${root_article_details.id}" type="button"
									class="btn btn-primary" value="发表评论"
									onclick="publish(${root_article_details.id})" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class=" modal fade" id="login_regist" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<ul class="nav nav-tabs nav-justified" id="mytab">
							<li class="active nav-item"><a class="nav-link"
								href="#login_pane" data-toggle="tab" id="login_pane_btn">登录</a></li>
							<li class="nav-item"><a class="nav-link" href="#regist_pane"
								data-toggle="tab" id="regist_pane_btn">注册</a></li>
						</ul>
						<div class="tab-content" id="mytabcontent">
							<div class="tab-pane fade" id="login_pane">
								<div class="panel panel-default">
									<div class="panel-body">
										<form id="loginform" action="" class="form-horizontal"
											style="border: 1px solid #333333; border-radius: 5px; padding: 5px 5px;">
											<div class="form-group">
												<input type="text" class="form-control" name="l_username"
													id="usernameLogin" placeholder="用户名/手机/邮箱" />
											</div>
											<div class="form-group">
												<input type="password" class="form-control"
													name="l_password" id="passwordLogin" placeholder="密码" />
											</div>
											<div class="form-group">
												<label for="identityRegist">用户身份</label>
												<div class="radio-inline">
													<label> <input type="radio" name="l_identity"
														id="identityLogin_common" value="common" checked />普通用户
													</label>
												</div>
												<div class="radio-inline">
													<label> <input type="radio" name="l_identity"
														id="identityLogin_admin" value="admin" />管理员
													</label>
												</div>
											</div>
											<div class="form-group">
												<button type="button" class="btn btn-primary"
													onclick="userlogin()">登录</button>
											</div>
										</form>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="regist_pane">
								<div class="panel panel-default">
									<div class="panel-body">
										<form id="registform" action="" class="form-horizontal"
											style="border: 1px solid #333333; border-radius: 5px; padding: 5px 5px;">
											<div class="form-group">
												<label for="usernameRegist">用户名</label> <input type="text"
													class="form-control" name="r_username" id="usernameRegist"
													placeholder="请输入用户名" />
											</div>
											<div class="form-group">
												<label for="passwordRegist">密码</label> <input
													type="password" class="form-control" name="r_password"
													id="passwordRegist" placeholder="请输入密码" />
											</div>
											<div class="form-group">
												<label for="passwordRegistCheck">确认密码</label> <input
													type="password" class="form-control" name="r_passwordcheck"
													id="passwordRegistCheck" placeholder="请再次确认密码" />
											</div>
											<div class="form-group">
												<label for="telephoneRegist">手机号</label> <input type="text"
													class="form-control" name="telephone" id="telephoneRegist"
													placeholder="请输入正确的手机号" />
											</div>
											<div class="form-group">
												<label>用户身份</label>
												<div class="radio-inline">
													<label> <input type="radio" name="r_identity"
														id="identityRegist_common" value="common" checked />普通用户
													</label>
												</div>
												<div class="radio-inline">
													<label> <input type="radio" name="r_identity"
														id="identityRegist_admin" value="admin" />管理员
													</label>
												</div>
											</div>
											<div class="form-group">
												<label for="Protocol" class="form-check-inline"><input
													type="checkbox" name="protocol" id="Protocol" size="50" />我已阅读并同意遵守<a
													href="#">《飞控社区用户注册协议》</a></label>
											</div>
											<div class="form-group">
												<button type="button" class="btn btn-primary"
													onclick="userregist()">确定注册</button>
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
	</div>
</body>
<script type="text/javascript">

//点击子子帖中的评论，使评论呈现相应的内容
function startcomment(id){
	var data_pid;
	var data_writer;
	$.ajax({
		type:"post",
		url:"<%=basePath%>bbs/getOneArticle.action",
		data:{"id":id},
		success:function(data){
			data_pid="#commentarea_"+data.pid;
			data_writer=data.writer;
			console.log(data_pid);
			console.log(data_writer);
			$(data_pid).val('评论'+data_writer+':');
		}
	});
}
//点击子帖中的评论，先判断是否登录，根据子帖id判断点击的是哪个子帖，然后打开子帖对应的评论框
function isLogin(id){
	var login_flag=<%=login_flag%>;
	console.log(login_flag);
	var str="#comment_"+id;
	if(!login_flag){
		alert("您还没登录，请先登录！");
		$(str).removeAttr("data-toggle","collapse").attr("onclick");
	}else{
		console.log(str);
		$(str).attr("data-toggle","collapse").removeAttr("onclick").click();
	}
}
function userlogin(){
	var check=check();
	if(check){
		var obj=document.getElementsByName("l_identity");
		if(obj[0].checked){
			$.ajax({
				type:"post",
				url:"<%=basePath%>bbs/userlogin.action",
				data:$("#loginform").serialize(),
				success:function(data){
					if(data=="OK"){
						alert("登陆成功！");
						window.location.reload();
					}else{
						alert("登陆失败，用户名或密码或身份有误！");
						window.location.reload();
					}
				}
			});
		}
		if(obj[1].checked){
			$.ajax({
				type:"post",
				url:"<%=basePath%>bbs/adminlogin.action",
				data:$("#loginform").serialize(),
				success:function(data){
					if(data=="OK"){
						window.location.href="<%=basePath%>bbs/topublish_0.action";
					}else{
						alert("登陆失败，用户名或密码或身份有误！");
						window.location.reload();
					}
				}
			});
		}
	}
	
	function check(){
	    var usercode = $("#usernameLogin").val();
	    var password = $("#passwordLogin").val();
	    if(usercode=="" || password==""){
	    	alert("账号或密码不能为空！");
	        return false;
	    }  
	    return true;
	}
}
function userregist(){
	var usercode = $("#usernameRegist").val();
    var password = $("#passwordRegist").val();
    var passwordcheck= $("#passwordRegistCheck").val();
    var telephone=$("#telephoneRegist").val();
    var protocol=$("#Protocol").is(":checked")?true:false;
    var regLetter = /[A-Za-z]/;
    var regNum = /[0-9]/;
    var regTeShu =new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？+-]");
    var complex = 0;
    
    if (regLetter.test(password)){
    	++complex;
    }
    if (regNum.test(password)){
    	++complex;
    }
    if (regTeShu.test(password)){
    	++complex;
    }
    
	var check=check();
	if(check){
		var safetyscores;
		var pswstrength;
		if (complex == 2 && 6<=password.length <8) {             
			safetyscores=7;
			pswstrength="弱";
	    }
		if (complex == 2 && 8<=password.length) {             
			safetyscores=8;
			pswstrength="中";
	    }
		if (complex == 3 && password.length ==6) {             
			safetyscores=8;
			pswstrength="中";
	    }
		if (complex == 3 && password.length ==7) {             
			safetyscores=9;
			pswstrength="较强";
	    }
		if (complex == 3 && 8<=password.length) {             
			safetyscores=10;
			pswstrength="强";
	    }
		$.ajax({
			type:"post",
			url:"<%=basePath%>bbs/userregist.action",
			data:$.param({'securityscores':safetyscores,'pswstrength':pswstrength})+'&'+$("#registform").serialize(),
			success:function(data){
				if(data=="OK"){
					alert("注册成功！");
					window.location.reload();
				}else{
					var value ="该账号已注册！请重新换一个账号注册！";
					alert("注册失败："+value);
				}
			}
		});
	}
	function check(){
	    var usercode = $("#usernameRegist").val();
	    var password = $("#passwordRegist").val();
	    var passwordcheck= $("#passwordRegistCheck").val();
	    var telephone=$("#telephoneRegist").val();
	    var protocol=$("#Protocol").is(":checked")?true:false;
	    if(usercode=="" || password==""){
	    	alert("账号或密码不能为空");
	        return false;
	    }
	    
	    var regLetter = /[A-Za-z]/;
	    var regNum = /[0-9]/;
	    var regTeShu =new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？+-]");
	    var complex = 0;
	    
	    if (regLetter.test(password)){
	    	++complex;
	    }
	    if (regNum.test(password)){
	    	++complex;
	    }
	    if (regTeShu.test(password)){
	    	++complex;
	    }
	    if (complex < 3 || password.length < 8) {             
	    	alert("密码长度不能小于8位，包含数字、字母、符号中的至少3种");//iview中的一个提示框
	    	return false;
	    }
	    
	    if(passwordcheck!=password){
	    	if(passwordcheck==""){
	    		alert("请再次确认密码");
	    		return false;
	    	}else{
	    		alert("两次输入的密码不一致，请核对");
		    	return false;
	    	}
	    }
	    if(telephone==""){
	    	alert("请输入您的手机号");
	    	return false;
	    }
	    if(telephone.length!=11){
	    	alert("请输入正确的手机号");
	    	return false;
	    }
	    if(!protocol){
	    	alert("您须同意遵守《飞控社区用户注册协议》才能注册");
	    	return false;
	    }
	    return true;
	}
}

function addArticle(id){
	var str="#commentarea_"+id;
	$.ajax({
		type:"post",
		url:"<%=basePath%>bbs/addArticle.action",
		data:{MyCommentArea_context:$(str).val(),"id":id},
		success:function(data){
			if(data=="OK"){
				window.location.reload();
			}else{
				alert("评论不成功！");
			}
		}
	});
}
function userlogout(){
	if(confirm('确定要退出吗？')){
		$.post(
				"<%=basePath%>bbs/userlogout.action",
				function(data){
		            if(data =="OK"){
		                alert("账号已成功注销!");
		                window.location.reload();
		            }else{
		                alert("账号注销失败!");
		                window.location.reload();
		            }
		        });
	}
}
function adminlogout(){
	if(confirm("确定退出登录吗？")){
		window.location.href="${pageContext.request.contextPath }/bbs/adminlogout.action";
	}
}
function publish(id){
	var str="#roottextarea_"+id;
	var rootstr=$(str).val();
	if(rootstr!=""&&rootstr!="this is value"){
		$.ajax({
			type:"post",
			url:"<%=basePath%>bbs/publishArticle.action",
			data:{MyRootTextarea:$(str).val(),"id":id},
			success:function(data){
				if(data=="OK"){
					window.location.reload();
				}else{
					alert("评论不成功！");
				}
			}
		});
	}else{
		alert("请输入你的评论!");
	}
}
function getFocusEvent(id){
	var login_flag=<%=login_flag%>;
	if(!login_flag){
		var publish_btn="#publish_btn_"+id;
		$(publish_btn).attr("disabled","disabled");
		alert("您还没登录，请先登录！");
		var str="#roottextarea_"+id;
		$(str).blur();
	}
}

function getLoginPane(){
	$("#login_pane_btn").click();
}
function getRegistPane(){
	$("#regist_pane_btn").click();
}
</script>
</html>