package model;

import java.time.LocalDateTime;
import java.util.HashSet;
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

import com.sun.istack.internal.Nullable;

@Entity
@Table(name="person")
public class Person {

	// DATABASE FIELDS:
	
	@Id
	@Column(name="personID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(name="firstName")
    private String firstName;
	
	@Column(name="lastName")
    private String lastName;
	
	@Nullable
	@Column(name="projects")
	@ManyToMany()
	@Cascade(value={CascadeType.ALL})
	@JoinColumn(name="projectID")
	private Set<Project> projects = new HashSet<>();

	
	// CONSTRUCTORS:
	
	public Person() {
	}
    public Person(String firstName, String lastName){
    	this.firstName = firstName;
    	this.lastName = lastName;
    }
    
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
