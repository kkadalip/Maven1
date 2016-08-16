package Model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

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
	
	@Column(name="planningStartDate")
	private LocalDateTime planningStartDate;
	@Column(name="planningEndDate")
	private LocalDateTime planningEndDate;
	
	@Column(name="buildingStartDate")
	private LocalDateTime buildingStartDate;
	@Column(name="buildingEndDate")
	private LocalDateTime buildingEndDate;

	//Person Architect(s)
	
	//Person Contributor(s): Kaastöö?? / Extra comment ???: (nt koostöös arhitektuuribürooga X, … arhitekt Y)
	
	//Person Constructor (konstruktor)
	
	//Person Interior designer(s)
	
	//Person Landscape architect
	
	@Column (name="sizeQuantity")
	private Integer sizeQuantity;
	
	@Column (name="sizeUnit")
	private String sizeUnit;
	
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
