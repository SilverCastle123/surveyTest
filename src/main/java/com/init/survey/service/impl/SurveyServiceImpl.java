package com.init.survey.service.impl;

import com.init.survey.dto.SurveyDTO;
import com.init.survey.dto.SurveySaveRequest;
import com.init.survey.entity.Question;
import com.init.survey.entity.Survey;
import com.init.survey.repository.QuestionRepository;
import com.init.survey.repository.SurveyRepository;
import com.init.survey.service.SurveyService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class SurveyServiceImpl implements SurveyService {

    private final SurveyRepository surveyRepository;
    private final QuestionRepository questionRepository;

    @Override
    public List<SurveyDTO> getAllSurveys() {
        return surveyRepository.findAll().stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    @Override
    public SurveyDTO getSurveyById(Long id) {
        return surveyRepository.findById(id)
                .map(this::convertToDTO)
                .orElse(null);
    }

    @Override
    public SurveyDTO createSurvey(SurveyDTO dto) {
        Survey survey = Survey.builder()
                .title(dto.getTitle())
                .description(dto.getDescription())
                .createdAt(LocalDateTime.now())
                .build();
        return convertToDTO(surveyRepository.save(survey));
    }

    @Override
    public void deleteSurvey(Long id) {
        surveyRepository.deleteById(id);
    }

    @Override
    @Transactional
    public void saveSurveyWithQuestions(SurveySaveRequest request) {
        Survey survey = Survey.builder()
                .title(request.getTitle())
                .description(request.getDescription())
                .createdAt(LocalDateTime.now())
                .build();

        Survey savedSurvey = surveyRepository.save(survey);

        List<Question> questions = request.getQuestions().stream()
                .map(q -> Question.builder()
                        .survey(savedSurvey)
                        .order(q.getOrder())
                        .type(q.getType())
                        .content(q.getContent())
                        .build())
                .collect(Collectors.toList());

        questionRepository.saveAll(questions);
    }

    private SurveyDTO convertToDTO(Survey survey) {
        return SurveyDTO.builder()
                .id(survey.getId())
                .title(survey.getTitle())
                .description(survey.getDescription())
                .createdAt(survey.getCreatedAt())
                .build();
    }
    
    
}
