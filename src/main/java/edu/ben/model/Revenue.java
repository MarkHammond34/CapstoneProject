package edu.ben.model;

import javax.persistence.*;
import java.sql.Timestamp;

@Table(name = "revenue")
@Entity(name = "revenue")
public class Revenue {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "revenue_ID")
    private int revenueID;

    @Column(name = "transaction_price")
    private int transactionPrice;

    @Column(name="date")
    private Timestamp date;

    public Revenue() {

    }

    public int getRevenueID() {
        return revenueID;
    }

    public void setRevenueID(int revenueID) {
        this.revenueID = revenueID;
    }

    public int getTransactionPrice() {
        return transactionPrice;
    }

    public void setTransactionPrice(int transactionPrice) {
        this.transactionPrice = transactionPrice;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
}
