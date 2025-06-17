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

    @RequestMapping("/form/create.do")
    public String create() {
        return "form/create";
    }
    
}