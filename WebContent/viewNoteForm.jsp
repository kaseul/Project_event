<%@page import="mirim.hs.kr.NoteBean"%>
<%@page import="java.util.List"%>
<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	LogonDBBean db = LogonDBBean.getInstance();
	List<NoteBean> notes = null;
	String id = (String)session.getAttribute("id");
	
	if(id != null) {
		notes = db.selectNotesWithId(id);
	}
	
	request.setAttribute("notes", notes);
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
<div class="container">
	<div class="row">
		<c:forEach items="${notes}" var="note">
			<div class="col-4" style="margin-top: 30px;">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">${note.title}</h4>
						<p class="card-text" style="text-align: right;"><f:formatDate value="${note.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
						<button class="btn btn-dark" onclick="location.href='viewNoteDetail.jsp?nno=${note.nno}'">내용 보기</button>
				    </div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
</body>
</html>