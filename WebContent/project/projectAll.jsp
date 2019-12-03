<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Projects</title>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Public+Sans&display=swap" rel="stylesheet">
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Public+Sans&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/themes/material_orange.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>
<style>
    *{
        font-family: 'Nanum Gothic', sans-serif;
        color: black;
    }
#footer{
	height:200px;
}
.btns{
	margin: 10px;
	text-align: right;
}
textarea{
	resize: none;
}
</style>
<body>
    <div class="container">
  <h2>내 프로젝트</h2>
  <div class="btns" id="btns">
  	<button type="button" class="btn btn-primary" id="modify" role="button" class="btn btn-secondary popover-test" title="Popover title" data-toggle="modal" data-target="#modifyModal" hidden>수정</button>
  	<button type="button" class="btn btn-danger" id="delete" hidden>삭제</button>
  	<button type="button" class="btn btn-dark" id="edit">편집</button>
  </div>
  <div class="card-deck">
    <div class="card bg-transparent">
      <div class="card-body text-center createProject">
        <button type="button" id="createProject" role="button" class="btn btn-secondary popover-test" title="Popover title" data-toggle="modal" data-target="#addModal">+</button>
      </div>
    </div>
     <c:forEach items="${projectList}" var="dto">
    <div class="card text-dark bg-white">
     <a href="${pageContext.request.contextPath}/viewProject.pro?seq=${dto.myPro_seq}" id="urlProject">
     <div class="card-body text-top bg-white"> 
        <c:choose> 
	        <c:when test="${loginInfo == dto.myPro_header}">
	        	<div class="checkboxDiv" id="checkboxDiv" hidden>
		        	<input type="checkbox" class="form-check-input" id="pro_seq" name="pro_seq" value="${dto.myPro_seq}">
		        </div>
	        </c:when>
        </c:choose>
        <p class="card-text" style="font-weight:bold;font-size:20px">${dto.myPro_title}</p>
      </div>
      <div class="card-body text-center bg-info">
        <p class="card-text" style="font-size:12px">${dto.myPro_contents}</p>
      </div> 
      <div class="card-body text-bottom bg-white" id="footer">
       <p class="card-text" style="font-size:12px;text-align:center">${dto.myPro_startDate} ~ ${dto.myPro_endDate}</p>
        <p class="card-text" style="font-size:12px;text-align:center">${dto.myPro_count}명 참여 중</p>
      </div>
       <div class="seq" id="hiddenSeq" hidden>${dto.myPro_seq}</div>
        </a>
    </div>
    </c:forEach>
  </div>
</div>  
 <div id="pro_seqAll" hidden>${pro_seqAll}</div>
<!-- 프로젝트 생성 Modal 시작 -->
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">프로젝트 생성</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" id="closeAdd">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/create.pro"
						method="post" id="frmProject">
						<div class="form-group">
							<label for="title" id="titleLbl" class="col-form-label">프로젝트명:</label>
							<input type="text" class="form-control" id="title" name="title">
							<p id="titleInput" hidden></p>
						</div>
						<div class="form-group">
							<label for="contents" id="contentsLbl" class="col-form-label">프로젝트
								내용:</label>
							<textarea class="form-control" id="contents" name="contents"></textarea>
							<p id="contentsInput" hidden></p>
						</div>
						<div class="form-group">
							<label for="startDate" id="startLbl" class="col-form-label">시작일자:</label>
							<input type="text" class="form-control" id="startDate"
								name="startDate" placeholder="시작일자" data-input>
								<p id="startDateInput" hidden></p>
						</div>
						<div class="form-group">
							<label for="endDate" id="endLbl" class="col-form-label">마감일자:</label>
							<input type="text" class="form-control" id="endDate"
								name="endDate" placeholder="마감일자" data-input>
								<p id="endDateInput" hidden></p>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="cancel" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" id="create" class="btn btn-primary">생성</button>
				</div>
			</div>
		</div>
	</div>
