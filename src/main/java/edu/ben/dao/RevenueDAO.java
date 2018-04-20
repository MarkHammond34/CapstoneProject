package edu.ben.dao;

import java.sql.Timestamp;

public interface RevenueDAO {

   public int getHourlyRevenue(int hour);

   public int getDailyRevenue(int day);

   public int getWeeklyRevenue(int week);

   public int getMonthlyRevenue(int month);

   public int getYearlyRevenue(int year);

   public int getTotalRevenue();
}
