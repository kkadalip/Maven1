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
	@Column(name="planningStartDate")
	private LocalDateTime planningStartDate;
	@Nullable
	@Column(name="planningEndDate")
	private LocalDateTime planningEndDate;
	
	@Nullable
	@Column(name="buildingStartDate")
	private LocalDateTime buildingStartDate;
	@Nullable
	@Column(name="buildingEndDate")
	private LocalDateTime buildingEndDate;

	
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
    @ManyToMany() // fetch = FetchType.LAZY // EAGER // TODO IMPROVE with a separate method in DAO? //@ManyToOne // (cascade={CascadeType.ALL}) // @OneToMany(fetch = FetchType.LAZY, mappedBy = "user???")
    @Cascade(value = { CascadeType.ALL })
    @JoinColumn(name = "personID") // not parent_sector duh // <key column="sector_id"
    private Set<Person> architects = new HashSet<>();
	
	// (Hoone algne autor)
	@Nullable
    @Column(name="originalAuthors")
    @ManyToMany()
    @Cascade(value = { CascadeType.ALL })
    @JoinColumn(name = "personID")
    private Set<Person> originalAuthors = new HashSet<>();
	
	// Kaastöö?? / Extra comment ???: (nt koostöös arhitektuuribürooga X, … arhitekt Y)
	@Nullable
    @Column(name="contributors")
    @ManyToMany()
    @Cascade(value = { CascadeType.ALL })
    @JoinColumn(name = "personID")
    private Set<Person> contributors = new HashSet<>();
	
	// konstruktor
	@Nullable
    @Column(name="constructors")
    @ManyToMany()
    @Cascade(value = { CascadeType.ALL })
    @JoinColumn(name = "personID")
    private Set<Person> constructors = new HashSet<>();

	// sisekujundaja
	@Nullable
    @Column(name="interiorDesigners")
    @ManyToMany()
    @Cascade(value = { CascadeType.ALL })
    @JoinColumn(name = "personID")
    private Set<Person> interiorDesigners = new HashSet<>();
	
	// maastiku arhitekt
	@Nullable
    @Column(name="landscapeArchitects")
    @ManyToMany()
    @Cascade(value = { CascadeType.ALL })
    @JoinColumn(name = "personID")
    private Set<Person> landscapeArchitects = new HashSet<>();
	
	// valgustid
	@Nullable
    @Column(name="lightsDesigners")
    @ManyToMany()
    @Cascade(value = { CascadeType.ALL })
    @JoinColumn(name = "personID")
    private Set<Person> lightsDesigners = new HashSet<>();
		
	// String Prize (preemia): nt Konkursitöö I preemia
	
	// Image(s): promo pics
	
	// Image(s) drawings
	
	// String Location town:
	
	// Location address(es):
	
	// + LONG and LAT for GEO POSITIONING!!!
	
	//Project Group
	
	// GETTERS & SETTERS:

}
