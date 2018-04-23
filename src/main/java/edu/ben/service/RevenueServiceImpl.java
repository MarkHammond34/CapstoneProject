package edu.ben.service;

import edu.ben.dao.RevenueDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class RevenueServiceImpl implements RevenueService {

    RevenueDAO rd;

    @Autowired
    public void setRd(RevenueDAO rd) {
        this.rd = rd;
    }

    @Override
    public int getHourlyRevenue(int hour) {
        return rd.getHourlyRevenue(hour);
    }

    @Override
    public int getDailyRevenue(int day) {
        return rd.getDailyRevenue(day);
    }

    @Override
    public int getWeeklyRevenue(int week) {
        return rd.getWeeklyRevenue(week);
    }

    @Override
    public int getMonthlyRevenue(int month) {
        return rd.getMonthlyRevenue(month);
    }

    @Override
    public int getYearlyRevenue(int year) {
        return rd.getYearlyRevenue(year);
    }

    @Override
    public int getTotalRevenue() {
        return rd.getTotalRevenue();
    }


}
