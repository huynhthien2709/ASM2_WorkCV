package com.asm2.dao;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.asm2.DTO.ApplyPostDTO;
import com.asm2.DTO.CompanyDTO;
import com.asm2.DTO.UserDTO;
import com.asm2.entity.ApplyPost;
import com.asm2.entity.Company;
import com.asm2.entity.Cv;
import com.asm2.entity.Recruitment;
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
			userDTO.setImage(user.getImage());
			if (user.getCv() == null) {
				userDTO.setCv("0");
			}else {
				userDTO.setCv(Integer.toString(user.getCv().getId()));
			}
			

			return userDTO;
		}

	}

	@Override
	public User updateUser(UserDTO userDTO) {
		User user = this.getUserById(userDTO.getId());

		Session currentSession = sessionFactory.getCurrentSession();
		Role role = new Role();
		role.setId(Integer.parseInt(userDTO.getRole()));

		if (userDTO.getCv() != null && !userDTO.getCv().equals("")) {			
			Cv cv = updadateCvForCandidate(userDTO.getCv());
			user.setCv(cv);
		} else {
			System.out.println("user " + user.getCv().getFileName());
			Cv cv = updadateCvForCandidate(user.getCv().getFileName());
			user.setCv(cv);
		}
		user.setEmail(userDTO.getEmail());
		user.setFullName(userDTO.getFullName());
		user.setAddress(userDTO.getAddress());
		user.setPhoneNumber(userDTO.getPhoneNumber());
		user.setId(userDTO.getId());
		user.setRole(role);
		user.setDescription(userDTO.getDescription());
		if (userDTO.getImage() != null && !userDTO.getImage().trim().equals("") ) {
			user.setImage(userDTO.getImage());
		} else {
			user.setImage(user.getImage());
		}

		currentSession.saveOrUpdate(user);
		return user;
	}
	
	

	@Override
	public User updateUserHR(UserDTO userDTO) {
		User user = this.getUserById(userDTO.getId());

		Session currentSession = sessionFactory.getCurrentSession();
		Role role = new Role();
		role.setId(Integer.parseInt(userDTO.getRole()));
		user.setEmail(userDTO.getEmail());
		user.setFullName(userDTO.getFullName());
		user.setAddress(userDTO.getAddress());
		user.setPhoneNumber(userDTO.getPhoneNumber());
		user.setId(userDTO.getId());
		user.setRole(role);
		user.setDescription(userDTO.getDescription());
		user.setCv(null);
		if (userDTO.getImage() != null && !userDTO.getImage().trim().equals("") ) {
			user.setImage(userDTO.getImage());
		} else {
			user.setImage(user.getImage());
		}

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
		} else {
			return null;
		}

	}

	@Override
	public User getUserById(int userId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<User> query = currentSession.createQuery("from User where id =: userId", User.class);
		query.setParameter("userId", userId);
		return query.uniqueResult();
	}

	@Override
	public Cv updadateCvForCandidate(String pathCv) {
		Session currentSession = sessionFactory.getCurrentSession();
		Cv cv = new Cv();
		cv.setFileName(pathCv);
		currentSession.saveOrUpdate(cv);
		return cv;
	}

	@Override
	public Cv getCvById(int cvid) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Cv> query = currentSession.createQuery("from Cv where id =: cvid", Cv.class);
		query.setParameter("cvid", cvid);
		return query.uniqueResult();
	}

	@Override
	public void deleteCv(int cvId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("delete Cv where id =: cvId");
		query.setParameter("cvId", cvId);
		query.executeUpdate();
//		currentSession.delete(currentSession);
	}

	@Override
	public void updateUser(User user) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(user);

	}

	@Override
	public ApplyPost applyJobNoUploadCv(ApplyPostDTO applyPostDTO) {
		Session currentSession = sessionFactory.getCurrentSession();
		ApplyPost applyPost = new ApplyPost();
		LocalDateTime myDateObj = LocalDateTime.now();
		DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
		String formattedDate = myDateObj.format(myFormatObj);
		applyPost.setCreatedAt(formattedDate);
		int recruitmentId = applyPostDTO.getRecruitmentId();
		Recruitment recruitment = getRecruitmentById(recruitmentId);
		applyPost.setRecruitment(recruitment);
		int userId = applyPostDTO.getUserId();
		User user = getUserById(userId);
		applyPost.setUser(user);
		applyPost.setNameCv(applyPostDTO.getNameCv());
		currentSession.saveOrUpdate(applyPost);
		return null;
	}

	@Override
	public Recruitment getRecruitmentById(int recruitmentId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Recruitment> query = currentSession.createQuery("from Recruitment where id =: recruitmentId", Recruitment.class);
		query.setParameter("recruitmentId", recruitmentId);		
		return query.uniqueResult();
	}

}
