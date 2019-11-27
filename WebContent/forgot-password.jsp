<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>SB Admin 2 - Forgot Password</title>
  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  <!-- Custom fonts for this template-->
  <link href="resources/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-primary">
  <div class="container">
    <!-- Outer Row -->
    <div class="row justify-content-center">
      <div class="col-xl-10 col-lg-12 col-md-9">
        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-2">Forgot Your Password?</h1>
                    <p class="mb-4">We get it, stuff happens. Just enter your email address below and we'll send you a link to reset your password!</p>
                  </div>
                  <form class="user">
                    <div class="form-group">
                      <input type="email" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Enter Email Address...">
                    </div>
                    <a class="btn btn-primary btn-user btn-block" id="btn_forgetEmailSend">
                      Reset Password
                    </a>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="register.html">Create an Account!</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="login.jsp">Already have an account? Login!</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
  $("#btn_forgetEmailSend").on("click",function(){
		var email = $("#exampleInputEmail").val();
		if(email != ""){
			$.ajax({ 
				url: "emailCheck.login", 
				data: { email: email }, 
				method: "post", 
				dataType: "json" 
			}).done(function(data){ 
				console.log(data);
				if(data){
					alert("성공적으로 이메일을 전송하였습니다 이메일을 확인해주세요.");
					$(location).attr("href", "/Project/login.jsp");
				}else{
					alert("이메일을 전송하지 못했습니다. 작성하신 이메일을 확인해주세요.");
				}
			}).fail(function(){ 
				alert("서버오류!!");
				$(location).attr("href", "/login.jsp");
			});
		}else{
			alert("이메일을 입력해주세요.");
		}
  })
  </script>
</body>
</html>
