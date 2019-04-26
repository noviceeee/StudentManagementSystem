<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!

int checkInt(String str) {
		int num = 0;
		if (str != null) {
			str = str.trim();
			try {
				num = Integer.parseInt(str);
				return num;
			} catch (NumberFormatException e) {
				e.printStackTrace();
				return -1;
			}
		}
		return -1;
	}

	String checkStr(String str) {
		if (str == null)
			return null;
		str = str.trim();
		if (str.equals(""))
			return null;
		else
			return str;
	}
	%>
<%

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