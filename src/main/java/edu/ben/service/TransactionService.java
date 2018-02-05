package edu.ben.service;

import edu.ben.model.Transaction;

public interface TransactionService {
	
	public Transaction getTransaction(int id);
	
	public void createTransaction(Transaction transaction);
	
	public void saveOrUpdate(Transaction transaction);
	
	public void deleteTransaction(Transaction transaction);
}
