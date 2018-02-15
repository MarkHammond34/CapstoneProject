package edu.ben.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.ben.model.Favorite;
import edu.ben.model.Listing;
import edu.ben.model.User;
import edu.ben.service.CategoryService;
import edu.ben.service.FavoriteService;
import edu.ben.service.ListingService;
import edu.ben.service.UserService;
import edu.ben.util.ImagePath;

@Controller
public class ListingController extends BaseController {

	@Autowired
	ListingService listingService;

	@Autowired
	FavoriteService favoriteService;

	@Autowired
	CategoryService categoryService;

	@Autowired
	UserService userService;

	/**
	 * Upload single file using Spring Controller
	 */
	@RequestMapping(value = "/uploadListing", method = RequestMethod.POST)
	public String uploadFileHandler(@RequestParam("title") String name, @RequestParam("category") String category,
			@RequestParam("price") double price, @RequestParam("description") String description,
			@RequestParam("file") MultipartFile file, @RequestParam("type") String type, Model model,
			HttpServletRequest request) {

		System.out.println("Hit UploadListing Controller");

		String message = "";
		String error = "";

		User u = (User) request.getSession().getAttribute("user");

		if (u == null) {
			addErrorMessage("Login To Create A Listing");
			setRequest(request);
			return "login";
		}

		// This is a dirty fix
		Timestamp endTimestamp = Timestamp.valueOf(request.getParameter("endDate").replace('T', ' ') + ":00.0");

		// Checks to make sure listing is for at least one hour
		if (endTimestamp.before(new Timestamp(System.currentTimeMillis() + 3600000))) {
			addErrorMessage("Listings Must Be Last At Least One Hour");
			setRequest(request);
			return "redirect:" + request.getHeader("Referer");
		}

		if (!file.isEmpty()) {
			try {
				String extension = FilenameUtils.getExtension(file.getOriginalFilename());

				System.out.println(extension);

				if (!extension.equals("jpg") && !extension.equals("png") && !extension.equals("jpeg")) {
					addErrorMessage("Listing failed. You did not upload an image.");
					setRequest(request);
					return "createListing";
				} else if (price < 0) {
					addErrorMessage("Cannot have a negative price.");
					setRequest(request);
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
				Listing listing = new Listing(name, description, price, /* category, */ file.getOriginalFilename());// FIX
																													// LATER

				if (type.equals("auction")) {
					listing.setType("auction");
					listing.setHighestBid(0.0);
				} else {
					listing.setType("fixed");
				}

				listing.setUser(u);
				System.out.println("Check to see if session exists: " + u.getUserID());
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
		setRequest(request);
		return "createListing";
	}

	@RequestMapping("/displayListing")
	public String displayListing(HttpServletRequest request) {
		setRequest(request);
		return "displayListing";
	}

	@RequestMapping("/displayListingByCategory")
	public String displayListingByCategory(@RequestParam("category") String category, HttpServletRequest request,
			Model model) {

		System.out.println("Listing Category for display: " + category);
		List<Listing> listings = listingService.getAllListingsByCategory(category);
		System.out.println("List size = " + listings.size());
		System.out.println(listings.get(0).getImage_path());
		User user = (User) request.getSession().getAttribute("user");

		// System.out.println("User attribute: " + user.getUsername());
		model.addAttribute("user", user);
		model.addAttribute("category", category);
		model.addAttribute("listings", listings);

		return "displayListing";
	}

	@RequestMapping(value = "/watchListing", method = RequestMethod.POST)
	public String updateListing(HttpServletRequest request, ModelAndView model) {
		String listingIDString = request.getParameter("listingID");
		int listingID = Integer.parseInt(listingIDString);

		User user = (User) request.getSession().getAttribute("user");
		Listing listing = listingService.getByListingID(listingID);

		Favorite f = new Favorite();
		f.setListing(listing);
		f.setUser(user);

		// if it exists. (change name later)
		if (favoriteService.isWatched(listingID, user.getUserID())) {
			System.out.println("Unwatching a Listing");
			favoriteService.unwatchListing(listingID, user.getUserID());
		} else {
			System.out.println("Watching a listing");
			favoriteService.watchListing(listingID, user.getUserID());
		}

		List<Listing> recent = listingService.getRecentListings();
		model.addObject("recentListings", recent);

		List<Listing> endingSoon = listingService.getRecentListings();
		model.addObject("endingSoonListings", endingSoon);

		List<Listing> trending = listingService.getListingsByBidCount();
		model.addObject("trendingListings", trending);

		return "redirect:/";
	}

	@PostMapping("/bid")
	public String bid(@RequestParam("bidValue") double bidValue, @RequestParam int listingID,
			HttpServletRequest request) {

		User user = (User) request.getSession().getAttribute("user");

		if (user == null) {
			addWarningMessage("Login To Place A Bid");
			setRequest(request);
			return "login";
		}

		int results = listingService.placeBid(user.getUserID(), bidValue, listingService.getByListingID(listingID));

		if (results == -2) {
			addErrorMessage("Bid Most Be Larger Than Highest Bid");
		} else if (results == -1) {
			addErrorMessage("Sorry, you didn't get your bid in on time!");
		} else {
			addSuccessMessage("Congrats! You're the highest bidder!");
		}

		setRequest(request);
		System.out.println("redirect:" + request.getHeader(" Referer "));
		return "redirect:" + request.getHeader("Referer");
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit() {

		ModelAndView model = new ModelAndView("/jspf/edit-fixed-listing");
		model.addObject("listingID", 1);

		return model;
	}

	@RequestMapping(value = "/editTheListing", method = RequestMethod.POST)
	public String editListing(@RequestParam("listingID") String id, @RequestParam("price") String price) {

		Listing listing = listingService.getByListingID(Integer.parseInt(id));
		listing.setPrice(Double.parseDouble(price));
		listingService.saveOrUpdate(listing);

		return "redirect:/viewProfile";
	}

	@RequestMapping(value = "/sub", method = RequestMethod.GET)
	public ModelAndView viewSubcats() {

		ModelAndView model = new ModelAndView("sub-categories");

		return model;
	}

	@RequestMapping(value = "/subPost", method = RequestMethod.POST)
	public ModelAndView viewSubcategories(@RequestParam("category") String category, HttpServletRequest request) {

		ModelAndView model = new ModelAndView("sub-categories");

		// get listings
		List<Listing> listings = listingService.getAllListingsByCategory(category);

		// get user
		User user = (User) request.getSession().getAttribute("user");

		model.addObject("user", user);
		model.addObject("listings", listings);

		return model;
	}

	@RequestMapping(value = "/listing", method = RequestMethod.GET)
	public ModelAndView viewSelectedListing() {

		ModelAndView model = new ModelAndView("listing");

		// get listing
		Listing listing = listingService.getByListingID(1);
		User user = userService.getUserById(1);
		String dateCreated = listing.getDateCreated().toString().substring(0, 10);
		// pass these to model
		model.addObject("listing", listing);
		model.addObject("user", user);
		model.addObject("date", dateCreated);

		return model;
	}

}