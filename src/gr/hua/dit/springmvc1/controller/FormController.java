package gr.hua.dit.springmvc1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import gr.hua.dit.springmvc1.dao.FormDAO;
import gr.hua.dit.springmvc1.entity.Form;

@Controller
@RequestMapping("/form")
public class FormController {

    @Autowired
    private FormDAO formDAO;
    
    @RequestMapping("/list")
    public String listForms(Model model) {
            
            // get forms from dao
            List<Form> forms = formDAO.getForms();
            
            // add the forms to the model
            model.addAttribute("forms",forms);
            
            return "view-forms";
    }
	
    
    @RequestMapping("/session")
    public String sortOneForm(Model model) {
    	
    	List<Form> forms = formDAO.verify();
    	
    	model.addAttribute("forms", forms);
    	
    	return "session";
    }
    
    @RequestMapping("/sorted-forms")
    public String calculateF(Model model) {
    	
    	List<Form> forms = formDAO.sort();
    	
    	model.addAttribute("forms",forms);
    	
    	return "sorted-forms";
    	
    }
    
    @RequestMapping("/availability")
    public String updateAvailability(Model model) {
    	
    	String result = formDAO.updateAvailability();
    	
    	model.addAttribute("result", result);
    	
    	return "availability";
    	
    }
    
}
