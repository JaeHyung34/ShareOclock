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

<title>관리자 페이지</title>
<jsp:include page="/cdn/cdn.jsp" flush="false" />
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" type="text/css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/js/dataTables.semanticui.min.js" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.js" type="text/css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js" type="text/css"/>

<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.css">
<link rel="stylesheet"
   href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css">

<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" type="text/javascript" ></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" type="text/javascript" ></script>	
<script>
        jQuery(function($){
            $("#foo-table").DataTable();
        });
        
       
    </script>
</head>

<body id="page-top">
 	<c:choose>
      <c:when test="${ManagerInfo == null}">
         <script>
			location.href="../index.jsp";
         </script>
      </c:when>
    </c:choose>
			<!-- 메인 콘텐츠 시작 부분 -->
			<div class="container">
				<h2>Black List</h2>
				<p>블랙리스트 회원 정보</p>
				<form action="${pageContext.request.contextPath}/delete.black"
					method="post" id="frm">
					<table class="table table-bordered text-center" id="foo-table">
						<thead class="thead-dark">
							<tr>
								<th class="text-center">번호</th>
								<th class="text-center">이름</th>
								<th class="text-center">아이디</th>
								<th class="text-center">선택</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="list" varStatus="status">
								<tr>
									<td>${status.count }</td>
									<td>${list.bl_name }</td>
									<td><button type="button" class="blackInfo btn btn-link"
											id="${list.bl_email }" data-toggle="modal"
											data-target="#exampleModal" data-whatever="${list.bl_email }">${list.bl_email }</button>
									<td><input type="checkbox" class="blackCheck"
										name="blackCheck" value="${list.bl_email }"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="d-flex justify-content-center"><ul class="pagination">${pages}</ul></div>
				</form>

				<button type="submit" id="deleteBtn" class="btn btn-sm btn-primary">삭제</button>
			</div>


			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">회원 정보</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form action="${pageContext.request.contextPath }/modify.black" method="post" id="modifyBtn">
								<div class="form-group">
									<label for="recipient-email" class="col-form-label">회원
										아이디</label> <input type="text" class="form-control" id="black-email"
										name="black-email" readonly>
								</div>
								<div class="form-group">
									<label for="recipient-name" class="col-form-label">회원
										이름</label> <input type="text" class="form-control" id="black-name"
										name="black-name" readonly>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">사유</label>
									<textarea class="form-control" id="black-reason"
										name="black-reason"></textarea>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-sm btn-light" id="modify"
										>완료</button>
									<button type="button" class="btn btn-sm btn-light"
										data-dismiss="modal">닫기</button>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>



			<script>
			
				$("#modify").on("click",function(){
					$("#modifyBtn").submit();
				});
				$("#deleteBtn").on(
						"click",
						function() {
							if ($("input:checkbox[class='blackCheck']").is(
									":checked") == true) {
								var result = confirm("정말 삭제하시겠습니까?");
								if (result) {
									$("#frm").submit();
								} else {
									return;
								}
							} else {
								alert("선택한 회원이 없습니다. 회원을 선택해주세요.");
							}

						});

				$(".blackInfo").on("click", function() {
					var i = $(this).attr("id");
					$.ajax({
						url : "detail.black",
						dataType : "json",
						data : {
							email : i
						}
					}).done(function(resp) {
						$("#black-email").val(resp.bl_email);
						$("#black-name").val(resp.bl_name);
						$("#black-reason").val(resp.bl_reason);
					}).fail(function(resp) {
						console.log("실패");
					});
				});

				$("#addBlackMember").on("click", function() {

					var bl_email = document.getElementById("mail");
					var email1 = bl_email.value;
					var bl_name = $("#name").val();
					var bl_reason = $("#reasontext").val();
					console.log(email1);
					console.log(bl_name);
					console.log(bl_reason);
					$.ajax({
						url : "Newblack.black",
						dataType : "json",
						data : {
							email : email1,
							name : bl_name,
							reason : bl_reason
						}
					}).done(function(resp) {
						$("#exampleModal1").css("display", "block");
						console.log(resp);
					}).fail(function() {

						$("#exampleModal1").slideUp(2000);
						$(".modal-backdrop").attr("class", "");
						alert("회원이 아닙니다. 다시 입력해주세요.");
					});

				});
			</script>
			<!-- 메인 콘텐츠 끝 -->
		</div>

	</div>

</body>
</html>

