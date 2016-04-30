<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>正在进入</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<script language="javascript" type="text/javascript">
	// 以下方式直接跳转
	//window.location.href = 'hello.html';
	// 以下方式定时跳转
	setTimeout("javascript:location.href='index.jsp'", 1500);
</script>
</head>
<body>

注销成功，正在返回主页；<br>
如果无法跳转，请<a href="index.jsp">点击此处</a>
</body>
</html>
