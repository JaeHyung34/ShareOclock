<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Register</title>

  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/resources/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">내 정보 수정하기!</h1>
              </div>
              <form class="user" onsubmit="return validate();" action="modify.member" method="post">
                <div class="form-group">
                  <input type="email" name=mb_email readonly="readonly" class="form-control form-control-user" id="modifyInputEmail" placeholder="이메일">
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" autocomplete="off"  name=mb_pw class="form-control form-control-user" id="modifyInputPassword" placeholder="비밀번호">
                  </div>
                  <div class="col-sm-6">
                    <input type="password"  autocomplete="off" class="form-control form-control-user" id="modifyRepeatPassword" placeholder="비밀번호 확인">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" name=mb_nickName readonly="readonly" class="form-control form-control-user" id="modifyInputID" placeholder="아이디">
                  </div>
                  <div class="col-sm-6">
                  <input type="text" name=mb_name  class="form-control form-control-user" id="modifyInputName" placeholder="이름">
                  </div>
                </div>
                 <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" name=mb_phone class="form-control form-control-user" id="modifyInputPhone" placeholder="전화번호">
                  </div>
                  <div class="col-sm-6">
                  <input type="text" name=mb_group class="form-control form-control-user" id="modifyInputGroup" placeholder="소속(소속 없으면 빈공란)">
                  </div>
                </div>
                <button class="btn btn-primary btn-user btn-block" id=btn_signInfoSend>
                  	수정하기
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
	<script>
		  function validate() {
			var getMail =  RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
		    var getPw= RegExp(/^[A-Za-z0-9]{6,15}$/);
		    var getId = RegExp(/^[A-Za-z0-9]{5,12}$/);
		    var getName = RegExp(/^[가-힣A-Za-z]+$/);
		    var getPhone = RegExp(/^\d{2,3}\d{3,4}\d{4}$/); //형식 설정


		    //이메일 공백 확인
		    if($("#modifyInputEmail").val() == ""){
		      alert("이메일 입력해주세요");
		      $("#modifyInputEmail").focus();
		      return false;
		    }
		    //이메일 유효성 검사
		    if(!getMail.test($("#modifyInputEmail").val())){
		      alert("이메일 형식에 맞게 작성해주세요.");
		      $("#modifyInputEmail").val("");
		      $("#modifyInputEmail").focus();
		      return false;
		    }
		    //비밀번호 공백 확인
		    if($("#modifyInputPassword").val() == ""){
		      alert("비밀번호 입력해주세요");
		      $("#modifyInputPassword").focus();
		      return false;
		    }
		    //비밀번호 유효성 검사
		    if(!getPw.test($("#modifyInputPassword").val())) {
			    alert("6~15 자리로 입력해주세요.(영어,숫자만 가능합니다.)");
			    $("#modifyInputPassword").val("");
			    $("#modifyInputPassword").focus();
			    return false;
		    }
		    //이메일과 비밀번호랑 같은지
		    if ($("#modifyInputEmail").val()==($("#modifyInputPassword").val())) {
		    alert("이메일과 비밀번호가 같습니다 확인해주세요.");
		    $("#modifyInputPassword").val("");
		    $("#modifyInputPassword").focus();
		    return false;
		    }
		    //비밀번호와 확인이 같은지
		    if($("#modifyInputPassword").val() != ($("#modifyRepeatPassword").val())){ 
		    alert("비밀번호가 같지않습니다.");
		    $("#modifyInputPassword").val("");
		    $("#modifyRepeatPassword").val("");
		    $("#modifyInputPassword").focus();
		    return false;
		   }

		   //아이디 공백 확인
		    if($("#modifyInputID").val() == ""){
		      alert("아이디를 입력해주세요");
		      $("#modifyInputID").focus();
		      return false;
		    }
		    //아이디 유효성 검사
		    if(!getId.test($("#modifyInputID").val())){
		      alert("5~12 자리수로 아이디를 입력해주세요.")
		      $("#modifyInputID").val("");
		      $("#modifyInputID").focus();
		      return false;
		    }
		    
		    //이름 공백 확인
		    if($("#modifyInputName").val() == ""){
		        alert("이름을 입력해주세요");
		        $("#modifyInputName").focus();
		        return false;
		      }
		    //이름 유효성 검사
		    if (!getName.test($("#modifyInputName").val())) {
		      alert("이름을 제대로 입력해주세요");
		      $("#modifyInputName").val("");
		      $("#modifyInputName").focus();
		      return false;
		    }
		    //전화번호 공백 확인
		    if($("#modifyInputPhone").val() == ""){
		        alert("아이디를 입력해주세요");
		        $("#modifyInputPhone").focus();
		        return false;
		      }
		    //전화번호 유효성 검사
		    if (!getPhone.test($("#modifyInputPhone").val())) {
		      alert("전화번호를 제대로 입력해주세요");
		      $("#modifyInputPhone").val("");
		      $("#modifyInputPhone").focus();
		      return false;
		    }
		  	return true;
		  }
		  $(document).ready(function(){
			  var loginInfo = "${loginInfo}";
			  if(loginInfo != "" && loginInfo != null){
					$.ajax({ 
						url: "myInfo.member", 
						method: "post", 
						dataType: "json" 
					}).done(function(data){ 
						console.log(data);
						if(data){
							$("#modifyInputEmail").val(data.mb_email);
							$("#modifyInputID").val(data.mb_nickname);
							$("#modifyInputName").val(data.mb_name);
							$("#modifyInputPhone").val(data.mb_phone);
							$("#modifyInputGroup").val(data.mb_group);
						}
					}).fail(function(){ 
						alert("서버오류!!");
					});
		    	}		  })
		 
  </script>
  <!-- Bootstrap core JavaScript   <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
  <!-- Core plugin JavaScript  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>  -->
  <!-- Custom scripts for all pages  <script src="js/sb-admin-2.min.js"></script>-->

</body>

</html>
