<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!int checkInt(String str) {
		String regex = "[1-9][0-9]*";//正则表达式，数字，不能为零
		if (str != null) {
			str = str.trim();
			if (str.matches(regex))
				return Integer.parseInt(str);
			;
		}
		return -1;
	}

	String checkName(String str) {
		String regex = "[\u4e00-\u9fa5]+";//匹配中文字符的正则表达式，一次或多次
		if (str == null)
			return "";
		str = str.trim();
		if (str.matches(regex))
			return str;
		else
			return "";
	}
	
	String checkSex(String sex){
		if(sex!=null && (sex.equals("男")||sex.equals("女")))
		return sex;
		return "";
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