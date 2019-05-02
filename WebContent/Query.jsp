<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="InfoCheck.jsp" %>
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
String name = checkName(strName);
String sex = checkSex(strSex);
int age = checkInt(strAge);
int height = checkInt(strHeight);
int weight = checkInt(strWeight);

	String url = "jdbc:mysql://localhost/student?serverTimezone=Asia/Shanghai";
	String user = "user1";
	String password = "123";
	String str = "";//存储标签和信息数据的字符串
	Connection conn = null;
	Statement s = null;
	ResultSet rs = null;//查询信息的结果
	Statement sCount = null;
	ResultSet rCount = null;//统计信息数量的结果
	int count = 0;//信息总数
	String where = "where";

	if (id >0) {
		if (!where.equals("where"))
			where += " and";
		where += " id = " + id;
	}
	if (name != null) {
		if (!where.equals("where"))
			where += " and";
		where += " name like '%" + name+"%'";
	}
	if (sex != null) {
		if (!where.equals("where"))
			where += " and";
		where += " sex='" + sex+"'";
	}
	if (age >0) {
		if (!where.equals("where"))
			where += " and";
		where += " age=" + age;
	}
	if (height >0) {
		if (!where.equals("where"))
			where += " and";
		where += " height=" + height;
	}
	if (weight >0) {
		if (!where.equals("where"))
			where += " and";
		where += " weight=" + weight;
	}

	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, user, password);

		sCount = conn.createStatement();
		rCount = sCount.executeQuery("select count(*) from stu " + where);
		rCount.next();
		count = rCount.getInt(1);

		s = conn.createStatement();
		rs = s.executeQuery("select * from stu " + where);
		while (rs.next()) {//将查询结果放在一起
			str = str + "<tr class='info'><td>" + rs.getInt("id") + "</td><td>" + rs.getString("name")
					+ "</td><td>" + rs.getString("sex") + "</td><td>" + rs.getString("age") + "</td><td>"
					+ rs.getInt("height") + "</td><td>" + rs.getInt("weight") + "</td></tr>";
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
		if (rs != null) {
			rs.close();
			rs = null;
		}
		if (sCount != null) {
			sCount.close();
			sCount = null;
		}
		if (rCount != null) {
			rCount.close();
			rCount = null;
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查询结果</title>
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
.info:hover {
	background-color: gray;
	color: white;
}
</style>
</head>
<body>
<a href="Show.jsp">返回</a>
	<div>
<font size="5">查询结果</font>
		<hr>
		<table border="1">
			<tr bgcolor="LightSteelBlue">
				<td>编号</td>
				<td>姓名</td>
				<td>性别</td>
				<td>年龄</td>
				<td>身高（cm）</td>
				<td>体重（kg）</td>
			</tr>
			<%=str%>	
		</table><br>
		<font>共<%=count%>条</font>
	</div>
	<%
		str = "";
	%>
</body>
</html>