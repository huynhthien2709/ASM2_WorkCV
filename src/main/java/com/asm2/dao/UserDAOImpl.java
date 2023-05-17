package com.asm2.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.asm2.DTO.CompanyDTO;
import com.asm2.DTO.UserDTO;
import com.asm2.entity.Company;
import com.asm2.entity.Role;
import com.asm2.entity.User;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Role> getRoles() {
		Session currentSession = sessionFactory.getCurrentSession();

		Query<Role> theQuery = currentSession.createQuery("from Role", Role.class);

		List<Role> roles = theQuery.getResultList();

		return roles;
	}

	@Override
	public User registerUser(UserDTO userDTO) {
		Session currentSession = sessionFactory.getCurrentSession();
		User user = new User();
		Query theQuery = currentSession.createQuery("from User where email =:email", User.class);
		theQuery.setParameter("email", userDTO.getEmail());
		user = (User) theQuery.uniqueResult();
		if (user != null) {
			return null;
		} else {
			User user1 = new User();
			Role role = new Role();
			role.setId(Integer.parseInt(userDTO.getRole()));
			user1.setEmail(userDTO.getEmail());
			user1.setFullName(userDTO.getFullName());
			user1.setPassword(BCrypt.hashpw(userDTO.getPassword(), BCrypt.gensalt(12)));
			user1.setRole(role);
			currentSession.save(user1);
		}

		return user;

	}

	@Override
	public UserDTO getUserLogin(UserDTO userDTO) {
		Session currentSession = sessionFactory.getCurrentSession();
		User user = new User();
		Query theQuery = currentSession.createQuery("from User where email =:email", User.class);
		theQuery.setParameter("email", userDTO.getEmail());
		user = (User) theQuery.uniqueResult();
		if (user == null) {
			return null;
		} else {
			userDTO.setEmail(user.getEmail());
			userDTO.setPassword(user.getPassword());
			userDTO.setFullName(user.getFullName());
			userDTO.setRole(Integer.toString(user.getRole().getId()));
			userDTO.setId(user.getId());
			userDTO.setAddress(user.getAddress());
			userDTO.setPhoneNumber(user.getPhoneNumber());
			userDTO.setDescription(user.getDescription());
			return userDTO;
		}

	}

	@Override
	public User updateUser(UserDTO userDTO) {
		Session currentSession = sessionFactory.getCurrentSession();
		User user = new User();
		Role role = new Role();
		role.setId(Integer.parseInt(userDTO.getRole()));
		user.setEmail(userDTO.getEmail());
		user.setFullName(userDTO.getFullName());
		user.setAddress(userDTO.getAddress());
		user.setPhoneNumber(userDTO.getPhoneNumber());
		user.setId(userDTO.getId());
//		user.setStatus(userDTO.getStatus());
		user.setRole(role);
		user.setPassword(userDTO.getPassword());
		user.setDescription(userDTO.getDescription());
		currentSession.saveOrUpdate(user);
		return user;
	}

	@Override
	public Company updateCompanyInfo(CompanyDTO companyDTO, int userId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Company company = new Company();
		company.setId(companyDTO.getId());
		company.setEmail(companyDTO.getEmail());
		company.setNameCompany(companyDTO.getNameCompany());
		company.setAddress(companyDTO.getAddress());
		company.setPhoneNumber(companyDTO.getPhoneNumber());
		company.setDescription(companyDTO.getDescription());
		company.setUserId(userId);
		company.setLogo(companyDTO.getLogo());

		currentSession.saveOrUpdate(company);
		return company;
	}

	@Override
	public Company getCompany(CompanyDTO companyDTO, int userId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Company company = new Company();
		Query query = currentSession.createQuery("from Company where userId =: userId", Company.class);
		query.setParameter("userId", userId);
		company = (Company) query.uniqueResult();
		if (company != null) {
			companyDTO.setId(company.getId());
			companyDTO.setEmail(company.getEmail());
			companyDTO.setNameCompany(company.getNameCompany());
			companyDTO.setAddress(company.getAddress());
			companyDTO.setPhoneNumber(company.getPhoneNumber());
			companyDTO.setDescription(company.getDescription());
			companyDTO.setLogo(company.getLogo());
			return company;
		}else {
			return null;
		}
		
	}

}
