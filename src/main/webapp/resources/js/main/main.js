// 설문조사 작성 버튼 클릭
document.getElementById("createFormBtn").addEventListener("click", function () {
	location.href = contextPath + "/form/create.do";
});

// 검색 버튼 클릭
document.getElementById("searchBtn").addEventListener("click", function () {
	Swal.fire({
		title: "검색버튼 클릭 체크",
		icon: "success",
		draggable: true
	});
});

