package com.init.survey.entity;

import javax.persistence.*;
import lombok.*;
import java.util.List;

@Entity
@Table(name = "SVY_QUESTION")
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "question_seq_gen")
    @SequenceGenerator(name = "question_seq_gen", sequenceName = "QUESTION_SEQ", allocationSize = 1)
    private Long id;

    @Column(name = "question_order")
    private int order;

    private String type;

    @Column(length = 1000)
    private String content;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "survey_id")
    private Survey survey;
    
    @OneToMany(mappedBy = "question", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Choice> choices;

}
