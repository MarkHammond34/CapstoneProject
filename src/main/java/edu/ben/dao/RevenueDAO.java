package edu.ben.dao;

public interface RevenueDAO {

   public long getHourlyRevenue(int date);

   public long getDailyRevenue(int hour, String date);

   public long getWeeklyRevenue(int date);

   public long getMonthlyRevenue(String input);

   public Integer getYearlyRevenue(Integer date);

   public Integer getTotalRevenue();
}
