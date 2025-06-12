<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">

<title>설문지 작성</title>
    
<style type="text/css">

.card {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
    padding: 24px;
    margin: 20px auto;
    max-width: 720px;
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
			    <li><a href="#"><strong>설문 제목 등록</strong></a></li>
			    <li><a href="#">인사말 등록</a></li>
			    <li><a href="#">설문지 작성</a></li>
			    <li><a href="#">응답자 정보</a></li>
			    <li><a href="#">경품 추첨</a></li>
			    <li><a href="#">맺음말 작성</a></li>
			    <li><a href="#">결과</a></li>
			</ol>
		</nav>
		
		<div class="card">
			<div id="questionArea">
    			<!-- 문항들이 여기에 추가됨 -->
  			</div>
		</div>
		
		<div class="card" style="position: fixed; top: 50%; right: 32px; transform: translateY(-50%); width: 160px; z-index: 1000;">
			<button type="button" class="init-btn" id="addQuestionBtn">문항 추가</button>
			<button class="init-btn" onclick="goNextStep()">다음</button>
			<button type="button" class="init-btn" id="cancelBtn">취소</button>
		</div>
   	</div>
	<!-- 본문 영역 종료 -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>

<script src="${pageContext.request.contextPath}/resources/js/form/create.js"></script>
</body>
</html>
