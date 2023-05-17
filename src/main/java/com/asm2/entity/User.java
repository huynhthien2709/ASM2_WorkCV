package com.asm2.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "user")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "address")
	private String address;

	@Column(name = "description")
	private String description;

	@Column(name = "email")
	private String email;

	@NotNull(message = "is required")
	@Column(name = "full_name")
	private String fullName;

	@Column(name = "image")
	private String image;

	@NotNull(message = "is required")
	@Column(name = "password")
	private String password;

	@Column(name = "phone_number")
	private String phoneNumber;

	@Column(name = "status")
	private int status;

	@ManyToOne
	@JoinColumn(name = "role_id")
	private Role role;
	

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private List<Company> listCompanies;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private List<Cv> cvs;

	public List<Company> getListCompanies() {
		return listCompanies;
	}

	public void setListCompanies(List<Company> listCompanies) {
		this.listCompanies = listCompanies;
	}

	public User(String address, String description, String email, @NotNull(message = "is required") String fullName,
			String image, @NotNull(message = "is required") String password, String phoneNumber, int status) {
		this.address = address;
		this.description = description;
		this.email = email;
		this.fullName = fullName;
		this.image = image;
		this.password = password;
		this.phoneNumber = phoneNumber;
		this.status = status;
	}

	public User() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}



}
