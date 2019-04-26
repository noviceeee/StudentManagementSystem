<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="InfoCheck.jsp"%>
<%@ include file="AdminCheck.jsp"%>
<%@ page import="java.sql.*" %>
<%
	String strId = request.getParameter("id");
	int id = checkInt(strId);
	if (id <= 0)
		return;

	String url = "jdbc:mysql://localhost/student?serverTimezone=Asia/Shanghai";
	String user = "user1";
	String password = "123";
	Connection conn = null;
	Statement s = null;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, user, password);
		s = conn.createStatement();
		s.executeUpdate("delete from stu where id=" + id);

		response.sendRedirect("Show.jsp");

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (conn != null) {
			conn.close();
			conn = null;
		}
		if (s != null) {
			s.close();
			s = null;
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>