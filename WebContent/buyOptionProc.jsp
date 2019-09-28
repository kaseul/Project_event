<%@page import="mirim.hs.kr.UserBean"%>
<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	LogonDBBean db = LogonDBBean.getInstance();
	String id = (String) session.getAttribute("id");
	UserBean user = db.getUser(id);
	int upoint = user.getPoint();
	int pno = Integer.parseInt(request.getParameter("pno"));
	int point = Integer.parseInt(request.getParameter("point"));
	
	System.out.println("buyOption : " + upoint + " " + point);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Note</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.10.1/js/all.js"></script>
<script>
<%
	if(upoint < point) { %>
		alert('포인트가 부족합니다.');
		history.go(-1);
<%	}
	else {
		db.insertOption(id, pno, point);
		%>
			alert('옵션을 구매하였습니다!');
			location.href="buyOption.jsp";	
		<%
	}
%>
</script>
</head>
<body>
</body>
</html>