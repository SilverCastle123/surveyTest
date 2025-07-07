package com.init.survey.controller;

import com.init.survey.dto.SurveyDTO;
import com.init.survey.dto.SurveySaveRequest;
import com.init.survey.service.SurveyService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import javax.validation.Valid;

/*
    설문지 컨트롤러
    작성일 : 2025.06.11
    작성자 : -
*/

@RestController
@RequestMapping("/api/surveys")
@RequiredArgsConstructor
public class SurveyController {

    private final SurveyService surveyService;

    
    //전체 설문 목록 조회
    @GetMapping
    public ResponseEntity<List<SurveyDTO>> getAllSurveys() {
        List<SurveyDTO> surveys = surveyService.getAllSurveys();
        return ResponseEntity.ok(surveys);
    }

    
    //ID로 설문 조회
    @GetMapping("/{id}")
    public ResponseEntity<SurveyDTO> getSurveyById(@PathVariable Long id) {
        SurveyDTO dto = surveyService.getSurveyById(id);
        return ResponseEntity.ok(dto);
    }

    
    //설문 생성
    @PostMapping
    public ResponseEntity<SurveyDTO> createSurvey(@RequestBody SurveyDTO surveyDTO) {
        SurveyDTO created = surveyService.createSurvey(surveyDTO);
        return ResponseEntity.status(HttpStatus.CREATED).body(created);
    }
    

    //설문 저장
    @PostMapping("/with-questions")
    public ResponseEntity<?> saveSurvey(@Valid @RequestBody SurveySaveRequest request,
                                        BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            // 에러 메시지 추출 (간단한 버전)
            String errorMessage = bindingResult.getAllErrors().get(0).getDefaultMessage();
            return ResponseEntity.badRequest().body(errorMessage);
        }

        surveyService.saveSurveyWithQuestions(request);
        return ResponseEntity.ok("설문 저장 성공");
    }
    


    //설문 삭제
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteSurvey(@PathVariable Long id) {
        surveyService.deleteSurvey(id);
        return ResponseEntity.noContent().build(); // 204 No Content
    }
}
