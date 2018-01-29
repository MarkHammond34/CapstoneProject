package edu.ben.service;

import java.util.List;

import edu.ben.model.User;

public interface UserService {

	public List<User> getAllUsers();

	public User getUserById(int id);

	public void deleteUser(int id);
	
	public void saveOrUpdate(User user);

	public void create(User user);

	public void lockByUsername(String username);

	public void unlockByUsername(String username);
}

