package edu.ben.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

	@RequestMapping(value = "/communityPage", method = RequestMethod.GET)
	public ModelAndView community() {
		ModelAndView model = new ModelAndView("/community");
		// List<User> list = userService.getAllUsers();

		// model.addObject("list", list);

		return model;
	}

	@RequestMapping(value = "/feedback", method = RequestMethod.POST)
	public ModelAndView feedback() {

		return new ModelAndView("redirect:/community");
	}

	@RequestMapping(value = "/uploadNews", method = RequestMethod.POST)
	public String viewEventsNews(HttpServletRequest request,  @RequestParam("title") String title, @RequestParam("doc") MultipartFile doc,
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
				File dir2 = new File(Path.url + File.separator + "news" );
				
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

		CalendarEvent event = new CalendarEvent(title, location, startDate, endDate, description);

		Quickstart q = new Quickstart();

		System.out.println(startDate.toString());

		q.CreateEvent(event);

		return "events-news";
	}

}
