<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create New Project</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Public+Sans&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/themes/material_orange.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>
<style>
* {
	font-family: 'Nanum Gothic', sans-serif;
	/*        font-family: 'Public Sans', sans-serif;*/
}

/* body { */
/* 	background-color: transparent; */
/* 	text-align: center; */
/* } */

/* #titleMainDiv { */
/* 	margin: 30px; */
/* } */

/* #titleMain { */
/* 	font-size: 30px; */
/* 	font-weight: bold; */
/* } */

/* label { */
/* 	display: inline-block; */
/* 	width: 100px; */
/* 	font-weight: bold; */
/* 	text-align: left; */
/* } */

/* #titleDiv, #contentsDiv, #startDiv, #endDiv, #btnDiv { */
/* 	margin: 15px; */
/* } */

/* #endDiv, #startDiv { */
/* 	margin-right: 115px; */
/* } */

/* input { */
/* 	border: 1px solid #82828260; */
/* 	height: 30px; */
/* 	color: #82828260; */
/* } */

/* #title { */
/* 	width: 200px; */
/* } */

/* #contents { */
/* 	width: 300px; */
/* } */

/* #startDate, #endDate { */
/* 	width: 100px; */
/* } */

/* button { */
/* 	background: #1AAB8A; */
/* 	color: #fff; */
/* 	border: none; */
/* 	position: relative; */
/* 	height: 30px; */
/* 	font-size: 1.2em; */
/* 	padding: 0 1em; */
/* 	cursor: pointer; */
/* 	transition: 800ms ease all; */
/* 	outline: none; */
/* } */

/* button:hover { */
/* 	background: #fff; */
/* 	color: #1AAB8A; */
/* } */

/* button:before, button:after { */
/* 	content: ''; */
/* 	position: absolute; */
/* 	top: 0; */
/* 	right: 0; */
/* 	height: 2px; */
/* 	width: 0; */
/* 	background: #1AAB8A; */
/* 	transition: 400ms ease all; */
/* } */

/* button:after { */
/* 	right: inherit; */
/* 	top: inherit; */
/* 	left: 0; */
/* 	bottom: 0; */
/* } */

/* button:hover:before, button:hover:after { */
/* 	width: 100%; */
/* 	transition: 800ms ease all; */
/* } */
</style>
</head>
<body>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">프로젝트 생성</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/create.pro"
						method="post" id="frm">
						<div class="form-group">
							<label for="recipient-name" id="titleLbl" class="col-form-label">프로젝트명:</label>
							<input type="text" class="form-control" id="recipient-name">
						</div>
						<div class="form-group">
							<label for="message-text" id="contentsLbl" class="col-form-label">프로젝트
								내용:</label>
							<textarea class="form-control" id="message-text"></textarea>
						</div>
						<div class="form-group">
							<label for="recipient-name" id="startLbl" class="col-form-label">시작일자:</label>
							<input type="text" class="form-control" id="startDate"
								name="startDate" placeholder="시작일자" data-input readonly>
						</div>
						<div class="form-group">
							<label for="recipient-name" id="endLbl" class="col-form-label">마감일자:</label>
							<input type="text" class="form-control" id="endDate"
								name="endDate" placeholder="마감일자" data-input readonly>
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
	<!-- 		<div id="titleMainDiv"> -->
	<!-- 			<div id="titleMain">프로젝트 생성</div> -->
	<!-- 		</div> -->
	<!-- 		<div id="titleDiv"> -->
	<!-- 			<label id="titleLbl">프로젝트명</label> <input type="text" id="title" name="title" -->
	<!-- 				placeholder="프로젝트명 입력" maxlength="20"> -->
	<!-- 		</div> -->
	<!-- 		<div id="contentsDiv"> -->
	<!-- 			<label id="contentsLbl">프로젝트 내용</label> <input type="text" id="contents" name="contents" -->
	<!-- 				placeholder="프로젝트 내용 입력" maxlength="30"> -->
	<!-- 		</div> -->
	<!-- 		<div id="startDiv"> -->
	<!-- 			<label id="startLbl">시작일자</label> <input type="text" id="startDate" name="startDate" -->
	<!-- 				placeholder="시작일자" data-input readonly> -->
	<!-- 		</div> -->
	<!-- 		<div id="endDiv"> -->
	<!-- 			<label id="endLbl">마감일자</label> <input type="text" id="endDate" name="endDate" -->
	<!-- 				placeholder="마감일자" data-input readonly> -->
	<!-- 		</div> -->
	<!-- 		<div id="btnDiv"> -->
	<!-- 			<button type="button" id="create">생성</button> -->
	<!-- 			<button type="button" id="cancel">취소</button> -->
	<!-- 		</div> -->
	<script>
	$('#myModal').on('show.bs.modal', function (event) {
		 var button = $(event.relatedTarget) // Button that triggered the modal
		  var recipient = button.data('whatever') // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  var modal = $(this)
		  modal.find('.modal-title').text('New message to ' + recipient)
		  modal.find('.modal-body input').val(recipient)
		});
	
            $("#startDate").flatpickr({
                enableTime: false,
                dateFormat: "Y-m-d"
            });
            $("#endDate").flatpickr({
                enableTime: false,
                dateFormat: "Y-m-d"
            });
            $("#create").on("click", function(){
                $("#frm").submit();
            })
            $("#cancel").on("click", function(){
//                 iframe.close;
            });
            $("#contents").blur(function(){
          //  	var regex = 
            });
        </script>
</body>
</html>