<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String id = (String)session.getAttribute("id");
	LogonDBBean db = LogonDBBean.getInstance();
	
	if(id != null) {
		request.setAttribute("products", db.selectNoProductWithId(id));
	}
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
	function buy(pno, point) {
		if(confirm('이 옵션을 구매하시겠습니까?')) {
			document.getElementById('pno').value = pno;
			document.getElementById('point').value = point;
			document.getElementById('optionForm').submit();
		}
	}
</script>
</head>
<body>
<div class="container">
	<div class="row">
		<c:forEach items="${products}" var="product">
			<div class="col-4" style="margin-top: 30px;">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">${product.ptype} - ${product.pname}</h4>
						<p class="card-text" style="text-align: right"><i class="fas fa-star"></i>&nbsp;${product.point}</p>
						<button class="btn btn-dark" onclick="buy('${product.pno}', '${product.point}')">구매하기</button>
				    </div>
				</div>
			</div>
		</c:forEach>
	</div>
	<form id="optionForm" action="buyOptionProc.jsp" method="post" style="visibility: hidden;">
		<input type="hidden" id="pno" name="pno">
		<input type="hidden" id="point" name="point">
	</form>
</div>
</body>
</html>