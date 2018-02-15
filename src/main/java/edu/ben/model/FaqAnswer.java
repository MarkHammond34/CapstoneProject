package edu.ben.model;

import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity(name = "faq_answer")
@Table(name = "faq_answer")
@Transactional
public class FaqAnswer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "answer_id")
    private int answerID;

    @Column(name = "created_by")
    private int createdBy;

    @Column(name = "created_on")
    private Timestamp createdOn;

    @ManyToOne
    @JoinColumn(name = "question_id", nullable = false)
    private FaqQuestion question;

    public FaqAnswer() {
    }

    public int getAnswerID() {
        return answerID;
    }

    public void setAnswerID(int answerID) {
        this.answerID = answerID;
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

    public FaqQuestion getQuestion() {
        return question;
    }

    public void setQuestion(FaqQuestion question) {
        this.question = question;
    }
}
