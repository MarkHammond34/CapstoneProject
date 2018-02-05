package edu.ben.model;

import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

@Entity(name = "conversation")
@Table(name = "conversation")
@Transactional
public class Conversation implements Serializable{

    @Id
    @Column(name="conversation_ID")
    private int id;

    @OneToOne
    @JoinColumn(name="userId _1")
    private User user1;

    @OneToOne
    @JoinColumn(name="userId_2")
    private User user2;

    @Column(name="date_created")
    private Timestamp dateCreated;



    public Conversation(User user1, User user2){
        this.user1 = user1;
        this.user2 = user2;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser1() {
        return user1;
    }

    public void setUser1(User user1) {
        this.user1 = user1;
    }

    public User getUser2() {
        return user2;
    }

    public void setUser2(User user2) {
        this.user2 = user2;
    }

    public Timestamp getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Timestamp dateCreated) {
        this.dateCreated = dateCreated;
    }
}
