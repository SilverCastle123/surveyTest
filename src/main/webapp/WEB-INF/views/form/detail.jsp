<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				    <!-- 설문 제목 및 설명 -->
				    <div class="card-header bg-primary text-white">
				        <h4>${survey.title}</h4>
				        <p class="mb-0">${survey.description}</p>
				    </div>
				
				    <!-- 설문 수정/삭제 버튼 -->
				    <div class="buttonArea text-end my-3">
				        <button type="button" class="init-btn addQuestionBtn" id="UpdateBtn">설문 수정</button>
				        <button type="button" class="btn btn-danger rounded-pill" id="deleteBtn">설문 삭제</button>
				    </div>
				
				    <!-- 문항 반복 -->
				    <c:forEach var="question" items="${survey.questions}">
					    <div class="card mb-3">
					        <div class="card-header bg-light">
					            ${question.questionOrder}. ${question.content}
					        </div>
					        <div class="card-body">
					            <c:choose>
					                <%-- 객관식 세로 --%>
					                <c:when test="${question.type eq 'objectV'}">
					                    <c:forEach var="choice" items="${question.choices}">
					                        <div><input type="radio" disabled> ${choice.content}</div>
					                    </c:forEach>
					                </c:when>
					                
					                <%-- 객관식 가로 --%>
					                <c:when test="${question.type eq 'objectH'}">
					                    <div>
					                        <c:forEach var="choice" items="${question.choices}">
					                            <label style="margin-right: 10px;">
					                                <input type="radio" disabled> ${choice.content}
					                            </label>
					                        </c:forEach>
					                    </div>
					                </c:when>
					                
					                <%-- 주관식 --%>
					                <c:when test="${question.type eq 'subject'}">
					                    <input type="text" class="form-control" disabled placeholder="응답 입력란" />
					                </c:when>
					                
					                <%-- 그리드 --%>
					                <c:when test="${question.type eq 'grid'}">
									    <table class="table table-bordered text-center" id="gridTable_${question.questionOrder}">
									        <thead>
									            <!-- 여기에 JS에서 헤더(tr)를 추가할 예정 -->
									        </thead>
									        <tbody>
									            <c:forEach var="cat" items="${question.categories}">
									                <tr>
									                    <td>${cat.content}</td>
									                    <c:forEach begin="1" end="${question.scaleSize}">
									                        <td>
									                            <input type="radio" disabled name="grid_${question.questionOrder}_${cat.categoryOrder}" />
									                        </td>
									                    </c:forEach>
									                </tr>
									            </c:forEach>
									        </tbody>
									    </table>
									</c:when>

					            </c:choose>
					        </div>
					    </div>
					</c:forEach>

				</div>


			</div>
			
		</div>
		
	</div>
	<!-- 본문 영역 종료 -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>

<script src="${pageContext.request.contextPath}/resources/js/form/detail.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        <c:forEach var="q" items="${survey.questions}">
            <c:if test="${q.type eq 'grid'}">
                renderGridTableHeader(${q.questionOrder}, "${q.scaleType}", ${q.scaleSize});
            </c:if>
        </c:forEach>
    });
</script>
</body>
</html>