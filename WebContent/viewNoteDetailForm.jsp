<%@page import="mirim.hs.kr.NoteBean"%>
<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	request.setCharacterEncoding("UTF-8");
	int nno = Integer.parseInt(request.getParameter("nno"));
	LogonDBBean db = LogonDBBean.getInstance();
	NoteBean note = db.selectNote(nno);
	
	request.setAttribute("note", note);
	if(note.getSno() != 0) {
		request.setAttribute("schedule", db.selectScheduleWithSno(note.getSno()));
	}
	request.setAttribute("issues", db.selectIssues(nno));
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
			    <c:if test="${!empty schedule}">
			    	<div class="card-text" data-toggle="collapse" data-target="#schedule">관련 일정 : <span style="background-color: rgb(255, 255, 0);">${schedule.title}</span></div>
			    	<div id="schedule" class="collapse">
			    	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일정 기간 : <f:formatDate value="${schedule.startDay}"/> ~ <f:formatDate value="${schedule.endDay}"/> <br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${schedule.content}<br>
						<c:choose>
							<c:when test="${schedule.id == id}">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;팀원 : ${fn:replace(schedule.team, ',', ' / ')} <br>
							</c:when>
							<c:otherwise>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;팀원 : ${schedule.id} / ${fn:replace(schedule.team, ',', ' / ')} <br>
							</c:otherwise>
						</c:choose>
					</div>
			    </c:if>
			    <hr>
			    <div class="card-text">${note.content}</div>
			    <hr>
			    <button class="btn btn-dark" onclick="history.go(-1)">뒤로가기</button>
			    <button class="btn btn-dark" onclick="location.href='updateNote.jsp?nno=${note.nno}'">수정</button>
			    <button class="btn btn-light" onclick="copy('http://localhost:8088/Project_event/viewNoteDetail.jsp?nno=${note.nno}')" data-toggle="popover" data-trigger="focus" data-content="Copied!"><i class="fas fa-link"></i>링크</button>
			    <button class="btn btn-light" onclick="location.href='downloadNoteHWP.jsp?nno=${note.nno}'"><i class="fas fa-file-download"></i>&nbsp;.hwp</button>
			    <button class="btn btn-light" onclick="location.href='downloadNoteWord.jsp?nno=${note.nno}'"><i class="fas fa-file-download"></i>&nbsp;.doc</button>
  			</div>
		</div>
		<div class="card" style="margin: 50px 0px;">
			<div class="card-header" style="margin-bottom: 20px;"><i class="fas fa-comment"></i>&nbsp;Issues</div>
			<c:forEach items="${issues}" var="issue">
				<div class="card-body" style="padding-bottom: 0px; padding-top: 0px;">
					<h5 class="card-title">${issue.id}<span style="float: right; color: #aaa; font-weight: normal; font-size: 14px"><f:formatDate value="${issue.regDay}" pattern="yyyy-MM-dd HH:mm:ss"/></span></h5>
    				<p class="card-text">${issue.content}</p>
    				<hr>
				</div>
			</c:forEach>
			<div class="card-body">
				<form action="insertIssuesProc.jsp" method="post">
					<input type="hidden" name="nno" value="${note.nno}">
					<c:choose>
						<c:when test="${empty id}">
							<div class="form-inline">
								이름 : <input type="text" class="form-control" name="id" max="10" required>	
							</div>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="id" value="${id}">
						</c:otherwise>
					</c:choose>
					<div class="form-inline">
						<textarea class="form-control col-10" id="content" name="content" maxlength="100" placeholder="이슈를 입력해주세요" style="resize: none;" required></textarea>
						<button type="submit" class="btn btn-dark col-2" style="height: 50px;">입력</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>