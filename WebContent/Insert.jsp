<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%!String checkInt(String str) {
		int num = 0;
		if (str == null)
			return "null";
		str = str.trim();
		if (str.equals(""))
			return "null";
		try {
			num = Integer.parseInt(str);
			if (num <= 0)
				return "null";
			return "" + num;

		} catch (NumberFormatException e) {
			e.printStackTrace();
			return "null";
		}
	}

	String checkStr(String str) {
		if (str == null)
			return "null";
		str = str.trim();
		if (str.equals(""))
			return "null";
		else
			return str;

	}%>
<%
	String strId = request.getParameter("id");
	String strName = request.getParameter("name");
	String strSex = request.getParameter("sex");
	String strAge = request.getParameter("age");
	String strHeight = request.getParameter("height");
	String strWeight = request.getParameter("weight");
	String id = checkInt(strId);
	String name = checkStr(strName);
	String sex = checkStr(strSex);
	String age = checkInt(strAge);
	String height = checkInt(strHeight);
	String weight = checkInt(strWeight);
	
	String url = "jdbc:mysql://localhost/student?serverTimezone=Asia/Shanghai";
	String user = "user1";
	String password = "123";
	String str = "";//存储标签和信息数据的字符串
	Connection conn = null;
	Statement s = null;
	ResultSet rs = null;//查询信息的结果
	Statement sCount = null;
	ResultSet rCount = null;//统计信息数量的结果
	int count;//信息总数
	String where = "where ";
	if(id != null)
		where += "id="+id;
	if(name !=)



	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, user, password);

		sCount = conn.createStatement();
		rCount = sCount.executeQuery("select count(*) from stu");
		rCount.next();
		count = rCount.getInt(1);
		s = conn.createStatement();
		
		
		rs = s.executeQuery("select * from stu");
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
<title>Insert title here</title>
</head>
<body>
<form action="" >
			学号<input type="text" name="id"> 姓名<input type="text"
				name="name"> 性别<input type="text" name="sex"><br>
			<br> 年龄<input type="text" name="age"> 身高<input
				type="text" name="height"> 体重<input type="text"
				name="weight"><br>
			<br> <input type="submit" value="提交"> <input type="reset"
				value="重置">
		</form>
</body>
</html>