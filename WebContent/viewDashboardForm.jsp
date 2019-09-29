<%@page import="mirim.hs.kr.UserBean"%>
<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	LogonDBBean db = LogonDBBean.getInstance();
	String id = (String) session.getAttribute("id");
	if(id != null) {
		Timestamp login = db.getUser(id).getLogin();
		Timestamp now = new Timestamp(System.currentTimeMillis());
		
		request.setAttribute("schedules", db.selectScheduleForDashBoard(id, login, now));
		request.setAttribute("notes", db.selectNoteForDashBoard(id, login, now));
		request.setAttribute("issues", db.selectIssuesForDashBoard(id, login, now));
		db.updateLogin(id, now);
		System.out.println(login + " " + now);
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
$(document).ready(function(){
  $('.toast').toast('show');
});
</script>
</head>
<body>
	<div class="container" style="padding: 50px 0px 30px;">
		<div class="row">
			<div class="col-4">
				<div class="card" style="height: 100%;">
					<div class="card-body">
						<h5 class="card-title">일정</h5>
						<c:forEach items="${schedules}" var="schedule">
							<div class="toast" data-autohide="false">
								<div class="toast-header">
								    <strong class="mr-auto text-primary">${schedule.title}</strong>
								    <small class="text-muted"><f:formatDate value="${schedule.startDay}" pattern="yyyy-MM-dd HH:mm:ss"/> ~ <f:formatDate value="${schedule.endDay}" pattern="yyyy-MM-dd HH:mm:ss"/> </small>
								    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
								</div>
								<div class="toast-body">
								    <c:choose>
								    	<c:when test="${schedule.regDate > login}">
								    		새로운 일정이 등록되었습니다!
								    	</c:when>
								    	<c:otherwise>
								    		일정이 수정되었습니다!
								    	</c:otherwise>
								    </c:choose>
								    <br>
								    <button class="btn btn-light btn-block" onclick="location.href='viewCalendar.jsp'">일정 보기</button>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card" style="height: 100%;">
					<div class="card-body">
						<h5 class="card-title">노트</h5>
						<c:forEach items="${notes}" var="note">
							<div class="toast" data-autohide="false">
								<div class="toast-header">
								    <strong class="mr-auto text-primary">${note.title}</strong>
								    <small class="text-muted"><f:formatDate value="${note.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </small>
								    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
								</div>
								<div class="toast-body">
								    <c:choose>
								    	<c:when test="${note.regDate > login}">
								    		새로운 노트가 등록되었습니다!
								    	</c:when>
								    	<c:otherwise>
								    		노트가 수정되었습니다!
								    	</c:otherwise>
								    </c:choose>
								    <br>
								    <button class="btn btn-light btn-block" onclick="location.href='viewNoteDetail.jsp?nno=${note.nno}'">노트 보기</button>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card" style="height: 100%;">
					<div class="card-body">
						<h5 class="card-title">이슈</h5>
						<c:forEach items="${issues}" var="issue">
							<c:if test="${issue.id != id}">
								<div class="toast" data-autohide="false">
									<div class="toast-header">
									    <strong class="mr-auto text-primary">${issue.id}</strong>
									    <small class="text-muted"><f:formatDate value="${issue.regDay}" pattern="yyyy-MM-dd HH:mm:ss"/> </small>
									    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
									</div>
									<div class="toast-body">
									    새로운 이슈가 등록되었습니다!
									    <br>
									    <button class="btn btn-light btn-block" onclick="location.href='viewNoteDetail.jsp?nno=${issue.nno}'">이슈 보기</button>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>