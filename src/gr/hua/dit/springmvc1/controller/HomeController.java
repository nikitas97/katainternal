package gr.hua.dit.springmvc1.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import gr.hua.dit.springmvc1.entity.Employee;

@Controller
public class HomeController {

	@RequestMapping("/login")
	public String showloginpage() {
	        return "login";
	} 
	
	@RequestMapping("/")
	public String showfirstpage() {
	        return "index";
	}
	
	@RequestMapping("/about")
	public String showAbout() {
	        return "about";
	}
	
	
	@RequestMapping("redirect:/employee/list")
	public String Employeeslist() {
		return "view-employee";
	}
	
	@RequestMapping("redirect:/form/availability")
	public String updateAvailability() {
		return "availability";
	}
	
	@RequestMapping("redirect:/student/list")
	public String Studentlist() {
		return "view-studs";
	}
	
	@RequestMapping("redirect:/form/list")
	public String Formslist() {
		return "view-forms";
	}
	
	@RequestMapping("redirect:/form/sorted-forms")
	public String processForm() {
	        return "sorted-forms";
	}
	
	@RequestMapping("/student-form")
	public String studentForm() {
		return "student-form";
	}
	
	@RequestMapping("/submit-student")
	public String submitStudent() {
	   return "submit-student";
	}
	
	
	
	
	
	
	
	
	
	
	


}
