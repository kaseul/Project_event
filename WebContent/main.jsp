<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="mirim.hs.kr.UserBean"%>
<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	LogonDBBean db = LogonDBBean.getInstance();
	UserBean user = null;
	Date regDate = null;
	Date eventDate = null;
	int check = 0;
	int[] lots = new int[3];
	
	for(int i = 0; i < lots.length; i++) {
		lots[i] = ((int) (Math.random() * lots.length) + 1) * 50;
		
		for(int j = 0; j < i; j++) {
			if(lots[i] == lots[j]) {
				i--;
				break;
			}
		}
	}
	
	// System.out.println(lots[0] + " " + lots[1] + " " + lots[2]);
	
	String id = (String) session.getAttribute("id");
	if(id != null || !id.equals("admin")) {
		user = db.getUser(id);
		regDate = user.getRegDate();
		eventDate = user.getEventDate();
		
		Calendar eventCalendar = Calendar.getInstance();
		eventCalendar.setTime(new SimpleDateFormat("yyyyMMdd").parse(new SimpleDateFormat("yyyyMMdd").format(eventDate)));
		
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new SimpleDateFormat("yyyyMMdd").parse(new SimpleDateFormat("yyyyMMdd").format(new Date(System.currentTimeMillis()))));
		
		System.out.println("Main eventCalendar : " + eventCalendar.get(Calendar.YEAR) + "/" + eventCalendar.get(Calendar.MONTH) + "/" + eventCalendar.get(Calendar.DATE) + " " + eventCalendar.get(Calendar.HOUR) + ":" + eventCalendar.get(Calendar.MINUTE) + ":" + eventCalendar.get(Calendar.SECOND));
		System.out.println("Main todayCalendar : " + calendar.get(Calendar.YEAR) + "/" + calendar.get(Calendar.MONTH) + "/" + calendar.get(Calendar.DATE) + " " + calendar.get(Calendar.HOUR) + ":" + calendar.get(Calendar.MINUTE) + ":" + calendar.get(Calendar.SECOND));
		System.out.println(calendar.compareTo(eventCalendar));
		//out.println(regDate + " " + eventDate + " " + today);
		
		if((regDate.compareTo(eventDate) == 0) || calendar.compareTo(eventCalendar) > 0) {
			check = 1;
		}
	}
	
	request.setAttribute("user", user);
	request.setAttribute("check", check);
	request.setAttribute("lots", lots);
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
<style>
	input + img {
		cursor: pointer;
		width: 100px;
	}

	input:checked + img {
		outline: 2px solid #aaaaff;
		outline-radius: 3px;
	}
</style>
<script>
window.onload = function() {
	if(document.getElementById('eventModal')) {
		document.getElementById('eventButton').click();
	}
}
</script>
</head>
<body>
Main
<c:if test="${check == 1}">
<!-- Button to Open the Modal -->
  <input type="hidden" id="eventButton" data-toggle="modal" data-target="#eventModal">
  
  <!-- The Modal -->
  <div class="modal fade" id="eventModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	<form action="event.jsp" method="post" style="text-align: center;">
        		<p>제비를 뽑아 포인트를 획득하세요!</p>
        		<c:forEach items="${lots}" var="lot" varStatus="status">
        			<label>
        				<c:choose>
        					<c:when test="${status.count == 1}">
        						<input type="radio" name="point" value="${lot}" style="display: none;" checked required>
        					</c:when>
        					<c:otherwise>
        						<input type="radio" name="point" value="${lot}" style="display: none;">
        					</c:otherwise>
        				</c:choose>
				  		<img src="https://image.winudf.com/v2/image1/Y29tLm9vby5sb3R0ZXJ5X2ljb25fMTU2Nzg1NDA2M18wMDM/icon.png?w=170&fakeurl=1">
					</label>
        		</c:forEach>
        		<p>
        		<button type="submit" class="btn btn-dark">뽑기</button>
        	</form>
        </div>
        
      </div>
    </div>
  </div>
</c:if>
</body>
</html>