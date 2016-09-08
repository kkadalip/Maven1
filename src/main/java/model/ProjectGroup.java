package model;

import java.util.HashSet;
import java.util.SortedSet;
import java.util.TreeSet;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.annotations.SortNatural;

import com.sun.istack.internal.Nullable;

@Entity
@Table(name="projectGroup")
public class ProjectGroup {
	
	// DATABASE FIELDS:
	
	@Id
	@Column(name="projectGroupID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(name="name")
    private String name;
	
	@LazyCollection(LazyCollectionOption.FALSE)
	@Nullable
	//@Column(name="childProjects") // @Column(s) not allowed on a @ManyToOne property: model.Project.projectGroup
    @OneToMany(mappedBy="projectGroup") // not the table project but PROPERTY // MANY SIDE IS OWNER AND TELLS MAPPING //default LAZY (fetch=FetchType.EAGER) // LAZY // (cascade={CascadeType.ALL})
    //@Cascade(value={CascadeType.ALL}) // save them to the database when saving their parent.
	@OrderBy(value="name")
	@SortNatural
	// Associations marked as mappedBy must not define database mappings like @JoinTable or @JoinColumn: model.ProjectGroup.childProjects @JoinColumn(name="projectID") //, insertable = false, updatable = false)
    private SortedSet<Project> childProjects = new TreeSet<>();

	
	@Column(name="imagesRootFolder")
    private String imagesRootFolder;
	
	
	// CONSTRUCTORS:
    
	public ProjectGroup() {
	}
	
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


	public SortedSet<Project> getChildProjects() {
		return childProjects;
	}

	public void setChildProjects(SortedSet<Project> childProjects) {
		this.childProjects = childProjects;
	}

	public String getImagesRootFolder() {
		return imagesRootFolder;
	}

	public void setImagesRootFolder(String imagesRootFolder) {
		this.imagesRootFolder = imagesRootFolder;
	}
	
	
    
}
