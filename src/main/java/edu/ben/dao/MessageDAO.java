package edu.ben.dao;

import edu.ben.model.Message;
import edu.ben.model.User;

import java.util.List;

public interface MessageDAO {

    public void create(Message message);

    public void saveOrUpdate(Message message);

    public void createConversation(int user1 , int user2);

    public List<Message> getConversation(int user1, int user2);

    public void sendMessage(int user1, int user2, String message);
}
