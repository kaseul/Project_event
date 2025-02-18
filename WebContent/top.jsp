<%@page import="mirim.hs.kr.UserBean"%>
<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	LogonDBBean db = LogonDBBean.getInstance();
	String id = (String) session.getAttribute("id");
	UserBean user = null;
	
	if(id != null) {
		user = db.getUser(id);
	}
	request.setAttribute("user", user);
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
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
	<a class="navbar-brand" href="index.jsp">Note</a>
	<ul class="navbar-nav">
	<c:choose>
		<c:when test="${empty id}">
			<li class="nav-item">
		      <a class="nav-link" href="join.jsp">회원가입</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="login.jsp">로그인</a>
		    </li>
		</c:when>
		<c:when test="${id == 'admin'}">
			<li class="nav-item">
		      <a class="nav-link" href="viewUsers.jsp">회원 목록</a>
		    </li>
			<li class="nav-item">
		      <a class="nav-link" href="viewBuy.jsp">옵션 구매 목록</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="buyOption.jsp">옵션 목록</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="insertOption.jsp">옵션 등록</a>
		    </li>
  		</c:when>
  		<c:otherwise>
  			<li class="nav-item">
		      <a class="nav-link" href="viewDashboard.jsp">대시보드</a>
		    </li>
  			<li class="nav-item">
		      <a class="nav-link" href="viewCalendar.jsp">일정 보기</a>
		    </li>
  			<li class="nav-item">
		      <a class="nav-link" href="viewNote.jsp">노트 보기</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="insertNote.jsp">노트 작성</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="buyOption.jsp">옵션 구매</a>
		    </li>
  		</c:otherwise>
	</c:choose>
	</ul>
	<c:if test="${!empty id}">
		<!-- 오른쪽 nav-item -->
		<ul class="navbar-nav ml-auto">
	    	<li class="nav-item">
				<span class="navbar-text">
					${id}님
					<c:if test="${id != 'admin'}">
						<span class="badge badge-light">
							<i class="fas fa-star"></i>${user.point}
						</span>
					</c:if>
				</span>
			</li>
			<li class="nav-item">
		      <a class="nav-link" href="logout.jsp">로그아웃</a>
		    </li>
	    </ul>
	</c:if>
</nav>
</body>
</html>