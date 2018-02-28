package edu.ben.controller;

import javax.servlet.http.HttpServletRequest;

import edu.ben.service.UserService;
import edu.ben.util.Email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import edu.ben.model.User;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import edu.ben.dao.UserDAO;
import edu.ben.dao.UserDAOImpl;

@Controller
public class LoginController extends BaseController {
	@SuppressWarnings("unused")
	private static final long serialVersionUID = 1L;

	/**
	 * @Autowired ServletContext context;
	 */

	@Autowired
	UserService userService;

	@PostMapping("/loginUser")
	public String login(HttpServletRequest request) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		System.out.println(email);
		System.out.println(password);

		User user = userService.findBySchoolEmail(email);
		
		String url = "";
		String message = "";

		if (user != null) {
			if (user.getActive() > 0 && user.getLocked() < 1) {
				if (user.getPassword() != null && user.getPassword().equals(password)) {
					request.getSession().setAttribute("user", user);
					userService.updateAttemptedLogins(0, user);
					System.out.println("pass match");
					return "redirect:/";

				} else {
					request.setAttribute("email", email);
					int loginAttempts = user.getLoginAttempts() + 1;
					System.out.println(loginAttempts);
					userService.updateAttemptedLogins(loginAttempts, user);
					
					if (loginAttempts >= 5) {
						userService.lockByUsername(user.getUsername());
						addErrorMessage(
								"invalid username and password - login limit exceeded, your account has been locked out");
					} else {
						addErrorMessage("invalid password - you have " + (5 - loginAttempts) + " remaining");
					}
					url = "login";
				}
			} else {
				addErrorMessage("Your account is locked out, click unlock to activate your account");
				url = "login";
			}
		} else {
			addErrorMessage("We didn't find your email linked to an account in our Database");
			url = "login";
		}

		request.setAttribute("email", email);
		request.setAttribute("message", message);
		setRequest(request);
		return url;

	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@PostMapping("/unlock")
	public String unlock() {
		return "unlock";
	}

	@GetMapping("/reset")
	public String emailReset() {
		return "emailReset";
	}

	@GetMapping("/email")
	public String email() {
		return "email";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		request.removeAttribute("user");
		return "redirect:/";
	}

	/*@PostMapping("/unlock")
	public String unlock(HttpServletRequest request) {
		String action = request.getParameter("action");
		String message = "";
		String url = "unlock";

		if (action.equals("email")) {
			String email = request.getParameter("email");

			User user = userService.findBySchoolEmail(email);

			if (user != null) {

				Email mail = new Email();
				message = Email.unlockCode(email);
				url = "unlock";
			} else {

				message = "We didn't find your email linked to an account in our Database";
				url = "unlockCode";

			}

		} else if (action.equals("code")) {

			String email = request.getParameter("email");
			String code = request.getParameter("code");

			User user = userService.findBySchoolEmail(email);

			if (user != null) {

				if (code.equals(user.getUnlockCode())) {
					UserDAO.updateIsActive(1, email);
					message = "Account successfully unlocked";
					url = "login";
				} else {
					message = "The entered code doesn't match the code we sent you";
					url = "unlock";
				}

			} else {

				message = "We didn't find your email linked to an account in our Database";

			}

		}

		request.setAttribute("message", message);
		return url;

	}

}*/
}
