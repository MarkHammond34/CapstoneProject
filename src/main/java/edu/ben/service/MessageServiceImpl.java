package edu.ben.service;

import edu.ben.dao.MessageDAOImpl;
import edu.ben.model.Message;
import edu.ben.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class MessageServiceImpl implements MessageService {

    private MessageDAOImpl msgDAO = new MessageDAOImpl();

    @Override
    public void createConversation(User user1, User user2) {
        msgDAO.createConversation(user1.getUserID(), user2.getUserID());
    }

    @Override
    public List<Message> getConversation(User user1, User user2) {
      return msgDAO.getConversation(user1.getUserID(), user2.getUserID());

    }

    @Override
    public void sendMessage(User user, User sendTo, String message) {
        msgDAO.sendMessage(user.getUserID(), sendTo.getUserID(), message);
    }
}
