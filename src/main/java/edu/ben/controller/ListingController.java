package edu.ben.controller;

import edu.ben.model.*;
import edu.ben.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import edu.ben.service.CategoryService;
import edu.ben.service.FavoriteService;
import edu.ben.service.ListingService;
import edu.ben.service.OfferService;
import edu.ben.service.NotificationService;
import edu.ben.service.SavedSearchService;
import edu.ben.service.UserService;
import edu.ben.util.Path;

@Controller
@Transactional
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

    @Autowired
    PickUpService pickUpService;

    @Autowired
    TransactionService transactionService;

    @Autowired
    private Environment environment;

    @Autowired
    ImageService imageService;

    @Autowired
    TutorialService tutorialService;

    /**
     * Upload single file using Spring Controller
     */
    @RequestMapping(value = "/uploadListing", method = RequestMethod.POST)
    public String uploadFileHandler(@RequestParam("title") String name, @RequestParam("category") String category,
                                    @RequestParam("subCategory") String subCategory,
                                    @RequestParam(value = "price", required = false) Double price,
                                    @RequestParam("description") String description, @RequestParam("file") List<MultipartFile> file,
                                    @RequestParam("type") String type, @RequestParam("paymentType") String paymentType,
                                    @RequestParam("premium") String premium, Model model,
                                    HttpServletRequest request) {

        System.out.println("Hit UploadListing Controller");
        if (price == null) {
            price = (double) 0;
            // This is a dirty fix
            Timestamp endTimestamp = Timestamp.valueOf(request.getParameter("endDate").replace('T', ' ') + ":00.0");

            // Checks to make sure listing is for at least one hour
            if (endTimestamp.before(new Timestamp(System.currentTimeMillis() + 3600000))) {
                addErrorMessage("Listings Must Be Last At Least One Hour");
                setRequest(request);
                return "redirect:" + request.getHeader("Referer");

            }
        }

        String message = "";
        //String error = "";

        System.out.println(subCategory);

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
        // This is a dirty fix

        if (request.getParameter("endDate") != null) {
            // Timestamp endTimestamp = Timestamp.valueOf(request.getParameter("endDate").replace('T', ' ') + ":00.0");
            // Checks to make sure listing is for at least one hour
            if (endTimestamp.before(new Timestamp(System.currentTimeMillis() + 3600000))) {
                addErrorMessage("Listings Must Be Last At Least One Hour");
                setRequest(request);
                return "redirect:" + request.getHeader("Referer");
            }
        }
        if (price < 0) {
            addErrorMessage("Cannot have a negative price.");
            setRequest(request);
            return "listing/create-listing";
        }

        Listing listing = new Listing(name, description, price, category, paymentType);// FIX

        if (type.equals("auction")) {
            listing.setType("auction");
            listing.setHighestBid(0);
        } else {
            listing.setType("fixed");
        }
        System.out.println(premium);

        if (premium.equals("yes")) {
            listing.setPremium(1);
        } else {
            listing.setPremium(0);
        }

        if (!file.isEmpty()) {
            try {
////                String extension = FilenameUtils.getExtension(file.getOriginalFilename());
////                listing.setUser(u);
////                int listingId = listingService.save(listing);
////                Listing lst = listingService.getByListingID(listingId);
////
////                String directory = System.getProperty("user.home");
////                for (int i = 0; i < file.size(); i++) {
////                    String fileType = FilenameUtils.getExtension(file.get(i).getOriginalFilename());
////                    String fileName = FilenameUtils.getBaseName(file.get(i).getOriginalFilename());
////                    if (fileType.equals("jpg") || fileType.equals("png") || fileType.equals("jpeg")) {
////                        Image imgImport = new Image();
////                        try {
////                            // byte[] bytes = file.get(i).getBytes();
////                            System.out.println("File Directory:   " + System.getProperty("user.home") + File.separator + "ulistitUsers" + File.separator + u.getUserID() + "@" + u.getSchoolEmail() + File.separator + "listings" + File.separator + listingId);
////                            File dir = new File(System.getProperty("user.home") + File.separator + "ulistitUsers" + File.separator + u.getUserID() + "@" + u.getSchoolEmail() + File.separator + "listings" + File.separator + listingId);
////                            if (!dir.exists())
////                                dir.mkdirs();
////                            System.out.println("Image Path:     " + "ulistitUsers" + "/" + u.getUserID() + "@" + u.getSchoolEmail() + "/" + "listings" + "/" + listingId);
////                            imgImport.setImage_path("ulistitUsers" + "/" + u.getUserID() + "@" + u.getSchoolEmail() + "/" + "listings" + "/" + listingId);
////                            imgImport.setListing(lst);
////                            imgImport.setImage_name(fileName + "." + fileType);
////                            if (i == 0)
////                                imgImport.setMain(1);
////                            imageService.save(imgImport);
////                            System.out.println("Full File path:     " + System.getProperty("user.home") + File.separator + "ulistitUsers" + File.separator + u.getUserID() + "@" + u.getSchoolEmail() + File.separator + "listings" + File.separator + listingId + File.separator + file.get(i).getOriginalFilename());
////                            File serverFile = new File(System.getProperty("user.home") + File.separator + "ulistitUsers" + File.separator + u.getUserID() + "@" + u.getSchoolEmail() + File.separator + "listings" + File.separator + listingId + File.separator + file.get(i).getOriginalFilename());
////                            try {
////                                //  BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
////                                stream.write(bytes);
////                            } catch (FileNotFoundException e) {
////                                e.printStackTrace();
////                            }
////
////                        } catch (IOException e) {
////                            e.printStackTrace();
////                        }
////                    }
////                }
//
//                if (!file.isEmpty()) {
//                    try {
//                        String extension = FilenameUtils.getExtension(file.getOriginalFilename());
//
//                        System.out.println(extension);
//
//                        if (!extension.equals("jpg") && !extension.equals("png") && !extension.equals("jpeg")) {
//                            addErrorMessage("Listing failed. You did not upload an image.");
//                            setRequest(request);
//                            return "createListing";
//                        } else if (price < 0) {
//                            addErrorMessage("Cannot have a negative price.");
//                            setRequest(request);
//                            return "createListing";
//                        }
//
//                        byte[] bytes = file.getBytes();
//
//                        // Creating the directory to store file
//                        File dir = new File(Path.url + File.separator + "listings");
//                        if (!dir.exists())
//                            dir.mkdirs();
//
//                        // Create the file on server
//
//                        System.out.println("Hit Controller 2");
//                        File serverFile = new File(dir.getAbsolutePath() + File.separator + file.getOriginalFilename());
//                        BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
//                        stream.write(bytes);
//
//                        System.out.println("File Uploaded");
//                        //Listing listing = new Listing(name, description, price, category, file.getOriginalFilename());// FIX
//                        // LATER

                if (type.equals("auction")) {
                    listing.setType("auction");
                    listing.setHighestBid(0);
                } else {
                    listing.setType("fixed");
                }
                System.out.println(premium);

                if (premium.equals("yes")) {
                    listing.setPremium(1);
                } else {
                    listing.setPremium(0);
                }

                listing.setUser(u);
                System.out.println("Check to see if session exists: " + u.getUserID());
                listingService.create(listing);

                message = "Listing Uploaded Successfully";
                model.addAttribute("message", message);
                //stream.close();

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

                return "listing/create-listing";
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

        request.setAttribute("categories", categoryService.getAllCategories());
        request.setAttribute("subCategories", categoryService.getAllSubCategories());

        return "listing/create-listing";
    }

    @RequestMapping("/displayListing")
    public String displayListing(HttpServletRequest request) {
        setRequest(request);
        return "displayListing";
    }

    @RequestMapping("/displayListingByCategory")
    public String displayListingByCategory(@RequestParam("category") String category, HttpServletRequest
            request,
                                           Model model) {

        System.out.println("Listing Category for display: " + category);
        List<Listing> listings = listingService.getAllListingsByCategory(category);
        System.out.println("List size = " + listings.size());
        //System.out.println(listings.get(0).getImage_path());
        User user = (User) request.getSession().getAttribute("user");

        // System.out.println("User attribute: " + user.getUsername());
        model.addAttribute("user", user);
        model.addAttribute("category", category);
        model.addAttribute("listings", listings);

        return "displayListing";
    }

    @RequestMapping(value = "/updateListingInfo", method = RequestMethod.POST)
    public String updateListingInfo(HttpServletRequest request,
                                    @RequestParam(value = "name") String name,
                                    @RequestParam(value = "description") String description,
                                    @RequestParam(value = "category") String category,
                                    @RequestParam(value = "id") int id)

    {

        Listing listing = listingService.getByListingID(id);
        addSuccessMessage("Listing Updated!");
        setRequest(request);
        listing.setName(name);
        listing.setDescription(description);
        listing.setCategory(category);

        listingService.saveOrUpdate(listing);
        return "redirect:/adminListing";
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
    public ModelAndView edit(@RequestParam("listing") int listingID) {

        ModelAndView model = new ModelAndView("/jspf/edit-fixed-listing");

        Listing listing = listingService.getByListingID((listingID));

        model.addObject("listingID", listingID);
        model.addObject("listing", listing);

        return model;
    }

    @GetMapping("/editListing")
    public String editListing(HttpServletRequest request, @RequestParam("id") int id) {
        System.out.println(id);
        request.setAttribute("listing", listingService.getByListingID(id));
        return "editListing";
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
    public String viewSelectedListing(HttpServletRequest request, @RequestParam("l") int listingID) {

        Listing listing = listingService.getByListingID(listingID);

        if (listing == null) {
            addErrorMessage("Error Loading Listing");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        User user = (User) request.getSession().getAttribute("user");

        if (user != null) {

//            boolean hasOffer;
//
//            // Checks if the user already made an offer on the listing
//            if (offerService.getOfferByUserAndListingId(user.getUserID(), listingID) != null) {
//                hasOffer = true;
//            } else {
//                hasOffer = false;
//            }
//
//            model.addObject("hasOffer", hasOffer);

            if (listing.getEnded() == 1) {

                Transaction transaction = transactionService.getTransactionsByListingID(listingID);

                // Check if transaction was cancelled
                if (transaction.getTransactionType().equals("cancelled")) {

                    if (user.getUserID() == transaction.getBuyer().getUserID() || user.getUserID() == transaction.getSeller().getUserID()) {
                        addWarningMessage("Transaction On This Listing Has Been Cancelled");
                        request.setAttribute("viewTransaction", true);
                    }

                } else {

                    // Check if pick up was started
                    PickUp pickUp = pickUpService.getPickUpByListingID(listingID);

                    if (pickUp != null) {

                        // View Pick Up Page
                        if (pickUp.getStatus().equals("IN REVIEW")) {
                            request.setAttribute("viewPickUp", true);

                        } else if (pickUp.getStatus().equals("PICK UP MISSED")) {
                            addWarningMessage("Pick Up Missed");
                            request.setAttribute("viewPickUp", true);

                            // View Checkout Page
                        } else if (pickUp.getStatus().equals("ACCEPTED")) {
                            request.setAttribute("viewCheckout", true);

                            // View Pick Up Page For Details
                        } else if (pickUp.getStatus().equals("AWAITING PICK UP")) {
                            request.setAttribute("viewPickUpDetails", true);

                            // View Verification or Transaction Page
                        } else if (pickUp.getStatus().equals("PENDING VERIFICATION")) {

                            // User Logged In Is Seller And Has Not Verified
                            if (pickUp.getTransaction().getSeller().getUserID() == user.getUserID() && pickUp.getSellerVerified() == 0) {
                                request.setAttribute("viewVerification", true);

                                // User Logged In Is Seller And Has Verified
                            } else if (pickUp.getTransaction().getSeller().getUserID() == user.getUserID() && pickUp.getSellerVerified() == 1) {
                                request.setAttribute("viewTransaction", true);

                                // User Logged In Is Buyer And Has Not Verified
                            } else if (pickUp.getTransaction().getBuyer().getUserID() == user.getUserID() && pickUp.getBuyerVerified() == 0) {
                                request.setAttribute("viewVerification", true);

                                // User Logged In Is Buyer And Has Verified
                            } else if (pickUp.getTransaction().getBuyer().getUserID() == user.getUserID() && pickUp.getBuyerVerified() == 1) {
                                request.setAttribute("viewTransaction", true);
                            }

                        } else if (pickUp.getStatus().equals("VERIFIED") &&
                                pickUp.getTransaction().getSeller().getUserID() == user.getUserID()) {
                            request.setAttribute("viewTransaction", true);

                        } else if (pickUp.getStatus().equals("COMPLETED")) {
                            request.setAttribute("viewTransaction", true);
                        }
                    }
                }
            }

            if (user.getTutorial() != null && user.getTutorial().getViewedListing() == 0) {

                // Update tutorial
                Tutorial tutorial = user.getTutorial();
                tutorial.setViewedListing(1);
                tutorialService.update(tutorial);

                // Set updated tutorial
                user.setTutorial(tutorial);
                request.getSession().removeAttribute("user");
                request.getSession().setAttribute("user", user);

                request.setAttribute("showTutorial", true);

            }

        }

        request.setAttribute("listing", listing);

        request.setAttribute("title", "Listing");

        setRequest(request);
        return "listing/listing";

    }

    @RequestMapping(value = "/cancel-overview", method = RequestMethod.GET)
    public String cancelPurchaseOverview(@RequestParam("l") int listingID, HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addWarningMessage("Login To Cancel A Purchase");
            setRequest(request);
            return "login";
        }

        Listing listing;

        try {
            listing = listingService.getByListingID(listingID);
        } catch (Exception e) {
            addErrorMessage("Error Loading The Listing");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        if (listing == null) {
            addErrorMessage("Error Loading The Listing");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        if (user.getUserID() != listing.getUser().getUserID() && user.getUserID() != listing.getHighestBidder().getUserID()) {
            addErrorMessage("Access Denied");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        if (listing.getEnded() == 0) {
            addWarningMessage("Listing Must Be Over To Cancel A Purchase");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        Transaction transaction = transactionService.getTransactionsByListingID(listingID);

        if (transaction != null && transaction.getTransactionType().equals("cancelled")) {
            addWarningMessage("Listing Was Already Cancelled");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        request.setAttribute("listing", listing);
        return "listing/cancel-purchase-overview";

    }

    @RequestMapping(value = "/cancel-purchase", method = RequestMethod.POST)
    public String cancelPurchase(@RequestParam("l") int listingID, HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addWarningMessage("Login To Cancel A Purchase");
            setRequest(request);
            return "login";
        }

        Listing listing = listingService.getByListingID(listingID);

        if (listing == null) {
            addErrorMessage("Error Loading The Listing");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        Notification notification;

        // send notification to other user
        if (user.getUserID() == listing.getHighestBidder().getUserID()) {
            // notify the seller
            notification = new Notification(listing.getUser(), listingID, "Purchase Cancelled",
                    "The buyer for your listing: " + listing.getName() + " has cancelled the purchase.\n\nAs a result, " +
                            "if they already payed via PayPal, they received a full refund.\n\nSorry :(", 1);

        } else if (user.getUserID() == listing.getUser().getUserID()) {
            // notify the buyer
            notification = new Notification(listing.getHighestBidder(), listingID, "Purchase Cancelled",
                    "The seller for the listing: " + listing.getName() + " has cancelled the purchase.\n\nAs a result, " +
                            "if you already payed via PayPal, you will receive a full refund.\n\nSorry :(", 1);

            // unauthorized user
        } else {
            addErrorMessage("Access Denied");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        if (listing.getEnded() == 0) {
            addWarningMessage("Listing Must Be Over To Cancel A Purchase");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        // Cancel Transaction
        Transaction transaction = transactionService.getTransactionsByListingID(listingID);

        if (transaction == null) {
            addErrorMessage("Error Loading The Transaction: Try Again Later");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        if (transaction.getTransactionType().equals("cancelled")) {
            addWarningMessage("Listing Was Already Cancelled");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        transaction.setTransactionType("cancelled");
        transaction.setCompleted(1);
        transactionService.saveOrUpdate(transaction);

        // Return money

        // Cancel Pick Up
        PickUp pickUp = pickUpService.getPickUpByListingID(listingID);

        if (pickUp == null) {
            addErrorMessage("Error Loading The Pick Up: Try Again Later");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        pickUp.setStatus("CANCELLED");
        pickUp.setActive(0);
        pickUpService.update(pickUp);

        notificationService.save(notification);

        addSuccessMessage("Purchase Cancelled");
        return "redirect:" + request.getHeader("Referer");

    }

    @RequestMapping(value = "/cancelAuction", method = RequestMethod.GET)
    public ModelAndView cancelAuction(@RequestParam("listing") int listingID) {

        ModelAndView model = new ModelAndView("dashboard2");

        Listing listing = listingService.getByListingID(listingID);

        // if bidcount is above 0, reject auction cancel with an error message
        if (listing.getBidCount() > 0) {
            // error message
            addErrorMessage("You may not cancel an auction that has already been bid on.");
        } else {
            // popup, are you sure you want to cancel?

            // if bidcount is 0, ask if seller is sure they want to cancel the auction

            // no? - cancel popup

            // yes?

            // deactivate the listing
            listing.setActive(0);
            listing.setEnded(1);
            listingService.saveOrUpdate(listing);

        }
        return model;
    }

    @RequestMapping(value = "/auctionRules", method = RequestMethod.GET)
    public ModelAndView auction() {

        ModelAndView model = new ModelAndView("auction-rules");

        return model;
    }

    @RequestMapping(value = "/rules", method = RequestMethod.GET)
    public ModelAndView rules() {

        ModelAndView model = new ModelAndView("rules");

        return model;
    }

//    @GetMapping("/reportListing")
//    public String reportListing(@RequestParam("listingId") int id, HttpServletRequest request) {
//        System.out.println(id);
//        Listing listing = listingService.getByListingID(id);
//        request.setAttribute("listing", listing);
//        return "reportListing";
//    }

    @GetMapping("/reportListing")
    public String reportListing(@RequestParam("listingId") int id, HttpServletRequest request) {
        System.out.println(id);
        Listing listing = listingService.getByListingID(id);
        request.setAttribute("listing", listing);
        return "reportListing";
    }
}