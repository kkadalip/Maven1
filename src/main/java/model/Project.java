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

	public Project() {
	}
	
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
    @Column(name="architects")
    @ManyToMany() // fetch = FetchType.LAZY // EAGER // TODO IMPROVE with a separate method in DAO? //@ManyToOne // (cascade={CascadeType.ALL}) // @OneToMany(fetch = FetchType.LAZY, mappedBy = "user???")
    @Cascade(value = { CascadeType.ALL })
    @JoinColumn(name = "personID") // not parent_sector duh // <key column="sector_id"
    private Set<Person> architects = new HashSet<>();
	
	//Person Contributor(s): Kaastöö?? / Extra comment ???: (nt koostöös arhitektuuribürooga X, … arhitekt Y)
	
	//Person Constructor (konstruktor)
	
	//Person Interior designer(s)
	
	//Person Landscape architect
	
	@Nullable
	@Column (name="sizeQuantity")
	private Integer sizeQuantity;
	
	@Nullable
	@Column (name="sizeUnit")
	private String sizeUnit;
	
	@Nullable
	@Column(name="apartmentsQuantity")
	private Integer apartmentsQuantity;
	
	// Person Lights: (valgustid)  nt Margus Triibmann (Keha3)
	
	// Person Original author: (Hoone algne autor)
	
	// String Prize (preemia): nt Konkursitöö I preemia
	
	// Image(s): promo pics
	
	// Image(s) drawings
	
	// String Location town:
	
	// Location address(es):
	
	// + LONG and LAT for GEO POSITIONING!!!
	
	//Project Group

}
