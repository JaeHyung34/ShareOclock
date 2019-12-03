<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>일정 게시판</title>
<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/HTML_prototype_Form/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Public+Sans&Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/HTML_prototype_Form/css/sb-admin-2.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/HTML_prototype_Form/css/index_.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/HTML_prototype_Form/css/message_index.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/themes/material_green.css">
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<style>
.btns {
	text-align: right;
}

#boardLink, #calendarLink {
	margin: 5px; 
	height: 30px;
	width: 30px;
}

label {
	width: 100px;
}

#high, #mid, #low, #highSingle, #midSingle, #lowSingle {
	width: 100px;
}

.note-editable {
	background-color: white
}
</style>
</head>

<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>
		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion d-none d-md-block"
			id="accordionSidebar">
			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="#">
				<div class="sidebar-brand-icon">
					<i class="fas fa-radiation"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					신선놀음 <sup>1.5</sup>
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link" href="#"> <i
					class="fas fa-project-diagram"></i> <span>새 프로젝트 <span
						class="badge badge-danger badge-pill">new</span>
				</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link" href="#"> <i
					class="fas fa-project-diagram"></i> <span>쪽지함</span> <span
					class="badge badge-danger badge-pill">new</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">재형</div>

			<!-- Nav Item - 로그인 -->
			<li class="nav-item"><a class="nav-link" href="#"> <i
					class="fas fa-fw fa-chart-area"></i> <span>정재형</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading - 달력 -->
			<div class="sidebar-heading">은비</div>

			<!-- Nav Item -->
			<li class="nav-item"><a class="nav-link" href="#"> <i
					class="fas fa-fw fa-chart-area"></i> <span>조은비</span></a></li>

			<!-- Heading - 게시판 -->
			<div class="sidebar-heading">유진</div>

			<!-- Nav Item -->
			<li class="nav-item"><a class="nav-link" href="#"> <i
					class="fas fa-fw fa-chart-area"></i> <span>전유진</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">익호</div>

			<!-- Nav Item - 관리자 페이지 -->
			<li class="nav-item"><a class="nav-link" href="admin.html">
					<i class="fas fa-fw fa-chart-area"></i> <span>신익호</span>
			</a></li>



			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">내 정보</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseMyInfo"> <i
					class="fas fa-fw fa-folder"></i> <span>내 정보 보기 </span>
			</a>
				<div id="collapseMyInfo" class="collapse"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">정보 :</h6>
						<a class="collapse-item mb-" href="#">내 정보 수정</a> <a
							class="collapse-item bg-info" href="#">로그아웃</a> </a>
					</div></li>
			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">임시</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>Pages</span>
			</a>
				<div id="collapsePages" class="collapse"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Login Screens:</h6>
						<a class="collapse-item" href="login.html">Login</a> <a
							class="collapse-item" href="register.html">Register</a> <a
							class="collapse-item" href="forgot-password.html">Forgot
							Password</a>
						<div class="collapse-divider"></div>
						<h6 class="collapse-header">Other Pages:</h6>
						<a class="collapse-item" href="404.html">404 Page</a> <a
							class="collapse-item" href="blank.html">Blank Page</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<div>
					<button class="rounded-circle border-0" id="sidebarToggle"></button>
				</div>
			</div>
		</ul>

		<!-- Main Content -->
		<div id="content">


			<!-- Topbar // 모바일환경일 때에만 노출되는 상위네비바 -->
			<nav
				class="navbar navbar-expand navbar-light bg-primary topbar mb-4 static-top shadow w-100 d-xs-block d-md-none">

				<!-- Sidebar Toggle (Topbar) -->
				<ul class="navbar-nav">
					<!-- Nav Item - User Information -->
					<li class="nav-item dropdown no-arrow"><a
						class="nav-link dropdown-toggle" href="#" id="userDropdown"
						role="button" data-toggle="dropdown"> <i class="fa fa-bars"></i>
							<span id="msgAlert" class="badge badge-danger badge-counter">N</span>
					</a> <!-- Dropdown - User Information -->
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--grow-in">
							<a class="dropdown-item" href="#"> <i
								class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내 프로젝트 <span
								id="alert" class="badge badge-danger badge-counter">N</span>
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#"> <i
								class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 조은비
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#"> <i
								class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 전유진
							</a>
						</div></li>
				</ul>

				<!-- Topbar Navbar -->
				<ul class="navbar-nav ml-auto">

					<!-- Nav Item - Alerts -->
					<li class="nav-item dropdown no-arrow mx-1"><a
						class="nav-link" href="message_index.html"> <i
							class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts --> <span
							id="msgAlert" class="badge badge-danger badge-counter">N</span>
					</a></li>

					<div class="topbar-divider d-none d-sm-block"></div>

					<!-- Nav Item - User Information -->
					<li class="nav-item dropdown no-arrow"><a
						class="nav-link dropdown-toggle" href="#" id="userDropdown"
						role="button" data-toggle="dropdown"> <img
							class="img-profile rounded-circle"
							src="${pageContext.request.contextPath}/HTML_prototype_Form/img/default_profile.png">
					</a> <!-- Dropdown - User Information -->
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--grow-in">
							<a class="dropdown-item" href="#"> <i
								class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내 정보 보기
							</a>
							<div class="dropdown-divider"></div>
								data-target="#logoutModal"> <i
								class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
								로그아웃
							</a>
						</div></li>

				</ul>

			</nav>
			<!-- End of Topbar -->

			<!-- 메인 콘텐츠 시작 부분 -->
			<div class="container">
				<h2>일정 게시판</h2>
				<div class="btns">
					<button type="button" id="createTask" role="button"
						class="btn btn-secondary popover-test" title="Popover title"
						data-toggle="modal" data-target="#addModal" data-backdrop="static">일정추가</button>
					<a href="${pageContext.request.contextPath}/task/viewCalendar.jsp"><img
						id="calendarLink"
						src="${pageContext.request.contextPath}/HTML_prototype_Form/img/calendar.png"></a>
					<a href="#"><img id="boardLink"
						src="${pageContext.request.contextPath}/HTML_prototype_Form/img/listboard.png"></a>
				</div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>시작일자</th>
							<th>마감일자</th>
							<th>제목</th>
							<th>우선순위</th>
							<th>담당자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${TaskDTO}" var="dto">
							<tr>
								<td>${dto.pt_startDate}</td>
								<td>${dto.pt_endDate}</td>
								<td class="pt_title" data-toggle="modal" data-dismiss="modal"
									data-target="#viewModal" data-backdrop="static"
									data-value="${dto.pt_seq}">${dto.pt_title}</td>
								<c:choose>
									<c:when test="${dto.pt_priority=='H'}">
										<td>높음</td>
									</c:when>
									<c:when test="${dto.pt_priority=='M'}">
										<td>중간</td>
									</c:when>
									<c:when test="${dto.pt_priority=='L'}">
										<td>낮음</td>
									</c:when>
								</c:choose>
								<td>${dto.pt_writer}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- 	일정 추가 modal -->
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
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
							<button type="button" class="btn btn-secondary btn-sm"
								name="high" id="high">상</button>
							<button type="button" class="btn btn-secondary btn-sm" name="mid"
								id="mid">중</button>
							<button type="button" class="btn btn-secondary btn-sm" name="low"
								id="low">하</button>
							<input type="text" id="priority" name="priority" hidden>
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
	<!-- 일정 추가 modal 끝 -->
	<!-- 일정 조회, 수정 modal -->
	<div class="modal fade" id="viewModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">일정 보기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/modifyTask.pt"
						method="post" id="frmModify">
						<div class="form-group">
							<label for="titleSingle" id="titleLbl" class="col-form-label">일정명:</label>
							<input type="text" class="form-control" id="titleSingle"
								name="titleSingle" readonly>
						</div>
						<div class="form-group">
							<label for="startDateSingle" id="contentsLbl"
								class="col-form-label">시작일자:</label> <input type="text"
								id="startDateSingle" name="startDateSingle" data-input readonly>
						</div>
						<div class="form-group">
							<label for="endDateSingle" id="startLbl" class="col-form-label">마감일자:</label>
							<input type="text" id="endDateSingle" name="endDateSingle"
								data-input readonly>
						</div>
						<div class="form-group" id="priorityDiv">
							<label for="recipient-name" id="endLbl" class="col-form-label">중요도:</label>
							<button type="button" class="btn btn-secondary btn-sm"
								name="highSingle" id="highSingle" disabled=true>상</button>
							<button type="button" class="btn btn-secondary btn-sm"
								name="midSingle" id="midSingle" disabled=true>중</button>
							<button type="button" class="btn btn-secondary btn-sm"
								name="lowSingle" id="lowSingle" disabled=true>하</button>
							<input type="text" id="prioritySingle" name="prioritySingle"
								hidden>
						</div>
						<div class="form-group">
							<label for="recipient-name" id="titleLbl" class="col-form-label">일정
								내용:</label>
							<div id="contents">
								<textarea id="summernoteView" name="summernoteView"></textarea>
								<input type=text id=hiddenSeq name=hiddenSeq hidden>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="cancelSingle" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<c:if test="${user == dtoSingle.pt_writer}">
						<button type="button" id="modify" class="btn btn-primary">수정</button>
						<button type="button" id="complete" class="btn btn-primary" hidden>저장</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>


	<!-- 일정 수정 modal 끝 -->



	<!-- 메인 콘텐츠 끝 -->


	<script>
		$('.pt_title')
			.on("click", function() {
				$("#startDateSingle").flatpickr({
					clickOpens : false
				});
				$("#endDateSingle").flatpickr({
					clickOpens : false
				});
				$("#complete").hide();
				$("#modify").show();
					var pt_title = $(this).data('value');
				// 			console.log(pt_title);
					var destination = "${pageContext.request.contextPath}/detailTask.pt";
				// 팝업 호출
				$.ajax({
					url : destination,
					data : {
						pt_seq : pt_title
					},
					type : "post",
					dataType : "json"
					}).done(function(data) {
						console.log(data);
						$("#viewModal > .modal-dialog").ready(function() {
							$("#titleSingle").attr("readonly", true);
							$("#startDateSingle").attr("readonly",true);
							$("#endDateSingle").attr("readonly",true);
							$("#highSingle").attr("disabled",true);
							$("#midSingle").attr("disabled",true);
							$("#lowSingle").attr("disabled",true);
							$("#hiddenSeq").val(pt_title);
							console.log($("#hiddenSeq").val());
							$("#titleSingle").val(data.dtoSingle.pt_title);
							$("#startDateSingle").val(data.dtoSingle.pt_startDate);
							$("#endDateSingle").val(data.dtoSingle.pt_endDate);
						if (data.dtoSingle.pt_priority == 'H') {
							$("#highSingle").attr('class','btn btn-danger btn-sm');
							$("#midSingle").attr('class','btn btn-secondary btn-sm');
							$("#lowSingle").attr('class','btn btn-secondary btn-sm');
						} else if (data.dtoSingle.pt_priority == 'M') {
							$("#midSingle").attr('class','btn btn-success btn-sm');
							$("#highSingle").attr('class','btn btn-secondary btn-sm');
							$("#lowSingle").attr('class','btn btn-secondary btn-sm');
						} else if (data.dtoSingle.pt_priority == 'L') {
							$("#lowSingle").attr('class','btn btn-warning btn-sm');
							$("#highSingle").attr('class','btn btn-secondary btn-sm');
							$("#midSingle").attr('class','btn btn-secondary btn-sm');
						}
						$("#viewModal .note-editable").html(data.dtoSingle.pt_contents);
						$("#viewModal .note-editable").attr('readonly',true);
					});
						}).fail(function(a, b, c) {
							console.log(a);
							console.log(b);
							console.log(c);
						});
							$("#viewModal").modal("show");

						})

		let modContent;
		var content = $("#msgContent2").text();
		console.log(content);
		if (content.length > 10) {
			let arr = Array.from($("#msgContent2").text());
			console.log(arr);
			for (let i = 0; i < 10; i++) {
				console.log(arr[i]);
				modContent += arr[i];
			}
			console.log(modContent + "...");
			document.getElementById("msgContent2").innerHTML = modContent
					+ "...";
		}

		$("#startDate").flatpickr({
			enableTime : false,
			dateFormat : "Y-m-d"
		});

		$("#endDate").flatpickr({
			enableTime : false,
			dateFormat : "Y-m-d"
		});

		$("#create").on("click", function() {
			console.log($("#summernote").val());
			var cleanText = $("#summernote").val().replace(/&amp/g, "$");
			cleanText = cleanText.replace(/&nbsp/g, "");
			console.log(cleanText);
			$("#summernote").val(cleanText);
			$("#frm").submit();
		});
		$("#addModal").ready(function() {
			$('#summernote').summernote({
				placeholder : '일정 내용을 입력해 주세요.',
				disableDragAndDrop : true,
				height : 150,
				toolbar : [
						['style',
							['bold',
							'italic',
							'underline',
							'clear' ] 
						],
						['font',
							['strikethrough',
							'superscript',
							'subscript' ] 
						],
						[ 'fontsize',
							[ 'fontsize' ] 
						],
						[ 'color', 
							[ 'color' ] 
						],
						['para',
							[ 'ul',
							'ol',
							'paragraph' ]
						],
						[ 'height',
							[ 'height' ]
						] 
						]
						});
						});
		$("#summernoteView")
				.summernote(
						{
							height : 150,
							toolbar : [
									[
											'style',
											[ 'bold', 'italic', 'underline',
													'clear' ] ],
									[
											'font',
											[ 'strikethrough', 'superscript',
													'subscript' ] ],
									[ 'fontsize', [ 'fontsize' ] ],
									[ 'color', [ 'color' ] ],
									[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
									[ 'height', [ 'height' ] ] ]
						});
		$("#high").on("click", function() {
			$("#priority").val("");
			$("#high").attr('class', 'btn btn-danger btn-sm');
			$("#mid").attr('class', 'btn btn-secondary btn-sm');
			$("#low").attr('class', 'btn btn-secondary btn-sm');
			$("#priority").val("H");
		});
		$("#mid").on("click", function() {
			$("#priority").val("");
			$("#mid").attr('class', 'btn btn-success btn-sm');
			$("#low").attr('class', 'btn btn-secondary btn-sm');
			$("#high").attr('class', 'btn btn-secondary btn-sm');
			$("#priority").val("M");
		});
		$("#low").on("click", function() {
			$("#priority").val("");
			$("#low").attr('class', 'btn btn-warning btn-sm');
			$("#high").attr('class', 'btn btn-secondary btn-sm');
			$("#mid").attr('class', 'btn btn-secondary btn-sm');
			$("#priority").val("L");
		});

		$("#highSingle").on("click", function() {
			$("#prioritySingle").val("");
			$("#highSingle").attr('class', 'btn btn-danger btn-sm');
			$("#midSingle").attr('class', 'btn btn-secondary btn-sm');
			$("#lowSingle").attr('class', 'btn btn-secondary btn-sm');
			$("#prioritySingle").val("H");
		});
		$("#midSingle").on("click", function() {
			$("#prioritySingle").val("");
			$("#midSingle").attr('class', 'btn btn-success btn-sm');
			$("#lowSingle").attr('class', 'btn btn-secondary btn-sm');
			$("#highSingle").attr('class', 'btn btn-secondary btn-sm');
			$("#prioritySingle").val("M");
		});
		$("#lowSingle").on("click", function() {
			$("#prioritySingle").val("");
			$("#lowSingle").attr('class', 'btn btn-warning btn-sm');
			$("#highSingle").attr('class', 'btn btn-secondary btn-sm');
			$("#midSingle").attr('class', 'btn btn-secondary btn-sm');
			$("#prioritySingle").val("L");
		});

		$("#modify").on("click", function(e) {
			$("#modify").hide();
			$("#complete").show();
			$("#complete").attr('hidden', false);
			
			$("#startDateSingle").on("mouseenter", function(e){
				$("#startDateSingle").flatpickr({
					clickOpens : true					
				});
			});
			
			$("#endDateSingle").on("mouseenter", function(e){
				$("#endDateSingle").flatpickr({
					clickOpens : true
				});
			});

			$("#titleSingle").removeAttr("readonly");
			$("#startDateSingle").removeAttr("readonly");
			$("#endDateSingle").removeAttr("readonly");
			$("#highSingle").removeAttr("disabled");
			$("#midSingle").removeAttr("disabled");
			
 
		$("#lowSingle").removeAttr("disabled");
			
// 			$("#startDateSingle").flatpickr({
// 				clickOpens : true
// 			});
// 			$("#endDateSingle").flatpickr({
// 				clickOpens : true
// 			});
			
			$("#complete").on("click", function() {
				console.log($("#titleSingle"));
				console.log($("#prioritySingle"));
				console.log($("#contentsSingle"));
				console.log($("#startDateSingle"));
				console.log($("#endDateSingle"));
				
				$("#startDateSingle").unbind();
				$("#endDateSingle").unbind();
				
				alert("수정이 완료되었습니다.");
				$("#viewModal").modal('hide');
				$("#frmModify").submit();
			});
			//         		$("#cancelSingle").on("click", function(){
			//         			$("#startDateSingle").unbind();
			//         			$("#endDateSingle").unbind();
			//         		});

		});
		//     	$('#viewModal').on('hide', function () {

		//     	})
	</script>
</body>
</html>

