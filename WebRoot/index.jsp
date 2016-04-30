<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>网上聊天室</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	window.onload = function() {
		if ("${username}" + "" != "") {
			document.getElementById("adduser").style.display = "none"; //隐藏
			document.getElementById("login").style.display = "none"; //隐藏
			document.getElementById("showuser").style.display = "block"; //显示
			document.getElementById("showuser").innerHTML = "<a href='"+"User/userinfo.jsp'"+">"
					+ "${username}"
					+ "</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='logoutaction'>注销</a>";
		}
		addUserToList();
		window.setInterval("addUserToList()", 15 * 1000);
	};
	function sendMessage() {
		if ("${username}" != "") {

			var message = document.getElementById("message");
			if (message.value + "" != "") {
				var xmlhttp;

				if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
					xmlhttp = new XMLHttpRequest();
				} else {// code for IE6, IE5
					xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
				xmlhttp.open("POST", "messageAction", true);
				//post必加
				xmlhttp.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
				xmlhttp.send("message=" + message.value + "&username="
						+ "${username}");

			}
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					//清空输入框
					message.value = "";
					//刷新聊天消息框
					/* var txt = xmlhttp.responseText;
					document.getElementById("showMessage").value += txt; */
				}
			};
		}
	}

	/* function setButton() {
		if (document.getElementById("message").value != ""
				&& "${username}" != "") {
			document.getElementById("send").disabled = false;
		} else {
			document.getElementById("send").disabled = true;
		}
	} */

	function addUserToList() {
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.open("get", "getUserList", true);
		xmlhttp.send();

		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var txt = xmlhttp.responseText;
				var strs = new Array();
				strs = txt.split(",");
				var show = "在线会员列表<br />"
						+ "<hr size=" + 3 +" noshade=" + "noshade" + "color=" + "#000000" +"/>";

				for (var i = 0; i < strs.length; i++) {
					var show = show + strs[i];
				}
				document.getElementById("right").innerHTML = show;
			}
		};
	}
</script>
</head>

<body>
	<%
		if (!(request.getAttribute("username") == null)) {
			HttpSession httpsession = request.getSession();
			if (httpsession.getAttribute("username") == null) {
				httpsession.setAttribute("username",
						request.getAttribute("username"));
			}
		}
	%>
	<div id="top" style="background-color:#e8ffe8;width:100%;height: 10%">
		<span style="font-size:20pt;">网上聊天室</span> <br />
		<div style="float:right;">
			<div id="adduser" style="float:left;weight:100px">
				<a href="User/AddUser.jsp">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div id="showuser" style="float:left;weight:200px;display:none;"></div>
			<div id="login" style="float:left;weight:100px">
				<a href="User/login.jsp">登录</a>
			</div>
		</div>
	</div>
	<div id="mid" style="background-color:#f0dad2;width:100%;height:80%">
		<div id="left" style="width:70%;float:left;height:100%;">
			<div id="content" style="width:100%;height:80%;">
				<!--  
				<textarea readonly id="showMessage" style="width:100%;height:100%;"></textarea> 
				-->
				<iframe name="daohang_frame" src="Message/showMessage.jsp"
					frameborder="0" scrolling="no" width="100%" height="100%"></iframe>
			</div>
			<div id="input" style="width:100%;height:20%;">
				<textarea id="message" style="width:90%;height:100%;float:left;"></textarea>
				<button id="send" onclick="sendMessage()"
					style="width:10%;height:100%;float:right;">发送</button>
			</div>
		</div>
		<div id="right"
			style="width:30%;float:left;height:100%;text-align:center;"></div>
	</div>
	<div id="below" style="background-color:gray;width:100%;height:10%">
		<span>欢迎来到聊天室</span>
	</div>
</body>
</html>
