package com.init.survey.service;

import java.util.List;

import com.init.survey.dto.SurveyDTO;
import com.init.survey.dto.SurveySaveRequest;

public interface SurveyService {
    List<SurveyDTO> getAllSurveys();
    SurveyDTO getSurveyById(Long id);
    SurveyDTO createSurvey(SurveyDTO surveyDTO);
    void deleteSurvey(Long id);
    void saveSurveyWithQuestions(SurveySaveRequest request);
}