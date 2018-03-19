package edu.ben.controller;

import edu.ben.model.Follow;
import edu.ben.model.Image;
import edu.ben.model.User;
import edu.ben.service.FollowService;
import edu.ben.service.ListingService;
import edu.ben.service.OfferService;
import edu.ben.service.UserService;
import edu.ben.util.ImagePath;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	FollowService followService;
	
	@Autowired
	ListingService listingService;
	
	@Autowired
	OfferService offerService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView model = new ModelAndView("/list");
		List<User> list = userService.getAllUsers();

		model.addObject("list", list);

		return model;
	}

	@RequestMapping(value = "/update{id}", method = RequestMethod.GET)
	public ModelAndView update(@PathVariable("id") int id) {
		ModelAndView model = new ModelAndView("/form");
		User user = userService.getUserById(id);

		model.addObject("userForm", user);

		return model;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView add() {
		ModelAndView model = new ModelAndView("/form");
		User user = new User();

		model.addObject("userForm", user);

		return model;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("userForm") User user) {

		userService.saveOrUpdate(user);

		return new ModelAndView("redirect:/list");
	}

	@RequestMapping(value = "/testing", method = RequestMethod.GET)
	public ModelAndView testing() {

		// User user = new User("Corey", "Bill", "ey", "corey@email.com", "password");
		// userService.createUser(user);

		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "/uploadProfilePic", method = RequestMethod.POST)
	public String uploadProfilePic(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");

		if (!file.isEmpty()) {
			try {

				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				File dir = new File(ImagePath.url + File.separator + "profile-pic");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server

				File serverFile = new File(dir.getAbsolutePath() + File.separator + file.getOriginalFilename());
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);

				Image image = new Image( file.getName(), file.getOriginalFilename(), 1); // not sure what was meant for this object

                //user.setImage_path(image);
				userService.saveOrUpdate(user);
				stream.close();

				// Listing l = new Listing(name, description, price, category, file );
				// ld.create(l);

				return "createListing";
			} catch (Exception e) {
				e.printStackTrace();
				return "You failed to upload profile pic  => " + e.getMessage();

			}
		} else {
			return "You failed to upload profile pic because the file was empty.";
		}
	}

	@RequestMapping(value = "/editUser", method = RequestMethod.GET)
	public String editUser() {

		return "edit-user";
	}

	@RequestMapping(value = "/followUser", method = RequestMethod.GET)
	public String follow(HttpServletRequest request, @RequestParam("result") String results,
			@RequestParam("followerId") int followerId) {
		System.out.println("Hit Servlet");
		User session = (User) request.getSession().getAttribute("user");
		if (results.equals("follow")) {
			Follow f = new Follow();
			User user = userService.getUserById(session.getUserID());
			User follower = userService.getUserById(followerId);

			f.setUser(user);
			f.setFollower(follower);

			followService.create(f);

			System.out.println("following a user");
		} else if (results.equals("unfollow")) {
			Follow current = followService.findCurrent(session.getUserID(), followerId);
			followService.deleteFollower(current.getId());

			System.out.println("Unfollow");
		}
		return ":/redirect";
	}


//	@GetMapping("/rateReview")
//	public String rateReview() {
//		return "rateReview";
//	}

	/*@PostMapping("/reviewRateSeller")
	public String reviewRateSeller(HttpServletRequest request) {
		
		  User u = (User) request.getSession().getAttribute("user");

	
	}*/

}
