package gr.hua.dit.springmvc1.dao;

import java.util.List;

import gr.hua.dit.springmvc1.entity.Form;

public interface FormDAO {

	public List<Form> getForms();
	
	public List<Form> verify();
	
	public List<Form> sort();
	
	public String updateAvailability();
	
}
