package edu.ben.model;

import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import javax.persistence.Entity;
import java.io.Serializable;
import java.sql.Timestamp;

@Entity(name = "message")
@Table(name = "message")
@Transactional
public class Message implements Serializable {

    @Id
    @Column(name = "message_ID")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinColumn(name = "conversation_ID")
    private Conversation conversationId;

    @OneToOne
    @JoinColumn(name = "userId")
    private User user;

    @Column(name = "message_body")
    private String messageBody;

    @Column(name = "date_sent")
    private Timestamp dateSent;

    public Message() {

    }

    public Message(User user, String messageBody) {
        this.user = user;
        this.messageBody = messageBody;
    }

    public Message(User user, String messageBody, Conversation conversationId) {
        this.user = user;
        this.messageBody = messageBody;
        this.conversationId = conversationId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Conversation getConversationId() {
        return conversationId;
    }

    public void setConversationId(Conversation conversationId) {
        this.conversationId = conversationId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getMessageBody() {
        return messageBody;
    }

    public void setMessageBody(String messageBody) {
        this.messageBody = messageBody;
    }

    public Timestamp getDateSent() {
        return dateSent;
    }

    public void setDateSent(Timestamp dateSent) {
        this.dateSent = dateSent;
    }
}
