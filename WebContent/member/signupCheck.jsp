<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
	<c:choose>
		<c:when test="${name != null}">
			<script>
				alert( "${name}" + " 님 가입해주셔서 감사합니다. 환영합니다"); 
				location.href="../index.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert( "가입에 실패하셨습니다."); 
				location.href="../index.jsp";
			</script>
		
		</c:otherwise>
	</c:choose>

</body>
</html>