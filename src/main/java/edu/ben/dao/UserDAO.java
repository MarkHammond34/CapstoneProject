package edu.ben.dao;

import java.util.List;

import edu.ben.model.User;

public interface UserDAO {

	public List<User> getAllUsers();
	
	public User getUserById(int id);
	
	public void deleteUser(int id);
	
	public void saveOrUpdate(User user);

	public void create(User user);

	public void unlockByUsername(String username);

	public void lockByUsername(String username);

	public User findByEmail(String email);

	public User findBySchoolEmail(String email);

	public void update(User user);

	public void updateAttemptedLogins(int attemptedLogins, String email);

	public void updateIsActive(int isActive, String email);
}
