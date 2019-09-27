<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" style="margin-top: 10%;">
		<form action="joinProc.jsp" method="post">
		  <div class="form-group">
		    <label for="id">ID:</label>
		    <input type="text" class="form-control" id="id" name="id" maxlength="8" required>
		  </div>
		  <div class="form-group">
		    <label for="pwd">비밀번호:</label>
		    <input type="password" class="form-control" id="pw" name="pw" maxlength="12" required>
		  </div>
		  <div class="form-group">
		    <label for="name">이름:</label>
		    <input type="text" class="form-control" id="name" name="name" maxlength="4" required>
		  </div>
		  <button type="submit" class="btn btn-dark">회원가입</button>
		</form>
	</div>
</body>
</html>