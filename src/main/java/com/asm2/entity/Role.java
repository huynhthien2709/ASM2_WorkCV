package com.asm2.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "role")
public class Role {
	
	@Id
	@Column(name = "id")
	private int id;
	
	@Column(name = "role_name")
	private String roleName;
	
	@OneToMany(mappedBy = "role")
	private List<User> users;

	public Role(int id, String roleName) {
		this.id = id;
		this.roleName = roleName;
	}

	public Role() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}
	
	

}
