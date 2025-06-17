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

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>

<body>
	<div class="wrapper">
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<!-- 본문 영역 시작 -->
	<div class="content">
		<nav class="init-nav">
	  		<ol>
			    <li><a href="#" data-target=".basicInf" class="fw-bold text-primary">기본정보 등록</a></li>
			    <li><a href="#" data-target=".question">설문지 작성</a></li>
			    <li><a href="#" data-target=".respInfo">응답자 정보</a></li>
			    <li><a href="#" data-target=".giftInfo">경품 추첨</a></li>
			    <li><a href="#" data-target=".closing">맺음말 작성</a></li>
			    <li><a href="#" data-target=".complete">완료</a></li>
			</ol>
		</nav>
		
		<!-- 기본정보 등록 -->
		<div class="basicInf">
			<div class="card" style="width: 50%; height: auto;">
				<div id="informationArea">
					<div class="mb-4">
						<h5 class="fw-bold">설문지 제목을 입력해주세요</h5>
						<input type="text" class="form-control" placeholder="설문지 제목" id="searchText">
					</div>
					<div class="mb-3">
						<h5 class="fw-bold">설문지 인사말을 입력해주세요</h5>
						<h6 class="text-danger">※ 설문 목적이나 참여 방법 등을 간단히 안내하고 싶다면 인사말을 작성해 주세요</h6>
						<textarea class="form-control" rows="5" cols="" placeholder="소중한 의견 부탁드립니다."></textarea>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 설문지 작성 -->
		<div class="question d-none">
			<div class="card" style="width: 50%; height: auto;">
				<div id="questionArea">
	    			<strong>설문지 작성 페이지</strong>
	  			</div>
	  			<button type="button" class="btn btn-primary" id="saveSurveyBtn">설문 저장</button>
			</div>
		</div>
		
		
		<!-- 응답자 정보 -->
		<div class="respInfo d-none">
			<div class="card" style="width: 50%; height: auto;">
				<div id="respInfoArea">
	    			<strong>응답자 정보 페이지</strong>
	  			</div>
			</div>
		</div>
		
		<!-- 경품 추첨 -->
		<div class="giftInfo d-none">
			<div class="card" style="width: 50%; height: auto;">
				<div id="giftInfoArea">
	    			<strong>경품 추첨 페이지</strong>
	  			</div>
			</div>
		</div>
		
		<!-- 맺음말 작성 -->
		<div class="closing d-none">
			<div class="card" style="width: 50%; height: auto;">
				<div id="closingArea">
	    			<strong>맺음말 작성 페이지</strong>
	  			</div>
			</div>
		</div>
		
		<!-- 완료 -->
		<div class="complete d-none">
			<div class="card" style="width: 50%; height: auto;">
				<div id="completeArea">
	    			<strong>완료 페이지</strong>
	  			</div>
			</div>
		</div>
		
		<div class="card" style="position: fixed; top: 50%; right: 32px; transform: translateY(-50%); width: 300px; z-index: 1000;">
			<button type="button" class="init-btn addQuestionBtn mb-2" id="objectV">객관식 문항 (세로) 추가</button>
			<button type="button" class="init-btn addQuestionBtn mb-2" id="objectH">객관식 문항 (가로) 추가</button>
			<button type="button" class="init-btn addQuestionBtn mb-2" id="subject">주관식 문항 추가</button>
			<button type="button" class="init-btn addQuestionBtn mb-2" id="grid">그리드 문항 추가</button>
			<button type="button" class="init-btn" id="cancelBtn">설문지 작성 취소</button>
		</div>
   	</div>
	<!-- 본문 영역 종료 -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>

<script src="${pageContext.request.contextPath}/resources/js/form/create.js"></script>
</body>
</html>
