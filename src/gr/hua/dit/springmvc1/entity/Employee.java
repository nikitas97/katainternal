package gr.hua.dit.springmvc1.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "employee")
public class Employee{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private long id;
	
	@Column(name = "isSupervisor")
	private boolean isSupervisor;
	
	@Column(name = "department")
	private String department;
	
	@Column(name = "first_name")
	private String firstName;
	
	@Column(name = "last_name")
	private String lastName;
	
	@Column(name = "username")
	private String username;
	
	@Column(name = "password")
	private String password;
	
	@Column(name = "email")
	private String email;


	public Employee() {
        
    }
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public boolean isSupervisor() {
		return isSupervisor;
	}

	public void setSupervisor(boolean isSupervisor) {
		this.isSupervisor = isSupervisor;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
			return email;
	}

	public void setEmail(String email) {
			this.email = email;
	}
	
	public int calcRating(String city,int studIncome,boolean workingParents,int familyInc,int studyingSibs,String studCity) {
		int rating=0;
		
		if (studIncome==0 && workingParents==false) {
			rating=999;
		}
		int totalInc=familyInc+studIncome;
		if (totalInc<10000) {
			rating=rating+100;
		} else if (totalInc>10000 && totalInc<15000) {
			rating=rating+30;
		}
		if (studyingSibs>0) {
			rating=rating + (studyingSibs*20);
		}
		if (studCity!=city) {
			rating=rating+50;
		}
		
		return rating;
	}
	
	
	@Override
    public String toString() {
            return "Employee [id=" + id + ",department=" + department + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + "]";
    }
	
	
}