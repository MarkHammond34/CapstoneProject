package edu.ben.model;

import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

@Entity(name = "faq_question")
@Table(name = "faq_question")
@Transactional
public class FaqQuestion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "question_id")
    private int questionID;

    @Column(name = "question")
    private String question;

    @OneToMany(mappedBy = "faq_question")
    private Set<FaqAnswer> answers;

    @Column(name = "created_by")
    private int createdBy;

    @Column(name = "created_on")
    private Timestamp createdOn;

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public Set<FaqAnswer> getAnswers() {
        return answers;
    }

    public void setAnswers(Set<FaqAnswer> answers) {
        this.answers = answers;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public Timestamp getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Timestamp createdOn) {
        this.createdOn = createdOn;
    }
}
