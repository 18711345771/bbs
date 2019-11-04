<%@page import="com.bbs.po.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="list" uri="http://itheima.com/commonlist/"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
    <!-- 引入 Bootstrap -->
    <script type="text/javascript" src="<%=basePath%>bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="<%=basePath%>bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath%>css/BBS_index.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <title>飞控社区论坛首页</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                <div class="navbar navbar-expand-sm bg-dark navbar-dark">
                    <a class="nav navbar-brand" href="#" data-toggle="collapse" >Logo</a>
                    <ul class="nav navbar-nav">
                        <li class="active nav-item"><a href="<%=basePath %>bbs/list.action" class="nav-link">论坛</a></li>
                        <li class="nav-item"><a href="#" class="nav-link">聚焦</a></li>
                        <li class="nav-item"><a href="#" class="nav-link">飞控榜</a></li>
                        <li class="nav-item"><a href="#" class="nav-link"><b class="fa fa-bars"></b></a></li>
                    </ul>
                    <form action="<%=basePath %>bbs/list.action" method="post" class="navbar-form navbar-left form-inline" role="search">
                        <div class="form-group">
                            <input id="limitedstr" name="limitedstr" type="text" class="form-control" placeholder="搜帖、搜类型、搜版块">
                        </div>
                        <div class="form-group">
                        	<button type="submit" class="btn btn-primary">搜搜看</button>
                        </div>
                    </form>
                    <!--</div>-->
                    	<%
                    	User userinfo=(User)request.getSession().getAttribute("UserInfo");
                    	User admininfo=(User)request.getSession().getAttribute("AdminInfo");
                    	if(userinfo!=null){
                        %>
                        <ul class="nav navbar-nav navbar-right pull-right" id="userinfobar">
                        	<li class="nav-item">
                        		<a href="<%=basePath %>bbs/Personal_Header.action" class="nav-link"><img alt="" src="<%=basePath %>${UserInfo.getHeadicon()}" style="border-radius:20px; width:20px; height:20px;"></a>
                        	</li>
                        	<li class="nav-item">
                        		<a href="<%=basePath%>bbs/personarticle.action" class="nav-link" style="font-size:10px;">账号:${UserInfo.getUsername()}</a>
                       	 	</li>
                        	<li class="nav-item">
                        		<a href="#" class="nav-link"  style="font-size:10px;">登录时间:${UserInfo.getDatetime()}</a>
                        	</li>
                        	<li class="nav-item">
                				<a href="#" class="nav-link" onclick="userlogout()"  style="font-size:10px;">[退出登录]</a>
                		 	</li>
                		 </ul>
                		<%
                    		}else if(admininfo!=null){
                        %>
                        <ul class="nav navbar-nav navbar-right pull-right" id="userinfobar">
                            <li class="nav-item">
                        		<a href="#" class="nav-link"><img alt="" src="<%=basePath%>${AdminInfo.getHeadicon()}" style="border-radius:20px; width:20px; height:20px;"></a>
                        	</li>
                        	<li class="nav-item">
                        		<a href="<%=basePath%>bbs/topublish_0.action" class="nav-link" style="font-size:10px;">账号:${AdminInfo.getUsername()}[管理员]</a>
                        	</li>
                        	<li class="nav-item">
                        		<a href="#" class="nav-link" style="font-size:10px;">登录时间:${AdminInfo.getDatetime()}</a>
                        	</li>
                			<li class="nav-item">
                				<a href="#" class="nav-link" onclick="adminlogout()" style="font-size:10px;">[退出登录]</a>
                			</li>
                		</ul>
                		<%
                    		}else{
                    	%>
                    	<ul class="nav navbar-nav navbar-right pull-right" id="userinfobar">
                        	<li class="nav-item"><a href="#" data-toggle="modal" data-target="#login_regist" class="nav-link" onclick="getLoginPane()">登录</a></li>
                        	<li class="nav-item"><a href="#" data-toggle="modal" data-target="#login_regist" class="nav-link" onclick="getRegistPane()">注册</a></li>
                        </ul>
                        <%
                    	}
                    	%>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                <h4><span class="label label-primary">问答</span></h4>
                <div class="table-responsive">
                    <table class="table table-hover table-striped table-no-border">
                    	<tbody>
                    		<c:forEach items="${list.rows}" var="row">
                    				<c:if test="${ row.editorNo=='问答版块'}">
                    					<tr>
                    						<td><a href="<%=basePath%>bbs/root_child_article.action?id=${row.id}">${row.title}</a></td>	
                    						<td>${row.type}</td>	
                    					</tr>
                    				</c:if>
                    		</c:forEach>
                    	</tbody>
                    </table>
                </div>
                <h4><span class="label label-primary">热帖榜</span></h4>
                <div class="table-responsive">
                    <table class="table table-hover table-striped table-no-border">
                        <tbody>
                        	<c:forEach items="${list.rows}" var="row">
                    				<c:if test="${ row.editorNo=='热帖榜版块'}">
                    					<tr>
                    						<td><a href="<%=basePath%>bbs/root_child_article.action?id=${row.id}">${row.title}</a></td>	
                    						<td>${row.type}</td>	
                    					</tr>
                    				</c:if>
                    		</c:forEach>
                        </tbody>
                    </table>
                </div>
                <h4><span class=" label label-primary">钻石榜</span></h4>
                <div class="table-responsive">
                    <table class="table table-hover table-striped table-no-border">
                        <tbody>
                        	<c:forEach items="${list.rows}" var="row">
                    				<c:if test="${ row.editorNo=='钻石榜版块'}">
                    					<tr>
                    						<td><a href="<%=basePath%>bbs/root_child_article.action?id=${row.id}">${row.title}</a></td>	
                    						<td>${row.type}</td>	
                    					</tr>
                    				</c:if>
                    		</c:forEach>
                    		</tbody>
                    </table>
                </div>
                <h4><span class=" label label-primary">打赏榜</span></h4>
                <div class="table-responsive">
                    <table class="table table-hover table-striped table-no-border">
                        <tbody>
                        	<c:forEach items="${list.rows}" var="row">
                    				<c:if test="${ row.editorNo=='打赏榜版块'}">
                    					<tr>
                    						<td><a href="<%=basePath%>bbs/root_child_article.action?id=${row.id}">${row.title}</a></td>	
                    						<td>${row.type}</td>	
                    					</tr>
                    				</c:if>
                    		</c:forEach>
                        </tbody>
                    </table>
                </div>
                <h4><span class=" label label-primary">城市榜</span></h4>
                <div class="table-responsive">
                    <table class="table table-hover table-striped table-no-border">
                        <tbody>
                        	<c:forEach items="${list.rows}" var="row">
                    				<c:if test="${ row.editorNo=='城市榜版块'}">
                    					<tr>
                    						<td><a href="<%=basePath%>bbs/root_child_article.action?id=${row.id}">${row.title}</a></td>	
                    						<td>${row.type}</td>	
                    					</tr>
                    				</c:if>
                    		</c:forEach>
                        </tbody>
                    </table>
                </div>
                <h4><span class=" label label-primary">红黑榜</span></h4>
                <div class="table-responsive">
                    <table class="table table-hover table-striped table-no-border">
                        <tbody>
                        	<c:forEach items="${list.rows}" var="row">
                    				<c:if test="${ row.editorNo=='红黑榜版块'}">
                    					<tr>
                    						<td><a href="<%=basePath%>bbs/root_child_article.action?id=${row.id}">${row.title}</a></td>	
                    						<td>${row.type}</td>	
                    					</tr>
                    				</c:if>
                    		</c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="text-left">
                	<list:page url="${pageContext.request.contextPath }/bbs/list.action"></list:page>
                </div>
            </div>
        </div>
        <div class=" modal fade" id="login_regist" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <ul class="nav nav-tabs nav-justified" id="mytab">
                            <li class="active nav-item"><a class="nav-link" href="#login_pane" data-toggle="tab" id="login_pane_btn">登录</a></li>
                            <li class="nav-item"><a class="nav-link" href="#regist_pane" data-toggle="tab" id="regist_pane_btn">注册</a></li>
                        </ul>
                        <div class="tab-content" id="mytabcontent">
                            <div class="tab-pane fade" id="login_pane">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <form id="loginform" action="" class="form-horizontal" style="border: 1px solid #333333;border-radius: 5px;padding: 5px 5px;">
                                            <div class="form-group">
                                                <input type="text" class="form-control" name="l_username" id="usernameLogin" placeholder="用户名/手机/邮箱"/>
                                            </div>
                                            <div class="form-group">
                                                <input type="password" class="form-control" name="l_password" id="passwordLogin" placeholder="密码"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="identityRegist">用户身份</label>
                                                <div class="radio-inline">
                                                	<label>
                                                		<input type="radio" name="l_identity" id="identityLogin_common" value="common" checked/>普通用户
                                                	</label>
                                                </div>
                                                <div class="radio-inline">
                                                	<label>
                                                		<input type="radio" name="l_identity" id="identityLogin_admin" value="admin"/>管理员
                                                	</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <button type="button" class="btn btn-primary" onclick="userlogin()">登录</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="regist_pane">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <form id="registform" action="" class="form-horizontal" style="border: 1px solid #333333;border-radius: 5px;padding: 5px 5px;">
                                            <div class="form-group">
                                                <label for="usernameRegist">用户名</label>
                                                <input type="text" class="form-control" name="r_username" id="usernameRegist" placeholder="请输入用户名"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="passwordRegist">密码</label>
                                                <input type="password" class="form-control" name="r_password" id="passwordRegist" placeholder="请输入密码"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="passwordRegist">确认密码</label>
                                                <input type="password" class="form-control" name="r_passwordcheck" id="passwordRegistCheck" placeholder="请确认密码"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="telephoneRegist">手机号</label>
                                                <input type="text" class="form-control" name="telephone" id="telephoneRegist" placeholder="请输入正确的手机号"/>
                                            </div>
                                            <div class="form-group">
                                                <label>用户身份</label>
                                                <div class="radio-inline">
                                                	<label>
                                                		<input type="radio" name="r_identity" id="identityRegist_common" value="common" checked/>普通用户
                                                	</label>
                                                </div>
                                                <div class="radio-inline">
                                                	<label>
                                                		<input type="radio" name="r_identity" id="identityRegist_admin" value="admin"/>管理员
                                                	</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Protocol" class="form-check-inline"><input type="checkbox" name="protocol" id="Protocol" size="50"/>我已阅读并同意遵守<a href="#">《飞控社区用户注册协议》</a></label>
                                            </div>
                                            <div class="form-group">
                                                <button type="button" class="btn btn-primary" onclick="userregist()">确定注册</button>
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
    	console.log(complex);
    }
    if (regNum.test(password)){
    	++complex;
    	console.log(complex);
    }
    if (regTeShu.test(password)){
    	++complex;
    	console.log(complex);
    }
 
    function check(){    
	    if(usercode=="" || password==""){
	    	alert("账号或密码不能为空");
	        return false;
	    }
	    if (complex < 2 || password.length < 6) {             
	    	alert("密码长度不能小于6位，包含数字、字母、符号中的至少2种");//iview中的一个提示框
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
	var check=check();
	if(check){
		var safetyscores;
		var pswstrength;
		if ((complex == 2) && (6<=password.length<8)) {             
			safetyscores=7;
			pswstrength="弱";
	    }else if ((complex == 2) && (password.length>=8)) {             
			safetyscores=8;
			pswstrength="中";
	    }else if ((complex == 3) && (password.length ==6)) {             
			safetyscores=8;
			pswstrength="中";
	    }else if ((complex == 3) &&( password.length ==7)) {             
			safetyscores=9;
			pswstrength="较强";
	    }else if ((complex == 3) && (8<=password.length)) {             
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
	
}
function userlogout(){
	if(confirm('确定要退出吗？')){
		$.post(
				"<%=basePath %>bbs/userlogout.action",
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

function getLoginPane(){
	$("#login_pane_btn").click();
}
function getRegistPane(){
	$("#regist_pane_btn").click();
}
</script>
</html>