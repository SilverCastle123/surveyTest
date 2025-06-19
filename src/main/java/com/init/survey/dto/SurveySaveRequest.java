package com.init.survey.dto;

import lombok.*;


import java.util.List;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SurveySaveRequest {

    @NotBlank(message = "설문 제목은 필수입니다.")
    private String title;

    private String description;

    @NotNull
    @Size(min = 1, message = "최소 1개의 문항이 필요합니다.")
    private List<QuestionDTO> questions;

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class QuestionDTO {
        @NotNull
        private Integer order;

        @NotBlank
        private String type;

        @NotBlank
        private String content;
        
        private List<ChoiceDTO> choices;
        
        @Getter
        @Setter
        @NoArgsConstructor
        @AllArgsConstructor
        @Builder
        public static class ChoiceDTO {
            @NotBlank
            private String content;
        }
    }
}