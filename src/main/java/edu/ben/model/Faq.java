package edu.ben.model;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity(name = "faq")
@Table(name = "faq")
public class Faq {

    @Id
    @GeneratedValue
    @Column(name = "question_id")
    private int questionID;

    @Column(name = "question")
    private String question;

    @Column(name = "answer")
    private String answer;

    @OneToOne
    @JoinColumn(name = "created_by")
    private User createdBy;

    @Column(name = "date_created")
    private Timestamp dateCreated;

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

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public User getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(User createdBy) {
        this.createdBy = createdBy;
    }

    public Timestamp getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Timestamp dateCreated) {
        this.dateCreated = dateCreated;
    }
}
