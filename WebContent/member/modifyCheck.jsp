<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<c:choose>
		<c:when test="${modifyCheck != null}">
			<script>
				alert( "회원정보가 수정되었습니다."); 
				window.parent.location.href="../index.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert( "수정에 실패하셨습니다."); 
				window.parent.location.href="../index.jsp";
			</script>
		
		</c:otherwise>
	</c:choose>

</body>
</html>