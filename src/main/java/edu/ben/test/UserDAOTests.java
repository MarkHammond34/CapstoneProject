package edu.ben.test;

import edu.ben.dao.UserDAOImpl;
import edu.ben.model.User;
import edu.ben.service.UserService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

public class UserDAOTests {

    @Autowired
    UserService userService;

    @Before
    public void init() {
    }

    @Test
    public void createWithValidInput() {

        UserDAOImpl dao = new UserDAOImpl();

    //    User u = new User("Mark", "Hammond", "mhammond", "markhammond1010@yahoo.com", "b2246523@ben.edu", "password", "password");

    //    dao.create(u);
    }

    @Test
    public void unlockByUsername() {

        userService.unlockByUsername("mhammond");


    }

}
