<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style type="text/css">
	.full {
		width: 100%;
		height: 100%;
		background: rgba(0, 0, 0, 0);
	}
</style>
<script>
function selectText() {
    var selectionText = "";
    if (document.getSelection) {
        selectionText = document.getSelection();
    } else if (document.selection) {
        selectionText = document.selection.createRange().text;
    }
    console.log(selectionText);
}
</script>
</head>
<body>
	<div class="container">
		<form action="insertNoteProc.jsp" method="post">
			<input type="text" class="form-control" name="title" maxlength="30" required>
			<ul class="nav nav-tabs nav-justified">
				<li class="nav-item">
					<button type="button" class="nav-link active full" data-toggle="tab" onclick="document.execCommand('bold');"><i class="fas fa-bold"></i></button>
				</li>
				<li class="nav-item">
					<button type="button" class="nav-link full" data-toggle="tab" onclick="document.execCommand('italic');"><i class="fas fa-italic"></i></button>
				</li>
				<li class="nav-item">
					<button type="button" class="nav-link full" data-toggle="tab" onclick="document.execCommand('italic');"><i class="fas fa-italic"></i></button>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" onclick="document.execCommand('');">Link</a>
				</li>
			</ul>
			<div id="content" class="card" contenteditable="true" style="border-top: none; border-top-left-radius: 0px 0px; border-top-right-radius: 0px 0px; max-height: 100px;">
			</div>
		</form>
	</div>
</body>
</html>