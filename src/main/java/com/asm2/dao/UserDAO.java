package com.asm2.dao;

import java.util.List;

import com.asm2.DTO.CompanyDTO;
import com.asm2.DTO.UserDTO;
import com.asm2.entity.Company;
import com.asm2.entity.Cv;
import com.asm2.entity.Role;
import com.asm2.entity.User;

public interface UserDAO {

	public List<Role> getRoles();
	
	public User registerUser(UserDTO userDTO);
	
	public UserDTO getUserLogin(UserDTO userDTO);
	
	public User updateUser(UserDTO userDTO);
	
	public Company updateCompanyInfo(CompanyDTO companyDTO,int userId);
	
	public Company getCompany(CompanyDTO companyDTO, int userId);
	
	public User getUserById(int userId);
	
	public Cv updadateCvForCandidate(String pathCv);
	
	public Cv getCvById(int cvid);
	
	public void deleteCv(int cvId);
	
	public void updateUser(User user);
	


}
