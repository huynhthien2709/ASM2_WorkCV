package com.asm2.service;

import java.util.List;

import javax.transaction.Transactional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asm2.DTO.ApplyPostDTO;
import com.asm2.DTO.CompanyDTO;
import com.asm2.DTO.FollowCompanyDTO;
import com.asm2.DTO.UserDTO;
import com.asm2.dao.UserDAO;
import com.asm2.entity.ApplyPost;
import com.asm2.entity.Company;
import com.asm2.entity.Cv;
import com.asm2.entity.FollowCompany;
import com.asm2.entity.Role;
import com.asm2.entity.SaveJob;
import com.asm2.entity.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	@Override
	@Transactional
	public List<Role> getRoles() {
		return userDAO.getRoles();
	}

	@Override
	@Transactional
	public User registerUser(UserDTO userDTO) {
		User user = userDAO.registerUser(userDTO);
		if (user == null) {
			return null;
		}
		return userDAO.registerUser(userDTO);
	}

	@Override
	@Transactional
	public boolean checkUserLogin(UserDTO userDTO) {
		String pass = userDTO.getPassword();
		userDTO = userDAO.getUserLogin(userDTO);
		if (userDTO != null) {
			if (BCrypt.checkpw(pass, userDTO.getPassword())) {
				return true;
			} else {
				return false;
			}
		}
		return false;
	}

	@Override
	@Transactional
	public User updateUser(UserDTO userDTO) {
		if (userDTO.getRole().equals("1")) {
			User user = userDAO.updateUser(userDTO);
			return user;
		} else {
			User user = userDAO.updateUserHR(userDTO);
			return user;
		}
	}

	@Override
	@Transactional
	public Company updateCompanyInfo(CompanyDTO companyDTO, int userId) {
		Company company = userDAO.updateCompanyInfo(companyDTO, userId);
		return company;
	}

	@Override
	@Transactional
	public Company getCompanyInfo(CompanyDTO companyDTO, int userId) {
		Company company = userDAO.getCompany(companyDTO, userId);
		if (company == null) {
			return null;
		}
		return company;
	}

	@Override
	@Transactional
	public User getUserById(int userId) {
		User user = userDAO.getUserById(userId);
		return user;
	}

	@Override
	@Transactional
	public Cv getCvById(int cvid) {
		Cv cv = userDAO.getCvById(cvid);
		return cv;
	}

	@Override
	public void deleteCv(User user) {
		int cvId = user.getCv().getId();
		user.setCv(null);
		userDAO.updateUser(user);
		userDAO.deleteCv(cvId);

	}

	@Override
	@Transactional
	public ApplyPost applyJob(ApplyPostDTO applyPostDTO) {
		ApplyPost applyPost = userDAO.applyJob(applyPostDTO);
		return applyPost;
	}

	@Override
	@Transactional
	public List<SaveJob> getListSaveJob(int userId, int page) {

		return userDAO.getListSaveJob(userId, page);
	}

	@Override
	@Transactional
	public List<ApplyPost> getUserbyApplyPosts() {

		return userDAO.getUserbyApplyPosts();
	}

	@Override
	@Transactional
	public Company getCompanyByUserId(int userId) {

		return userDAO.getCompanyByUserId(userId);
	}

	@Override
	@Transactional
	public CompanyDTO getCompanybyId(int compId) {
		return userDAO.getCompanybyId(compId);
	}

	@Override
	@Transactional
	public FollowCompany addFollowCompany(FollowCompanyDTO followCompanyDTO) {

		return userDAO.addFollowCompany(followCompanyDTO);
	}

	@Override
	@Transactional
	public List<FollowCompany> getListFollowCompany(int userId, int page) {
		
		return userDAO.getListFollowCompany(userId, page);
	}

	@Override
	@Transactional
	public void deleteSaveJob(int userId, int recId) {
		userDAO.deleteSaveJob(userId, recId);
	}

	@Override
	@Transactional
	public List<ApplyPost> getListApplyPosts(int userId, int page) {
		
		return userDAO.getListApplyPosts(userId, page);
	}

	@Override
	public void updateStatusUser(int userId) {
		userDAO.updateStatusUser(userId);
		
	}
	
	

}
