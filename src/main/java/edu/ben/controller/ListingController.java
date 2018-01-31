package edu.ben.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.ben.dao.ListingDAO;
import edu.ben.model.Listing;
import edu.ben.model.User;
import edu.ben.service.ListingService;
import edu.ben.service.UserService;
import edu.ben.util.ImagePath;

@Controller
public class ListingController {

	@Autowired
	ListingService listingService;

	/**
	 * Upload single file using Spring Controller
	 */
	@RequestMapping(value = "/uploadListing", method = RequestMethod.POST)
	public String uploadFileHandler(@RequestParam("title") String name, @RequestParam("category") String category,
			@RequestParam("price") double price, @RequestParam("description") String description,
			@RequestParam("file") MultipartFile file, Model model, HttpServletRequest request) {

		System.out.println("Hit UploadListing Controller");

		String message = "";
		String error = "";

		User u = (User) request.getSession().getAttribute("u");

		if (!file.isEmpty()) {
			try {
				String extension = FilenameUtils.getExtension(file.getOriginalFilename());

				System.out.println(extension);

				if (!extension.equals("jpg") && !extension.equals("png") && !extension.equals("jpeg")) {
					error = "Listing failed. You did not upload an image.";
					model.addAttribute("error", error);
					return "createListing";
				} else if (price < 0) {
					error = "Cannot have a negative price.";
					model.addAttribute("error", error);
					return "createListing";
				}

				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				File dir = new File(ImagePath.url + File.separator + "listings");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server

				System.out.println("Hit Controller 2");
				File serverFile = new File(dir.getAbsolutePath() + File.separator + file.getOriginalFilename());
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);

				System.out.println("File Uploaded");
				Listing listing = new Listing(name, description, price, category, file.getOriginalFilename());

				listing.setUser(u);
				listingService.create(listing);

				message = "Listing Uploaded Successfully";
				model.addAttribute("message", message);
				stream.close();

				// Listing l = new Listing(name, description, price, category, file );
				// ld.create(l);

				return "createListing";
			} catch (Exception e) {
				e.printStackTrace();
				return "You failed to upload " + name + " => " + e.getMessage();

			}
		} else {
			return "You failed to upload " + name + " because the file was empty.";
		}

	}

	@RequestMapping("/createListing")
	public String listingPage(HttpServletRequest request) {
		User u = new User(1, "Steve", "Schultz", "Schultz28", "steveschultz73@gmail.com", "b2273469@ben.edu",
				"cooperstown19", "cooperstown19", 1);
		request.getSession().setAttribute("u", u);

		User user2 = (User) request.getSession().getAttribute("u");
		System.out.println("SessionID: " + user2.getUserID());

		return "createListing";
	}

	@RequestMapping("/displayListing")
	public String displayListing(@RequestParam("category") String category, HttpServletRequest request, Model model) {

		List<Listing> listings = listingService.getAllListingsByCategory(category);
		System.out.println("List size = " + listings.size());

		User user = (User) request.getSession().getAttribute("u");

		model.addAttribute("user", user);
		model.addAttribute("category", category);
		model.addAttribute("listings", listings);

		return "displayListing";
	}

}
