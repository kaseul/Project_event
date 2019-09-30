<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	LogonDBBean db = LogonDBBean.getInstance();
	int pno = Integer.parseInt(request.getParameter("pno"));
	request.setAttribute("product", db.getProduct(pno));
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
<h3 style="text-align: center; margin: 50px 0px;">옵션 수정</h3>
<div class="container">
<hr>
	<form action="updateOptionProc.jsp" method="post">
		<input type="hidden" name="pno" value="${product.pno}">
		<div class="form-group">
		    <label for="ptype">옵션 종류 :</label>
		    <select class="form-control" id="ptype" name="ptype" required>
		    	<c:choose>
		    		<c:when test="${product.ptype == 'hiliteColor'}">
		    			<option value="hiliteColor" selected>hiliteColor - 글자 배경색</option>
		    			<option value="foreColor">foreColor - 글자색</option>
		    		</c:when>
		    		<c:otherwise>
		    			<option value="hiliteColor">hiliteColor - 글자 배경색</option>
		    			<option value="foreColor" selected>foreColor - 글자색</option>
		    		</c:otherwise>
		    	</c:choose>
		    </select>
		</div>
		<div class="form-group">
		    <label for="pname">옵션 표시 이름 :</label>
		    <input type="text" class="form-control" id="pname" name="pname" value="${product.pname}" maxlength="30" required>
		</div>
		<div class="form-group">
		    <label for="pvalue">옵션 값 :</label>
		    <input type="text" class="form-control" id="pvalue" name="pvalue" value="${product.pvalue}" maxlength="30" required>
		</div>
		<div class="form-group">
		    <label for="point">포인트 :</label>
		    <input type="number" class="form-control" id="point" name="point" value="${product.point}" min="5" max="50" required>
		</div>
		<center>
			<button type="submit" class="btn btn-dark">옵션 수정</button>
		</center>
	</form>
</div>
</body>
</html>