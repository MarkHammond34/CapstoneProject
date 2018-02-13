package edu.ben.service;

import edu.ben.dao.MessageDAO;
import edu.ben.dao.MessageDAOImpl;
import edu.ben.model.Conversation;
import edu.ben.model.Message;
import edu.ben.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MessageServiceImpl implements MessageService {

    MessageDAO msgDAO;

    public void saveOrUpdate(Conversation conversation) {
        msgDAO.saveOrUpdate(conversation);
    }

    @Autowired
    public void setUserDAO(MessageDAO msgDAO) {
        this.msgDAO = msgDAO;
    }

    @Override
    public void createConversation(User user1, User user2) {
        msgDAO.createConversation(user1.getUserID(), user2.getUserID());
    }

    @Override
    public List<Conversation> getConversation(User user1) {
        return msgDAO.getConversation(user1.getUserID());
    }

    @Override
    public List<Message> getMessages(User user1, User user2) {
        return msgDAO.getMessages(user1.getUserID(), user2.getUserID());

    }

    @Override
    public void sendMessage(User user, User sendTo, String message) {
        msgDAO.sendMessage(user.getUserID(), sendTo.getUserID(), message);
    }
}
