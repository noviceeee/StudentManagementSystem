<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="InfoCheck.jsp" %>
<%@ include file="AdminCheck.jsp" %>

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String strId = request.getParameter("id");
String strName = request.getParameter("name");
String strSex = request.getParameter("sex");
String strAge = request.getParameter("age");
String strHeight = request.getParameter("height");
String strWeight = request.getParameter("weight");
int id = checkInt(strId);
String name = checkStr(strName);
String sex = checkStr(strSex);
int age = checkInt(strAge);
int height = checkInt(strHeight);
int weight = checkInt(strWeight);

if(strName == null||strSex==null||strAge==null||strHeight==null||strWeight==null ){}
else if(name==null||!(sex.equals("男")||sex.equals("女"))||age<0||height<0||weight<0){
	out.println("<font color='red'>请正确完整地填写内容！</font>");
	return;
}

	String url = "jdbc:mysql://localhost/student?serverTimezone=Asia/Shanghai";
	String user = "user1";
	String password = "123";
	Connection conn = null;
	PreparedStatement ps = null;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, user, password);

		conn.setAutoCommit(false);
		ps = conn.prepareStatement("insert into stu values(null,?,?,?,?,?)");

		ps.setString(1, name);
		ps.setString(2, sex);
		ps.setInt(3, age);
		ps.setInt(4, height);
		ps.setInt(5, weight);
		ps.executeUpdate();
		conn.commit();
		conn.setAutoCommit(true);
		
		response.sendRedirect("Show.jsp");
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (conn != null) {
			conn.close();
			conn = null;
		}
		if (ps != null) {
			ps.close();
			ps = null;
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加信息</title>
<style type="text/css">
table {
	border-collapse: collapse;
	margin: auto;
}

td {
	width: 100px;
	text-align: center;
}

div {
	text-align: center;
}
</style>
</head>
<body>
<a href="Show.jsp">返回</a>
<div>
		<font size="5">添加信息</font>
		<hr>
		<form action="">
			学号<input type="text" value="默认排序，填写无效"> 姓名<input type="text"
				name="name"> 性别<input type="text" name="sex"><br>
			<br> 年龄<input type="text" name="age"> 身高<input
				type="text" name="height"> 体重<input type="text"
				name="weight"><br> <br> <input type="submit"
				value="提交"> <input type="reset" value="重置">
		</form>
	</div>
</body>
</html>