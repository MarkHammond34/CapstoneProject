package edu.ben.controller;

import edu.ben.model.Favorite;
import edu.ben.model.Listing;
import edu.ben.model.User;
import edu.ben.service.FavoriteService;
import edu.ben.service.ListingService;
import edu.ben.util.ImagePath;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.util.List;

@Controller
public class ListingController extends BaseController {

    @Autowired
    ListingService listingService;

    /**
     * Upload single file using Spring Controller
     */
    @RequestMapping(value = "/uploadListing", method = RequestMethod.POST)
    public String uploadFileHandler(@RequestParam("title") String name, @RequestParam("category") String category,
                                    @RequestParam("price") double price, @RequestParam("description") String description,
                                    @RequestParam("file") MultipartFile file, @RequestParam("type") String type,
                                    Model model, HttpServletRequest request) {

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
                Listing listing = new Listing(name, description, price, category, file.getOriginalFilename());

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
    public String displayListingByCategory(@RequestParam("category") String category, HttpServletRequest request, Model model) {

        System.out.println("Listing Category for display: " + category);
        List<Listing> listings = listingService.getAllListingsByCategory(category);
        System.out.println("List size = " + listings.size());

        User user = (User) request.getSession().getAttribute("user");

        System.out.println("User attribute: " + user.getUsername());
        model.addAttribute("user", user);
        model.addAttribute("category", category);
        model.addAttribute("listings", listings);

        return "displayListing";
    }

    @PostMapping("/bid")
    public String bid(@RequestParam("bidValue") double bidValue, @RequestParam int listingID, HttpServletRequest request) {

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

}

