<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<!--  나중에 삭제  -->
<style type="text/css">
@keyframes runPopcat {
  0% {
    left: 0;
    transform: scaleX(1);
  }
  45% {
    left: calc(100% - 150px);
    transform: scaleX(1);
  }
  50% {
    left: calc(100% - 150px);
    transform: scaleX(-1); /* 반전 지점 */
  }
  95% {
    left: 0;
    transform: scaleX(-1);
  }
  100% {
    left: 0;
    transform: scaleX(1); /* 다시 정방향 */
  }
}

.popcat-run {
  position: absolute;
  top: 100px;
  width: 150px;
  animation: runPopcat 10s ease-in-out infinite;
}
</style>
 
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
	
<title>메인 페이지</title>
</head>

<body>
	<div class="wrapper">
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	
	<!-- 본문 영역 시작 -->
	<div class="content">
		
		<div class="input-group w-50 mb-3" style="justify-self: center;">
			<input type="text" class="form-control" placeholder="검색어를 입력해주세요">
		  	<button class="btn btn-primary" type="button" id="searchBtn">검색</button>
		</div>
		
		<div class="bg-light p-4 mb-3 text-end">
			<button type="button" class="init-btn" id="createFormBtn">+ 설문조사 작성</button>
		</div>
		
		<div class="table-responsive"> <!-- 추후 동적 코드로 수정 -->
		  	<table class="table table-striped table-hover table-bordered align-middle">
		    	<thead class="table-light">
		      		<tr>
				        <th scope="col">No</th>
				        <th scope="col">설문 제목</th>
				        <th scope="col">설문 개시일</th>
				        <th scope="col">설문 마감일</th>
		      		</tr>
		    	</thead>
		    	<tbody>
		        	<tr>
				        <td>1</td>
				        <td>지역 상권 활성화를 위한 소비자 만족도 조사.</td>
				        <td>2025-06-12</td>
				        <td>2025-07-12</td>
			    	</tr>
		        	<tr>
				        <td>2</td>
				        <td>공공시설 이용자 서비스 품질 평가 설문조사</td>
				        <td>2025-05-01</td>
				        <td>2025-06-28</td>
			    	</tr>
		        	<tr>
				        <td>3</td>
				        <td>교통복지 향상을 위한 대중교통 이용 실태 조사</td>
				        <td>2025-06-03</td>
				        <td>2025-07-03</td>
			    	</tr>
		        	<tr>
				        <td>4</td>
				        <td>기후변화 대응을 위한 주민 인식 및 참여도 조사</td>
				        <td>2025-05-01</td>
				        <td>2025-06-28</td>
			    	</tr>
		        	<tr>
				        <td>5</td>
				        <td>생활안전 및 치안 만족도 향상 설문조사</td>
				        <td>2025-06-09</td>
				        <td>2025-07-09</td>
			    	</tr>
		    	</tbody>
	  		</table>
		</div>
		
		<img id="popcat" src="${pageContext.request.contextPath}/resources/img/popcat-pop.gif" alt="팝캣" class="popcat-run" style="margin-top: 500px;">		
	</div>
	<!-- 본문 영역 종료 -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
	
<script src="${pageContext.request.contextPath}/resources/js/main/main.js"></script>
</body>

</html>