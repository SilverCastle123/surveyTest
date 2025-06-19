package com.init.survey.entity;

import javax.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "SVY_SURVEYS")
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Survey {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "survey_seq_gen")
    @SequenceGenerator(name = "survey_seq_gen", sequenceName = "SURVEY_SEQ", allocationSize = 1)
    private Long id;

    private String title;

    @Column(length = 1000)
    private String description;

    private LocalDateTime createdAt;

    @OneToMany(mappedBy = "survey", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Question> questions;
}
