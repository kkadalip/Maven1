package model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
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
@Table(name="address")
public class Address {

	// CONSTRUCTORS:
	
	public Address() {
	}
	
	// DATABASE FIELDS:

	@Id
	@Column(name="addressID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Nullable
	@Column(name="country")
	private String country;
	
//	@Nullable
//	@Column(name="state")
//	private String state;
	
	@Nullable
	@Column(name="county")
	private String county;
	
	@Column(name="city")
	private String city;
	
	@Column(name="street")
	private String street;
	
	// building number with letter
	@Column(name="building")
	private String building;
	
	@Column(name="postIndex")
	private Integer postIndex;
	
	// GEO POSITIONING:
	@Column(name="longitude")
	private Float longitude;
	@Column(name="latitude")
	private Float latitude;
	public Long getId() {
		return id;
	}
	
//	@Nullable
//    @Column(name="projects")
//    @ManyToMany()
//    @Cascade(value = { CascadeType.ALL })
//    @JoinColumn //(name = "projectID")
//    private Set<Project> projects = new HashSet<>();
	
	// GETTERS & SETTERS
	
	public void setId(Long id) {
		this.id = id;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getBuilding() {
		return building;
	}
	public void setBuilding(String building) {
		this.building = building;
	}
	public Integer getPostIndex() {
		return postIndex;
	}
	public void setPostIndex(Integer postIndex) {
		this.postIndex = postIndex;
	}
	public Float getLongitude() {
		return longitude;
	}
	public void setLongitude(Float longitude) {
		this.longitude = longitude;
	}
	public Float getLatitude() {
		return latitude;
	}
	public void setLatitude(Float latitude) {
		this.latitude = latitude;
	}
//	public Set<Project> getProjects() {
//		return projects;
//	}
//	public void setProjects(Set<Project> projects) {
//		this.projects = projects;
//	}
	
}
