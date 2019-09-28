<%@page import="mirim.hs.kr.NoteBean"%>
<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	int nno = Integer.parseInt(request.getParameter("nno"));
	LogonDBBean db = LogonDBBean.getInstance();
	NoteBean note = db.selectNote(nno);
	
	request.setAttribute("note", note);
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
function copy(text) {
    var t = document.createElement("textarea");
    document.body.appendChild(t);
    t.value = text;
    t.select();
    document.execCommand('copy');
    document.body.removeChild(t);
}
$(document).ready(function(){
  $('[data-toggle="popover"]').popover();   
});
</script>
</head>
<body>
	<div class="container" style="padding: 50px 0px;">
		<div class="card">
		    <div class="card-body">
			    <h4 class="card-title">${note.title}</h4>
			    <p class="card-text" style="text-align: right; color: #aaa;"><f:formatDate value="${note.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
			    <hr>
			    <div class="card-text">${note.content}</div>
			    <hr>
			    <button class="btn btn-dark" onclick="history.go(-1)">뒤로가기</button>
			    <button class="btn btn-dark" onclick="location.href='updateNote.jsp?nno=${note.nno}'">수정</button>
			    <button class="btn btn-light" onclick="copy('http://localhost:8088/Project_event/viewNoteDetail.jsp?nno=${note.nno}')" data-toggle="popover" data-trigger="focus" data-content="Copied!"><i class="fas fa-link"></i>링크</button>
			    <button class="btn btn-dark" onclick="location.href='downloadNoteHWP.jsp?nno=${note.nno}'">.hwp</button>
			    <button class="btn btn-dark" onclick="location.href='downloadNoteWord.jsp?nno=${note.nno}'">.doc</button>
  			</div>
		</div>
	</div>
</body>
</html>