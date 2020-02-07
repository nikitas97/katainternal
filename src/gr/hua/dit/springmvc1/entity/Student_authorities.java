package gr.hua.dit.springmvc1.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "student_authorities")
public class Student_authorities {

	@Id
	@Column(name = "username")
	String username;
	
	@Column(name = "authority")
	String authority;

	
	
	public Student_authorities(String username, String authority) {
		super();
		this.username = username;
		this.authority = authority;
	}
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
}
