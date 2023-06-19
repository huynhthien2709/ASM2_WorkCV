package com.asm2.service;

import java.util.List;

import com.asm2.DTO.ApplyPostDTO;
import com.asm2.DTO.CompanyDTO;
import com.asm2.DTO.FollowCompanyDTO;
import com.asm2.DTO.UserDTO;
import com.asm2.entity.ApplyPost;
import com.asm2.entity.Company;
import com.asm2.entity.Cv;
import com.asm2.entity.FollowCompany;
import com.asm2.entity.Role;
import com.asm2.entity.SaveJob;
import com.asm2.entity.User;

public interface UserService {

	public List<Role> getRoles();

	public User registerUser(UserDTO userDTO);

	public boolean checkUserLogin(UserDTO userDTO);

	public User updateUser(UserDTO userDTO);

	public Company updateCompanyInfo(CompanyDTO companyDTO, int userId);

	public Company getCompanyInfo(CompanyDTO companyDTO, int userId);

	public User getUserById(int userId);

	public Cv getCvById(int cvid);

	public void deleteCv(User user);
	
	public ApplyPost applyJob(ApplyPostDTO applyPostDTO);
	
	public List<SaveJob>  getListSaveJob(int userId);
	
	public List<ApplyPost> getUserbyApplyPosts();
	
	public Company getCompanyByUserId(int userId);
	
	public CompanyDTO getCompanybyId(int compId);
	
	public FollowCompany addFollowCompany(FollowCompanyDTO followCompanyDTO);
}
