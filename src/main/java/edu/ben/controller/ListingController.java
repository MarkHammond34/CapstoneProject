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

		User u = (User) request.getSession().getAttribute("user");

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
		return "createListing";
	}

	@RequestMapping("/displayListing")
	public String displayListing() {

		return "displayListing";
	}
	
	@RequestMapping("/displayListingByCategory")
	public String displayListingByCategory(@RequestParam("category") String category, HttpServletRequest request, Model model) {

		System.out.println("Listing Category for display: "+category);
		List<Listing> listings = listingService.getAllListingsByCategory(category);
		System.out.println("List size = " + listings.size());

		User user = (User) request.getSession().getAttribute("user");

		System.out.println("User attribute: " + user.getUsername());
		model.addAttribute("user", user);
		model.addAttribute("category", category);
		model.addAttribute("listings", listings);

		return "displayListing";
	}

}
