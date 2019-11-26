<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<style>
#wrapper {
	border: 2px solid;
	border-color: darkseagreen;
	border-radius: 10px;
	width: 250px;
	margin: auto;
	text-align: center;
}

#logo {
	color: darkseagreen;
	font-weight: 700;
	margin-top: 5px;
	margin-bottom: 5px;
}

#inputdiv>input {
	width: 80%;
}

#logbtn>input {
	border: 2px solid darkseagreen;
	border-radius: 5px;
	color: darkseagreen;
	background-color: white
}

p {
	display: inline;
}
</style>
</head>
<body>
	<form action="" id="">
		<div id="wrapper">
			<div class="indexDiv">내정보 보기</div>
			<div id="idDiv">
				<div class="textDiv">아이디 : ${dto.id}</div>
			</div>

			<div id="nameDiv">
				<div class="textDiv">이름 : ${dto.name}</div>
			</div>
			<div id="phoneDiv">
				<div class="textDiv">전화번호 : ${dto.phone}</div>
				<div>
				</div>
			</div>
			<div id="emailDiv">
				<div class="textDiv">이메일 : ${dto.email}</div>
				<div>
				</div>
			</div>
			<div id="addressDiv">
				<div class="textDiv">우편번호 : ${dto.zipcode}</div>
				<div>
				</div>
			</div>
			<div class="addressDiv2">
				<div class="textDiv">주소1 : ${dto.address1}</div>
				<div>
				</div>
			</div>
			<div class="addressDiv2">
				<div class="textDiv">주소2 : ${dto.address2}</div>
				<div>
				</div>
			</div>
			<div class="lodBtn">
				<button type="button" id="back">돌아가기</button>
				<button type="reset" id="membermodify">정보수정</button>

			</div>

		</div>
	</form>
	
	<script>
		$("#membermodify").on("click",function(){
			location.href="memberModifyView.member";
		})
		$("#back").on("click",function(){
			location.href="index.jsp";
		})
	</script>



</body>
</html>
