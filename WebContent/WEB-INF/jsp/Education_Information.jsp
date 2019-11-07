<%@page import="com.bbs.po.User"%>
<%@page import="com.bbs.po.EducationInformation"%>
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
<style type="text/css">
        .showorhide{
            display: none;
        }
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
					<%!
						boolean login_flag=false;
						boolean has_educate_info=false;	
					%>
					<%
						EducationInformation educateinfo=(EducationInformation) request.getAttribute("educationInfo");
						if(educateinfo!=null){
							has_educate_info=true;
						}
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
									<li><a href="<%=basePath%>bbs/Contract_Information.action">
											<i class="fa fa-comment fa-fw"></i> 联系信息
									</a></li>
									<li><a
										href="<%=basePath%>bbs/Education_Information.action"class="active"> <i
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
						<h1 class="page-header">教育信息</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="panel panel-default">
					<div class="panel-body">
							<div class="condense_panel">
									<form>
							<div class="form-group form-inline">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;大学:</label>
									<input type="text" id="showcollegeRecruitTime" class="form-control"
										placeholder="入学时间"/>
								<select id="showprovince" class="form-control " name="showprovince" disabled>
										<option value="">---</option>
										<c:forEach items="${provinceInfo }" var="row_a">
												<option value="${row_a.dict_order_code }" <c:if test="${row_a.dict_order_code==showprovince}">selected</c:if>>
														${row_a.dict_item_name}
												</option>
										</c:forEach>
								</select>
								<select id="showcity" class="form-control " name="showcity" disabled>
										<option value="">---</option>
										<c:forEach items="${cityInfo }" var="row_a">
												<option value="${row_a.dict_order_code }" <c:if test="${row_a.dict_order_code==showcity}">selected</c:if>>
														${row_a.dict_item_name}
												</option>
										</c:forEach>
								</select>
								<select id="showschool" class="form-control " name="showschool" disabled>
										<option value="">---</option>
										<c:forEach items="${schoolInfo }" var="row_a">
												<option value="${row_a.dict_order_code }" <c:if test="${row_a.dict_order_code==showschool}">selected</c:if>>
														${row_a.dict_item_name}
												</option>
										</c:forEach>
								</select>
							</div>
							<div class="form-group form-inline">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高中:</label>
								<input type="text"
									class="form-control" id="showhighSchoolRecruitTime"
									placeholder="入学时间"/> <input
									type="text" class="form-control"
									id="showhighSchoolName" placeholder="学校名称"/>
							</div>
							<div class="form-group form-inline">
								<label>&nbsp;&nbsp;&nbsp;中专学校:</label> <input type="text"
									 class="form-control"
									id="showcareerSchoolRecruitTime" placeholder="入学时间"/> <input
									type="text" class="form-control"
									id="showcareerSchoolName" placeholder="学校名称"/>
							</div>
							<div class="form-group form-inline">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;初中:</label>
								<input type="text"
									class="form-control" id="showmiddleSchoolRecruitTime"
									placeholder="入学时间"/> <input
									type="text"class="form-control"
									id="showmiddleSchoolName" placeholder="学校名称" />
							</div>
							<div class="form-group form-inline">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小学:</label>
								<input type="text"
									class="form-control" id="showprimarySchoolRecruitTime"
									placeholder="入学时间"/> <input
									type="text"  class="form-control"
									id="showprimarySchoolName" placeholder="学校名称"/>
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-primary" onclick="show_panel(0)"
								style="margin: 0 auto; width: 100px;">修改</button>
						</form>
							</div>
							<div  class="condense_panel">
								<form id="educationinformationform"
							action="${pageContext.request.contextPath }/customer/list.action">
							<div class="form-group form-inline">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;大学:</label>
								<div class="input-group">
									<input type="text" id="collegeRecruitTime" name="collegeRecruitTime" class="form-control"
										onClick="return Calendar('collegeRecruitTime');"
										placeholder="入学时间" /> <span class="input-group-addon"><span
										class="fa fa-calendar"></span></span>
								</div>
								<select id="province" name="province" class="form-control"></select>
								<select id="city" name="city" class="form-control"></select> <select
									id="school" name="school" class="form-control"></select>
							</div>
							<div class="form-group form-inline">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高中:</label>
								<input type="text" id="highSchoolRecruitTime"
									class="form-control" name="highSchoolRecruitTime"
									placeholder="入学时间"
									onClick="return Calendar('highSchoolRecruitTime');" /> <input
									type="text" id="highSchoolName" class="form-control"
									name="highSchoolName" placeholder="学校名称" />
							</div>
							<div class="form-group form-inline">
								<label>&nbsp;&nbsp;&nbsp;中专学校:</label> <input type="text"
									id="careerSchoolRecruitTime" class="form-control"
									name="careerSchoolRecruitTime" placeholder="入学时间"
									onClick="return Calendar('careerSchoolRecruitTime');" /> <input
									type="text" id="careerSchoolName" class="form-control"
									name="careerSchoolName" placeholder="学校名称" />
							</div>
							<div class="form-group form-inline">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;初中:</label>
								<input type="text" id="middleSchoolRecruitTime"
									class="form-control" name="middleSchoolRecruitTime"
									placeholder="入学时间"
									onClick="return Calendar('middleSchoolRecruitTime');" /> <input
									type="text" id="middleSchoolName" class="form-control"
									name="middleSchoolName" placeholder="学校名称"/>
							</div>
							<div class="form-group form-inline">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小学:</label>
								<input type="text" id="primarySchoolRecruitTime"
									class="form-control" name="primarySchoolRecruitTime"
									placeholder="入学时间"
									onClick="return Calendar('primarySchoolRecruitTime');"/> <input
									type="text" id="primarySchoolName" class="form-control"
									name="primarySchoolName" placeholder="学校名称"/>
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-primary" onclick="saveEducationInformation()"
								style="margin: 0 auto; width: 100px;">保存</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" onclick="show_panel(1)">查看</button>
						</form>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="<%=basePath%>js/AllSchool.js"></script>
