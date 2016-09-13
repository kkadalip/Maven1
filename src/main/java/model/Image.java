package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

//import javax.annotation.Nullable;

@Entity
@Table(name="image")
public class Image {
	
	// CONSTRUCTORS:
	
	public Image() {
	}
	public Image(String folderName, String fileName) {
		this.folderName = folderName;
    	this.fileName = fileName;
	}
	public Image(String folderName, String fileName, Integer sortNumber) {
		this.folderName = folderName;
    	this.fileName = fileName;
    	this.sortNumber = sortNumber;
	}
	
	// DATABASE FIELDS:
	
	@Id
	@Column(name="imageID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(name="folderName")
    private String folderName;
	
	@Column(name="fileName")
    private String fileName;
	
	@Column(name="sortNumber")
    private Integer sortNumber;

	// GETTERS & SETTERS:
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFolderName() {
		return folderName;
	}
	public void setFolderName(String folderName) {
		this.folderName = folderName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Integer getSortNumber() {
		return sortNumber;
	}
	public void setSortNumber(Integer sortNumber) {
		this.sortNumber = sortNumber;
	}
	
}
