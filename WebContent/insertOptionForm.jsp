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
<script src="https://use.fontawesome.com/releases/v5.10.1/js/all.js"></script>
</head>
<body>
<div class="container" style="padding: 50px 0px;">
	<form action="insertOptionProc.jsp" method="post">
		<div class="form-group">
		    <label for="ptype">옵션 종류 :</label>
		    <input type="text" class="form-control" id="ptype" name="ptype" maxlength="30" required>
		</div>
		<div class="form-group">
		    <label for="pname">옵션 표시 이름 :</label>
		    <input type="text" class="form-control" id="pname" name="pname" maxlength="30" required>
		</div>
		<div class="form-group">
		    <label for="pvalue">옵션 값 :</label>
		    <input type="text" class="form-control" id="pvalue" name="pvalue" maxlength="30" required>
		</div>
		<div class="form-group">
		    <label for="point">포인트 :</label>
		    <input type="number" class="form-control" id="point" name="point" min="5" max="50" required>
		</div>
		<center>
			<button type="submit" class="btn btn-dark">옵션 등록</button>
		</center>
	</form>
</div>
</body>
</html>