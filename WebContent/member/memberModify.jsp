
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#wrapper {
	border: 2px solid darkseagreen;
	color: darkseagreen;
	width: 600px;
	margin: auto;
}

#wrapper>div>div {
	display: inline-block;
	margin-top: 5px;
	margin-bottom: 5px;
}

button {
	border-color: darkseagreen;
	background-color: white;
	border-radius: 10px;
}
input[type=button]{

	border-color: darkseagreen;
	background-color: white;
	border-radius: 10px;
}

.textDiv {
	width: 130px;
	text-align: right;
}

.indexDiv {
	text-align: center;
	font-weight: 700;
	margin-top: 10px;
	margin-bottom: 10px;
	font-size: 20px;
}

.lodBtn {
	text-align: center;
	margin-top: 5px;
	margin-bottom: 10px;
}

.add2 {
	width: 300px;
}
</style>

</head>
<body>

	<form action="memberModify.member" method="get" id="frm">

		<div id="wrapper">
			<div class="indexDiv">회원 정보 수정</div>
			<div id="idDiv">
				<div class="textDiv">아이디 :</div>
				<div>
					<input type="text" id="idInput" name="id" readonly>
				</div>
			</div>
			<div id="pwDiv">
				<div class="textDiv">패스워드 :</div>
				<div id="pwInputDiv">
					<input type="password" id="pwInput" name="pw">
				</div>
				<div id="PWinput"></div>
			</div>
			<div id="pwOkDiv">
				<div class="textDiv">패스워드 확인 :</div>
				<div id="pwOkInputDiv">
					<input type="password" id="pwOkInput">
				</div>
				<div id="PWOkinput"></div>
			</div>
			<div id="nameDiv">
				<div class="textDiv">이름 :</div>
				<div>
					<input type="text" id="nameInput" name="name">
				</div>
			</div>
			<div id="phoneDiv">
				<div class="textDiv">전화번호 :</div>
				<div>
					<input type="text" id="phoneInput" name="phone">
				</div>
			</div>
			<div id="emailDiv">
				<div class="textDiv">이메일 :</div>
				<div>
					<input type="text" id="emailInput" name="email">
				</div>
			</div>
			<div id="addressDiv">
				<div class="textDiv">우편번호 :</div>
				<div>
					<input type="text" id="postcode" placeholder="우편번호" name="zipcode">
					<button onclick="execDaumPostcode()" type="button">찾기</button>
				</div>
			</div>
			<div class="addressDiv2">
				<div class="textDiv">주소1 :</div>
				<div>
					<input class="add2" type="text" id="jibunAddress"
						placeholder="지번주소" name="address1">
				</div>
			</div>
			<div class="addressDiv2">
				<div class="textDiv">주소2 :</div>
				<div>
					<input class="add2" type="text" id="detailAddress"
						placeholder="상세주소" name="address2">
				</div>
			</div>
			<div class="lodBtn">

				<input type="button" id="back" value=돌아가기>
				<button  id="modifyBtn">회원 수정</button>

			</div>

		</div>
	</form>

	<script>
		$("#idInput").val("${dto.id}");
		$("#nameInput").val("${dto.name}");
		$("#phoneInput").val("${dto.phone}");
		$("#emailInput").val("${dto.email}");
		$("#postcode").val("${dto.zipcode}");
		$("#jibunAddress").val("${dto.address1}");
		$("#detailAddress").val("${dto.address2}");
		
		$("#modifyBtn").on("click", function() {

			var input = $("input");

			for (i = 0; i < input.length; i++) {
				if ($(input[i]).val() == "") {
					alert("양식을 모두 채워주세요!");
					return;
				}
			}

			frm.submit();

		});
		
		
		$("#pwInput").on("blur", function() {
			var regex = /^(\w){6,12}$/;
			var pwd = $("#pwInput").val();
			var result = regex.exec(pwd);

			if (result == null) {
				$("#PWinput").text("영문과 숫자 6-12");
				$("#pwInput").val("");
			} else {
				$("#PWinput").text("");
			}
		});

		$("#pwOkInput").on("blur", function() {
			if ($("#pwInput").val() == $("#pwOkInput").val()) {
				$("#PWOkinput").text("패스워드가 일치합니다.")
			} else {
				$("#PWOkinput").text("패스워드가 일치하지 않습니다.");
				$("#pwOkInput").val("");
			}
		});

		$("#back").on("click", function() {
			location.href = "myInfo.member";
		});
		
		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("jibunAddress").value = data.jibunAddress;

							document.getElementById("detailAddress")
									.focus();

						}
					}).open();
		}
	</script>

</body>
</html>