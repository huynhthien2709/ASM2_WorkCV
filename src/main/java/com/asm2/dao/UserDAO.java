package com.asm2.dao;

import java.util.List;

import com.asm2.DTO.ApplyPostDTO;
import com.asm2.DTO.CompanyDTO;
import com.asm2.DTO.FollowCompanyDTO;
import com.asm2.DTO.UserDTO;
import com.asm2.entity.ApplyPost;
import com.asm2.entity.Company;
import com.asm2.entity.Cv;
import com.asm2.entity.FollowCompany;
import com.asm2.entity.Recruitment;
import com.asm2.entity.Role;
import com.asm2.entity.SaveJob;
import com.asm2.entity.User;

public interface UserDAO {

	public List<Role> getRoles();
	
	public User registerUser(UserDTO userDTO);
	
	public UserDTO getUserLogin(UserDTO userDTO);
	
	public User updateUser(UserDTO userDTO);
	
	public User updateUserHR(UserDTO userDTO);
	
	public Company updateCompanyInfo(CompanyDTO companyDTO,int userId);
	
	public Company getCompany(CompanyDTO companyDTO, int userId);
	
	public User getUserById(int userId);
	
	public Cv updadateCvForCandidate(String pathCv);
	
	public Cv getCvById(int cvid);
	
	public void deleteCv(int cvId);
	
	public void updateUser(User user);
	
	public ApplyPost applyJob(ApplyPostDTO applyPostDTO);
	
	public Recruitment getRecruitmentById(int recruitmentId);

	public Cv updateCvApplyJobCv (String path, int userId);
	
	public List<SaveJob> getListSaveJob(int userId);
	
	public List<ApplyPost> getUserbyApplyPosts();
	
	public Company getCompanyByUserId(int userId);
	
	public CompanyDTO getCompanybyId(int compId);
	
	public FollowCompany addFollowCompany(FollowCompanyDTO followCompanyDTO);
	
	public List<FollowCompany> getListFollowCompany(int userId);
	
	public void deleteSaveJob(int userId, int recId);
	
	public List<ApplyPost> getListApplyPosts(int userId, int page);

}
