package edu.ben.dao;

public interface RevenueDAO {

   public long getDailyRevenue(int hour, String date);

   public long getWeeklyRevenue(String date);

   public long getMonthlyRevenue(String input);

   public long getYearlyRevenue(String date);

   public long getTotalRevenue();
}
