<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%	
	String admin = (String) session.getAttribute("admin");
	if (admin == null || !admin.equals("true")) {
		out.println("<font color='red'>请先登录！</font>");
		return;
	} %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>