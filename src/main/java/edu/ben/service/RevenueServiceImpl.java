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
    public long getHourlyRevenue(int hour) {
        return rd.getHourlyRevenue(hour);
    }

    @Override
    public long getDailyRevenue(int day, String date) {
        return rd.getDailyRevenue(day, date);
    }

    @Override
    public long getWeeklyRevenue(int week) {
        return rd.getWeeklyRevenue(week);
    }

    @Override
    public long getMonthlyRevenue(String input) {
        return rd.getMonthlyRevenue(input);
    }

    @Override
    public Integer getYearlyRevenue(Integer year) {
        return rd.getYearlyRevenue(year);
    }

    @Override
    public Integer getTotalRevenue() {
        return rd.getTotalRevenue();
    }


}
