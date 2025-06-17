package com.init.survey.entity;

import javax.persistence.*;
import lombok.*;

@Entity
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "question_seq_gen")
    @SequenceGenerator(name = "question_seq_gen", sequenceName = "QUESTION_SEQ", allocationSize = 1)
    private Long id;

    private int order;

    private String type;

    @Column(length = 1000)
    private String content;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "survey_id")
    private Survey survey;
}
