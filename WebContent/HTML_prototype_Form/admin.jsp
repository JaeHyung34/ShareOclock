<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>admin</title>
  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet" type="text/css">
  <link href="css/index_.css" rel="stylesheet" type="text/css">
  <link href="css/message_index.css" rel="stylesheet" type="text/css">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    
  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  
    <!-- Sidebar -->
    <ul class="navbar-nav sidebar sidebar-dark accordion d-none d-md-block bg-gray-800" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
        <div class="sidebar-brand-icon">
          <i class="fas fa-radiation"></i>
        </div>
        <div class="sidebar-brand-text mx-3">신선놀음 <sup>1.5</sup></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="#">
          <i class="fas fa-project-diagram"></i>
          <span>새 프로젝트
            <span class="badge badge-danger badge-pill">new</span>
          </span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="#">
          <i class="fas fa-project-diagram"></i>
          <span>쪽지함</span>
            <span class="badge badge-danger badge-pill">new</span>
        </a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">재형</div>

      <!-- Nav Item - 로그인 -->
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>정재형</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading - 달력 -->
      <div class="sidebar-heading">은비</div>

      <!-- Nav Item -->
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>조은비</span></a>
      </li>

      <!-- Heading - 게시판 -->
      <div class="sidebar-heading">유진</div>

      <!-- Nav Item -->
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>전유진</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">익호</div>

      <!-- Nav Item - 관리자 페이지 -->
      <li class="nav-item">
        <a class="nav-link" href="admin.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>신익호</span></a>
      </li>



      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">내 정보</div>

      <!-- Nav Item - Pages Collapse Menu --> 
       <li class="nav-item"> 
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMyInfo">
          <i class="fas fa-fw fa-folder"></i>
          <span>내 정보 보기 </span>
        </a>
        <div id="collapseMyInfo" class="collapse"  data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">정보 :</h6>
            <a class="collapse-item mb-" href="#">내 정보 수정</a>
            <a class="collapse-item bg-info" href="#">로그아웃</a>
          </a>
        </div>
      </li>
      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">임시</div>

      <!-- Nav Item - Pages Collapse Menu --> 
       <li class="nav-item"> 
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div id="collapsePages" class="collapse" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Login Screens:</h6>
            <a class="collapse-item" href="login.html">Login</a>
            <a class="collapse-item" href="register.html">Register</a>
            <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">Other Pages:</h6>
            <a class="collapse-item" href="404.html">404 Page</a>
            <a class="collapse-item" href="blank.html">Blank Page</a>
          </div>
        </div>
      </li>

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
        <nav class="navbar navbar-expand navbar-light bg-gray-800 topbar mb-4 static-top shadow w-100 d-xs-block d-md-none">

          <!-- Sidebar Toggle (Topbar) -->
          <ul class="navbar-nav">
            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown">
                <i class="fa fa-bars"></i>
                <span id="msgAlert" class="badge badge-danger badge-counter">N</span>
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                 회원관리
                
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  프로젝트 관리 
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  게시물 관리 
                  <span id="alert" class="badge badge-danger badge-counter">N</span>
                </a>
              </div>
            </li>
          </ul>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

           <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link" href="message_index.html">
                <i class="fas fa-bell fa-fw"></i>
                <!-- Counter - Alerts -->
                <span id="msgAlert" class="badge badge-danger badge-counter">N</span>
              </a>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown">
                <img class="img-profile rounded-circle" src="img/default_profile.png">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  내 정보 보기 
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item bg-info" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  로그아웃 
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

    <!-- 메인 콘텐츠 시작 부분 -->

     <div class="container">
  <h2>Striped Rows</h2>
  <p>The .table-striped class adds zebra-stripes to a table:</p> 
  <form action="${pageContext.request.contextPath}/delete.black" method="post" id="frm">           
  <table class="table table-striped">
    <thead>
      <tr>
        <th>이름</th>
        <th>사유</th>
        <th>아이디</th>
        <th>선택</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${list }" var="list">
	<tr>
		<td>${list.bl_name }</td>
		<td>${list.bl_reason }</td>
		<td>${list.bl_email }</td>
		<td><input type="checkbox" id="blackCheck"name=blackCheck value="${list.bl_email }"></td>
	</tr>
	</c:forEach>
    </tbody>
  </table>
  </form>
	<button type="button" id="btn">수정</button>
	<button type="submit" id="deleteBtn">삭제</button>
</div>	
	<script>
		$("#btn").on("click",function(){
			location.href="blackmember/NewBlack.jsp";
		});
		$("#deleteBtn").on("click",function(){
			$('input:checkbox[name="blackCheck"]').each(function(){
				console.log($("#blackCheck").val());
				this.checked = true;
				$("#frm").submit();
			});
		});
	</script>
        
    <!-- 메인 콘텐츠 끝 -->

    </div>
</div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

  <script src="js/index_.js"></script>
    <script>
        let modContent;
        var content = $("#msgContent2").text();
            console.log(content);
        if (content.length > 10)  {
            let arr = Array.from($("#msgContent2").text());
            console.log(arr);
            for (let i = 0; i < 10; i++) {
              console.log(arr[i]);
              modContent += arr[i]; 
            }
            console.log(modContent + "...");
            document.getElementById("msgContent2").innerHTML = modContent + "...";
        }
    </script>
  </body>
</html>

        