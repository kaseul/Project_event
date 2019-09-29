<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="mirim.hs.kr.ScheduleBean"%>
<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	LogonDBBean db = LogonDBBean.getInstance();
	ScheduleBean schedule = new ScheduleBean();
	schedule.setSno(Integer.parseInt(request.getParameter("sno")));
	schedule.setId((String) session.getAttribute("id"));
	schedule.setTitle(request.getParameter("title"));
	schedule.setContent(request.getParameter("content"));
	schedule.setStartDay(Timestamp.valueOf(request.getParameter("startDay").replace("T", " ") + ":00"));
	schedule.setEndDay(Timestamp.valueOf(request.getParameter("endDay").replace("T", " ") + ":00"));
	schedule.setTeam(request.getParameter("team"));
	
	System.out.println("updateCalendarProc : " + schedule);
	
	db.updateSchedule(schedule);
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
	alert('일정을 수정하였습니다!');
	location.href='viewCalendar.jsp';
</script>
</head>
<body>

</body>
</html>