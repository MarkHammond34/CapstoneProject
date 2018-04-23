package edu.ben.dao;

import edu.ben.model.News;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;

@Transactional
@Repository
public class RevenueDAOImpl implements RevenueDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public int getHourlyRevenue(int hour) {
       return 0;
    }

    @Override
    public int getDailyRevenue(int day) {
        Query q = getSession().createQuery("SELECT SUM(transaction_price) FROM revenue WHERE DAY(revenue.date) = DAY(20180401:day)");
        q.setParameter("day", day);
        return (Integer) q.uniqueResult();
    }

    @Override
    public int getWeeklyRevenue(int week) {
        return 0;
    }

    @Override
    public int getMonthlyRevenue(int month) {
        return 0;
    }

    @Override
    public int getYearlyRevenue(int year) {
        return 0;
    }

    @Override
    public int getTotalRevenue() {
        return 0;
    }
}
