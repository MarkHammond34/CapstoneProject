package edu.ben.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import edu.ben.dao.UserDAO;
import edu.ben.model.User;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    UserDAO userDAO;

    @Autowired
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public List<User> getAllUsers() {
        return userDAO.getAllUsers();
    }

    public User getUserById(int id) {
        try {
            return userDAO.getUserById(id);
        } catch (IndexOutOfBoundsException e) {
            return null;
        }
    }

    public void deleteUser(int id) {
        userDAO.deleteUser(id);
    }

    public void saveOrUpdate(User user) {
        userDAO.saveOrUpdate(user);
    }

    public void create(User user) {
        userDAO.create(user);
    }

    public void lockByUsername(String username) {
        userDAO.lockByUsername(username);
    }

    public void unlockByUsername(String username) {
        userDAO.unlockByUsername(username);
    }

    @Override
    public User findByEmail(String email) {
        try {
            return userDAO.findByEmail(email);
        } catch (IndexOutOfBoundsException e) {
            return null;
        }
    }

    @Override
    public User findBySchoolEmail(String email) {
        try {
            return userDAO.findBySchoolEmail(email);
        } catch (IndexOutOfBoundsException e) {
            return null;
        }
    }

    @Override
    public void update(User user) {
        userDAO.update(user);
    }

    @Override
    public void updateAttemptedLogins(int loginAttempts, User user) {
        user.setLoginAttempts(loginAttempts);
        userDAO.update(user);
    }

    @Override
    public void updateIsActive(int isActive, String email) {
        userDAO.updateIsActive(isActive, email);
    }

    @Override
    public List<User> getRecentUsers() {
        return userDAO.getRecentUsers();
    }


    @Override
    public List<User> getListingLosers(int listingID, int winnerID) {
        return userDAO.getListingLosers(listingID, winnerID);
    }

    @Override
    public List<User> getDisputeResolvingAdmins() {
        return userDAO.getDisputeResolvingAdmins();
    }

	@Override
	public List<User> searchUser(String search) {
		return userDAO.searchUser(search);
	}

}
