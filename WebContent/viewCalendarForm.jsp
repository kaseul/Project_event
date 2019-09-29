<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	LogonDBBean db = LogonDBBean.getInstance();
	String id = (String) session.getAttribute("id");
	
	request.setAttribute("schedules", db.selectScheduleWithNote(id));
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
<!-- fullCalendar -->
<link href='fullcalendar/core/main.css' rel='stylesheet' />
<link href='fullcalendar/daygrid/main.css' rel='stylesheet' />
<link href='fullcalendar/list/main.css' rel='stylesheet' />
<script src='fullcalendar/core/main.js'></script>
<script src='fullcalendar/daygrid/main.js'></script>
<script src='fullcalendar/list/main.js'></script>
<script src='fullcalendar/core/locales/ko.js'></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');

	  var calendar = new FullCalendar.Calendar(calendarEl, {
		plugins: [ 'dayGrid', 'list' ],
	    header: {
	      right: 'dayGridMonth,listWeek',
	      center: 'title',
	      left: 'prev,next'
	    },
	    eventClick: function(info) {
	      	var eventObj = info.event;

	        var start = eventObj.start;
	        var end = eventObj.end;
	        var team = eventObj.extendedProps.team;
	        
	        
	        start = start.getFullYear() + "-" + (start.getMonth() + 1) + "-" + start.getDate() + " " + start.getHours() + ":" + start.getMinutes() + ":" + start.getSeconds();
	        end = end.getFullYear() + "-" + (end.getMonth() + 1) + "-" + end.getDate() + " " + end.getHours() + ":" + end.getMinutes() + ":" + end.getSeconds();
	        
	        document.getElementById('modalTitle').innerHTML = eventObj.title;
	        document.getElementById('modalBody').innerHTML = "작성자 : " + eventObj.extendedProps.writer + "<hr> + 일정 기간 : " + start + " ~ " + end + "<hr> + 관련 노트 수 : " + eventObj.extendedProps.notes + "";
	        if(eventObj.extendedProps.notes != '0') {
	        	document.getElementById('modalBody').innerHTML += '<button class="btn btn-dark" style="float: right; top: 50%; transform: translate(0%, -20%);" onclick="location.href=\'viewNote.jsp?sno=' + eventObj.extendedProps.sno +'\'">노트 보기</button>';
	        }
	        if(team) {
	        	team = team.replace(/,/g, "</span> / <span style='background-color: rgb(255, 255, 0)'>");
	        	document.getElementById('modalBody').innerHTML += "<hr> + 팀원 : <span style='background-color: rgb(255, 255, 0)'>" + team + "</span>";
	        }
	        document.getElementById('modalBody').innerHTML += "<hr> + 내용 <br>" + eventObj.extendedProps.content;
	        if(eventObj.extendedProps.edit) {
	        	document.getElementById('modalBody').innerHTML += '<p><center><button class="btn btn-dark btn-block" onclick="location.href=\'updateCalendar.jsp?sno=' +eventObj.extendedProps.sno +'\'">일정 수정하기</button>';
	        }
	        document.getElementById('viewCalendarButton').click();
	    },
	    locale: 'ko',
	    events: [
	    	<c:forEach var="schedule" items="${schedules}">
				{   
					<c:choose>
						<c:when test="${id == schedule.id}">
							edit: 1,
						</c:when>
					</c:choose>
					<c:if test="${!empty schedule.team}">
						<c:choose>
							<c:when test="${id == schedule.id}">
								team: '${schedule.team}',
							</c:when>
							<c:otherwise>
								team: '${schedule.id}' + ',' + '${schedule.team}',
							</c:otherwise>
						</c:choose>
						borderColor: '#FF6600',
						backgroundColor: '#FF6600',
					</c:if>
					sno: '${schedule.sno}',
					title: '${schedule.title}',
					content: '${schedule.content}',
					writer: '${schedule.id}',
					notes: '${schedule.notes}',
					start: '${schedule.startDay}',
					end: '${schedule.endDay}',
				},
			</c:forEach>
	    ]
	  });

	  calendar.render();
	});

</script>
</head>
<body>
	<div class="container" style="padding: 50px 0px;">
		<div class="row">
			<div class="col-10">
				<div id="calendar"></div>
			</div>
			<div class="col-2">
				<div class="card" style="height: 100%;">
					<div class="card-body">
						<button class="btn btn-light btn-block" style="padding: 10px" data-toggle="modal" data-target="#insertCalendarModal">
							<i class="far fa-calendar-plus fa-4x"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 일정 등록 Modal -->
	<div class="modal fade" id="insertCalendarModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">일정 등록</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <form action="insertCalendarProc.jsp" method="post">
	        	<input type="hidden" name="id" value="${id}">
	        	<div class="form-group">
				    <label for="title">일정 제목 :</label>
				    <input type="text" class="form-control" id="title" name="title" maxlength="30" required>
				</div>
				<label for="day">일정 기간 :</label>
				<div class="form-inline">
				    <input type="datetime-local" class="form-control col-5" name="startDay">&nbsp;~&nbsp;
				    <input type="datetime-local" class="form-control col-5" name="endDay">
				</div>
				<div class="form-group">
				    <label for="content">일정 내용 :</label>
				    <textarea class="form-control" id="content" name="content" maxlength="100" style="resize: none;" required></textarea>
				</div>
				<div class="form-group">
				    <label for="team">팀원 :</label>
				    <textarea class="form-control" id="team" name="team" maxlength="100" placeholder=",로 구분해주세요" style="resize: none;"></textarea>
				</div>
				<button type="submit" class="btn btn-dark btn-block">등록하기</button>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	
	<button id="viewCalendarButton" data-toggle="modal" data-target="#viewCalendarModal" style="visibility: hidden;"></button>
	<!-- 일정 보기 Modal -->
	<div class="modal fade" id="viewCalendarModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title" id="modalTitle"></h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body" id="modalBody">
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>