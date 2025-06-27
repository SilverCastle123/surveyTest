package com.init.survey.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.init.survey.dto.SurveyDTO;
import com.init.survey.dto.SurveySaveRequest;

public interface SurveyService {
    List<SurveyDTO> getAllSurveys();
    SurveyDTO getSurveyById(Long id);
    SurveyDTO createSurvey(SurveyDTO surveyDTO);
    Page<SurveyDTO> getSurveysPaged(int page, int size);
    void deleteSurvey(Long id);
    void saveSurveyWithQuestions(SurveySaveRequest request);
}