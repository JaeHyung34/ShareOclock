<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>

	<div id="result">

		<c:choose>
			<c:when test="${result == 0}">
			이미 사용중인 아이디 입니다.
			<button id="close">Close</button>
				<script>
					document.getElementById("close").onclick = function() {
						$(opener.document).find("#idInput").val("");
						$(opener.document).find("#idCheck").val("");
						window.close();
					};
				</script>
			</c:when>
			<c:otherwise>
			사용 가능한 아이디 입니다.
			<button id="use">Use</button>
				<button id="cancel">Cancel</button>
				<script>
					document.getElementById("use").onclick = function() {
						$(opener.document).find("#idCheck").val("true");
						window.close();
					};
					document.getElementById("cancel").onclick = function() {
						$(opener.document).find("#id").val("");
						$(opener.document).find("#idCheck").val("");
						window.close();
					};
				</script>
			</c:otherwise>
		</c:choose>

	</div>

</body>
</html>