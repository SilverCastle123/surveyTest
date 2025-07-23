document.addEventListener("DOMContentLoaded", initSurveyApp);

function initSurveyApp() {
	bindSearch();			// 검색 호출
	downloadDropdown();		// 다운로드 아이콘 드롭다운 호출
	bindDownload();			// PDF, 엑셀 다운로드 호출
}


// 설문조사 작성 버튼 클릭
document.getElementById("createFormBtn").addEventListener("click", function () {
	location.href = contextPath + "/form/create.do";
});


function bindSearch() {
	const searchBtn = document.getElementById("searchBtn");
	const searchInput = document.getElementById("searchText");

	if (!searchBtn || !searchInput) return;

	searchBtn.addEventListener("click", function () {
		const query = searchInput.value.trim();
		if (query !== "") {
			window.location.href = `/survey/main.do?search=${encodeURIComponent(query)}`;
		}
	});

	searchInput.addEventListener("keypress", function (e) {
		if (e.key === "Enter") {
			searchBtn.click();
		}
	});
};




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

