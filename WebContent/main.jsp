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

<title>제목을 입력하세요</title>
<jsp:include page="/cdn/cdn.jsp" flush="false" />
</head>
<style>
	#accordionSidebar *{
		color: black;
	}
	#acoordionSidebar {
		border-right: 1px solid black;
		background-color : black;
		color: #4a4a4a;
	}
	html{
		background-color : white;
	}
 	.nav-link{ 
 		border-bottom: 1px solid #a2a3a250;
 		background-color : white;
 	} 
	#logoTag{
		background-color : white;
	}
	.nav-link:hover{
		color: #d61c1c;
	}
	#newBadge1, #newBadge2{
		color: white;
		font-size: 5px;
	}
</style>
<body id="page-top">
	<c:choose>
		<c:when test="${ManagerInfo != null}">
			<script>
				alert( "${ManagerInfo}" + "관리자님  환영합니다"); 
				location.href="../Project/memberList.admin";
			</script>
		</c:when>
		<c:otherwise>
			<script>
			  history.back();
			</script>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${loginInfo == null}">
			<script>
				location.href="/Project/index.jsp";
			</script>
		</c:when>
	</c:choose>
	<!-- Page Wrapper -->
	<div id="wrapper">


		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

		<!-- Sidebar -->
		<ul
			class="navbar-nav sidebar sidebar-dark accordion d-none d-md-block"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="#" id="logoTag">
				<div class="sidebar-brand-icon">
					<img src="${pageContext.request.contextPath}/HTML_prototype_Form/img/logo1.png" style="width:110px;height:110px;"></img>
				</div>
<!-- 				<div class="sidebar-brand-text mx-3"> -->
<!-- 					신선놀음 <sup>1.5</sup> -->
<!-- 				</div> -->
			</a>

			<!-- 프로젝트 -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link" href="#"> <i
					class="fas fa-project-diagram"></i> <span class="MenuH">프로젝트 </span>
					<span class="badge badge-danger badge-pill" id="newBadge1">new</span>
				</a></li>

			<!-- 쪽지함 -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/message/msg_index.jsp"> <i
					class="fas fa-project-diagram"></i> <span class="MenuH">쪽지함</span> <span
					class="badge badge-danger badge-pill" style="width:50;" id="newBadge2">new</span>
			</a></li>
			
			<!-- 내정보 -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/message/msg_index.jsp"> <i
					class="fas fa-project-diagram"></i> <span class="MenuH">내 정보</span>
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
			<li class="nav-item"><a class="nav-link" href="#" onclick="viewProjectMove()"> <i
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
			<li class="nav-item">
			<a class="nav-link collapsed" href="#"	data-toggle="collapse" data-target="#collapseMyInfo"> 
				<i class="fas fa-fw fa-folder"></i> <span>내 정보 보기 </span>
			</a>
				<div id="collapseMyInfo" class="collapse" data-parent="#accordionSidebar">
					<div class="bg-dark py-2 collapse-inner rounded">
						<h6 class="collapse-header">정보 :</h6>
						<a class="collapse-item mb-" href="#" onclick="modifySiteMove()">내 정보 수정</a> 
						<a class="collapse-item bg-info" href="#"  onclick="logOutSiteMove()">로그아웃</a> 
						<a class="collapse-item " href="#"  onclick="withdrawalSiteMove()">회원탈퇴</a> 
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
			<hr class="sidebar-divider d-none d-md-block" />

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
						class="nav-link" href="${pageContext.request.contextPath}/message/msg_index.jsp"> <i
							class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts --> <span
							id="msgAlert" class="badge badge-danger badge-counter">N</span>
					</a></li>
					<div class="topbar-divider d-none d-sm-block"></div>

					<!-- Nav Item - User Information -->
					<li class="nav-item dropdown no-arrow"><a
						class="nav-link dropdown-toggle" href="#" id="userDropdown"
						role="button" data-toggle="dropdown"> <img
							class="img-profile rounded-circle" src="cdn/img/default_profile.png">
					</a> <!-- Dropdown - User Information -->
						<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in">
							<a class="dropdown-item" href="#"> 
								<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내 정보 보기
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item bg-info" href="#" data-toggle="modal" data-target="#logoutModal"> 
								<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
								로그아웃
							</a>
						</div></li>
				</ul>
			</nav>
			
			<!-- End of Topbar -->
			<!-- 메인 콘텐츠 시작 부분 -->
			  	<iframe id="iframe" width="100%" height="100%" style="border:none;border-left:1px;background-color:white;" src="${pageContext.request.contextPath}/member/modifyInfo.jsp">
				</iframe>			
			<!-- 메인 콘텐츠 끝 -->
		</div>
	</div>


	<script>
	function modifySiteMove(){
		$("#iframe").attr("src","${pageContext.request.contextPath}/member/modifyInfo.jsp");
	}	
	function logOutSiteMove(){
		$(location).attr('href', "${pageContext.request.contextPath}/logout.login");
	}
	function withdrawalSiteMove(){
		var result = confirm("정말  탈퇴 하시겠습니까?");
		if (result) {
			$(location).attr('href', "${pageContext.request.contextPath}/withdrawal.member");
		}
	}
	function viewProjectMove(){
		$("#iframe").attr("src","${pageContext.request.contextPath}/view.pro");
	}
	</script>
</body>
</html>

