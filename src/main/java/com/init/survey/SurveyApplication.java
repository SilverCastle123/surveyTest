package com.init.survey;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EntityScan(basePackages = "com.init.survey.entity")
@EnableJpaRepositories(basePackages = "com.init.survey.repository")
public class SurveyApplication extends SpringBootServletInitializer{
    public static void main(String[] args) {
        SpringApplication.run(SurveyApplication.class, args);
    }
    
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(SurveyApplication.class);
    }
}