<script type="text/javascript" src="<%=basePath%>js/showdate.js"></script>
<script  type="text/javascript" >
window.onload=function(){
    init_show("<%=userinfo.getUsername()%>"); 
    var provinceArray = "";
    var provicneSelectStr = "";
    for(var i=0,len=province.length;i<len;i++){
        provinceArray = province[i];
        provicneSelectStr = provicneSelectStr + "<option value='"+provinceArray[0]+"'>"+provinceArray[1]+"</option>"
    }
    $("#province").html(provicneSelectStr);

    var selectCity = $("#province").val();
    var citylist=city[selectCity];
    var cityArray = "";
    var citySelectStr = "";
    for(var i=0,len=citylist.length;i<len;i++){
        cityArray = citylist[i];
        citySelectStr = citySelectStr + "<option value='"+cityArray[0]+"'>"+cityArray[1]+"</option>"
    }
    $("#city").html(citySelectStr);

    var selectschool = $("#city").val();
    var schoolUlStr = "";
    var schoolListStr = allschool[selectschool];
    for(var i=0,len=schoolListStr.length;i<len;i++){
        var schoolArray=schoolListStr[i];
        schoolUlStr = schoolUlStr + "<option value='"+schoolArray[0]+"'>"+schoolArray[1]+"</option>";
    }
    schoolUlStr = schoolUlStr + "<option value='999'>其它</option>";
    $("#school").html(schoolUlStr);
    //省切换事件
    $("#province").change(function(){
        var selectCity = $("#province").val();
        var citylist=city[selectCity];
        var cityArray = "";
        var citySelectStr = "";
        if(citylist!=null){
            for(var i=0,len=citylist.length;i<len;i++){
                cityArray = citylist[i];
                citySelectStr = citySelectStr + "<option value='"+cityArray[0]+"'>"+cityArray[1]+"</option>"
            }
        }

        $("#city").html(citySelectStr);

        var selectschool = $("#city").val();
        var schoolUlStr = "";
        var schoolListStr = allschool[selectschool];
        for(var i=0,len=schoolListStr.length;i<len;i++){
            var schoolArray=schoolListStr[i];
            schoolUlStr = schoolUlStr + "<option value='"+schoolArray[0]+"' >" + schoolArray[1] + "</option>";
        }
        schoolUlStr = schoolUlStr + "<option value='999'>其它</option>";
        $("#school").html(schoolUlStr);
    });
    //切换城市事件
    $("#city").change(function(){

        var selectschool = $("#city").val();
        var schoolUlStr = "";
        var schoolListStr = allschool[selectschool];
        for(var i=0,len=schoolListStr.length;i<len;i++){
            var schoolArray=schoolListStr[i];
            schoolUlStr = schoolUlStr + "<option value='"+schoolArray[0]+"' >" + schoolArray[1] + "</option>";
        }
        schoolUlStr = schoolUlStr + "<option value='999'>其它</option>";
        $("#school").html(schoolUlStr);
    });
}

function init_show(username){
	$.ajax({
    	type:"POST",
        url:"<%=basePath%>bbs/getEducationInformation.action",
    	data:{"username":username},
    	success:function(data){
    		if(data!=null){
    			$("#showcollegeRecruitTime").val(data.collegeRecTime);
    			var showprovincestr=data.collegeName?data.collegeName.split("/")[0]:"";
    			var showcitystr=data.collegeName?data.collegeName.split("/")[1]:"";
    			var showschoolstr=data.collegeName?data.collegeName.split("/")[2]:"";
    			$("#showprovince").val(showprovincestr);
    			$("#showcity").val(showcitystr);
    			$("#showschool").val(showschoolstr);
    			$("#showhighSchoolRecruitTime").val(data.highSchoolRecTime);
    			$("#showhighSchoolName").val(data.highSchoolName);
    			$("#showcareerSchoolRecruitTime").val(data.careerSchoolRecTime);
    			$("#showcareerSchoolName").val(data.careerSchoolName);
    			$("#showmiddleSchoolRecruitTime").val(data.midSchoolRecTime);
    			$("#showmiddleSchoolName").val(data.midSchoolName);
    			$("#showprimarySchoolRecruitTime").val(data.priSchoolRecTime);
    			$("#showprimarySchoolName").val(data.priSchoolName);
    			$(".condense_panel").eq(1).addClass("showorhide").siblings().removeClass("showorhide");
    		}else{
    			$(".condense_panel").eq(0).addClass("showorhide").siblings().removeClass("showorhide");
    		}
    	}
    });
}
function show_panel(sequence){
	if(sequence==1){
		$(".condense_panel").eq(1).addClass("showorhide").siblings().removeClass("showorhide");
	}
	if(sequence==0){
		$(".condense_panel").eq(0).addClass("showorhide").siblings().removeClass("showorhide");
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
			            }else{
			                alert("账号注销失败!");
			            }
			        });
		}
	}
	function saveEducationInformation(){
		var _login_flag=<%=login_flag%>;
		if(_login_flag){
			if(confirm("确定要提交吗？")){
				$.ajax({
					type:"post",
					url:'<%=basePath%>bbs/saveeducationinformation.action',
					data:$("#educationinformationform").serialize(),
					success:function(data){
								if(data=="OK"){
									if(confirm("学历信息上传并保存成功！")){
										window.location.reload();
									}
								}
					}
				})
			}
		}else{
			alert("您还没有登录，请先登录！");
		}
	}

</script>
</html>