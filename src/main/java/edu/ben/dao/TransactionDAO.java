package edu.ben.dao;

import edu.ben.model.Transaction;

public interface TransactionDAO {

	public Transaction getTransaction(int id);
	
	public void createTransaction(Transaction transaction);
	
	public void saveOrUpdate(Transaction transaction);
	
	public void deleteTransaction(Transaction transaction);
}