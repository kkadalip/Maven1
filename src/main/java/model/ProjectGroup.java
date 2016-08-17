package model;

import java.util.SortedSet;
import java.util.TreeSet;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.SortNatural;

public class ProjectGroup {

	public ProjectGroup() {
	}
	
	@Id
	@Column(name="projectGroupID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(name="name")
    private String name;
	
    @OneToMany(fetch=FetchType.EAGER) // LAZY // (cascade={CascadeType.ALL})
    @Cascade(value={CascadeType.ALL}) // save them to the database when saving their parent.
	@OrderBy(value="name")
	@SortNatural
	@JoinColumn(name="parent_id") //, insertable = false, updatable = false)
    private SortedSet<Project> childProjects = new TreeSet<>();
}
