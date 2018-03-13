package edu.ben.controller;

import edu.ben.model.Checklist;
import edu.ben.model.ChecklistItem;
import edu.ben.model.User;
import edu.ben.service.ChecklistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.UnexpectedRollbackException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ChecklistController extends BaseController {

    @Autowired
    ChecklistService checklistService;

    @GetMapping("/checklist")
    public String createChecklist(HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addWarningMessage("Login To Create A Checklist");
            setRequest(request);
            return "login";
        }

        Checklist checklist = null;

        try {

            checklist = checklistService.getByUserIDAndType(user.getUserID(), "FRESHMAN");

            // Checklist doesn't exist
        } catch (UnexpectedRollbackException e) {

            if (checklist == null) {

                Checklist adminChecklist = checklistService.getAdminChecklist();

                if (adminChecklist == null) {
                    addErrorMessage("Checklist Creation Error");
                    setRequest(request);
                    return "redirect:" + request.getHeader("Referer");
                }

                checklistService.save(new Checklist(user, "FRESHMAN"));

                checklist = checklistService.getByUserIDAndType(user.getUserID(), "FRESHMAN");

                // Create set of checklist items matching the admin checklist
                for (ChecklistItem item : adminChecklist.getItems()) {
                    ChecklistItem newItem = new ChecklistItem();
                    newItem.setChecklist(checklist);
                    newItem.setName(item.getName());
                    newItem.setStatus("STILL_NEED");
                    checklistService.save(newItem);
                }
            }
        }

        request.setAttribute("title", "Checklist");
        request.setAttribute("checklist", checklist);
        return "checklist/freshman-checklist";
    }

    @PostMapping("/update-checklist")
    public String updateChecklist(HttpServletRequest request, @RequestParam("checklistID") int checklistID,
                                  @RequestParam("itemID") int itemID, @RequestParam("newStatus") String newStatus) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addWarningMessage("Login To View Your Checklist");
            setRequest(request);
            return "login";
        }

        Checklist checklist = checklistService.getByChecklistID(checklistID);

        if (checklist == null) {
            addErrorMessage("Error Loading Checklist");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        for (ChecklistItem item : checklist.getItems()) {
            if (item.getItemID() == itemID) {
                item.setStatus(newStatus);
                checklistService.update(item);
                break;
            }
        }

        addSuccessMessage("Checklist Updated");
        setRequest(request);
        return "redirect:" + request.getHeader("Referer");
    }

    @PostMapping("/add-item")
    public String addItem(HttpServletRequest request, @RequestParam("checklistID") int checklistID,
                          @RequestParam("name") String name) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addWarningMessage("Login To View Your Checklist");
            setRequest(request);
            return "login";
        }

        Checklist checklist = checklistService.getByChecklistID(checklistID);

        if (checklist == null) {
            addErrorMessage("Error Loading Checklist");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        checklistService.save(new ChecklistItem(checklist, name));

        addSuccessMessage(name + " Created");
        setRequest(request);
        return "redirect:/checklist";
    }
}
