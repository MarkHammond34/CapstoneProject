package edu.ben.service;

import edu.ben.model.Conversation;
import edu.ben.model.Message;
import edu.ben.model.User;

import java.util.List;

public interface MessageService {

    public void create(Conversation conversation);

    public void createConversation(User user1, User user2);

    public List<Conversation> getConversation(int user1);

    public List<Message> getMessages(User user1, User user2);

    public void sendMessage(User user, User sendTo, String message);


}
