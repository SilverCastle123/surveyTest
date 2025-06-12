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
	
	
	// 문항 추가 버튼 클릭 시
	document.querySelectorAll(".addQuestionBtn").forEach(btn => {
		 btn.addEventListener("click", function () {
	    questionNum++;
	    const type = this.id;
	    let questionHtml = "";
	
	    if (type === "objectV") {
	      	// 객관식 세로 문항
	      	questionHtml = `
			<div class="card p-3 mb-3" data-question="${questionNum}">
				<h3>객관식 세로 문항 (임시)</h3>
				<button type="button" class="btn btn-sm btn-danger mt-2" onclick="deleteQuestion(${questionNum})">삭제</button>
			</div>
	      	`;
	    } else if (type === "objectH") {
	      	// 객관식 가로 문항
	      	questionHtml = `
			<div class="card p-3 mb-3" data-question="${questionNum}">
				<h3>객관식 가로 문항 (임시)</h3>
				<button type="button" class="btn btn-sm btn-danger mt-2" onclick="deleteQuestion(${questionNum})">삭제</button>
			</div>
	      	`;
	    } else if (type === "subject") {
	      	// 주관식 가로 문항
	      	questionHtml = `
			<div class="card p-3 mb-3" data-question="${questionNum}">
	        	<div class="mb-2 fw-bold">문항 ${questionNum} [주관식]</div>
	          	<input type="text" name="question_${questionNum}" class="form-control mb-2" placeholder="질문 내용을 입력하세요">
	          	<textarea class="form-control" placeholder="답변 입력란"></textarea>
	          	<button type="button" class="btn btn-sm btn-danger mt-2" onclick="deleteQuestion(${questionNum})">삭제</button>
	        </div>
	      	`;

	    } else if (type === "grid") {
	      	// 그리드 문항
	      	questionHtml = `
	      	<div class="card p-3 mb-3" data-question="${questionNum}">
				<h3>그리드 문항 (임시)</h3>
				<button type="button" class="btn btn-sm btn-danger mt-2" onclick="deleteQuestion(${questionNum})">삭제</button>
			</div>
	      	`;
	    }
	
	    document.getElementById("questionArea").insertAdjacentHTML("beforeend", questionHtml);
	  });
	});
});


function deleteQuestion(num) {
  const target = document.querySelector(`[data-question="${num}"]`);
  if (!target) return;

  Swal.fire({
    title: '문항을 삭제하시겠습니까?',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#d33',
    cancelButtonColor: '#aaa',
    confirmButtonText: '삭제',
    cancelButtonText: '취소'
  }).then((result) => {
    if (result.isConfirmed) {
      target.remove();
    }
  });
}


