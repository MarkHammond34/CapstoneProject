package edu.ben.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
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
import edu.ben.model.Notification;
import edu.ben.model.SavedSearch;
import edu.ben.model.User;
import edu.ben.service.CategoryService;
import edu.ben.service.FavoriteService;
import edu.ben.service.ListingService;
import edu.ben.service.OfferService;
import edu.ben.service.NotificationService;
import edu.ben.service.SavedSearchService;
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

	@Autowired
	OfferService offerService;

	@Autowired
	SavedSearchService savedSearchService;

	@Autowired
	NotificationService notificationService;

	/**
	 * Upload single file using Spring Controller
	 */
	@RequestMapping(value = "/uploadListing", method = RequestMethod.POST)
	public String uploadFileHandler(@RequestParam("title") String name, @RequestParam("category") String category,
			@RequestParam("subCategory") String subCategory,
			@RequestParam(value = "price", required = false) Double price,
			@RequestParam("description") String description, @RequestParam("file") MultipartFile file,
			@RequestParam("type") String type, Model model, HttpServletRequest request) {

		System.out.println("Hit UploadListing Controller");
		if (price == null) {
			price = (double) 0;

			if (request.getParameter("endDate") != null) {

				// This is a dirty fix
				Timestamp endTimestamp = Timestamp.valueOf(request.getParameter("endDate").replace('T', ' ') + ":00.0");

				// Checks to make sure listing is for at least one hour
				if (endTimestamp.before(new Timestamp(System.currentTimeMillis() + 3600000))) {
					addErrorMessage("Listings Must Be Last At Least One Hour");
					setRequest(request);
					return "redirect:" + request.getHeader("Referer");

				}
			}
		}

		String message = "";
		String error = "";

		System.out.println(subCategory);

		User u = (User) request.getSession().getAttribute("user");

		if (u == null) {
			addErrorMessage("Login To Create A Listing");
			setRequest(request);
			return "login";
		}
		if (request.getParameter("endDate") != null) {
			// This is a dirty fix
			Timestamp endTimestamp = Timestamp.valueOf(request.getParameter("endDate").replace('T', ' ') + ":00.0");

			// Checks to make sure listing is for at least one hour
			if (endTimestamp.before(new Timestamp(System.currentTimeMillis() + 3600000))) {
				addErrorMessage("Listings Must Be Last At Least One Hour");
				setRequest(request);
				return "redirect:" + request.getHeader("Referer");
			}
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
				Listing listing = new Listing(name, description, price, category, file.getOriginalFilename());// FIX
																												// LATER

				if (type.equals("auction")) {
					listing.setType("auction");
					listing.setHighestBid(0);
				} else if (type.equals("donation")) {
					listing.setType("donation");
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
				// Check for saved searches
				ArrayList<SavedSearch> allSavedSearches = (ArrayList<SavedSearch>) savedSearchService
						.getAllSavedSearches();

				System.out.println("Saved Search size: " + allSavedSearches.size());

				if (allSavedSearches != null) {
					for (int i = 0; i < allSavedSearches.size(); i++) {
						if (description.toLowerCase().contains(allSavedSearches.get(i).getSearch().toLowerCase())
								|| name.toLowerCase().contains(allSavedSearches.get(i).getSearch().toLowerCase())) {
							if (allSavedSearches.get(i).getUser().getUserID() != u.getUserID()) {
								notificationService.save(new Notification(
										userService.getUserById(allSavedSearches.get(i).getUser().getUserID()),
										listing.getId(), "New Listing Posted",
										u.getUsername() + " has posting a listing\n\n pertaining to "
												+ allSavedSearches.get(i).getSearch() + ".",
										1));
							}
						}
					}
				}

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

	@RequestMapping("/viewListing")
	public ModelAndView viewListing(@RequestParam("l") int l) {
		ModelAndView model = new ModelAndView("listing");

		// get listing
		Listing listing = listingService.getByListingID(l);
		// pass these to model
		model.addObject("listing", listing);

		System.out.println("Being used?");

		return model;
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

		Listing listing = listings.get(0); // temp

		// get user
		User user = (User) request.getSession().getAttribute("user");

		model.addObject("user", user);
		model.addObject("listings", listings);

		model.addObject("listing", listing); // temp

		return model;
	}

	@RequestMapping(value = "/listing", method = RequestMethod.GET)
	public ModelAndView viewSelectedListing(HttpServletRequest request, @RequestParam("listingId") int listingID) {

		ModelAndView model = new ModelAndView("listing");

		// get listing
		Listing listing = listingService.getByListingID(1);
		User user = (User) request.getSession().getAttribute("user");
		String dateCreated = listing.getDateCreated().toString().substring(0, 10);
		// pass these to model
		model.addObject("listing", listing);
		model.addObject("user", user);
		model.addObject("date", dateCreated);

		boolean hasOffer;

		// Checks if the user already made an offer on the listing
		if (offerService.getOfferByUserAndListingId(user.getUserID(), listingID) != null) {
			hasOffer = true;
		} else {
			hasOffer = false;
		}

		model.addObject("hasOffer", hasOffer);

		System.out.println("viewSelected");

		return model;
	}

	@RequestMapping(value = "/listing2", method = RequestMethod.GET)
	public ModelAndView viewSelectedListing2() {

		ModelAndView model = new ModelAndView("listing2");

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

	// DELETE BELOW LATER

	@RequestMapping(value = "/listing3", method = RequestMethod.GET)
	public ModelAndView viewSelectedListing3() {

		ModelAndView model = new ModelAndView("listing3");

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

	// DELETE ABOVE LATER

	@RequestMapping(value = "/cancelAuction", method = RequestMethod.GET)
	public ModelAndView cancelAuction(@RequestParam("listing") int listingID) {

		ModelAndView model = new ModelAndView("profile?");

		Listing listing = listingService.getByListingID(listingID);
		User user = userService.getUserById(listing.getUser().getUserID());

		// if bidcount is above 0, reject auction cancel with an error message
		if (listing.getBidCount() > 0) {
			// error message
			addErrorMessage("You may not cancel an auction that has already been bid on.");
		} else {
			// popup, are you sure you want to cancel?

			// if bidcount is 0, ask if seller is sure they want to cancel the auction

			// no? - cancel popup

			// yes?

			// delete the listing
			listingService.deleteListing(listingID);

		}
		return model;
	}

}