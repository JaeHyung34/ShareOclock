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

<title>메세지</title>
<jsp:include page="/cdn/cdn.jsp" flush="false" />

<style>
a {
	text-decoration: none;
	cursor: pointer;
	width: 100%;
	height: 100%;
}

a:link {
	text-decoration: none;
}

a:visited {
	color: #e67e22;
	text-decoration: none;
}

#b {
	box-sizing: border-box;
	border-top: 1px dotted red;
	border-bottom: 1px dotted red;
}

.msgContent {
	padding-right: 0px;
}
body {
	overflow: auto;
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
			<li class="nav-item active"><a class="nav-link"
				href="${pageContext.request.contextPath}/view.msg"> <i
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
							src="${pageContext.request.contextPath}/message/img/default_profile.png">
					</a> <!-- Dropdown - User Information -->
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--grow-in">
							<a class="dropdown-item" href="#"> <i
								class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내 정보 보기
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item bg-info" href="#" data-toggle="modal"
								data-target="#logoutModal"> <i
								class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
								로그아웃
							</a>
						</div></li>

				</ul>

			</nav>
			<!-- End of Topbar -->

<iframe>
			<!-- 메인 콘텐츠 시작 부분 -->
			<div id="content" class="container-fluid mx-xs-0 my-5 mx-md-5">

				<!-- md 이상일 때의 쪽지함 -->
				<div class="d-none d-md-block row">
					<h2>쪽지함</h2>
					<!--  <p>${sessionScope.loginInfo}의 쪽지함입니다. 읽지 않은 쪽지는 현재 0개 입니다</p> -->
					<p>의 쪽지함입니다. 읽지 않은 쪽지는 현재 0개 입니다</p>
					<div class="col-11">
					<table class="table table-hover ">
						<thead>
							<tr>
								<th><input id="selectAll" type="checkbox"></th>
								<th class="">보낸이</th>
								<th class="">내용</th>
								<th class="">날짜</th>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="i" varStatus="idx">
								<tr>
									<td><input class="ck" name="ck" value="${i.message_seq}"
										type="checkbox"></td>
									<td>${i.message_sender}</td>
									<td class="msgContent"><a id="${i.message_seq}"
										href="${pageContext.request.contextPath}/detailView.msg?seq=${i.message_seq}&entry=${entry}">
											${i.message_contents}</a> <c:if test="${i.message_read == \"n\"}">
											<span class="badge badge-pill">new</span>
										</c:if></td>
									<td class="">${i.message_time}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<nav >
						<ul class="pagination pagination-lg d-flex justify-content-center">
							${pagination}
						</ul>
					</nav>
					</div>
					<!--  검색기능 -->
					<form action="${pageContext.request.contextPath}/search.msg" method="post">
					<div class="row">
						<div class="col-12 d-flex justify-content-center">
							<select name="option">
								<option value="sender" <c:if test="${option.equals(\"sender\")}"> selected</c:if>>작성자</option>
								<option value="content"
								<c:if test="${option.equals(\"content\")}"> selected</c:if>>내용</option>
							</select>	
							<input type="text" name="search" value="${searchWord}">
							<input id="doSearch" type="submit" value="검색">
						</div>
					</div>	
					</form>
					<div id="btns" class="row mt-2">
						<div class="col-md-3">
							<input id="writeMsg" type="button" value="쪽지 쓰기">
						</div>
						<div class="col-md-3">
							<input id="readAll" type="button" value="모두 읽음으로 표시">
						</div>
						<div class="col-md-3">
							<input id="delete" type="button" value="삭제">
						</div>
						<div class="d-md-block col-md-3"></div>
					</div>
				</div>
				<!-- md이상일 때에 보이는 부분 끝 -->

				<!-- 모바일 화면 -->
				<div class="d-md-none">
					<h3>쪽지함</h3>
					<c:forEach items="${list}" var="i" varStatus="idx">
						<div id="b" class="row mb-2">
							<div class="col-1">${idx.index}</div>
							<div class="col-7">💬${i.message_sender}
								<c:if test="${i.message_read == \"n\"}">
									<span class="badge badge-danger badge-pill">new</span>
								</c:if>
							</div>
							<div class="col-4">
								<small>${i.message_mTime}</small>
							</div>
							<div class="col-12 mContent">
								<a
									href="${pageContext.request.contextPath}/detailView.msg?seq=${i.message_seq}&entry=${entry}">${i.message_mContents}</a>
							</div>
							<div class="w-100"></div>
						</div>
					</c:forEach>
					<nav class="w-100">
						<ul class="pagination d-flex justify-content-center">${pagination}</ul>
					</nav>
					<div class="row mb-4">
						<div class="col-6">
							<a href="${pageContext.request.contextPath}/message/sendMsg.jsp?entry=${entry}">쪽지
								쓰기</a>
						</div>
						<div class="col-6">
							<small>모두 읽음으로 표시</small>
						</div>
					</div>
				</div>
				<!-- 모바일 화면 끝 -->
			</div>
			<!-- 메인 콘텐츠 끝 -->
</iframe>
		</div>
	</div>

	<script>
    // 쪽지 쓰기
    $("#writeMsg").on("click", function() {
    	location.href="${pageContext.request.contextPath}/message/sendMsg.jsp?entry=${entry}";
    })
    // 쪽지 쓰기 - 끝
    // 모두 읽음으로 표시
	$("#readAll").on("click", function() {
		location.href="${pageContext.request.contextPath}/readAll.msg"
	})	
    // 모두 읽음으로 표시 - 끝
    // 삭제 
    $("#delete").on("click", function() {
    	var ckDel = "${pageContext.request.contextPath}/checkedDelete.msg?";
		if ($(".ck:checked").length === 0) {
    		alert("삭제할 대상을 선택해 주세요");
    		return;
		}
     	$(".ck:checked").each(function() {
			ckDel += "seq=" + this.value + '&';
    	})
		location.href=ckDel + "entry=${entry}";

    })
    // 삭제 - 끝
      // 전체 선택
          $("#selectAll").on("click", function() {
			if (this.checked) {
				$(".ck").prop("checked", true);	
			} else {
				$(".ck").prop("checked", false);
			}
          })
      // 전체 선택 - 끝
    </script>
</body>
</html>

