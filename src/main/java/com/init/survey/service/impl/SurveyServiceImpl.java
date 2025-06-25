package com.init.survey.service.impl;

import com.init.survey.dto.SurveyDTO;
import com.init.survey.dto.SurveySaveRequest;
import com.init.survey.entity.Choice;
import com.init.survey.entity.GridCategory;
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

        List<Question> questions = request.getQuestions().stream()
                .map(q -> {
                    Question question = Question.builder()
                            .order(q.getOrder())
                            .type(q.getType())
                            .content(q.getContent())
                            .survey(survey)
                            .build();

                    // 선택형 문항일 경우 보기 추가
                    if ((q.getType().equals("objectV") || q.getType().equals("objectH"))
                            && q.getChoices() != null) {
                        List<Choice> choices = q.getChoices().stream()
                                .map(choiceDTO -> Choice.builder()
                                		.order(choiceDTO.getOrder() != null ? choiceDTO.getOrder() : 0)
                                        .content(choiceDTO.getContent())
                                        .question(question)
                                        .build())
                                .collect(Collectors.toList());
                        question.setChoices(choices);
                    }
                    
                    
                 // 그리드 문항 처리
                    else if ("grid".equals(q.getType())) {
                        question.setScaleType(q.getScaleType());
                        question.setScaleSize(q.getScaleSize());

                        if (q.getCategories() != null) {
                            List<GridCategory> categories = q.getCategories().stream()
                                    .map(catDTO -> {
                                        GridCategory category = GridCategory.builder()
                                                .order(catDTO.getOrder())
                                                .content(catDTO.getContent())
                                                .question(question)
                                                .build();
                                        return category;
                                    })
                                    .collect(Collectors.toList());

                            question.setGridCategories(categories);
                        }
                    }

                    return question;
                })
                .collect(Collectors.toList());

        survey.setQuestions(questions);
        surveyRepository.save(survey); // cascade로 question, choice도 함께 저장됨
    }

    private SurveyDTO convertToDTO(Survey survey) {
        return SurveyDTO.builder()
                .id(survey.getId())
                .title(survey.getTitle())
                .description(survey.getDescription())
                .createdAt(survey.getCreatedAt())
                .questions(
                        survey.getQuestions().stream()
                                .map(q -> SurveyDTO.QuestionDTO.builder()
                                        .order(q.getOrder())
                                        .type(q.getType())
                                        .content(q.getContent())
                                        .build())
                                .collect(Collectors.toList())
                )
                .build();
    }
    
    
}
