package edu.ben.controller;

import edu.ben.dao.UserDAO;
import edu.ben.dao.UserDAOImpl;
import edu.ben.model.User;
import edu.ben.util.Email;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
public class RegistrationController extends BaseController {

    /**
     * @Autowired private PasswordEncoder passwordEncoder;
     */

    @PostMapping("/create")
    public String createUser(HttpServletRequest request, Model m, @Valid User user, BindingResult bindingResult) {

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

                UserDAOImpl dao = new UserDAOImpl();
                //user.setPassword(passwordEncoder.encode(user.getPassword()));
                // dao.create(user);
                request.getSession().setAttribute("action", "registration");
                request.getSession().setAttribute("tempUser", user);
                return "redirect:/validate";
            }
        }
    }

    @PostMapping("/admin-create")
    public String createAdmin(HttpServletRequest request, Model m, @Valid User user, BindingResult bindingResult) {

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
                return "register";

            } else {

                UserDAOImpl dao = new UserDAOImpl();
                //user.setPassword(passwordEncoder.encode(user.getPassword()));
                user.setSecurity_level(3);
                // dao.create(user);
                System.out.println("USER CREATED");
                return "redirect:/home";
            }
        }
    }


    @GetMapping("/register")
    public String register(HttpServletRequest m) {
        setRequest(m);
        return "registration/registration";
    }

    @PostMapping("/validate")
    public String validate(HttpServletRequest req) {

        User user = (User) req.getSession().getAttribute("tempUser");
        String action = (String) req.getSession().getAttribute("action");

        // User filled out form with valid data
        if (action.equals("registration")) {

            req.getSession().removeAttribute("action");
            req.getSession().setAttribute("code", Email.studentVerification(user.getSchoolEmail()));
            setRequest(req);
            return "student-validation";

            // User entered their code on the student-verification page
        } else {

            if (req.getSession().getAttribute("code").equals(req.getParameter("userCode"))) {

                req.getSession().removeAttribute("code");
                req.getSession().removeAttribute("tempUser");
                req.getSession().setAttribute("user", user);
                setRequest(req);
                return "redirect:/home";

            } else {

                // error message
                return "student-verification";

            }
        }
    }

    @GetMapping("/reset")
    public String passwordResetGet() {
        return "password-reset/password-reset";
    }

    @PostMapping("/reset")
    public String passwordResetPost(HttpServletRequest req, Model m) {

        UserDAOImpl dao = new UserDAOImpl();

        String action = (String) req.getSession().getAttribute("action");

        if (action.equals("reset")) {

            String email = req.getParameter("email");
            String emailType = req.getParameter("emailType");

            if (emailType.equals("personal")) {
                if (dao.findByEmail(email) == null) {
                    addErrorMessage("No Accounts Exists Under The Personal Email " + email);
                    setRequest(req);
                    return "password-reset/password-reset";
                }
            } else {
                if (dao.findBySchoolEmail(email) == null) {
                    addErrorMessage("No Accounts Exists Under The School Email " + email);
                    setRequest(req);
                    return "password-reset/password-reset";
                }
            }

            // send verification email
            req.getSession().setAttribute("code", Email.resetPassword(email));
            req.getSession().setAttribute("email", email);
            req.getSession().setAttribute("emailType", emailType);
            req.getSession().setAttribute("action", "compareCodes");

            addSuccessMessage("Check Your Email For Verification Code");

            if (req.getSession().getAttribute("emailType").equals("personal")) {
                dao.lockByEmail(email);
            } else {
                dao.lockBySchoolEmail(email);
            }

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

                if (req.getSession().getAttribute("emailType").equals("personal")) {
                    dao.unlockByEmail((String) req.getSession().getAttribute("email"));
                } else {
                    dao.unlockBySchoolEmail((String) req.getSession().getAttribute("email"));
                }

                setRequest(req);
                return "password-reset/reset-password-new-password";
            }

        } else if (action.equals("setNewPassword")) {

            String newPassword = req.getParameter("newPassword");
            String newPasswordConfirm = req.getParameter("newPasswordConfirm");

            if (newPassword.equals(newPasswordConfirm)) {

            } else {
                User u = dao.findByEmail(((String) req.getSession().getAttribute("email")));
                //u.setPassword(passwordEncoder.encode(newPassword));
                dao.update(u);

                addSuccessMessage("Password Successfully Reset");
                setRequest(req);
                return "redirect:/login";
            }
        } else {
            return "redirect:/home";
        }

        return "password-reset/password-reset";
    }
}