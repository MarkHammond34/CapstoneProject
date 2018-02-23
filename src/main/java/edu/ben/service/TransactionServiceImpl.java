package edu.ben.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ben.dao.TransactionDAO;
import edu.ben.model.Transaction;

@Service
@Transactional
public class TransactionServiceImpl implements TransactionService {
	
	TransactionDAO transactionDAO;
	
	@Autowired
	public void setTransactionDAO(TransactionDAO transactionDAO) {
		this.transactionDAO = transactionDAO;
	}

	@Override
	public Transaction getTransaction(int id) {
		return transactionDAO.getTransaction(id);
	}

	@Override
	public void createTransaction(Transaction transaction) {
		transactionDAO.createTransaction(transaction);
	}

	@Override
	public void saveOrUpdate(Transaction transaction) {
		transactionDAO.saveOrUpdate(transaction);
	}

	@Override
	public void deleteTransaction(Transaction transaction) {
		transactionDAO.deleteTransaction(transaction);
	}

	@Override
	public List<Transaction> getTransactionsByBuyerID(int id) {
		return transactionDAO.getTransactionsByBuyerID(id);
	}

	@Override
	public List<Transaction> getTransactionsBySellerID(int id) {
		return transactionDAO.getTransactionsBySellerID(id);
	}
	
}
