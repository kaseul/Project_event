<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
	LogonDBBean db = LogonDBBean.getInstance();
	int sno = Integer.parseInt(request.getParameter("sno"));
	
	request.setAttribute("schedule", db.selectScheduleWithSno(sno));
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
	<div class="container" style="padding: 50px 0px;">
		
		<form action="updateCalendarProc.jsp" method="post">
			<input type="hidden" name="sno" value="${schedule.sno}">
		      	작성자 : ${schedule.id} <br>
		      	<div class="form-group">
			    <label for="title">일정 제목 :</label>
			    <input type="text" class="form-control" id="title" name="title" value="${schedule.title}" maxlength="30" required>
			</div>
			<label for="day">일정 기간 :</label>
			<div class="form-inline">
			    <input type="datetime-local" class="form-control col-5" value="<f:formatDate value='${schedule.startDay}' pattern='yyyy-MM-dd'/>T<f:formatDate value='${schedule.startDay}' pattern='HH:mm'/>" name="startDay">&nbsp;~&nbsp;
			    <input type="datetime-local" class="form-control col-5" value="<f:formatDate value='${schedule.endDay}' pattern='yyyy-MM-dd'/>T<f:formatDate value='${schedule.endDay}' pattern='HH:mm'/>" name="endDay">
			</div>
			<div class="form-group">
			    <label for="content">일정 내용 :</label>
			    <textarea class="form-control" id="content" name="content" maxlength="100" style="resize: none;" required>${schedule.content}</textarea>
			</div>
			<div class="form-group">
			    <label for="team">팀원 :</label>
			    <textarea class="form-control" id="team" name="team" maxlength="100" style="resize: none;" required>${schedule.team}</textarea>
			</div>
			<center><button type="submit" class="btn btn-dark">수정하기</button></center>
	      </form>
	</div>
</body>
</html>