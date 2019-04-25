<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String admin = (String)session.getAttribute("admin");
String functions;

boolean login = false;
if(admin!=null&&admin.equals("true")){
	login = true;
	}
if(login){
	functions =
	"<a href='Insert.jsp'>添加</a>&nbsp&nbsp"
	+"<a href='Update.jsp'>修改</a>&nbsp&nbsp"
	+"<a href='Delete.jsp'>删除</a>";

}else{
		functions = "<p align='right'>使用更多功能，请先<a href='Login.jsp'>登录</a></p>";
}

	String url = "jdbc:mysql://localhost/student?serverTimezone=Asia/Shanghai";
	String user = "user1";
	String password = "123";
	String str = "";//存储标签和信息数据的字符串
	Connection conn = null;
	Statement s = null;
	ResultSet rs = null;//查询信息的结果
	Statement sCount = null;
	ResultSet rCount = null;//统计信息数量的结果
	int pageSize = 5;//每页显示五条信息
	int totalPage = 1;//总页数
	int count;//信息总数
	int start;//当前页第一条信息的前一条在数据库中的位置
	String strPage = request.getParameter("myPage");//接收到的请求页数
	String orderWay;//排序方式

	int myPage;//当前页数
	if (strPage == null || strPage.trim().equals("")) {
		myPage = 1;
	} else {
		try {
			myPage = Integer.parseInt(strPage.trim());
		} catch (NumberFormatException e) {
			myPage = 1;
		}
	}

	String order = request.getParameter("order");//接收到的排序方式
	if (order == null) {
		orderWay = "id asc";
	} else if (order.equals("idDesc"))
			orderWay = "id desc";
		else if (order.equals("hAsc"))
			orderWay = "height asc";
		else if (order.equals("hDesc"))
			orderWay = "height desc";
		else if (order.equals("wAsc"))
			orderWay = "weight asc";
		else if (order.equals("wDesc"))
			orderWay = "weight desc";
		else
			orderWay = "id asc";
	

	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, user, password);

		sCount = conn.createStatement();
		rCount = sCount.executeQuery("select count(*) from stu");
		rCount.next();
		count = rCount.getInt(1);
		totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;

		if (myPage <= 0)
			myPage = 1;
		else if (myPage > totalPage)
			myPage = totalPage;

		start = (myPage - 1) * pageSize;

		s = conn.createStatement();
		rs = s.executeQuery("select * from stu order by " + orderWay + " limit " + start + ", " + pageSize);
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
<meta charset="utf-8">
<title>学生信息管理系统</title>
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
		<form action="Show.jsp" name="fOrder">
	<font size="2">排序方式</font>
		<select name="order" onchange="document.fOrder.submit()" > 
			<option value="idAsc" <%=orderWay.equals("id asc")?"selected":"" %>>学号从小到大
			<option value="idDesc" <%=orderWay.equals("id desc")?"selected":"" %>>学号从大到小
			<option value="hAsc" <%=orderWay.equals("height asc")?"selected":"" %>>身高从低到高
			<option value="hDesc" <%=orderWay.equals("height desc")?"selected":"" %>>身高从高到低
			<option value="wAsc" <%=orderWay.equals("weight asc")?"selected":"" %>>体重从轻到重
			<option value="wDesc" <%=orderWay.equals("weight desc")?"selected":"" %>>体重从重到轻
		</select><br>
	</form>
	
	<div>
		<font size="5">学生信息管理系统</font>
		<hr>		
		<table border="1">
			<tr bgcolor="LightSteelBlue">
				<td>学号</td>
				<td>姓名</td>
				<td>性别</td>
				<td>年龄</td>
				<td>身高（cm）</td>
				<td>体重（kg）</td>
			</tr>
			<%=str%>
				<%str="";login=false; %>
		</table>
		<br> <a href="Show.jsp?myPage=1">首页</a> <a
			href="Show.jsp?myPage=<%=myPage - 1%>">上一页</a> 当前第<%=myPage%>页， 共<%=totalPage%>页
		<a href="Show.jsp?myPage=<%=myPage + 1%>">下一页</a> <a
			href="Show.jsp?myPage=<%=totalPage%>">末页</a><br>
		<br>
		
		<form action="Query.jsp" method="post">
			学号<input type="text" name="id"> 姓名<input type="text"
				name="name"> 性别<input type="text" name="sex"><br>
			<br> 年龄<input type="text" name="age"> 身高<input
				type="text" name="height"> 体重<input type="text"
				name="weight"><br> <br> <input type="submit"
				value="查询"> <input type="reset" value="重置">
		</form>
	</div>
	
 <%=functions %>

</body>
</html>