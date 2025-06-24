// 설문지 상세보기 JS 페이지
document.addEventListener("DOMContentLoaded", initSurveyApp);

function initSurveyApp() {
	updateBtn();		// 수정 버튼
	deleteBtn();		// 삭제 버튼
};


function updateBtn(){
	document.getElementById("UpdateBtn").addEventListener("click", function () {
    	Swal.fire({
			title: "수정버튼 클릭",
			icon: "success"
		});
		return;
	});
};


function deleteBtn(){
	document.getElementById("deleteBtn").addEventListener("click", function () {
    	Swal.fire({
			title: "삭제버튼 클릭",
			icon: "success"
		});
		return;
	});
};
