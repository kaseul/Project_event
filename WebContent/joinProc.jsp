<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	request.setCharacterEncoding("UTF-8");
	LogonDBBean db = LogonDBBean.getInstance();
%>
<jsp:useBean id="user" class="mirim.hs.kr.UserBean" />
<jsp:setProperty property="*" name="user"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
<%
int check = db.idCheck(user.getId());
if(check == 0) {
	db.insertUser(user);
	%>
	alert("회원 가입이 되었습니다.");
	location.href="login.jsp";
	<%
}
else { %>
alert("중복된 아이디는 사용할 수 없습니다.");
location.href="join.jsp";
<%}%>
</script>
</head>
<body>

</body>
</html>