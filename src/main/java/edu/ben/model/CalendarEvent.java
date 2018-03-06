package edu.ben.model;

import java.sql.Timestamp;

public class CalendarEvent {
	
	private String title;
	private String location;
	private String description;
	
	private Timestamp startTime;
	private Timestamp endTime;
	
	public CalendarEvent(String title, String location, Timestamp startTime, Timestamp endTime, String description) {
		super();
		this.title = title;
		this.location = location;
		this.description = description;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Timestamp getStartTime() {
		return startTime;
	}
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	
	
	

}
