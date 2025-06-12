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
		<div class="content-wrapper">
			<button type="button" class="init-btn" onclick="location.href='${pageContext.request.contextPath}/form/create.do'">설문조사 작성</button>
		</div>
	</div>
	<!-- 본문 영역 종료 -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
</body>

</html>