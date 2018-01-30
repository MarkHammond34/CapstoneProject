package test;

import edu.ben.config.HibernateConfig;
import edu.ben.dao.UserDAOImpl;
import edu.ben.model.User;
import edu.ben.service.UserService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {HibernateConfig.class})
@Transactional
@TransactionConfiguration(defaultRollback = true)
public class UserDAOTests {

    @Autowired
    UserService userService;

    @Before
    public void init() {
    }

   // @Test
    public void createWithValidInput() {

        //    User u = new User("Mark", "Hammond", "mhammond", "markhammond1010@yahoo.com", "b2246523@ben.edu", "password", "password");

        //    dao.create(u);
    }

    @Test
    public void unlockByUsername() {

        userService.unlockByUsername("mhammond");

    }

}
