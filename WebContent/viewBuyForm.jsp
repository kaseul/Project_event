<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	LogonDBBean db = LogonDBBean.getInstance();
	
	request.setAttribute("buys", db.selectBuyOptions());
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
	<h3 style="text-align: center; margin: 50px 0px;">구매 목록</h3>
	<div class="container">
		<hr>
		<table class="table table-striped">
			<tr>
				<th>회원</th>
				<th>옵션 종류</th>
				<th>옵션 이름</th>
				<th>가격</th>
			</tr>
			<c:forEach items="${buys}" var="buy">
				<tr>
					<td>${buy.id}</td>
					<td>${buy.ptype}</td>
					<td>${buy.pname}</td>
					<td>${buy.point}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>