<!-- 프로젝트 생성 Modal 끝--> 
<!-- 프로젝트 수정 Modal  -->
<div class="modal fade" id="modifyModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">프로젝트 수정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" id="closeModify">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
<%-- 					<form action="${pageContext.request.contextPath}/modify.pro" --%>
<!-- 						method="post" id="frmModify"> -->
						<div class="form-group">
							<label for="titleMod" id="titleLbl" class="col-form-label">프로젝트명:</label>
							<input type="text" class="form-control" id="titleMod" name="titleMod">
							<p id="titleInputMod" hidden></p>
						</div>
						<div class="form-group">
							<label for="contentsMod" id="contentsLbl" class="col-form-label">프로젝트
								내용:</label>
							<textarea class="form-control" id="contentsMod" name="contentsMod"></textarea>
							<p id="contentsInputMod" hidden></p>
						</div>
						<div class="form-group">
							<label for="startDateMod" id="startLbl" class="col-form-label">시작일자:</label>
							<input type="text" class="form-control" id="startDateMod"
								name="startDateMod" placeholder="시작일자" data-input>
								<p id="startDateInputMod" hidden></p>
						</div>
						<div class="form-group">
							<label for="endDateMod" id="endLbl" class="col-form-label">마감일자:</label>
							<input type="text" class="form-control" id="endDateMod"
								name="endDateMod" placeholder="마감일자" data-input>
								<p id="endDateInputMod" hidden></p>
						</div>
<!-- 					</form> -->
				</div>
				<div class="modal-footer">
					<button type="button" id="cancel" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" id="modifyMod" class="btn btn-primary">완료</button>
				</div>
			</div>
		</div>
	</div>

