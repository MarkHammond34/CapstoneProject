package edu.ben.service;

import java.util.List;

import edu.ben.model.Transaction;

public interface TransactionService {

	public Transaction getTransaction(int id);

	public void createTransaction(Transaction transaction);

	public void saveOrUpdate(Transaction transaction);

	public void deleteTransaction(Transaction transaction);

	public List<Transaction> getTransactionsByBuyerID(int id);

	public List<Transaction> getTransactionsBySellerID(int id);
	
	public List<Transaction> getTransactionsByUserID(int id);

	public Transaction getTransactionsByListingID(int id);
	
}
