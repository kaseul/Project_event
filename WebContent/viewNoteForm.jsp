<%@page import="mirim.hs.kr.NoteBean"%>
<%@page import="java.util.List"%>
<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
	LogonDBBean db = LogonDBBean.getInstance();
	List<NoteBean> notes = null;
	String id = (String)session.getAttribute("id");
	String sSno = request.getParameter("sno");
	
	if(id != null) {
		if(sSno == null) {
			notes = db.selectNotesWithId(id);
			request.setAttribute("schedules", db.selectScheduleWithId(id));
		}
		else {
			notes = db.selectNotesWithSno(Integer.parseInt(sSno));
			request.setAttribute("rSchedule", db.selectScheduleWithSno(Integer.parseInt(sSno)));
		}
	}
	
	request.setAttribute("notes", notes);
	request.setAttribute("sno", sSno);
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
<c:choose>
	<c:when test="${empty sno}">
		<h3 style="text-align: center; margin-top: 50px;">전체 노트</h3>
	</c:when>
	<c:otherwise>
		<h3 style="text-align: center; margin-top: 50px;">'${rSchedule.title}' 관련 노트</h3>
	</c:otherwise>
</c:choose>
<div class="container">
	<hr>
	<div class="row">
		<c:forEach items="${notes}" var="note">
			<div class="col-4" style="margin-top: 30px;">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">${note.title}</h4>
						<p class="card-text" style="text-align: right;"><f:formatDate value="${note.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
						<c:choose>
							<c:when test="${note.sno == 0}">
								<p class="card-text">관련 일정 : 없음</p>
							</c:when>
							<c:otherwise>
								<c:forEach items="${schedules}" var="schedule">
									<c:choose>
										<c:when test="${note.sno == schedule.sno}">
											<p class="card-text" data-toggle="collapse" data-target="#schedule${note.nno}">관련 일정 : <span style="background-color: rgb(255, 255, 0);">${schedule.title}</span></p>
											<div id="schedule${note.nno}" class="collapse">
									    	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일정 기간 : <f:formatDate value="${schedule.startDay}"/> ~ <f:formatDate value="${schedule.endDay}"/> <br>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일정 내용 : ${schedule.content} <br>
												<c:choose>
													<c:when test="${schedule.id == id}">
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;팀원 : ${fn:replace(schedule.team, ',', ' / ')} <br>
													</c:when>
													<c:otherwise>
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;팀원 : ${schedule.id} / ${fn:replace(schedule.team, ',', ' / ')} <br>
													</c:otherwise>
												</c:choose>
											</div>
										</c:when>
									</c:choose>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<button class="btn btn-dark" onclick="location.href='viewNoteDetail.jsp?nno=${note.nno}'">내용 보기</button>
				    </div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
</body>
</html>