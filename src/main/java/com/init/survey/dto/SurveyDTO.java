package com.init.survey.dto;

import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SurveyDTO {
    private Long id;
    private String title;
    private String description;
    
    private LocalDateTime createdAt;
    private List<QuestionDTO> questions;
    
    @Getter @Setter @Builder
    public static class QuestionDTO {
        private int order;
        private String type;
        private String content;
    }
}
