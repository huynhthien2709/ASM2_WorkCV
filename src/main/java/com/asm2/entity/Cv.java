package com.asm2.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "cv")
public class Cv {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "file_name")
	private String fileName;

	@OneToOne(mappedBy = "cv")
	private User user;

	public Cv(String fileName) {
		this.fileName = fileName;
	}

	public Cv() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	/**
	 * use to get just file name, not path fileName from data
	 * @return
	 */
	public String getCvShortName() {
		String[] arr = this.fileName.split("/");
		return arr[arr.length - 1];
	}

}
