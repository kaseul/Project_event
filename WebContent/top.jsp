<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<a class="navbar-brand" href="index.jsp">Logo</a>
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
		      <a class="nav-link" href="insertMenu.jsp">급식 등록</a>
		    </li>
  			<li class="nav-item">
		      <a class="nav-link" href="graph.jsp">메뉴 통계</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="board.jsp">급식 의견</a>
		    </li>
  		</c:when>
  		<c:otherwise>
		    <li class="nav-item">
		      <a class="nav-link" href="insertNote.jsp">노트 작성</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="likes.jsp">즐겨찾기</a>
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