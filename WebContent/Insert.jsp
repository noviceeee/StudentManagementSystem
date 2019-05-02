<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="InfoCheck.jsp" %>
<%@ include file="AdminCheck.jsp" %>

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String strName = request.getParameter("name");
String strSex = request.getParameter("sex");
String strAge = request.getParameter("age");
String strHeight = request.getParameter("height");
String strWeight = request.getParameter("weight");
String submit = request.getParameter("submit");

String name = checkName(strName);
String sex = checkSex(strSex);
int age = checkInt(strAge);
int height = checkInt(strHeight);
int weight = checkInt(strWeight);

if(submit != null && submit.equals("true")){
if(name.equals("")){
	out.println("<a href='Insert.jsp'>返回</a>&nbsp&nbsp<font color='red'>名字请填写中文字符！</font>");
	return;
}
if(sex.equals("")){
	out.println("<a href='Insert.jsp'>返回</a>&nbsp&nbsp<font color='red'>性别请填写“男/女”！</font>");
	return;
}
if(age<0){
	out.println("<a href='Insert.jsp'>返回</a>&nbsp&nbsp<font color='red'>年龄请填写正数！</font>");
	return;
}
if(height<0){
	out.println("<a href='Insert.jsp'>返回</a>&nbsp&nbsp<font color='red'>身高请填写正数！</font>");
	return;
}
if(weight<0){
	out.println("<a href='Insert.jsp'>返回</a>&nbsp&nbsp<font color='red'>体重请填写正数！</font>");
	return;
}
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
			编号<input type="text" value="默认排序，填写无效"> 姓名<input type="text"
				name="name"> 性别<input type="text" name="sex"><br>
			<br> 年龄<input type="text" name="age"> 身高<input
				type="text" name="height"> 体重<input type="text"
				name="weight"><br> <br> <input type="submit"
				value="提交"> <input type="reset" value="重置"><input type="hidden"
				name="submit" value="true">
		</form>
	</div>
</body>
</html>