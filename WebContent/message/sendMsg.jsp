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

<title>메세지 보내기</title>
<jsp:include page="/cdn/cdn.jsp" flush="false" />
<style>
	#receiver {
		width: 100%;
	}
	#msgBox {
		height: 50vh;
	}
	#inputMsg {
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
					class="fas fa-project-diagram"></i> <span>새 프로젝트 
					<span class="badge badge-danger badge-pill">new</span>
				</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link"
				href="${pageContext.request.contextPath}/message/msg_index.jsp">
					<i class="fas fa-project-diagram"></i> <span>쪽지함</span> <span
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
						class="nav-link"
						href="${pageContext.request.contextPath}/message/msg_index.jsp">
							<i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts --> <span
							id="msgAlert" class="badge badge-danger badge-counter">N</span>
					</a></li>

					<div class="topbar-divider d-none d-sm-block"></div>

					<!-- Nav Item - User Information -->
					<li class="nav-item dropdown no-arrow"><a
						class="nav-link dropdown-toggle" href="#" id="userDropdown"
						role="button" data-toggle="dropdown"> <img
							class="img-profile rounded-circle" src="img/default_profile.png">
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

			<!-- 메인 콘텐츠 시작 부분 -->

			<form id="frm" action="${pageContext.request.contextPath}/send.msg?entry=1"
				method="post">
				<div class="container mt-5 rounded">
					<div class="row mt-2 border mx-3 mx-md-0">
						<div class="d-none d-md-block col-md-2 text-right">받으실 분 :</div>
						<div class="col-8 col-sm-10 col-md-6 px-0">
							<input id="receiver" type="text"
								placeholder="받으실 분을 입력하세요"> 
						</div>
						<div class="col-4 col-sm-2 col-md-1">
							<button class="btn btn-secondary" type="button" id="add">등록</button>
						</div>
						<div>
							<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#find" disabled>그룹 찾기</button>
						</div>
					</div>
					<div class="row">
					<!-- 메시지 보낼 대상자 리스트 -->
						<p>메시지를 보낼 대상 : </p><br>
						<div id="sendList" class="ml-5"></div>
					</div>
					<!-- 메시지 보낼 대상자 리스트 끝 -->
					<div class="row mt-4 mx-3 mx-md-0">
						<div id="msgBox" class="col px-0">
							<div id="inputMsg" name="content" 
							class="border px-0 h-100"
								contenteditable="true"></div>
							<textarea class="d-none" id="tArea" name="tArea"></textarea>
						</div>
						<div class="w-100"></div>
						<p>✔내용은 300자를 넘을 수 없습니다</p>
						<div class="row w-100 mt-4">
							<div class="col-12 text-center">
								<button id="send">전송</button>
								<button id="cancel" class="ml-5" type="button">취소</button>
							</div>
						</div>
					</div>
			</form>

<!-- 보낼 사람 탐색 및 등록 -->
<div class="modal fade" id="find" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">보낼 대상 찾기</h5>
        <button type="button" class="close" data-dismiss="modal">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group row">
            <input type="text" class="col-8" id="findID" placeholder="받으실 분">
            <button id="searchID" type="button" class="col-3">추가</button>
          </div>
          <div class="form-group">
          <p>쪽지 보낼 대상 목록</p>
          	<div id="foundedID"></div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <input id="findCompleted" type="button" class="btn" value="완료">
        <button id="cancelFind" type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
