package edu.ben.controller;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import edu.ben.model.*;

import edu.ben.service.*;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProfileController extends BaseController {
	@Autowired
	UserService userService;

	@Autowired
	ListingService listingService;

	@Autowired
	FollowService followService;
	
	@Autowired
	TransactionService transactionService;
	
	@Autowired
	OfferService offerService;

	@Autowired
    ImageService imageService;

	@RequestMapping(value = "/viewProfile", method = RequestMethod.GET)
    public String viewProfile(HttpServletRequest request, @RequestParam("id") int id) {

        List<Listing> userListings = listingService.getAllListingsByUserID(id);
        // user offers
        List<Offer> offers = offerService.getPendingOffersByUserId(id);
        // user transactions
        List<Transaction> buyerTransactions = transactionService.getTransactionsByBuyerID(id);
        List<Transaction> sellerTransactions = transactionService.getTransactionsBySellerID(id);
        
        List<Offer> myOffers = offerService.getPendingOffersByListingId(id);
        
        request.setAttribute("user", userService.getUserById(id));
        
        request.setAttribute("userListings", userListings);
        request.setAttribute("myOffers", offers);
        request.setAttribute("transactions", buyerTransactions);
        request.setAttribute("transactions", sellerTransactions);
        request.setAttribute("offers", myOffers);
        
        return "profile-page";
    }

    @RequestMapping(value = "/viewUserListings", method = RequestMethod.GET)
    public String viewUserListing(HttpServletRequest request) {
        User session = (User) request.getSession().getAttribute("user");

        List<Listing> userListings = listingService.getAllListingsByUserID(session.getUserID());

        List<Listing> listingsWon = listingService.getListingsWon(session.getUserID());
        List<Listing> listingsLost = listingService.getListingsLost(session.getUserID());
        List<Listing> listingsActive = listingService.getListingsInProgressUserBidOn(session.getUserID());

        request.setAttribute("user", session);
        request.setAttribute("userListings", userListings);

        request.setAttribute("listingsWon", listingsWon);
        if (listingsWon != null) {
            request.setAttribute("wonCount", listingsWon.size());
        } else {
            request.setAttribute("wonCount", 0);
        }

        request.setAttribute("listingsActive", listingsActive);
        if (listingsActive != null) {
            request.setAttribute("activeCount", listingsActive.size());
        } else {
            request.setAttribute("activeCount", 0);
        }

        request.setAttribute("listingsLost", listingsLost);
        if (listingsLost != null) {
            request.setAttribute("lostCount", listingsLost.size());
        } else {
            request.setAttribute("lostCount", 0);
        }

        return "listing-profile";
    }
    
    @RequestMapping(value="/editListing", method=RequestMethod.POST)
    public String editListing(@RequestParam("listing") int id, @RequestParam("price") int price) {
    	
    	Listing listing = listingService.getByListingID(id);
    	listing.setPrice(price);
    	listingService.saveOrUpdate(listing);
    	addSuccessMessage("Price successfully updated!");
    	
    	return "redirect:/viewProfile";
    }

    @RequestMapping(value="/profileImageUpload", method=RequestMethod.GET)
    public String profileImageUpload(HttpServletRequest request){
	    User user = (User) request.getSession().getAttribute("user");
	    if(user == null){
	        return "index";
        }
	    return "profile-image-upload";
    }

    @RequestMapping(value="/profileImageUpload", method=RequestMethod.POST)
    public String profileImageUploadPost(@RequestParam("file") MultipartFile file,@RequestParam("imageMain") String imageMain, HttpServletRequest request){
        User u = (User) request.getSession().getAttribute("user");
	    String fileType = FilenameUtils.getExtension(file.getOriginalFilename());
        String fileName = FilenameUtils.getBaseName(file.getOriginalFilename());

        if(fileType.equals("jpg") || fileType.equals("png") || fileType.equals("jpeg")){
            Image imgImport = new Image();
            try {
                byte[] bytes = file.getBytes();
                System.out.println("File Directory:   " +System.getProperty("user.home")+ File.separator + "ulistitUsers" + File.separator + u.getUserID()+"@"+u.getSchoolEmail() + File.separator + "profile");
                File dir = new File( System.getProperty("user.home")+ File.separator + "ulistitUsers" + File.separator + u.getUserID()+"@"+u.getSchoolEmail() + File.separator + "profile");
                if (!dir.exists())
                    dir.mkdirs();
                System.out.println("Image Path:     "+ "ulistitUsers" + "/" + u.getUserID()+"@"+u.getSchoolEmail() + "/" + "profile");
                imgImport.setImage_path("ulistitUsers" + "/" + u.getUserID()+"@"+u.getSchoolEmail() + "/" + "profile");
                imgImport.setUser(u);
                imgImport.setImage_name(fileName + "." + fileType);
                if (imageMain.equals("yes")) {
                    imageService.removeAllMainImages(u.getUserID());
                    imgImport.setMain(1);
                } else {
                    imgImport.setMain(0);
                }
                imageService.save(imgImport);
                System.out.println("Full File path:     "+ System.getProperty("user.home")+ File.separator + "ulistitUsers" + File.separator + u.getUserID()+"@"+u.getSchoolEmail() + File.separator + "profile" + File.separator + file.getOriginalFilename());
                File serverFile = new File(System.getProperty("user.home")+ File.separator + "ulistitUsers" + File.separator + u.getUserID()+"@"+u.getSchoolEmail() + File.separator + "profile" + File.separator + file.getOriginalFilename());
                try {
                    BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                    stream.write(bytes);
                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                }

            } catch (IOException e) {
                e.printStackTrace();
            }
            request.getSession().setAttribute("user",(User) userService.getUserById(u.getUserID()));
        }
        return "redirect:/profileImageUpload";
    }

    @RequestMapping(value="/changeImageMain", method=RequestMethod.POST)
    public String profileImageUploadPost(@RequestParam("mainImage") int mainImage, HttpServletRequest request){
        User u = (User) request.getSession().getAttribute("user");
        imageService.removeAllMainImages(u.getUserID());
        imageService.changeMain(mainImage, 1);
        request.getSession().setAttribute("user",(User) userService.getUserById(u.getUserID()));
	    return "redirect:/profileImageUpload";
    }

}