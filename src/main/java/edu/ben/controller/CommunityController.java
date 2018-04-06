package edu.ben.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Array;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import edu.ben.model.Video;
import edu.ben.service.EventsService;
import edu.ben.service.VideoService;
import org.apache.commons.io.FilenameUtils;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xwpf.model.XWPFHeaderFooterPolicy;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFFooter;
import org.apache.poi.xwpf.usermodel.XWPFHeader;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.ben.model.CalendarEvent;
import edu.ben.model.News;
import edu.ben.service.NewsService;
import edu.ben.util.Path;
import edu.ben.util.Quickstart;

@Controller
public class CommunityController extends BaseController {

    @Autowired
    NewsService newsService;

    @Autowired
    EventsService eventService;

    @Autowired
    VideoService videoService;

    @RequestMapping(value = "/communityPage", method = RequestMethod.GET)
    public ModelAndView community(HttpServletRequest request) {
        ModelAndView model = new ModelAndView("/community2");

        ArrayList<CalendarEvent> events = (ArrayList<CalendarEvent>) eventService.getAllEvents();

        ArrayList<String> day = new ArrayList<>();
        ArrayList<String> month = new ArrayList<>();
        ArrayList<Integer> year = new ArrayList<>();
        ArrayList<Integer> date = new ArrayList<>();
        ArrayList<String> time = new ArrayList<>();
        int size = 5;
        if (events.size() <= 5) {
            size = events.size();
        }


        for (int i = 0; i < size; i++) {
            String monthString;
            String timeString;
            String hour;
            String minute;
            String am_pm;
            System.out.println("Hour: " + events.get(i).getStartTime().getHours() );
            System.out.println("Minute: " + events.get(i).getStartTime().getMinutes() );
            if (events.get(i).getStartTime().getHours() > 12) {
                hour = Integer.toString(events.get(i).getStartTime().getHours() - 12);
                am_pm = "PM";
            } else {
                hour = Integer.toString(events.get(i).getStartTime().getHours());
                am_pm = "AM";
            }

            if (events.get(i).getStartTime().getMinutes() <= 9) {
                minute = "0" + Integer.toString(events.get(i).getStartTime().getMinutes());
            } else {
                minute = Integer.toString(events.get(i).getStartTime().getMinutes());
            }

            timeString = hour +":" + minute + am_pm;
            time.add(timeString);

            switch (events.get(i).getStartTime().getMonth()) {
                case 0:
                    monthString = "January";
                    month.add(monthString);
                    break;
                case 1:
                    monthString = "February";
                    month.add(monthString);
                    break;
                case 2:
                    monthString = "March";
                    month.add(monthString);
                    break;
                case 3:
                    monthString = "April";
                    month.add(monthString);
                    break;
                case 4:
                    monthString = "May";
                    month.add(monthString);
                    break;
                case 5:
                    monthString = "June";
                    month.add(monthString);
                    break;
                case 6:
                    monthString = "July";
                    month.add(monthString);
                    break;
                case 7:
                    monthString = "August";
                    month.add(monthString);
                    break;
                case 8:
                    monthString = "September";
                    month.add(monthString);
                    break;
                case 9:
                    monthString = "October";
                    month.add(monthString);
                    break;
                case 10:
                    monthString = "November";
                    month.add(monthString);
                    break;
                case 11:
                    monthString = "December";
                    month.add(monthString);
                    break;
                default:
                    monthString = "Invalid month";
                    break;
            }
            String dayString = "invalid";
            switch (events.get(i).getStartTime().getDay()) {
                case 1:
                    dayString = "Monday";
                    day.add(monthString);
                    break;
                case 2:
                    dayString = "Tuesday";
                    day.add(monthString);
                    break;
                case 3:
                    dayString = "Wednesday";
                    day.add(monthString);
                    break;
                case 4:
                    dayString = "Thursday";
                    day.add(monthString);
                    break;
                case 5:
                    dayString = "Friday";
                    day.add(monthString);
                    break;
                case 6:
                    dayString = "Saturday";
                    day.add(monthString);
                    break;
                case 7:
                    dayString = "Sunday";
                    day.add(monthString);
                    break;
            }

            Integer yearInt = events.get(i).getStartTime().getYear() + 1900;
            year.add(yearInt);

            date.add(events.get(i).getStartTime().getDate());


            System.out.println("Month: " + monthString);
            System.out.println("Day: " + dayString);
            System.out.println("Year: " + yearInt);
            System.out.println("Date: " + events.get(i).getStartTime().getDate());
            System.out.println("Time: " + timeString);


            request.setAttribute("day", day);
            request.setAttribute("month", month);
            request.setAttribute("year", year);
            request.setAttribute("date", date);
            request.setAttribute("events", events);
            request.setAttribute("time", time);
        }

        Video newestVideo = videoService.getNewestVideo();
        Timestamp videoDateInt = newestVideo.getDateCreated();
        String videoDate = Integer.toString(videoDateInt.getMonth() + 1) +"/" + Integer.toString(videoDateInt.getDate()+ 1)+ "/" + Integer.toString(videoDateInt.getYear() + 1900);
        request.setAttribute("videoDate", videoDate);
        System.out.println("video date: " + videoDate);
        System.out.println("Path: " + newestVideo.getVideoPath());
        request.setAttribute("newestVideo", newestVideo);

        return model;
    }

