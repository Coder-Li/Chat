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

<title>My JSP 'jibenxinxi.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	window.onload = getUserInfo1();
	function getUserInfo1() {
		if ("${username}" != "") {
			getUserInfo();
		}
	}
	function getUserInfo() {
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.open("GET", "getUserInfo?username=${username}", true);
		xmlhttp.send();
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				//刷新聊天消息框
				var txt = xmlhttp.responseText;
				var strs= new Array();
				strs = txt.split(",");
				document.getElementById("city").innerHTML = strs[1];
				document.getElementById("sex").innerHTML = strs[2];
				document.getElementById("huoyuedu").innerHTML = strs[3];
			}
		};
	}
</script>
</head>

<body>
<body>
	<br />
	<table border="0">
		<tr>
			<td width="70">用户名:</td>
			<td width="86"><div id="name">${username}</div></td>
			<td width="79">&nbsp;</td>
			<td width="70">QQ:</td>
			<td width="76"><div id="qq"></div></td>
		</tr>
		<tr>
			<td width="70">性别:</td>
			<td width="86"><div id="sex"></div></td>
			<td width="79">&nbsp;</td>
			<td>活跃度</td>
			<td><div id="huoyuedu"></div></td>
		</tr>
		
		<tr>
			<td width="39">地区:</td>
			<td width="86"><div id="city"></div></td>
			<td width="79">&nbsp;</td>
		</tr>
		<tr>
			<td width="39">爱好:</td>
			<td width="86"><div id="habit"></div></td>
			<td width="79">&nbsp;</td>
		</tr>
	</table>
</body>
</body>

</html>
