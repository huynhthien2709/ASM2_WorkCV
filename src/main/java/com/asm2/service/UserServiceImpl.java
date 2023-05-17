package com.asm2.service;

import java.util.List;

import javax.transaction.Transactional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asm2.DTO.CompanyDTO;
import com.asm2.DTO.UserDTO;
import com.asm2.dao.UserDAO;
import com.asm2.entity.Company;
import com.asm2.entity.Role;
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
			}else {
				return false;
			}
		}
		return false;
	}

	@Override
	@Transactional
	public User updateUser(UserDTO userDTO) {
		User user = userDAO.updateUser(userDTO);
		return user;
	}

	@Override
	@Transactional
	public Company updateCompanyInfo(CompanyDTO companyDTO, int userId) {
		Company company = userDAO.updateCompanyInfo(companyDTO, userId);
		return company;
	}

	@Override
	public Company getCompanyInfo(CompanyDTO companyDTO, int userId) {
		Company company = userDAO.getCompany(companyDTO, userId);
		if (company == null) {
			return null;
		}
		return company;
	}

}
