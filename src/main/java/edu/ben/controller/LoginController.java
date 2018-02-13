package edu.ben.controller;

import javax.servlet.http.HttpServletRequest;

import edu.ben.service.UserService;
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
public class LoginController {
	@SuppressWarnings("unused")
	private static final long serialVersionUID = 1L;

	/**
	@Autowired
	ServletContext context;
	*/

	@Autowired
	UserService userService;

	@PostMapping("/")
	public String login(HttpServletRequest request) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		System.out.println(email);
		System.out.println(password);

		User user = userService.findBySchoolEmail(email);

		String url = "";
		String message = "";

		if (user != null) {
			if (user.getActive() > 0) {
				if (user.getPassword() != null && user.getPassword().equals(password)) {
					request.getSession().setAttribute("user", user);
					userService.updateAttemptedLogins(0, email);
					System.out.println("pass match");
					return "index";

				} else {
					request.setAttribute("email", email);
					int loginAttempts = user.getLoginAttempts() + 1;
					System.out.println(loginAttempts);
					userService.updateAttemptedLogins(loginAttempts, email);
					if (loginAttempts >= 5) {
						userService.lockByUsername(user.getUsername());
						message = "invalid username and password - login limit exceeded, your account has been locked out";
					} else {
						message = "invalid password - you have " + (5 - loginAttempts) + " remaining";
					}
					url = "login";
				}
			} else {
				message = "Your account is locked out, click unlock to activate your account";
				url = "login";
			}
		} else {
			message = "We didn't find your email linked to an account in our Database";
			url = "login";
		}

		request.setAttribute("email", email);
		request.setAttribute("message", message);

		return url;

	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@GetMapping("/unlock")
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
		return "homepage";
	}

}