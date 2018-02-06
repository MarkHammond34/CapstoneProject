package edu.ben.dao;

import edu.ben.model.Conversation;
import edu.ben.model.Message;
import edu.ben.model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Repository
public class MessageDAOImpl implements MessageDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void create(Message message) {
        getSession().save(message);
    }

    @Override
    public void saveOrUpdate(Message message) {
        getSession().saveOrUpdate(message);
    }

    private UserDAOImpl userDao = new UserDAOImpl();

    @Override
    public void createConversation(int user1, int user2) {
        User mainUser = userDao.getUserById(user1);
        User secondUser = userDao.getUserById(user2);

        Query q = getSession().createQuery("INSERT INTO conversation (userId_1, userId_2) VALUES (" + mainUser.getUserID() + ", " + secondUser.getUserID() + ")");
        q.executeUpdate();
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Message> getConversation(int user1, int user2) {
        User mainUser = userDao.getUserById(user1);
        User secondUser = userDao.getUserById(user2);

        Query q = getSession().createQuery("FROM conversation WHERE userID_1=" + mainUser.getUserID() + "AND userID_2=" + secondUser.getUserID());
        Conversation conversation = (Conversation) q.list().get(0);

        q = getSession().createQuery("FROM message WHERE conversation_ID=" + conversation.getId());
        List<Message> msg = (List<Message>) q.list();
        return msg;
    }

    @Override
    public void sendMessage(int user1, int user2, String message) {
        User mainUser = userDao.getUserById(user1);
        User secondUser = userDao.getUserById(user2);

        Query q = getSession().createQuery("FROM conversation WHERE userID_1=" + mainUser.getUserID() + "AND userID_2=" + secondUser.getUserID());
        Conversation conversation = (Conversation) q.list().get(0);

        q = getSession().createQuery("INSERT INTO message (conversation_ID, userId, message_body) VALUES (" + conversation.getId() + ", " + mainUser.getUserID() + ", " + message + ")");
        q.executeUpdate();
    }
}
