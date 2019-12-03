<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 추가</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Public+Sans&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/themes/material_orange.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>
<script>
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<style>
* {
	font-family: 'Nanum Gothic', sans-serif;
	/*        font-family: 'Public Sans', sans-serif;*/
}

body {
	background-color: transparent;
	/* 	text-align: center; */
}

#titleMainDiv {
	margin: 30px;
}

#titleMain {
	font-size: 30px;
	font-weight: bold;
}

label {
	display: inline-block;
	width: 100px;
	font-weight: bold;
	text-align: left;
}

#titleDiv, #contentsDiv, #startDiv, #endDiv, #btnDiv, #priorityDiv {
	margin: 15px;
}

#endDiv, #startDiv {
	margin-right: 115px;
}

input {
	border: 1px solid #82828260;
	height: 30px;
	color: #82828260;
}

#title {
	width: 200px;
}

#contents {
	width: 500px;
}

#startDate, #endDate {
	width: 100px;
}

button {
	background: #1AAB8A;
	color: #fff;
	border: none;
	position: relative;
	height: 30px;
	font-size: 1.2em;
	padding: 0 1em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

button:hover {
	background: #fff;
	color: #1AAB8A;
}

button:before, button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

button:hover:before, button:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

#high, #mid, #low {
	border: 1px solid white;
	border-radius: 5$;
	width: 60px;
	padding: 3px;
	background-color: #adadad;
	color: white;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">일정 추가</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/createTask.pt"
						method="post" id="frm">
						<div class="form-group">
							<label for="recipient-name" id="titleLbl" class="col-form-label">일정명:</label>
							<input type="text" class="form-control" id="recipient-name"
								name="title">
						</div>
						<div class="form-group">
							<label for="message-text" id="contentsLbl" class="col-form-label">시작일자:</label>
							<input type="text" id="startDate" name="startDate"
								placeholder="시작일자" data-input readonly>
						</div>
						<div class="form-group">
							<label for="recipient-name" id="startLbl" class="col-form-label">마감일자:</label>
							<input type="text" id="endDate" name="endDate" placeholder="마감일자"
								data-input readonly>
						</div>
						<div class="form-group" id="priorityDiv">
							<label for="recipient-name" id="endLbl" class="col-form-label">중요도:</label>
							<input type="button" id="high" name="high" value="상"> <input
								type="button" id="mid" name="mid" value="중"> <input
								type="button" id="low" name="low" value="하"> <input
								type="text" id="priority" name="priority" hidden>
						</div>
						<div class="form-group">
							<label for="recipient-name" id="titleLbl" class="col-form-label">일정
								내용:</label>
							<div id="contents">
								<textarea id="summernote" name="summernote"></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="cancel" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" id="create" class="btn btn-primary">생성</button>
				</div>
			</div>
		</div>
	</div>

	</form>
	<script>
	$("#startDate").flatpickr({ 
		enableTime: false, 
		dateFormat: "Y-m-d" 
	});
	$("#endDate").flatpickr({
		enableTime: false, 
		dateFormat: "Y-m-d" 
	});
	$("#create").on("click", function(){
		console.log($("#summernote").val()); 
		var cleanText =
		$("#summernote").val().replace(/&amp/g, "$");
		cleanText =	cleanText.replace(/&nbsp/g, ""); 
		console.log(cleanText);
		$("#summernote").val(cleanText); 
		$("#frm").submit(); 
	});
	$("#cancel").on("click", function(){ 
		iframe.close; 
		});
	$("#contents").blur(function(){ 
		// var regex = });
	$("#myModal").ready(function() { 
		$('#summernote').summernote({
			placeholder: '일정 내용을 입력해 주세요.', 
			height: 100, width: 500, 
		}); 
	});

	$("#high").on("click", function(){ 
		$("#priority").val("");
		$("#high").css("background-color", "#d40000");
		$("#mid").css("background-color", "#adadad");
		$("#low").css("background-color", "#adadad"); 
		$("#priority").val("H");
	}); 
	$("#mid").on("click", function(){
		$("#priority").val("");
		$("#mid").css("background-color", "#ffb730");
		$("#high").css("background-color", "#adadad");
		$("#low").css("background-color", "#adadad");
		$("#priority").val("M");
	}); 
	$("#low").on("click", function(){ 
		$("#priority").val("");
		$("#low").css("background-color", "#ffdd9e");
		$("#high").css("background-color", "#adadad");
		$("#mid").css("background-color", "#adadad"); 
		$("#priority").val("L");
	});
	</script>
</body>
</html>