<!-- 보낼 사람 탐색 및 등록 끝 -->
			<!-- 메인 콘텐츠 끝 -->

		</div>
	</div>
	<script>
    $("#send").on("click", function() {
      $("#tArea").val($("#inputMsg").html());
      if ($(".sendList").length == 0) {
    	  alert("받으실 분을 입력하세요");
    	  return false;
	  }
      if ($("#tArea").val() == "") {
    	  alert("내용을 입력하세요");
    	  return false;
      } else if ($("#tArea").val().length > 295) {
    	  alert("내용의 길이가 300자를 넘을 수 없습니다");
    	  return false;
      }
      $("#frm").submit();  
    }) 
	$("#sendList").on("click", '.fa-minus', function() {
		$(this).parent().remove();
	})
	$("#add").on("click", function() {
		if ($("receiver").val() == '') {
			alert("대상을 입력해주세요");
			return;
		}
		$.ajax({
			url: "${pageContext.request.contextPath}/findID.msg",
			type: "post",
			dataType: "text",
			data: {
				id: $("#receiver").val()		
			}	
		}).done(function(resp) {
			console.log(resp);
			let add = true;
			if (resp == 'null') {
				alert("찾는 대상이 존재하지 않습니다");
				return;
			} else {
				$(".sendList").each(function() {
					if ($(this).text() == resp) {
						alert("이미 추가한 대상입니다..");
						$("#receiver").val('');
						add = false;
						return;
					}
				});
			}
			if (add) {
				var input = '<div class="row">';
				var input1 = '<i class="fas fa-minus mr-2 mt-1"></i><span class="sendList">' + resp + '</span></div>';
				var input2 = "<input type='hidden' name='sendList' class='d-none' value=" + resp +">";
				$("#sendList").append(input + input1 + input2);
				$("#receiver").val('');
			} 
		}).fail(function(resp) {
			alert("오류발생으로 탐색에 실패했습니다 다시 시도해주세요");
			console.log("실패");
		}); 
	});
	$("#receiver").on("keydown", function(e) {
		if (e.keyCode == 13) {
			e.preventDefault();
			if ($("receiver").val() == '') {
				alert("대상을 입력해주세요");
				return;
			}
			$.ajax({
				url: "${pageContext.request.contextPath}/findID.msg",
				type: "post",
				dataType: "text",
				data: {
					id: $("#receiver").val()		
				}	
			}).done(function(resp) {
				let add = true;
				if (resp == 'null') {
					alert("찾는 대상이 존재하지 않습니다");
					return;
				} else {
					$(".sendList").each(function() {
						console.log(resp);
						if ($(this).text() == resp) {
							alert("이미 추가한 대상입니다..");
							$("#receiver").val('');
							add = false;
							return;
						}
					});
				}
				if (add) {
					var input = '<div class="row">';
					var input1 = '<i class="fas fa-minus mr-2 mt-1"></i><span class="sendList">' + resp + '</span></div>';
					var input2 = "<input type='text' name='sendList' class='d-none' value=" + resp +">";
					$("#sendList").append(input + input1 + input2);
					$("#receiver").val('');
				} 
			}).fail(function(resp) {
				alert("오류발생으로 탐색에 실패했습니다 다시 시도해주세요");
				console.log("실패");
			}); 
		}
	});
	$("#findCompleted").on("click", function(e) {
		$(".foundedIDs").each(function() {
			$("#sendList").append("<div class='row' name='sendList'>");
			$("#sendList").append($(this).html());
			$("#sendList").append("</div>");
			$("#find").modal("hide");
			$("#findID").val('');
			$(".foundedIDs").html('');
		});	
	})
	$("#searchID").on("click", function() {
		searchID();
	});
	$("#findID").on("keydown", function(e) {
		if (e.keyCode == 13) {
			if ($("#findID").val() == '') {
				e.preventDefault();
				alert("대상을 입력해주세요");
				return;
			}
			searchID(e);
			$("#findID").val('');
			e.preventDefault();
		}
	})
   function searchID(e) {
		if ($("#findID").val() == '') {
			alert("대상을 입력해주세요");
			return;
		}
		$.ajax({
			url: "${pageContext.request.contextPath}/findID.msg",
			type: "post",
			dataType: "text",
			data: {
				id: $("#findID").val()		
			}	
		}).done(function(resp) {
			let add = true;
			if (resp == 'null') {
				alert("찾는 대상이 존재하지 않습니다");
			} else {
				$(".foundedIDs").each(function() {
					if ($(this).text() == resp) {
						alert("이미 추가한 대상입니다");
						$("#findID").val('');
						add = false;
						return;
					}
				});
			if (add) 
				var input = '<div><i class="fas fa-minus mr-2 mt-1"></i><span class="foundedIDs">' + resp + '</span></div>';
				console.log($(this).text());
				$("#foundedID").append(input);
				$("#findID").val('');
			} 
		}).fail(function(resp) {
			alert("오류발생으로 탐색에 실패했습니다 다시 시도해주세요");
			console.log(resp);
		}); 
    } 
    $("#cancel").on("click", function() {
    	history.back();
    })
    $("#cancelFind").on("click", function() {
		$("#find").modal("hide");
		$("#findID").val('');
		$(".foundedIDs").html('');
    })
  </script>
</body>
</html>

