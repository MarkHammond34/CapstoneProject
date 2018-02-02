package edu.ben.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import edu.ben.model.User;
import edu.ben.service.UserService;
import edu.ben.util.Email;

@Controller
public class RegistrationController extends BaseController {

    /**
     * @Autowired private PasswordEncoder passwordEncoder;
     */

    @Autowired
    UserService userService;

    @PostMapping("/create")
    public String createUser(HttpServletRequest request, Model m, @Valid User user, BindingResult bindingResult) {

        try {
            if ((User) request.getSession().getAttribute("user") != null) {
                addWarningMessage("Please Logout Before Registering");
                return "redirect:/home";
            } else {

                if (bindingResult.hasErrors()) {

                    List<ObjectError> errors = bindingResult.getAllErrors();
                    for (ObjectError er : errors) {
                        addErrorMessage(er.getDefaultMessage());
                    }

                    setRequest(request);
                    return "registration/registration";

                } else {

                    if (request.getParameter("adminRegistration") != null) {
                        user.setSecurityLevel(3);
                    }

                    userService.create(user);
                    userService.lockByUsername(user.getUsername());
                    request.getSession().setAttribute("action", "registration");
                    request.getSession().setAttribute("tempUser", user);
                    return "redirect:/validate";
                }
            }
        } catch (ConstraintViolationException e) {
            addErrorMessage(e.getMessage());
            setRequest(request);
            return "registration/registration";
        }
    }

    @GetMapping("/register")
    public String register(HttpServletRequest m) {

        if (m.getParameter("admin") != null) {
            m.setAttribute("title", "Admin Sign Up");
            m.setAttribute("admin", true);
        } else {
            m.setAttribute("title", "Sign Up");
        }

        setRequest(m);
        return "registration/registration";
    }

    @GetMapping("/validate")
    public String validate(HttpServletRequest req) {

        User user = (User) req.getSession().getAttribute("tempUser");
        String action = (String) req.getSession().getAttribute("action");

        if (action.equals("registration")) {

            req.getSession().setAttribute("action", "code");
            req.getSession().setAttribute("code", Email.studentVerification(user.getSchoolEmail()));
            setRequest(req);
            return "registration/student-validation";

        } else if (action.equals("code")) {

            if (req.getSession().getAttribute("code").equals(req.getParameter("userCode"))) {

                userService.unlockByUsername((String) ((User) req.getSession().getAttribute("tempUser")).getUsername());
                req.getSession().removeAttribute("code");
                req.getSession().removeAttribute("tempUser");
                req.getSession().setAttribute("user", user);
                setRequest(req);
                return "redirect:/";

            } else {

                addErrorMessage("Codes Didn't Match");
                setRequest(req);
                return "registration/student-verification";

            }
        }
        return "";
    }

    @GetMapping("/resetPage")
    public String passwordResetGet() {
        return "password-reset/password-reset";
    }

    @PostMapping("/reset")
    public String passwordResetPost(HttpServletRequest req, Model m) {

        String action = (String) req.getSession().getAttribute("action");

        if (req.getParameter("action") != null) {

            String email = req.getParameter("email");
            String emailType = req.getParameter("emailType");

            User user;

            if (emailType.equals("personal")) {
                user = userService.findByEmail(email);
                if (user == null) {
                    addErrorMessage("No Accounts Exists Under The Personal Email " + email);
                    setRequest(req);
                    return "password-reset/password-reset";
                }
            } else {
                user = userService.findBySchoolEmail(email);
                if (user == null) {
                    addErrorMessage("No Accounts Exists Under The School Email " + email);
                    setRequest(req);
                    return "password-reset/password-reset";
                }
            }

            // send verification email
            req.getSession().setAttribute("code", Email.resetPassword(email));
            req.getSession().setAttribute("tempUser", user);
            req.getSession().setAttribute("action", "compareCodes");

            addSuccessMessage("Check Your Email For Verification Code");

            userService.lockByUsername(user.getUsername());

            setRequest(req);
            return "password-reset/reset-password-enter-code";

        } else if (action.equals("compareCodes")) {

            String userCode = req.getParameter("userCode");

            // check if code matches
            if (!userCode.equals(req.getSession().getAttribute("code"))) {
                addErrorMessage("Code Entered Does Not Match");
            } else {
                req.getSession().removeAttribute("code");
                req.getSession().setAttribute("action", "setNewPassword");

                addSuccessMessage("Enter Your New Password");

                userService.unlockByUsername(((User) req.getSession().getAttribute("tempUser")).getUsername());
                setRequest(req);
                return "password-reset/reset-password-new-password";
            }

        } else if (action.equals("setNewPassword")) {

            String newPassword = req.getParameter("newPassword");
            String newPasswordConfirm = req.getParameter("newPasswordConfirm");

            if (!newPassword.equals(newPasswordConfirm)) {
                addErrorMessage("Passwords Do Not Match");
            } else {

                try {
                    User user = (User) req.getSession().getAttribute("tempUser");
                    user.setPassword(newPassword);
                    userService.update(user);

                    req.getSession().removeAttribute("tempUser");
                    req.getSession().removeAttribute("action");
                    addSuccessMessage("Password Successfully Reset");
                    setRequest(req);
                    return "redirect:/login";
                } catch (ConstraintViolationException e) {
                    addErrorMessage("Passwords Must Match");
                    setRequest(req);
                    return "password-reset/reset-password-new-password";
                }
            }
        } else {
            return "redirect:/";
        }

        return "password-reset/password-reset";
    }
}