    @RequestMapping(value = "/feedback", method = RequestMethod.POST)
    public ModelAndView feedback() {

        return new ModelAndView("redirect:/community");
    }

    @RequestMapping(value = "/uploadNews", method = RequestMethod.POST)
    public String viewEventsNews(HttpServletRequest request, @RequestParam("title") String title, @RequestParam("doc") MultipartFile doc,
                                 @RequestParam("image") MultipartFile image, @RequestParam("description") String description) throws IOException {
        if (!doc.isEmpty()) {
            try {
                String extension = FilenameUtils.getExtension(doc.getOriginalFilename());
                String imageExtension = FilenameUtils.getExtension(image.getOriginalFilename());

//				System.out.println(extension);

                byte[] bytes = doc.getBytes();
                byte[] bytes2 = image.getBytes();

                // Creating the directory to store file
                File dir = new File(Path.docPath);
                File dir2 = new File(Path.url + File.separator + "news");

                if (!dir.exists())
                    dir.mkdirs();

                if (!dir2.exists())
                    dir2.mkdirs();

                // Create the file on server

                System.out.println("Hit Controller 2");
                File serverFile = new File(dir.getAbsolutePath() + File.separator + doc.getOriginalFilename());
                File serverFile2 = new File(dir2.getAbsolutePath() + File.separator + image.getOriginalFilename());

                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                BufferedOutputStream stream2 = new BufferedOutputStream(new FileOutputStream(serverFile2));

                stream.write(bytes);
                stream2.write(bytes2);

                System.out.println("File Uploaded");
                News news = new News(title, doc.getOriginalFilename(), image.getOriginalFilename(), description);
                newsService.create(news);

                stream.close();
                stream2.close();
            } catch (Exception e) {
                e.printStackTrace();
                return "You failed to upload " + doc.getOriginalFilename() + " => " + e.getMessage();

            }

        }
        return "events-news";
    }

