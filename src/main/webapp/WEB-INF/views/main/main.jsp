<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

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
			<input type="text" class="form-control" placeholder="검색어를 입력해주세요" id="searchText">
		  	<button class="btn btn-primary" type="button" id="searchBtn">검색</button>
		</div>
		
		<div class="bg-light p-4 mb-3 text-end">
			<button type="button" class="init-btn" id="createFormBtn">+ 설문지 작성</button>
		</div>
		
		<div class="table-responsive"> <!-- 추후 동적 코드로 수정 -->
		  	<table class="table table-striped table-hover table-bordered align-middle">
		    	<thead class="table-light">
		      		<tr>
				        <th scope="col">No</th>
				        <th scope="col">설문조사명</th>
				        <th scope="col">설문조사 개시일</th>
				        <th scope="col">설문조사 마감일</th>
				        <th scope="col">응답현황</th>
		      		</tr>
		    	</thead>
		    	<tbody>
		        	<tr>
		        		<td hidden="true">S00125</td>
				        <td>1</td>
				        <td>
				        	<a href="#">지역 상권 활성화를 위한 소비자 만족도 조사</a>
				        </td>
				        <td>2025-06-12</td>
				        <td>2025-07-12</td>
				        <td></td>
			    	</tr>
		        	<tr>
		        		<td hidden="true">S00371</td>
				        <td>2</td>
				        <td>
				        	<a href="#">공공시설 이용자 서비스 품질 평가 설문조사</a>
				        </td>
				        <td>2025-05-01</td>
				        <td>2025-06-28</td>
				        <td></td>
			    	</tr>
		        	<tr>
		        		<td hidden="true">S00082</td>
				        <td>3</td>
				        <td>
				        	<a href="#">교통복지 향상을 위한 대중교통 이용 실태 조사</a>
				        </td>
				        <td>2025-06-03</td>
				        <td>2025-07-03</td>
				        <td></td>
			    	</tr>
		        	<tr>
		        		<td hidden="true">S02091</td>
				        <td>4</td>
				        <td>
				        	<a href="#">기후변화 대응을 위한 주민 인식 및 참여도 조사</a>
				        </td>
				        <td>2025-05-01</td>
				        <td>2025-06-28</td>
				        <td></td>
			    	</tr>
		        	<tr>
		        		<td hidden="true">S01904</td>
				        <td>5</td>
				        <td>
				        	<a href="#">생활안전 및 치안 만족도 향상 설문조사</a>
				        </td>
				        <td>2025-06-09</td>
				        <td>2025-07-09</td>
				        <td></td>
			    	</tr>
		    	</tbody>
	  		</table>
		</div>
		
		<img id="popcat" src="${pageContext.request.contextPath}/resources/img/popcat-pop.gif" alt="팝캣" class="popcat-run" style="margin-top: 100px; width: 100px;">		
	</div>
	<!-- 본문 영역 종료 -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
	
<script src="${pageContext.request.contextPath}/resources/js/main/main.js"></script>
</body>

</html>