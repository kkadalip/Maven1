package model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import com.sun.istack.internal.Nullable;

import model.Person;

@Entity
@Table(name="project")
public class Project {

	// CONSTRUCTORS:
	
	public Project() {
	}
	
	// DATABASE FIELDS
	
	@Id
	@Column(name="projectID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(name="name")
    private String name;

	@Nullable
	@Column(name="planningStartYear")
	private Integer planningStartYear;
	@Nullable
	@Column(name="planningEndYear")
	private Integer planningEndYear;
	
	@Nullable
	@Column(name="buildingStartYear")
	private Integer buildingStartYear;
	@Nullable
	@Column(name="buildingEndYear")
	private Integer buildingEndYear;

	
	@Nullable
	@Column (name="sizeQuantity")
	private Integer sizeQuantity;
	
	@Nullable
	@Column (name="sizeUnit")
	private String sizeUnit;
	
	@Nullable
	@Column(name="apartmentsQuantity")
	private Integer apartmentsQuantity;
	
	
	@Nullable
    @Column(name="architects")
    @ManyToMany(fetch = FetchType.EAGER) // fetch = FetchType.LAZY // EAGER // TODO IMPROVE with a separate method in DAO? //@ManyToOne // (cascade={CascadeType.ALL}) // @OneToMany(fetch = FetchType.LAZY, mappedBy = "user???")
    @Cascade(value = { CascadeType.ALL })
    //@JoinColumn(name = "id") // PROPERTY NOT ID FIELD NAME? //"personID") // not parent_sector duh // <key column="sector_id"
	private List<Person> architects = new ArrayList<>();
	//private Set<Person> architects = new HashSet<>();
	
//	// (Hoone algne autor)
//	@Nullable
//    @Column(name="originalAuthors")
//    @ManyToMany()
//    @Cascade(value = { CascadeType.ALL })
//    @JoinColumn(name = "id") //(name = "personID")
//    private Set<Person> originalAuthors = new HashSet<>();
//	
//	// Kaastöö?? / Extra comment ???: (nt koostöös arhitektuuribürooga X, … arhitekt Y)
//	@Nullable
//    @Column(name="contributors")
//    @ManyToMany()
//    @Cascade(value = { CascadeType.ALL })
//    @JoinColumn(name = "id") //(name = "personID")
//    private Set<Person> contributors = new HashSet<>();
//	
//	// konstruktor
//	@Nullable
//    @Column(name="constructors")
//    @ManyToMany()
//    @Cascade(value = { CascadeType.ALL })
//    @JoinColumn(name = "id") //(name = "personID")
//    private Set<Person> constructors = new HashSet<>();
//
//	// sisekujundaja
//	@Nullable
//    @Column(name="interiorDesigners")
//    @ManyToMany()
//    @Cascade(value = { CascadeType.ALL })
//    @JoinColumn(name = "id") //(name = "personID")
//    private Set<Person> interiorDesigners = new HashSet<>();
//	
//	// maastiku arhitekt
//	@Nullable
//    @Column(name="landscapeArchitects")
//    @ManyToMany()
//    @Cascade(value = { CascadeType.ALL })
//    @JoinColumn(name = "id") //(name = "personID")
//    private Set<Person> landscapeArchitects = new HashSet<>();
//	
//	// valgustid
//	@Nullable
//    @Column(name="lightsDesigners")
//    @ManyToMany()
//    @Cascade(value = { CascadeType.ALL })
//    @JoinColumn(name = "id") //(name = "personID")
//    private Set<Person> lightsDesigners = new HashSet<>();
	
	// String Prize (preemia): nt Konkursitöö I preemia
	@Column(name="prizeComment")
	private String prizeComment;
	
	// Address (multiple nt eramute kompleks!!!)
	@Nullable
    @Column(name="addresses")
    @ManyToMany()
    @Cascade(value = { CascadeType.ALL })
    @JoinColumn(name = "id") //(name = "addressID")
    private Set<Address> addresses = new HashSet<>();
	
	// Image(s): promo pics
	
	// Image(s) drawings
	
	
	////Project Group üks grupp, mitu projekti, OneToMany
	// ManyToOne siin
	@Nullable
    //@Column(name="projectGroup") // @Column(s) not allowed on a @ManyToOne property: model.Project.projectGroup
    @ManyToOne() 
    //@Cascade(value = { CascadeType.ALL })
    @JoinColumn(name = "id") //(name="projectGroupID")
	private ProjectGroup projectGroup;

	// GETTERS & SETTERS:
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPlanningStartYear() {
		return planningStartYear;
	}

	public void setPlanningStartYear(Integer planningStartYear) {
		this.planningStartYear = planningStartYear;
	}

	public Integer getPlanningEndYear() {
		return planningEndYear;
	}

	public void setPlanningEndYear(Integer planningEndYear) {
		this.planningEndYear = planningEndYear;
	}

	public Integer getBuildingStartYear() {
		return buildingStartYear;
	}

	public void setBuildingStartYear(Integer buildingStartYear) {
		this.buildingStartYear = buildingStartYear;
	}

	public Integer getBuildingEndYear() {
		return buildingEndYear;
	}

	public void setBuildingEndYear(Integer buildingEndYear) {
		this.buildingEndYear = buildingEndYear;
	}

	public Integer getSizeQuantity() {
		return sizeQuantity;
	}

	public void setSizeQuantity(Integer sizeQuantity) {
		this.sizeQuantity = sizeQuantity;
	}

	public String getSizeUnit() {
		return sizeUnit;
	}

	public void setSizeUnit(String sizeUnit) {
		this.sizeUnit = sizeUnit;
	}

	public Integer getApartmentsQuantity() {
		return apartmentsQuantity;
	}

	public void setApartmentsQuantity(Integer apartmentsQuantity) {
		this.apartmentsQuantity = apartmentsQuantity;
	}

	public List<Person> getArchitects() {
		return architects;
	}

	public void setArchitects(List<Person> architects) {
		this.architects = architects;
	}

	public String getPrizeComment() {
		return prizeComment;
	}

	public void setPrizeComment(String prizeComment) {
		this.prizeComment = prizeComment;
	}

	public Set<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(Set<Address> addresses) {
		this.addresses = addresses;
	}

	public ProjectGroup getProjectGroup() {
		return projectGroup;
	}

	public void setProjectGroup(ProjectGroup projectGroup) {
		this.projectGroup = projectGroup;
	}

}
