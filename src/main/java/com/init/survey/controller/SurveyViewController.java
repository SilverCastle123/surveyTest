package com.init.survey.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
	설문지 컨트롤러
	작성일 : 2025.06.11
	작성자 : -
*/

@Controller
public class SurveyViewController {
	
	// 설문지 작성 페이지
    @RequestMapping("/form/create.do")
    public String create() {
        return "form/create";
    }

    // 설문지 상세보기 페이지
    @RequestMapping("/form/detail.do")
    public String detail() {
    	return "form/detail";
    }
    
}