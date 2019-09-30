<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	LogonDBBean db = LogonDBBean.getInstance();
	request.setAttribute("users", db.getUsers((String) session.getAttribute("id")));
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
</head>
<body>
	<h3 style="text-align: center; margin: 50px 0px;">회원 목록</h3>
	<div class="container">
		<hr>
		<table class="table table-striped">
			<tr>
				<th>회원 아이디</th>
				<th>회원 이름</th>
				<th>보유 포인트</th>
				<th>가입일</th>
				<th>마지막 이벤트 획득일</th>
				<th>마지막 로그인 시간</th>
			</tr>
			<c:forEach items="${users}" var="user">
				<tr>
					<td>${user.id}</td>
					<td>${user.name}</td>
					<td>${user.point}</td>
					<td><f:formatDate value="${user.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
					<td><f:formatDate value="${user.eventDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
					<td><f:formatDate value="${user.login}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>