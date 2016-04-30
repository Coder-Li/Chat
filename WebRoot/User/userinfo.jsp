<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>用户信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<style type="text/css">
div#head {
	width: 100%;
	height: 60px;
}

div#zhuti {
	width: 100%;
	height: 500px;
}

div#daohang {
	width: 20%;
	height: 500px;
	float: left;
}

div#neirong {
	width: 80%;
	height: 500px;
	float: left;
}

div#zuihou {
	width: 100%;
	height: 100px
}
</style>
</head>

<body>
	<div id="head">tou</div>
	<hr size="3" noshade="noshade" color="#000000" />
	<div id="zhuti">
		<div id="daohang">
			<div id="top">
				<p>
					<img src="pic/touxiang.jpg" width=80px height=80px
						align="middle" />
				</p>
			</div>
			<div id="mid">
				<p>
					<a href="User/jibenxinxi.jsp" target="neirong_frame"><b>基本信息</b></a>
				</p>
			</div>
		</div>
		<div id="neirong">
			<iframe name="neirong_frame" src="User/jibenxinxi.jsp" frameborder="0"
				scrolling="no" width="100%" height="500px"></iframe>
		</div>
	</div>
	<div id="zuihou">
		<hr size="1" color="#000000" />
		<h3>欢迎来访</h3>
	</div>
</body>
</html>
