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




// 척도 라벨 정의
const scaleOptions = {
    agree: {
        label: "동의 여부",
        labels: {
            5: ["전혀 동의하지 않음", "동의하지 않음", "보통이다", "동의함", "매우 동의함"],
            7: ["전혀 동의하지 않음", "약간 동의하지 않음", "동의하지 않음", "보통이다", "동의함", "약간 동의함", "매우 동의함"]
        }
    },
    satisfy: {
        label: "만족도",
        labels: {
            5: ["매우 불만족", "불만족", "보통이다", "만족", "매우 만족"],
            7: ["매우 불만족", "다소 불만족", "불만족", "보통이다", "만족", "다소 만족", "매우 만족"]
        }
    },
    truth: {
        label: "사실 여부",
        labels: {
            5: ["전혀 그렇지 않다", "그렇지 않다", "보통이다", "그렇다", "매우 그렇다"],
            7: ["전혀 그렇지 않다", "약간 그렇지 않다", "그렇지 않다", "보통이다", "그렇다", "약간 그렇다", "매우 그렇다"]
        }
    }
};

// 그리드 테이블 헤더 생성 함수
function renderGridTableHeader(questionOrder, scaleType, scaleSize) {
    const table = document.getElementById(`gridTable_${questionOrder}`);
    if (!table) return;

    const thead = table.querySelector('thead');
    const scale = scaleOptions[scaleType];

    if (!scale) {
        console.warn(`알 수 없는 scaleType: ${scaleType}`);
        return;
    }

    const labels = scale.labels[scaleSize];
    if (!labels) {
        console.warn(`알 수 없는 scaleSize: ${scaleSize} for scaleType: ${scaleType}`);
        return;
    }

    // 헤더 행 생성
    const tr = document.createElement('tr');

    // 첫 번째 빈 헤더 셀
    const thEmpty = document.createElement('th');
    tr.appendChild(thEmpty);

    // 척도 라벨 셀 생성
    labels.forEach(labelText => {
        const th = document.createElement('th');
        th.textContent = labelText;
        tr.appendChild(th);
    });

    // thead에 추가
    thead.appendChild(tr);
}
