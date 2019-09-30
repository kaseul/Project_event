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
	function buyPoint(pno, point) {
		if(confirm('이 옵션을 포인트로 구매하시겠습니까?')) {
			document.getElementById('pno').value = pno;
			document.getElementById('point').value = point;
			document.getElementById('optionForm').submit();
		}
	}
	function buy(pno, ptype, pname, point) {
		if(confirm('이 옵션을 구매하시겠습니까?')) {
			//window.open("buyCreditForm.jsp?pno=" + pno + "&ptype=" + ptype + "&pname=" + pname + "&point=" + point, "결제", "width=600, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes");  
		}
	}
</script>
</head>
<body>
<h3 style="text-align: center; margin-top: 50px;">노트 Editor 옵션</h3>
<div class="container">
	<hr>
	<div class="row">
		<c:forEach items="${products}" var="product">
			<div class="col-4" style="margin-top: 30px;">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">${product.ptype} - ${product.pname}</h4>
						<p class="card-text">
						<a href="#option${product.pno}" class="btn btn-light btn-block" data-toggle="collapse">예시 보기</a>
						<div id="option${product.pno}" class="collapse" style="padding-bottom: 10px;">
							<div contenteditable="true">글자를 드래그하고 버튼을 눌러보세요!</div>
							<button class="btn btn-primary btn-block" onclick="document.execCommand('${product.ptype}', 'fasle', '${product.pvalue}');">적용</button>
						</div>
						<c:choose>
							<c:when test="${id != 'admin'}">
								<button class="btn btn-dark col-5" onclick="buyPoint('${product.pno}', '${product.point}')"><i class="fas fa-star"></i>&nbsp;${product.point}</button>
								<button class="btn btn-dark col-5" style="float: right;" onclick="buy('${product.pno}', '${product.point}')"><i class="fas fa-credit-card"></i>&nbsp;${product.point}</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-dark btn-block" onclick="location.href='updateOption.jsp?pno=${product.pno}'">옵션 수정하기</button>
							</c:otherwise>
						</c:choose>
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