    @RequestMapping(value = "/viewNews")
    public String viewNews(HttpServletRequest request) {
        Resource resource = new ClassPathResource("TempNews1.docx");
        // File file = new File(classLoader.getResource("El Norte.docx").getFile());
        System.out.println("Please dont fail " + resource.getFilename());
        //
        // System.out.println(file.getAbsolutePath());
        // String name = doc.getOriginalFilename();
        // File resource = new File("C:" + request.getContextPath() +
        // "/src/main/webapp/resources/docs/" + name);
        // System.out.println("Resource " + resource.getPath());

        try {
            FileInputStream fis = new FileInputStream(resource.getFile());
            XWPFDocument xdoc = new XWPFDocument(OPCPackage.open(fis));

            List<XWPFParagraph> paragraphList = xdoc.getParagraphs();
            XWPFHeaderFooterPolicy policy = new XWPFHeaderFooterPolicy(xdoc);

            XWPFHeader header = policy.getDefaultHeader();
            if (header != null) {
                request.setAttribute("header", header);
                System.out.println(header.getText());
            }

            XWPFFooter footer = policy.getDefaultFooter();
            if (footer != null) {
                request.setAttribute("footer", footer);
                System.out.println(footer.getText());
            }

            for (XWPFParagraph paragraph : paragraphList) {

                System.out.println(paragraph.getText());
                System.out.println(paragraph.getAlignment());
                System.out.print(paragraph.getRuns().size());
                System.out.println(paragraph.getStyle());

                // Returns numbering format for this paragraph, eg bullet or lowerLetter.
                System.out.println(paragraph.getNumFmt());
                System.out.println(paragraph.getAlignment());

                System.out.println(paragraph.isWordWrapped());

                System.out.println("********************************************************************");
            }
            request.setAttribute("paragraphList", paragraphList);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "newsPage";
    }

    @RequestMapping(value = "/createEvent")
    public String createEvent(@RequestParam("title") String title, @RequestParam("location") String location,
                              @RequestParam("description") String description, HttpServletRequest request) throws IOException {
        System.out.println("Hit Servlet");

        Timestamp startDate = Timestamp.valueOf(request.getParameter("startDate").replace('T', ' ') + ":00");
        Timestamp endDate = Timestamp.valueOf(request.getParameter("endDate").replace('T', ' ') + ":00");

        CalendarEvent event = new CalendarEvent(title, location, startDate, endDate, description, 0);

        Quickstart q = new Quickstart();

        System.out.println(startDate.toString());

        q.CreateEvent(event);

        return "events-news";
    }

    @RequestMapping(value="/searchNews")
    public String searchNews(HttpServletRequest request, @RequestParam("Seaerch") String search) {
        System.out.println(search);
        ArrayList<News> news = (ArrayList<News>) newsService.getAllArticles();
        ArrayList<News> searchResults = new ArrayList<>();


        for (int i = 0;  i < news.size(); i++ ) {
            boolean searchFound = false;
            Resource resource = new ClassPathResource(news.get(i).getFilePath());
            // File file = new File(classLoader.getResource("El Norte.docx").getFile());
            System.out.println("Please dont fail " + resource.getFilename());
            //
            // System.out.println(file.getAbsolutePath());
            // String name = doc.getOriginalFilename();
            // File resource = new File("C:" + request.getContextPath() +
            // "/src/main/webapp/resources/docs/" + name);
            // System.out.println("Resource " + resource.getPath());

            try {
                FileInputStream fis = new FileInputStream(resource.getFile());
                XWPFDocument xdoc = new XWPFDocument(OPCPackage.open(fis));

                List<XWPFParagraph> paragraphList = xdoc.getParagraphs();
                XWPFHeaderFooterPolicy policy = new XWPFHeaderFooterPolicy(xdoc);

                XWPFHeader header = policy.getDefaultHeader();
                if (header != null) {
                    request.setAttribute("header", header);
                    System.out.println(header.getText());

                    if (header.getText().toLowerCase().contains(search)) {
                        System.out.println("Search found in header");
                        searchResults.add(news.get(i));
                        searchFound = true;
                    }
                }

                XWPFFooter footer = policy.getDefaultFooter();
                if (footer != null) {
                    request.setAttribute("footer", footer);
                    System.out.println(footer.getText());

                    if(footer.getText().toLowerCase().contains(search) && (searchFound = false)) {
                        System.out.println("Search found in footer");
                        searchResults.add(news.get(i));
                        searchFound = true;
                    }
                }

                for (XWPFParagraph paragraph : paragraphList) {
                    if (paragraph.getText().toLowerCase().contains(search) && (searchFound = false)) {
                        System.out.println("Search Result found");
                        searchResults.add(news.get(i));
                    }
                    System.out.println(paragraph.getText());
                    System.out.println(paragraph.getAlignment());
                    System.out.print(paragraph.getRuns().size());
                    System.out.println(paragraph.getStyle());

                    // Returns numbering format for this paragraph, eg bullet or lowerLetter.
                    System.out.println(paragraph.getNumFmt());
                    System.out.println(paragraph.getAlignment());

                    System.out.println(paragraph.isWordWrapped());

                    System.out.println("********************************************************************");
                }
                request.setAttribute("paragraphList", paragraphList);
                request.setAttribute("newsSearchResults", searchResults);
                System.out.println("search size: " + searchResults.size());
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return "community2";
    }

}
