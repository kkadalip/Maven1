package model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

//WRONG: import com.sun.istack.internal.Nullable;
import javax.annotation.Nullable;

@Entity
@Table(name="person")
public class Person {
	
	// CONSTRUCTORS:
	
	public Person() {
	}
    public Person(String firstName, String lastName){
    	this.firstName = firstName;
    	this.lastName = lastName;
    }
    
	// DATABASE FIELDS:
	
	@Id
	@Column(name="personID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(name="firstName")
    private String firstName;
	
	@Column(name="lastName")
    private String lastName;
	
//	@Nullable
//	@Column(name="projects")
//	@ManyToMany(mappedBy = "architects")
//	@Cascade(value={CascadeType.ALL})
//	//@JoinColumn(name="id") //(name="projectID")
//	private List<Project> projects = new ArrayList<>();
//	//private Set<Project> projects = new HashSet<>(); // projects as architect??
//    
    // GETTERS & SETTERS:
    
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
    
}
