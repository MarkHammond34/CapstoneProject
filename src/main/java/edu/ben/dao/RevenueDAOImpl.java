package edu.ben.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;

@Repository
@Transactional
public class RevenueDAOImpl implements RevenueDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public long getHourlyRevenue(int hour) {
        return 0;
    }

    @Override
    public long getDailyRevenue(int hour, String date) {
        try {
            Query q = getSession().createQuery("SELECT SUM(transactionPrice) AS transactionPrice FROM revenue WHERE DATE_FORMAT(transactionDate, '%Y-%M-%d') = '"+ date +"' and  DATE_FORMAT(transactionDate, '%H') = " + hour + " GROUP BY DATE_FORMAT(transactionDate, '%Y-%M-%d')");
            return (long) q.uniqueResult();

        } catch (NullPointerException e) {
            return 0;
        }
    }

    // done
    @Override
    public long getWeeklyRevenue(int date) {

        try {
            Query q = getSession().createQuery("Select sum(rev.transactionPrice) FROM revenue rev WHERE DAY(transactionDate) = DAY(:date)");
            q.setParameter("date", date);
            return (long) q.uniqueResult();

        } catch (NullPointerException e) {
            return 0;
        }
    }


    @Override
    public long getMonthlyRevenue(String date) {

        try {
            Query q = getSession().createQuery("SELECT SUM(transactionPrice) as transactionPrice FROM revenue WHERE DATE_FORMAT(transactionDate, \'%Y-%M\') = '" + date + "' GROUP BY DATE_FORMAT(transactionDate, \'%Y-%M\')");

            return (long) q.uniqueResult();
        } catch (NullPointerException e) {
            return 0;
        }

    }

    @Override
    public Integer getYearlyRevenue(Integer date) {
        return 0;
    }

    @Override
    public Integer getTotalRevenue() {
        return 0;
    }
}
