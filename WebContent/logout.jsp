<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	LogonDBBean db = LogonDBBean.getInstance();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
<%
String id = (String)session.getAttribute("id");

if(id != null) {
	session.removeAttribute("id");
%>
	alert("로그아웃 되었습니다.");
	location.href = "index.jsp";
<%
}
%>
</script>
</head>
<body>

</body>
</html>