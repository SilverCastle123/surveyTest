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
		  	<button class="btn btn-primary" type="button" id="searchBtn">
		  		<img src="${pageContext.request.contextPath}/resources/img/icon/search.svg" style="filter: brightness(0) invert(1);">
		  	</button>
		</div>
		
		<div class="bg-light p-4 mb-3 text-end">
			<button type="button" class="init-btn logo" id="createFormBtn">+ 설문지 작성</button>
		</div>
		
		<div class="table-responsive"> <!-- 추후 동적 코드로 수정 -->
		  	<table class="table table-striped table-hover table-bordered align-middle text-center">
		    	<thead class="table-light">
		      		<tr>
				        <th scope="col">번호</th>
				        <th scope="col">파일</th>
				        <th scope="col">제목</th>
				        <th scope="col">설문조사 게시일</th>
				        <th scope="col">설문조사 마감일</th>
				        <th scope="col">응답현황</th>
		      		</tr>
		    	</thead>
		    	<tbody>
		        	<tr>
		        		<td hidden="true">S00125</td>
				        <td>1</td>
				        <td>
				        	<img src="${pageContext.request.contextPath}/resources/img/icon/download.svg" class="download-icon" alt="다운로드아이콘" style="cursor: pointer;">
				        </td>
				        <td><a href="#">지역 상권 활성화를 위한 소비자 만족도 조사</a></td>
				        <td>2025-06-12</td>
				        <td>2025-07-12</td>
				        <td>-</td>
			    	</tr>
		        	<tr>
		        		<td hidden="true">S00371</td>
				        <td>2</td>
				        <td>
				        	<img src="${pageContext.request.contextPath}/resources/img/icon/download.svg" class="download-icon" alt="다운로드아이콘" style="cursor: pointer;">
				        </td>
				        <td><a href="#">공공시설 이용자 서비스 품질 평가 설문조사</a></td>
				        <td>2025-05-01</td>
				        <td>2025-06-28</td>
				        <td>-</td>
			    	</tr>
		    	</tbody>
	  		</table>
		</div>
		
<%-- 		<img id="popcat" src="${pageContext.request.contextPath}/resources/img/popcat-pop.gif" alt="팝캣" class="popcat-run" style="margin-top: 100px; width: 100px;">		 --%>
	</div>
	<!-- 본문 영역 종료 -->
	
	<!-- 다운로드 말풍선 영역 -->
	<div id="downloadDropdown" class="dropdown-menu show d-none" style="position: absolute; z-index: 9999;">
		<a class="dropdown-item" id="pdfDownBtn" style="cursor: pointer;">PDF 저장</a>
	  	<a class="dropdown-item" id="excelDownBtn" style="cursor: pointer;">엑셀 다운로드</a>
	</div>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
	
<script src="${pageContext.request.contextPath}/resources/js/main/main.js"></script>
</body>

</html>