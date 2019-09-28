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
	
	String id = (String)session.getAttribute("id");
	
	if(id != null) {
		request.setAttribute("products", db.selectProductWithId(id));
	}
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
function submit_div() {
	if(document.getElementById('contentDiv').innerHTML.trim() == "") {
		alert("내용을 입력해주세요!");
	}
	else{
		document.getElementById('content').value = document.getElementById('contentDiv').innerHTML.trim();
		//alert(document.getElementById('content').value);
		document.getElementById('submitButton').click();
	}
}
</script>
</head>
<body>
	<div class="container" style="padding-top: 20px;">
		<form id="updateNoteForm" action="updateNoteProc.jsp" method="post">
			제목
			<input type="text" class="form-control" name="title" value="${note.title}" maxlength="50" required><p>
			<input type="hidden" id="nno" name="nno" value="${note.nno}" required>
			<input type="hidden" id="content" name="content" required>
			<input type="hidden" name="id" value="${id}" required>
			<ul class="nav nav-tabs nav-justified">
				<li class="nav-item">
					<button type="button" class="nav-link full" data-toggle="tab" onclick="document.execCommand('undo');"><i class="fas fa-undo"></i></button>
				</li>
				<li class="nav-item">
					<button type="button" class="nav-link full" data-toggle="tab" onclick="document.execCommand('redo');"><i class="fas fa-redo"></i></button>
				</li>
				<li class="nav-item">
					<button type="button" class="nav-link full" data-toggle="tab" onclick="document.execCommand('bold');"><i class="fas fa-bold"></i></button>
				</li>
				<li class="nav-item">
					<button type="button" class="nav-link full" data-toggle="tab" onclick="document.execCommand('italic');"><i class="fas fa-italic"></i></button>
				</li>
				<li class="nav-item">
					<button type="button" class="nav-link full" data-toggle="tab" onclick="document.execCommand('underline');"><i class="fas fa-underline"></i></button>
				</li>
				<li class="nav-item">
					<button type="button" class="nav-link full" data-toggle="tab" onclick="document.execCommand('strikeThrough');"><i class="fas fa-strikethrough"></i></button>
				</li>
				<li class="nav-item">
					<button type="button" class="nav-link full" data-toggle="tab" onclick="document.execCommand('justifyleft');"><i class="fas fa-align-left"></i></button>
				</li>
				<li class="nav-item">
					<button type="button" class="nav-link full" data-toggle="tab" onclick="document.execCommand('justifycenter');"><i class="fas fa-align-center"></i></button>
				</li>
				<li class="nav-item">
					<button type="button" class="nav-link full" data-toggle="tab" onclick="document.execCommand('justifyright');"><i class="fas fa-align-right"></i></button>
				</li>
				<li class="nav-item">
					<button type="button" class="nav-link full" data-toggle="tab" onclick="document.execCommand('indent');"><i class="fas fa-indent"></i></button>
				</li>
				<li class="nav-item">
					<button type="button" class="nav-link full" data-toggle="tab" onclick="document.execCommand('outdent');"><i class="fas fa-outdent"></i></button>
				</li>
				<li class="nav-item">
					<button type="button" class="nav-link full" data-toggle="tab" onclick="document.execCommand('insertorderedList');"><i class="fas fa-list-ol"></i></button>
				</li>
				<li class="nav-item">
					<button type="button" class="nav-link full" data-toggle="tab" onclick="document.execCommand('insertunorderedList');"><i class="fas fa-list-ul"></i></button>
				</li>
				<li class="nav-item dropdown">
		      		<button class="nav-link dropdown-toggle full" data-toggle="dropdown"><i class="fas fa-font"></i></button>
		      		<div class="dropdown-menu">
		        		<button type="button" class="dropdown-item" onclick="document.execCommand('fontName', false, '돋움');">돋움</button>
		        		<button type="button" class="dropdown-item" onclick="document.execCommand('fontName', false, '굴림');">굴림</button>
		        		<button type="button" class="dropdown-item" onclick="document.execCommand('fontName', false, '궁서');">궁서</button>
	        		</div>
		    	</li>
		    	<li class="nav-item dropdown">
		      		<button class="nav-link dropdown-toggle full" data-toggle="dropdown"><i class="fas fa-text-height"></i></button>
		      		<div class="dropdown-menu">
		        		<button type="button" class="dropdown-item" onclick="document.execCommand('fontSize', false, '1');">10pt</button>
		        		<button type="button" class="dropdown-item" onclick="document.execCommand('fontSize', false, '2');">13pt</button>
		        		<button type="button" class="dropdown-item" onclick="document.execCommand('fontSize', false, '3');">16pt</button>
		        		<button type="button" class="dropdown-item" onclick="document.execCommand('fontSize', false, '4');">18pt</button>
		        		<button type="button" class="dropdown-item" onclick="document.execCommand('fontSize', false, '5');">24pt</button>
		        		<button type="button" class="dropdown-item" onclick="document.execCommand('fontSize', false, '6');">32pt</button>
		        		<button type="button" class="dropdown-item" onclick="document.execCommand('fontSize', false, '7');">48pt</button>
	        		</div>
		    	</li>
		    	<li class="nav-item dropdown">
		      		<button class="nav-link dropdown-toggle full" data-toggle="dropdown"><i class="fas fa-highlighter"></i></button>
		      		<div class="dropdown-menu">
		      			<c:forEach items="${products}" var="product">
		      				<c:if test="${product.ptype == 'hiliteColor'}">
		      					<button type="button" class="dropdown-item" onclick="document.execCommand('${product.ptype}', false, '${product.pvalue}');">${product.pname}</button>
		      				</c:if>
		      			</c:forEach>
	        		</div>
		    	</li>
			</ul>
			<div id="contentDiv" class="card" contenteditable="true" style="border-top: none; border-top-left-radius: 0px 0px; border-top-right-radius: 0px 0px; min-height: 200px;">
			${note.content}
			</div>
			<center>
				<button type="button" class="btn btn-dark" onclick="submit_div()" style="margin: 20px 5px;">저장</button>
				<button type="button" class="btn btn-dark" onclick="history.go(-1);" style="margin: 20px 5px;">취소</button>
				<input type="submit" id="submitButton" style="visibility: hidden;">
			</center>
		</form>
	</div>
</body>
</html>