<!-- 프로젝트 수정 Modal 끝 -->


     <script>     
     	//프로젝트 생성 모달 띄우기
     	$("#addModal").on("click", function(){
     		$("#title").val("");
        	$("#contents").val("");
        	$("#startDate").val("");
        	$("#endDate").val("");
     	});//각 입력창 초기화 셋팅
     	
     	$("#startDate").flatpickr({
            enableTime: false,
            dateFormat: "Y-m-d"
        });
        $("#endDate").flatpickr({
            enableTime: false,
            dateFormat: "Y-m-d"
        });//datapicker 인스턴스 생성
        
      //생성완료 버튼 클릭 시 이벤트 시작
        $("#create").on("click", function(){
        	if($("#title").val() == ""){
				title = $("#titleInput").html(0);
				alert("프로젝트명을 입력해 주세요.");
				return;
			}else if(!$.trim($("#contents").val())){
				endDate = $("#contentsInput").html(0);
				alert("프로젝트 내용을 입력해 주세요.");
				return;
			}else if($("#startDate").val() == ""){
				startDate = $("#startDateInput").html(0);
				alert("시작일자를 설정해 주세요.");
				return;
			}else if($("#endDate").val() == ""){
				endDate = $("#endDateInput").html(0);
				alert("마감일자를 설정해 주세요.");
				return;
			}else if($("#endDate").val() < $("#startDate").val()){
				endDate = $("#endDateInput").html(0);
				alert("마감일자는 시작일자 이후로 설정해 주세요.");
				return;
			}//각 입력창 null 값 체크 
			
			var result = (title*startDate*endDate*contents);
			if(result != 0){
				$("#frmProject").submit();
			}return;
        });//프로젝트 생성 submit
        
        // 편집 클릭 시 편집모드 활성화 
        $("#edit").on("click", function(){
        	$("#delete").attr("hidden", false);
        	$("#modify").attr("hidden", false);
			$(".checkboxDiv").attr("hidden", false);
        	
        	$("#edit").on("click", function(){
        		location.href = "${pageContext.request.contextPath}/view.pro";
        	});
        	
        	// 삭제 클릭 시 이벤트 
        	$("#delete").on("click", function(){
    			var lists = [];
    			  $("input[name='pro_seq']:checked").each(function(i){
    			   lists.push($(this).val());
    			  });
    			if(confirm("프로젝트 삭제는 복구가 불가합니다. 정말 삭제하시겠습니까?")){
    				$.ajax({
    	        		url: "${pageContext.request.contextPath}/deleteProject.pro",
    	        		data: {pro_seq : JSON.stringify(lists)},
    	        		type : "post", 
    	        		dataType: "json",
    	        	}).done(function(resp){
    	        		// 프로젝트 삭제 권한에 따른 결과값
    	        		if(resp.result == 'completed'){
    	        			alert("프로젝트 삭제가 완료되었습니다.");
    	        			location.href = "${pageContext.request.contextPath}/view.pro";
    	        		}else if(resp.result == 'inaccessible'){
    	        			alert("삭제권한이 없는 프로젝트입니다.");
    	        		}else if(resp.result =='fail'){
    	        			alert("프로젝트 삭제에 실패하였습니다.");
    	        		}
    	        	}).fail(function(a, b, c){
    	        		console.log(a);
    	        		console.log(b);
    	        		console.log(c);
    	        	});
    			}else{	
    				return;
    				}
    		});// 삭제 클릭 시 이벤트 끝
        	
        	 // 프로젝트 수정 클릭 시 이벤트
            $("#modify").on("click", function(){
            	$("#modify").attr('data-target', "#modifyModal");
            	
            	var pro_seq = $("input[name='pro_seq']:checked").val();
            	
            	var checkCount = $("input[name='pro_seq']:checked").length;
            	if(checkCount > 1){
            		alert("수정은 한 번에 한 개의 프로젝트만 가능합니다.");
            		$("#modify").attr('data-target', "");
            	}            	
            	// 체크한 프로젝트 내용 받아오기 
            	$.ajax({
            		url: "${pageContext.request.contextPath}/detailProject.pro",
            		data: {pro_seq : pro_seq},
            		type : "post", 
            		dataType: "json",
            	}).done(function(resp){
            		console.log(resp);
            		console.log(resp.pro_seq);
            		console.log(resp.pro_title);
            		console.log(resp.pro_contents);
            		console.log(resp.pro_startDate);
            		console.log(resp.pro_endDate);
            		
            		$("#titleMod").val(resp.pro_title);
            		$("#contentsMod").val(resp.pro_contents);
            		$("#startDateMod").val(resp.pro_startDate);
            		$("#endDateMod").val(resp.pro_endDate);
            		
            		$("#startDateMod").flatpickr({
                        enableTime: false,
                        dateFormat: "Y-m-d"
                    });
                    $("#endDateMod").flatpickr({
                        enableTime: false,
                        dateFormat: "Y-m-d"
                    });//datapicker 인스턴스 생성
                 // 체크한 프로젝트 내용 받아오기 끝
                    
                    //프로젝트 수정 완료 클릭 시 이벤트 
                    $("#modifyMod").on("click", function(){
                    	if($("#titleMod").val() == ""){
            				titleMod = $("#titleInputMod").html(0);
            				alert("프로젝트명을 입력해 주세요.");
            				return;
            			}else if(!$.trim($("#contentsMod").val())){
            				endDateMod = $("#contentsInputMod").html(0);
            				alert("프로젝트 내용을 입력해 주세요.");
            				return;
            			}else if($("#startDateMod").val() == ""){
            				startDateMod = $("#startDateInputMod").html(0);
            				alert("시작일자를 설정해 주세요.");
            				return;
            			}else if($("#endDateMod").val() == ""){
            				endDateMod = $("#endDateInputMod").html(0);
            				alert("마감일자를 설정해 주세요.");
            				return;
            			}else if($("#endDateMod").val() < $("#startDateMod").val()){
            				endDateMod = $("#endDateInputMod").html(0);
            				alert("마감일자는 시작일자 이후로 설정해 주세요.");
            				return;
            			}//각 입력창 null 값 체크 
            			
            			var result = (titleMod*startDateMod*endDateMod*contentsMod);
            			if(result != 0){
            				console.log(pro_seq);
            				console.log($("#titleMod").val());
            				console.log($("#contentsMod").val());
            				console.log($("#startDateMod").val());
            				console.log($("#endDateMod").val())
            				
            				$.ajax({
            					url: "${pageContext.request.contextPath}/modifyProject.pro",
            					data: {
            						pro_seq: pro_seq,
            						title: $("#titleMod").val(),
            						contents: $("#contentsMod").val(),
            						startDate: $("#startDateMod").val(),
            						endDate: $("#endDateMod").val()            						
            					},
            					dataType: "json",
            					type : "post", 
            					
            				}).done(function(resp){
            					// 프로젝트 수정 권한에 따른 결과값
            					if(resp.result == 'completed'){
            	        			alert("프로젝트 수정이 완료되었습니다.");
            	        			location.href = "${pageContext.request.contextPath}/view.pro";
            	        		}else if(resp.result == 'inaccessible'){
            	        			alert("수정권한이 없는 프로젝트입니다.");
            	        		}else if(resp.result =='fail'){
            	        			alert("프로젝트 수정에 실패하였습니다.");
            	        		}
            				}).fail(function(a, b, c){
            					console.log(a);
            					console.log(b);
            					console.log(c);
            				});
            			}return;
                    });
                    // 프로젝트 수정 완료 클릭 시 이벤트 끝
            	}).fail(function(a, b, c){
            		console.log(a);
            		console.log(b);
            		console.log(c);
            	});
            });// 프로젝트 수정 클릭 시 이벤트 끝
        }); // 편집 클릭 시 편집모드 활성화 끝  
     </script>
</body>
</html>