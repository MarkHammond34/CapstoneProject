package edu.ben.controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.ben.model.CalendarEvent;
import edu.ben.util.Quickstart;

@Controller
public class CalenderController {

	@RequestMapping(value = "/viewCalender")
	public String viewCalender() {
		return "calender";
	}
	
	@RequestMapping(value = "/createEvent")
	public String createEvent(@RequestParam("title") String title, @RequestParam("location") String location, @RequestParam("description") String description, HttpServletRequest request ) throws IOException {
		System.out.println("Hit Servlet");
		
		Timestamp startDate = Timestamp.valueOf(request.getParameter("startDate").replace('T', ' ') + ":00");
		Timestamp endDate = Timestamp.valueOf(request.getParameter("endDate").replace('T', ' ') + ":00");
		
		CalendarEvent event = new CalendarEvent(title, location, startDate, endDate, description);
		
		Quickstart q = new Quickstart();
		
		System.out.println(startDate.toString());
		
		q.CreateEvent(event);
		
		return "calender";
	}
	
	@RequestMapping(value = "/eventsNews", method = RequestMethod.GET)
	public String viewEventsNews() {
		return "events-news";
	}

}
