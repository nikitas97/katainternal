package gr.hua.dit.springmvc1.controller;

import org.springframework.stereotype.Controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import gr.hua.dit.springmvc1.dao.EmployeeDAO;
import gr.hua.dit.springmvc1.entity.Employee;


@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeDAO employeeDAO;
    
    @RequestMapping("/list")
    public String listEmployees(Model model) {
            
            // get employees from dao
            List<Employee> employees = employeeDAO.getEmployees();
            
            // add the employees to the model
            model.addAttribute("employees",employees);
            
            return "view-employees";
    }

	
	
}
