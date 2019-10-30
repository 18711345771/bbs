<%@page import="com.bbs.po.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>日历</title>

<link rel="stylesheet" type="text/css" href="<%=basePath %>css/easyui.css" />
<script type="text/javascript" src="<%=basePath %>js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery.fullcalendar.js"></script>
</head>

<body class="easyui-layout">
	<div region="center">
		<div class="easyui-fullCalendar" fit="true"></div>
	</div>
</body>
</html>