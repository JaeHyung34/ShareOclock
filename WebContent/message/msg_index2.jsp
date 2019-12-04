<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			<!-- 메인 콘텐츠 시작 부분 -->
			<div id="content" class="container-fluid mx-xs-0 my-5 mx-md-5">

				<!-- md 이상일 때의 쪽지함 -->
				<div class="d-none d-md-block row">
					<h2>쪽지함</h2>
					<!--  <p>${sessionScope.loginInfo}의 쪽지함입니다. 읽지 않은 쪽지는 현재 0개 입니다</p> -->
					<p>의 쪽지함입니다. 읽지 않은 쪽지는 현재 0개 입니다</p>
					<div class="col-11">
					<table class="table table-hover ">
						<thead>
							<tr>
								<th><input id="selectAll" type="checkbox"></th>
								<th class="">보낸이</th>
								<th class="">내용</th>
								<th class="">날짜</th>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="i" varStatus="idx">
								<tr>
									<td><input class="ck" name="ck" value="${i.message_seq}"
										type="checkbox"></td>
									<td>${i.message_sender}</td>
									<td class="msgContent"><a id="${i.message_seq}"
										href="${pageContext.request.contextPath}/detailView.msg?seq=${i.message_seq}&entry=${entry}">
											${i.message_contents}</a> <c:if test="${i.message_read == \"n\"}">
											<span class="badge badge-pill">new</span>
										</c:if></td>
									<td class="">${i.message_time}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<nav >
						<ul class="pagination pagination-lg d-flex justify-content-center">
							${pagination}
						</ul>
					</nav>
					</div>
					<!--  검색기능 -->
					<form action="${pageContext.request.contextPath}/search.msg" method="post">
					<div class="row">
						<div class="col-12 d-flex justify-content-center">
							<select name="option">
								<option value="sender" <c:if test="${option.equals(\"sender\")}"> selected</c:if>>작성자</option>
								<option value="content"
								<c:if test="${option.equals(\"content\")}"> selected</c:if>>내용</option>
							</select>	
							<input type="text" name="search" value="${searchWord}">
							<input id="doSearch" type="submit" value="검색">
						</div>
					</div>	
					</form>
					<div id="btns" class="row mt-2">
						<div class="col-md-3">
							<input id="writeMsg" type="button" value="쪽지 쓰기">
						</div>
						<div class="col-md-3">
							<input id="readAll" type="button" value="모두 읽음으로 표시">
						</div>
						<div class="col-md-3">
							<input id="delete" type="button" value="삭제">
						</div>
						<div class="d-md-block col-md-3"></div>
					</div>
				</div>
				<!-- md이상일 때에 보이는 부분 끝 -->

				<!-- 모바일 화면 -->
				<div class="d-md-none">
					<h3>쪽지함</h3>
					<c:forEach items="${list}" var="i" varStatus="idx">
						<div id="b" class="row mb-2">
							<div class="col-1">${idx.index}</div>
							<div class="col-7">💬${i.message_sender}
								<c:if test="${i.message_read == \"n\"}">
									<span class="badge badge-danger badge-pill">new</span>
								</c:if>
							</div>
							<div class="col-4">
								<small>${i.message_mTime}</small>
							</div>
							<div class="col-12 mContent">
								<a
									href="${pageContext.request.contextPath}/detailView.msg?seq=${i.message_seq}&entry=${entry}">${i.message_mContents}</a>
							</div>
							<div class="w-100"></div>
						</div>
					</c:forEach>
					<nav class="w-100">
						<ul class="pagination d-flex justify-content-center">${pagination}</ul>
					</nav>
					<div class="row mb-4">
						<div class="col-6">
							<a href="${pageContext.request.contextPath}/message/sendMsg.jsp?entry=${entry}">쪽지
								쓰기</a>
						</div>
						<div class="col-6">
							<small>모두 읽음으로 표시</small>
						</div>
					</div>
				</div>
				<!-- 모바일 화면 끝 -->
			</div>
			<!-- 메인 콘텐츠 끝 -->

	<script>
    // 쪽지 쓰기
    $("#writeMsg").on("click", function() {
    	location.href="${pageContext.request.contextPath}/message/sendMsg.jsp?entry=${entry}";
    })
    // 쪽지 쓰기 - 끝
    // 모두 읽음으로 표시
	$("#readAll").on("click", function() {
		location.href="${pageContext.request.contextPath}/readAll.msg"
	})	
    // 모두 읽음으로 표시 - 끝
    // 삭제 
    $("#delete").on("click", function() {
    	var ckDel = "${pageContext.request.contextPath}/checkedDelete.msg?";
		if ($(".ck:checked").length === 0) {
    		alert("삭제할 대상을 선택해 주세요");
    		return;
		}
     	$(".ck:checked").each(function() {
			ckDel += "seq=" + this.value + '&';
    	})
		location.href=ckDel + "entry=${entry}";

    })
    // 삭제 - 끝
      // 전체 선택
          $("#selectAll").on("click", function() {
			if (this.checked) {
				$(".ck").prop("checked", true);	
			} else {
				$(".ck").prop("checked", false);
			}
          })
      // 전체 선택 - 끝
    </script>

