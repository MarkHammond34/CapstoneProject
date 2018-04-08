package edu.ben.controller;

import edu.ben.model.Video;
import edu.ben.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.RequestWrapper;
import java.awt.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class VideoController extends BaseController {

    @Autowired
    VideoService videoService;

    @RequestMapping(value="/uploadVideo")
    public String uploadVideo(HttpServletRequest request, @RequestParam("videoTitle") String videoTitle, @RequestParam("video") String videoPath) {

        String pattern = "(?<=watch\\?v=|/videos/|embed\\/|youtu.be\\/|\\/v\\/|\\/e\\/|watch\\?v%3D|watch\\?feature=player_embedded&v=|%2Fvideos%2F|embed%\u200C\u200B2F|youtu.be%2F|%2Fv%2F)[^#\\&\\?\\n]*";
        String embeddedURL = "https://www.youtube.com/embed/";
        String id = "None";
        String message = "";

        Pattern compiledPattern = Pattern.compile(pattern);
        Matcher matcher = compiledPattern.matcher(videoPath); //url is youtube url for which you want to extract the id.
        if (matcher.find()) {
            id = matcher.group();
            embeddedURL = embeddedURL + id;
        } else {
            message = "This is not a valid youtube video URL";
            request.setAttribute("message", message);
            return "events-news";
        }
        Video video = new Video(videoTitle, embeddedURL);
        videoService.create(video);
        System.out.println(id);

        return "events-news";
    }

    @RequestMapping(value="/allVideos")
    public String viewAllVideos(HttpServletRequest request) {
        ArrayList<Video> allVideos = (ArrayList<Video>) videoService.getAllVideos();
        ArrayList<String> allDates = new ArrayList<>();

        for (int i = 0; i < allVideos.size(); i ++) {
            Timestamp videoDateInt = allVideos.get(i).getDateCreated();

            String videoDate = Integer.toString(videoDateInt.getMonth() + 1) +"/" + Integer.toString(videoDateInt.getDate()+ 1)+ "/" + Integer.toString(videoDateInt.getYear() + 1900);
            allDates.add(videoDate);
        }
        request.setAttribute("allVideos", allVideos);
        request.setAttribute("allDates", allDates);
        return "all-videos";
    }


}
