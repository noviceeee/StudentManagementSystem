<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="InfoCheck.jsp"%>
<%@ include file="AdminCheck.jsp"%>
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

	boolean submit = (strName != null || strSex != null || strAge != null || strHeight != null
			|| strWeight != null);
	boolean wrong = (name == null ||sex==null|| !(sex.equals("男") || sex.equals("女")) || age < 0 || height < 0
			|| weight < 0);
	if (submit && wrong) {
		out.println("<font color='red'>请正确完整地填写内容！</font>");
		return;
	}

	String url = "jdbc:mysql://localhost/student?serverTimezone=Asia/Shanghai";
	String user = "user1";
	String password = "123";
	Connection conn = null;
	Statement s = null;
	ResultSet rs = null;//查询信息的结果
	PreparedStatement ps = null;

	String set = "set";//存储要修改的信息
	boolean update = false;
	String strUpdate = request.getParameter("update");
	if (strUpdate != null && strUpdate.equals("true"))
		update = true;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, user, password);

		if (update) {
			conn.setAutoCommit(false);
			ps = conn.prepareStatement("update stu set name=?,sex=?,age=?,height=?,weight=? where id=" + id);

			ps.setString(1, name);
			ps.setString(2, sex);
			ps.setInt(3, age);
			ps.setInt(4, height);
			ps.setInt(5, weight);
			ps.executeUpdate();
			conn.commit();
			conn.setAutoCommit(true);

			update = false;
			response.sendRedirect("Show.jsp");

		} else {
			s = conn.createStatement();
			rs = s.executeQuery("select * from stu where id=" + id);
			rs.next();
			name = rs.getString("name");
			sex = rs.getString("sex");
			age = rs.getInt("age");
			height = rs.getInt("height");
			weight = rs.getInt("weight");
		}

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
		if (ps != null) {
			ps.close();
			ps = null;
		}
		if (rs != null) {
			rs.close();
			rs = null;
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改信息</title>
<style type="text/css">
div {
	text-align: center;
}
</style>
</head>
<body>
	<a href="Show.jsp">返回</a>
	<div>
		<font size="5">修改信息</font>
		<hr>
		<form action="Update.jsp">
			学号<input type="text" name="id" value=<%=id%> readonly> 姓名<input
				type="text" name="name" value=<%=name%>> 性别<input
				type="text" name="sex" value=<%=sex%>><br> <br> 年龄<input
				type="text" name="age" value=<%=age%>> 身高<input type="text"
				name="height" value=<%=height%>> 体重<input type="text"
				name="weight" value=<%=weight%>><br> <br> <input
				type="hidden" name="update" value="true"> <input
				type="submit" value="提交"> <input type="reset" value="重置">
		</form>
	</div>
</body>
</html>