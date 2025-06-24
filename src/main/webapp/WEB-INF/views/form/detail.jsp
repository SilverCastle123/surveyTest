<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">

<title>설문지 상세보기</title>

</head>

<body>
<div class="wrapper">
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<!-- 본문 영역 시작 -->
	<div class="content">
		
		<div class="tab-content" id="surveyTabContent">
			<!-- 질문 영역 -->
			<div class="tab-pane fade show active" id="questionArea" role="tabpanel">
				<div class="card mt-3">
					<div class="buttonArea text-end mb-3">
						<button type="button" class="init-btn addQuestionBtn" id="UpdateBtn">설문 수정</button>
						<button type="button" class="btn btn-danger rounded-pill" id="deleteBtn">설문 삭제</button>
					</div>
					<div class="alert alert-danger small">※ 설문지 상세보기 영역 _삭제 후 작업</div>
				</div>
			</div>
			
		</div>
		
	</div>
	<!-- 본문 영역 종료 -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>

<script src="${pageContext.request.contextPath}/resources/js/form/detail.js"></script>
</body>
</html>