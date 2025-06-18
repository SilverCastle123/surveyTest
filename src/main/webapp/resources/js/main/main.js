document.addEventListener("DOMContentLoaded", initSurveyApp);

function initSurveyApp() {
	bindSearch();			// 검색 호출
	downloadDropdown();		// 다운로드 아이콘 드롭다운 호출
	surveyDetail();			// 작성된 설문조사 목록 호출
	bindDownload();			// PDF, 엑셀 다운로드 호출
}


// 설문조사 작성 버튼 클릭
document.getElementById("createFormBtn").addEventListener("click", function () {
	location.href = contextPath + "/form/create.do";
});


function bindSearch(){
	document.getElementById("searchBtn").addEventListener("click", function () {
		const searchText = document.getElementById("searchText").value;
		Swal.fire({
			title: "검색버튼 클릭 체크",
			icon: "success",
			text: `검색어: ${searchText}`,
			draggable: true
		});
	});
};


function surveyDetail(){
	
	// 제목 클릭 설문 상세보기
	document.querySelectorAll("td:nth-child(4)").forEach(td => {
		td.addEventListener("click", function () {
			const surveyId = this.parentElement.cells[0].innerText;
			Swal.fire({
				title: "설문목록 클릭 체크",
				text: `설문ID: ${surveyId}`,
				icon: "success"
			});
		});
	});	
}


function downloadDropdown(){
	const dropdown = document.getElementById("downloadDropdown");
	
	document.querySelectorAll(".download-icon").forEach(icon => {
		icon.addEventListener("click", (e) => {
			const rect = e.target.getBoundingClientRect();
			
			dropdown.style.left = `${rect.right + window.scrollX}px`;
			dropdown.style.top = `${rect.top + window.scrollY}px`;
			dropdown.classList.remove("d-none");
		});
	});
  
  	// 드롭다운 이외 화면 클릭 시 종료
	document.addEventListener("click", (e) => {
	    if (!e.target.closest(".download-icon") && !dropdown.contains(e.target)) {
	  		dropdown.classList.add("d-none");
		}
	});
	
  	// 드롭다운 내부 요소 클릭 시 종료
	dropdown.querySelectorAll(".dropdown-item").forEach(item => {
		item.addEventListener("click", () => {
			dropdown.classList.add("d-none");
		});
	});
	
};

function bindDownload(){
	// pdf 다운로드 버튼 클릭 시
	document.getElementById("pdfDownBtn").addEventListener("click", function () {
		Swal.fire({
			title: "PDF 다운로드 버튼 클릭 확인",
			icon: "success"
		});
		return;
	});

	// 엑셀 다운로드 버튼 클릭 시
	document.getElementById("excelDownBtn").addEventListener("click", function () {
		Swal.fire({
			title: "엑셀 다운로드 버튼 클릭 확인",
			icon: "success"
		});
		return;
	});
};

