<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">

<title>설문지 작성</title>
    
<style type="text/css">
.draggable.dragging {
  opacity: 0.5;
  border: 2px dashed #007bff;
  background-color: #f1f9ff;
}
</style>
    
</head>

<body>
	<div class="wrapper">
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<!-- 본문 영역 시작 -->
	<div class="content">
		<nav class="init-nav">
	  		<ol>
			    <li><a href="#" data-target=".basicInf" class="fw-bold text-primary">기본정보 등록</a></li>
			    <li><a href="#" data-target=".question">설문문항 작성</a></li>
			    <li><a href="#" data-target=".closing">맺음말 작성</a></li>
			    <li><a href="#" data-target=".complete">설문게시</a></li>
			</ol>
		</nav>
		
		<!-- 기본정보 등록 -->
		<div class="basicInf">
			<div class="card" style="width: 70%; height: auto;">
				<div id="informationArea">
					<h5 class="fw-bold mb-3">기본정보 등록</h5>
				    <div class="alert alert-info small mb-3">
				    	※ 설문지 제목을 입력해주세요.
				    </div>
					<input type="text" class="form-control mb-3" placeholder="설문지 제목 작성.." id="searchText">
					
					<div class="alert alert-info small mb-3">
				    	※ 설문 목적이나 참여 방법 등을 간단히 안내하는 인사말을 작성해 주세요.
				    </div>
					<textarea class="form-control" rows="5" cols="" placeholder="인사말 작성.."></textarea>
				</div>
			</div>
		</div>
		
		<!-- 설문지 작성 -->
		<div class="question d-none">
			<div class="card" style="width: 70%; height: auto;">
				<div id="questionArea">
					<h5 class="fw-bold mb-3">설문지 작성</h5>
	  			</div>
	  			
	  			<div class="d-flex justify-content-center">
	  				<div class="alert alert-danger small mb-3" id="questionNotice">
	  					우측 패널을 이용하여 설문 문항을 등록하여주세요.
	  				</div>
	  				<div class="saveBtn d-none" id="saveSurveyWrap">
		  				<button type="button" class="btn btn-primary mt-3" id="saveSurveyBtn">미리보기</button>
	  				</div>
	  			</div>	
			</div>
		</div>
		
		<!-- 맺음말 작성 -->
		<div class="closing d-none">
			<div class="card" style="width: 70%; height: auto;">
				<div id="closingArea">
					<h5 class="fw-bold mb-3">설문지 맺음말</h5>
				    <div class="alert alert-info small mb-3">
				    	※ 응답자에게 마지막으로 전달할 감사 메시지를 입력해 주세요.
				    </div>
      				<textarea class="form-control" rows="5" id="closingMessage" placeholder="맺음말 작성.."></textarea>
	  			</div>
			</div>
		</div>
		
		<!-- 완료 -->
		<div class="complete d-none">
			<div class="card" style="width: 70%; height: auto;">
				<div id="completeArea">
					<div class="text-center">
						<img src="${pageContext.request.contextPath}/resources/img/surveyFinish.png" class="img-fluid" style="max-width: 40%;" alt="설문완료_일러스트">
						<div class="alert alert-warning small mt-3">
				    		설문지 작성 고생하셨습니다.<br>
				    		※ 설문 결과조회, 수정, 삭제를 위한 비밀번호를 입력해 주세요.
				    	</div>
				    	<form id="dummyPasswordForm">
							<div class="input-group mb-3">
								<span class="input-group-text p-2">
									<img src="${pageContext.request.contextPath}/resources/img/icon/key-fill.svg" alt="비밀번호 아이콘" style="width: 1.2rem; height: 1.2rem;" />
								</span>
								<input type="password" class="form-control" placeholder="설문지 비밀번호 작성..." id="passwordInput" autocomplete="off">
							</div>
				    	</form>
					</div>
					<div class="saveBtn d-flex justify-content-center gap-3" id="compleSurveyWrap">
		  				<button type="button" class="btn btn-secondary rounded-pill px-3" id="surveyDetailBtn">미리보기</button>
		  				<button type="button" class="btn btn-primary rounded-pill px-3" id="surveyUploadBtn">설문게시</button>
	  				</div>
	  			</div>
			</div>
		</div>
		
		<!-- 설문지 작성 컨트롤러 -->
		<div class="ctrl-panel d-none" id="questionCtrl">
			<div class="d-flex flex-column align-items-center">
				<div class="addQuestionBtn text-center mb-2" id="objectV" style="cursor: pointer;">
		  			<img src="${pageContext.request.contextPath}/resources/img/button/objectVBtn.png" alt="객관식 세로" style="width: 100%;">
			  		<div class="mt-1 small fw-bold">객관식(세로)</div>
				</div>
				<div class="addQuestionBtn text-center mb-2" id="objectH" style="cursor: pointer;">
		  			<img src="${pageContext.request.contextPath}/resources/img/button/objectHBtn.png" alt="객관식 가로" style="width: 100%;">
			  		<div class="mt-1 small fw-bold">객관식(가로)</div>
				</div>
				<div class="addQuestionBtn text-center mb-2" id="subject" style="cursor: pointer;">
		  			<img src="${pageContext.request.contextPath}/resources/img/button/subjectBtn.png" alt="주관식" style="width: 100%;">
			  		<div class="mt-1 small fw-bold">주관식</div>
				</div>
				<div class="addQuestionBtn text-center" id="grid" style="cursor: pointer;">
		  			<img src="${pageContext.request.contextPath}/resources/img/button/gridBtn.png" alt="그리드" style="width: 100%;">
			  		<div class="mt-1 small fw-bold">그리드</div>
				</div>
			</div>
		</div>


		<!-- 응답자 정보 컨트롤러 -->
		<div class="ctrl-panel d-none" id="respInfoCtrl">
			<div class="d-flex flex-column align-items-center">
				<button type="button" class="init-btn addrespInfoBtn mb-2" id="respInfoV">객관식 문항 (세로) 추가</button>
				<button type="button" class="init-btn addrespInfoBtn mb-2" id="respInfoH">객관식 문항 (가로) 추가</button>
				<button type="button" class="init-btn addrespInfoBtn mb-2" id="respInfoSub">주관식 문항 추가</button>
			</div>
		</div>
		
		
   	</div>
	<!-- 본문 영역 종료 -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>

<script src="${pageContext.request.contextPath}/resources/js/form/create.js"></script>
</body>
</html>
