document.addEventListener("DOMContentLoaded", function () {
  
//	'cancelBtn' 클릭 시 호출
const cancelBtn = document.getElementById("cancelBtn").addEventListener("click", function () {
	Swal.fire({
		title: '작성을 취소하시겠습니까?',
		text: "작성 중인 작업이 저장되지 않았습니다.",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#d33',
		cancelButtonColor: '#aaa',
		confirmButtonText: '확인',
		cancelButtonText: '취소'
		}).then((result) => {
		if (result.isConfirmed) {
		location.href = contextPath + "/main.do";
		}
	});
});

//	문항 번호 세는용 변수 questionNum 정의
let questionNum = 0;

// 주관식 문항 추가
document.getElementById("addQuestionBtn").addEventListener("click", function () {
	questionNum++;
	
	const questionHtml = `
		<div class="card p-3 mb-3" data-question="${questionNum}">
			<div class="mb-2 fw-bold">문항 ${questionNum}</div>
			<input type="text" name="question_${questionNum}" class="form-control mb-2" placeholder="질문 내용을 입력하세요">
			<button type="button" class="btn btn-sm btn-danger" onclick="deleteQuestion(${questionNum})">삭제</button>
		</div>
	`;
	
	document.getElementById("questionArea").insertAdjacentHTML("beforeend", questionHtml);
});

});


function deleteQuestion(num) {
  const target = document.querySelector(`[data-question="${num}"]`);
  if (target) target.remove();
}
