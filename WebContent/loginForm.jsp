<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" style="margin-top: 10%;">
		<form action="loginProc.jsp" method="post">
		  <div class="form-group">
		    <label for="id">ID:</label>
		    <input type="text" class="form-control" id="id" name="id" maxlength="8" required>
		  </div>
		  <div class="form-group">
		    <label for="pw">비밀번호:</label>
		    <input type="password" class="form-control" id="pw" name="pw" maxlength="12" required>
		  </div>
		  <button type="submit" class="btn btn-dark">로그인</button>
		</form>
	</div>
</body>
</html>