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

<title>网上聊天室注册用户</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	//验证用户名是否可用
	function checkusername() {
		var username = document.getElementById("username");
		if (username.value != "") {
			var xmlhttp;
			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp = new XMLHttpRequest();
			} else {// code for IE6, IE5
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.open("GET", "Testservlet.servlet?username="
					+ username.value, true);
			xmlhttp.send();
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var res;
					if (xmlhttp.responseText == "true") {
						res = "可以使用";
					} else {
						res = "用户名已被注册！";
					}
					document.getElementById("d_username").innerHTML = res;
				}
			};
		}
	}

	//验证两次密码相同
	function checkpas() {
		var pas = document.getElementById("password");
		var repas = document.getElementById("repassword");
		if (pas.value != "" && repas.value != "") {
			if (pas.value != repas.value) {
				document.getElementById("d_password").innerHTML = "两次密码不一致";
			} else {
				document.getElementById("d_password").innerHTML = "";
			}
		}
	}

	function checkContent() {
		if (document.getElementById("username").value != ""
				&& document.getElementById("password").value != ""
				&& document.getElementById("d_password").innerHTML == ""
				&& document.getElementById("city") != ""
				&& document.getElementById("e_mail") != "") {

			document.getElementById("submit").disabled = false;
		} else {
			document.getElementById("submit").disabled = true;
		}
	}
</script>

</head>

<body>
	<form action="addUserAction" method="post">
		<table>
			<tr>
				<td>昵称</td>
				<td><input id="username" onblur="checkusername()" type="text"
					name="user.username"></td>
				<td><div id="d_username"></div></td>
			</tr>
			<tr>
				<td>密 码</td>
				<td><input id="password" onblur="checkpas()" type="password"
					name="user.password"></td>
				<td></td>
			</tr>
			<tr>
				<td>确认密码</td>
				<td><input id="repassword" onblur="checkpas()" type="password"
					name="repassword"></td>
				<td><div id="d_password"></div></td>
			</tr>
			<tr>
				<td>性别</td>
				<td><input checked="checked" type="radio" id="sex" value="man"
					name="user.sex">男 <input id="sex" value="woman"
					name="user.sex" type="radio">女</td>
				<td></td>
			</tr>
			<tr>
				<td>城市</td>
				<td><input onchange="checkContent()" id="city" type="text"
					name="user.city"></td>
				<td></td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td><input onchange="checkContent()" onblur="checkContent()"
					id="e_mail" type="text" name="user.e_mail"></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input id="submit"
					disabled="disabled" type="submit" value="提交">
					&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"></td>
			</tr>
		</table>
	</form>
</body>
</html>
