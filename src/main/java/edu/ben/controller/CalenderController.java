package edu.ben.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.zwobble.mammoth.DocumentConverter;
import org.zwobble.mammoth.Result;
import org.apache.poi.xwpf.usermodel.XWPFDocument;

import edu.ben.model.CalendarEvent;
import edu.ben.model.News;
import edu.ben.service.NewsService;
import edu.ben.model.Listing;
import edu.ben.util.Path;
import edu.ben.util.Quickstart;

@Controller
public class CalenderController {
	
	@Autowired
	NewsService newsService;

	@RequestMapping(value = "/viewCalender")
	public String viewCalender(HttpServletRequest request, @RequestParam("doc") MultipartFile doc) throws IOException {

		// File convFile = new File(doc.getOriginalFilename());
		// convFile.createNewFile();
		//
		// DocumentConverter converter = new DocumentConverter();
		// Result<String> result = converter.convertToHtml(convFile);
		// String html = result.getValue(); // The generated HTML
		// System.out.println(html);
		// Set<String> warnings = result.getWarnings(); // Any warnings during
		// conversion
		//
		// request.setAttribute("html", html);
		return "calender";
	}

	

	@RequestMapping(value = "/eventsNews", method = RequestMethod.GET)
	public String viewEventsNews() {
		return "events-news";
	}

	

}
