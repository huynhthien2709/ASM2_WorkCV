package com.asm2.dao;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.asm2.DTO.RecruitmentDTO;
import com.asm2.entity.Category;
import com.asm2.entity.Company;
import com.asm2.entity.Recruitment;

@Repository
@Transactional
public class RecruitmentDAOImpl implements RecruitmentDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Category> getCategories() {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Category> query = currentSession.createQuery("from Category", Category.class);
		
		List<Category> categories = query.getResultList();
		
		return categories;
	}

	@Override
	public Recruitment addPostJob(RecruitmentDTO recruitmentDTO) {
		Session currentSession = sessionFactory.getCurrentSession();
		Recruitment recruitment = new Recruitment();
		Category category = new Category();
		LocalDateTime myDateObj = LocalDateTime.now();
		DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
		String formattedDate = myDateObj.format(myFormatObj);
		category.setId(Integer.parseInt(recruitmentDTO.getCategoryId()));
		recruitment.setTitle(recruitmentDTO.getTitle());
		recruitment.setDescription(recruitmentDTO.getDescription());
		recruitment.setExperience(recruitmentDTO.getExperience());
		recruitment.setAddress(recruitmentDTO.getAddress());
		recruitment.setDeadline(recruitmentDTO.getDeadline());
		recruitment.setSalary(recruitmentDTO.getSalary());
		recruitment.setType(recruitmentDTO.getType());
		recruitment.setCategory(category);
		recruitment.setCompanyId(recruitmentDTO.getCompanyId());
		recruitment.setCreatedAt(formattedDate);
		currentSession.saveOrUpdate(recruitment);
		return recruitment;
	}

	@Override
	public Category getCategorybyId(int categoryId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Category> query = currentSession.createQuery("from Category where id =: categoryId", Category.class);
		query.setParameter("categoryId", categoryId);
		Category category = (Category) query.uniqueResult();
		if (category != null) {
			Category cate = (Category) currentSession.get(Category.class, categoryId);
			int numcho = cate.getNumberChoose();
			cate.setNumberChoose(numcho + 1);
		}
		return category;
	}

	@Override
	public Recruitment getRecruitment(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Recruitment recruitment = currentSession.get(Recruitment.class, id);
		
		RecruitmentDTO recruitmentDTO = new RecruitmentDTO();
		recruitmentDTO.setAddress(recruitment.getAddress());
		return null;
	}

	@Override
	public Company getCompanyById(int compId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Company> query = currentSession.createQuery("from Company where id =: compId", Company.class);
		query.setParameter("compId", compId);
		Company	company = (Company) query.uniqueResult();
		return company;
	}
	
	

}
