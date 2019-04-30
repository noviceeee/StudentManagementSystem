<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");

	String user = request.getParameter("user");
	String password = request.getParameter("password");
	if (user == null || password == null) {
	} else if (user.equals("admin") && password.equals("admin")) {
		session.setAttribute("admin", "true");
		response.sendRedirect("Show.jsp");
	} else
		out.println("<font color='red'>用户名或密码错误，请重新输入！</font>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录页面</title>
</head>
<body>
	<form action="Login.jsp" method="post">
		用户名<input type="text" name="user">
		密码<input type="password" name="password"><input
			type="submit" value="登录"> <input type="reset" value="重置">
	</form>
	<br>
	<a href="Show.jsp">返回</a>
</body>
</html>