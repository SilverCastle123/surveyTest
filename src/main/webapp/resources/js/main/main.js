// 설문조사 작성 버튼 클릭
document.getElementById("createFormBtn").addEventListener("click", function () {
	location.href = contextPath + "/form/create.do";
});

// 검색 버튼 클릭
document.getElementById("searchBtn").addEventListener("click", function () {
	const searchText = document.getElementById("searchText").value;
	Swal.fire({
		title: "검색버튼 클릭 체크",
		icon: "success",
		text: `검색어: ${searchText}`,
		draggable: true
	});
});

document.querySelectorAll("td:nth-child(3)").forEach(td => {
	td.addEventListener("click", function () {
		const surveyId = this.parentElement.cells[0].innerText;
		Swal.fire({
			title: "설문목록 클릭 체크",
			text: `설문ID: ${surveyId}`,
			icon: "success"
		});
	});
});
