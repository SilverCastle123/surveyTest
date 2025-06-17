package com.init.survey.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class SurveySaveRequest {
    private String title;
    private String description;
    private List<QuestionDTO> questions;

    @Getter
    @Setter
    public static class QuestionDTO {
        private int order;
        private String type;
        private String content;
    }
}
