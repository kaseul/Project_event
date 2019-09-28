<%@page import="mirim.hs.kr.NoteBean"%>
<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="application/hwp;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
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
</head>
<body>
${note.content}
</body>
</html>
<%
response.setHeader("Content-Disposition", "attachment;filename=" + note.getTitle() + ".hwp");
response.setHeader("Content-Description", "JSP Generated Data");
%>