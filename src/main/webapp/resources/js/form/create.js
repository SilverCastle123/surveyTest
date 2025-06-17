document.addEventListener("DOMContentLoaded", function () {
  
	// 상단 네비게이션 클릭 시 화면 출력
	document.querySelectorAll(".init-nav a").forEach(link => {
		link.addEventListener("click", function (e) {
			e.preventDefault();
			
			// 모든 영역 숨김
		    document.querySelectorAll(".basicInf, .question, .respInfo, .giftInfo, .closing, .complete")
		      .forEach(section => section.classList.add("d-none"));
		
		    // 클릭한 영역 표시
		    const targetSelector = this.getAttribute("data-target");
		    const targetSection = document.querySelector(targetSelector);
		    if (targetSection) {
		      targetSection.classList.remove("d-none");
		    }
		
		    // 나머지 네비에 색상 제거
		    document.querySelectorAll(".init-nav a").forEach(a => {
		      a.classList.remove("fw-bold", "text-primary");
		    });
		
		    // 클릭한 네비에 색상 추가
		    this.classList.add("fw-bold", "text-primary");
		});
	});  

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
			<div class="card p-3 mb-3 draggable" data-question="${questionNum}" draggable="true">
				<h3>객관식 세로 문항 (임시)</h3>
				<button type="button" class="btn btn-sm btn-danger mt-2" onclick="deleteQuestion(${questionNum})">삭제</button>
			</div>
	      	`;
	    } else if (type === "objectH") {
	      	// 객관식 가로 문항
	      	questionHtml = `
			<div class="card p-3 mb-3 draggable" data-question="${questionNum}" draggable="true">
				<h3>객관식 가로 문항 (임시)</h3>
				<button type="button" class="btn btn-sm btn-danger mt-2" onclick="deleteQuestion(${questionNum})">삭제</button>
			</div>
	      	`;
	    } else if (type === "subject") {
	      	// 주관식 가로 문항
	      	questionHtml = `
			<div class="card p-3 mb-3 draggable" data-question="${questionNum}" draggable="true">
	        	<div class="mb-2 fw-bold">문항 ${questionNum} [주관식]</div>
	          	<input type="text" name="question_${questionNum}" class="form-control mb-2" placeholder="질문 내용을 입력하세요">
	          	<textarea class="form-control" placeholder="답변 입력란"></textarea>
	          	<button type="button" class="btn btn-sm btn-danger mt-2" onclick="deleteQuestion(${questionNum})">삭제</button>
	        </div>
	      	`;

	    } else if (type === "grid") {
	      	// 그리드 문항
	      	questionHtml = `
	      	<div class="card p-3 mb-3 draggable" data-question="${questionNum}" draggable="true">
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

// 드래그 앤 드롭 기능
document.addEventListener("dragstart", function (e) {
  if (e.target.classList.contains("draggable")) {
    e.target.classList.add("dragging");
  }
});

document.addEventListener("dragend", function (e) {
  if (e.target.classList.contains("draggable")) {
    e.target.classList.remove("dragging");
    renumberQuestions(); // 드래그 완료 후 번호 재정렬
  }
});

document.getElementById("questionArea").addEventListener("dragover", function (e) {
  e.preventDefault();
  const container = e.currentTarget;
  const dragging = document.querySelector(".dragging");
  const afterElement = getDragAfterElement(container, e.clientY);
  if (!afterElement) {
    container.appendChild(dragging);
  } else {
    container.insertBefore(dragging, afterElement);
  }
});

function getDragAfterElement(container, y) {
  const elements = [...container.querySelectorAll(".draggable:not(.dragging)")];
  return elements.reduce((closest, el) => {
    const box = el.getBoundingClientRect();
    const offset = y - box.top - box.height / 2;
    return offset < 0 && offset > closest.offset ? { offset, element: el } : closest;
  }, { offset: Number.NEGATIVE_INFINITY }).element;
}


function renumberQuestions() {
  const items = document.querySelectorAll("#questionArea .draggable");
  items.forEach((el, idx) => {
    const num = idx + 1;
    el.setAttribute("data-question", num);

    // input name 속성 업데이트 (주관식만 해당)
    const input = el.querySelector("input[name^='question_']");
    if (input) input.name = `question_${num}`;

    // 삭제 버튼의 onclick 이벤트 갱신
    const btn = el.querySelector("button.btn-danger");
    if (btn) btn.setAttribute("onclick", `deleteQuestion(${num})`);
  });
}




document.getElementById("saveSurveyBtn").addEventListener("click", function () {
  console.log("저장 버튼 클릭됨");

  const title = document.getElementById("searchText").value.trim();
  const description = document.querySelector(".basicInf textarea").value.trim();
  console.log("title:", title, "description:", description);

  if (!title) {
    Swal.fire("설문 제목을 입력해주세요.");
    return;
  }

  const questions = [];

  document.querySelectorAll("#questionArea .draggable").forEach((el, index) => {
    const type = el.querySelector("h3")?.textContent || "주관식";
    const input = el.querySelector("input");
    const questionText = input ? input.value.trim() : `문항 ${index + 1}`;

    questions.push({
      order: index + 1,
      type: type,
      content: questionText
    });
  });

  const data = {
    title: title,
    description: description,
    questions: questions
  };

  console.log("전송 데이터:", data);

  $.ajax({
    type: "POST",
    url: contextPath + "/api/surveys/with-questions",
    contentType: "application/json",
    data: JSON.stringify(data),
    success: function (response) {
      console.log("서버 응답:", response);
      Swal.fire("설문이 저장되었습니다.", "", "success").then(() => {
        location.href = contextPath + "/main.do";
      });
    },
    error: function (xhr, status, error) {
      console.error("AJAX 에러:", status, error);
      Swal.fire("저장 중 오류가 발생했습니다.", "", "error");
    }
  });
});
