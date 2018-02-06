package edu.ben.dao;

import edu.ben.model.Conversation;
import edu.ben.model.Message;
import edu.ben.model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MessageDAOImpl implements MessageDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    private UserDAOImpl userDao = new UserDAOImpl();


    @Override
    public void create(Conversation conversation) {
        getSession().save(conversation);
    }


    @Override
    public void createConversation(int user1, int user2) {
        Query q = getSession().createQuery("INSERT INTO ulistit.conversation (userId_1,userId_2) values (:userId1, :userId2)");
        q.setParameter("userId1", user1);
        q.setParameter("userId2", user2);
        q.executeUpdate();

    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Conversation> getConversation(int user1) {
        Query q = getSession().createQuery("FROM ulistit.conversation WHERE userID_1=" + user1);
        List<Conversation> conversation = (List<Conversation>) q.list();
        return conversation;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Message> getMessages(int user1, int user2) {
        User mainUser = userDao.getUserById(user1);
        User secondUser = userDao.getUserById(user2);

        Query q = getSession().createQuery("FROM ulistit.conversation WHERE userID_1=" + mainUser.getUserID() + "AND userID_2=" + secondUser.getUserID());
        Conversation conversation = (Conversation) q.list().get(0);

        q = getSession().createQuery("FROM ulistit.message WHERE conversation_ID=" + conversation.getId());
        List<Message> msg = (List<Message>) q.list();
        return msg;
    }

    @Override
    public void sendMessage(int user1, int user2, String message) {
        User mainUser = userDao.getUserById(user1);
        User secondUser = userDao.getUserById(user2);

        Query q = getSession().createQuery("FROM ulistit.conversation WHERE userID_1=" + mainUser.getUserID() + "AND userID_2=" + secondUser.getUserID());
        Conversation conversation = (Conversation) q.list().get(0);

        q = getSession().createQuery("INSERT INTO ulistit.message (conversation_ID, userId, message_body) VALUES (" + conversation.getId() + ", " + mainUser.getUserID() + ", " + message + ")");
        q.executeUpdate();
    }
}
