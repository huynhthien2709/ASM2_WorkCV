package com.asm2.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.asm2.DTO.RecruitmentDTO;
import com.asm2.entity.Category;
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
		category.setId(Integer.parseInt(recruitmentDTO.getCategoryId()));
//		recruitment.setId(recruitmentDTO.getId());
		recruitment.setTitle(recruitmentDTO.getTitle());
		recruitment.setDescription(recruitmentDTO.getDescription());
		recruitment.setExperience(recruitmentDTO.getExperience());
		recruitment.setAddress(recruitmentDTO.getAddress());
		recruitment.setDeadline(recruitmentDTO.getDeadline());
		recruitment.setSalary(recruitmentDTO.getSalary());
		recruitment.setType(recruitmentDTO.getType());
		recruitment.setCategory(category);
		recruitment.setCompanyId(recruitmentDTO.getCompanyId());
		
		currentSession.saveOrUpdate(recruitment);
		return null;
	}

}
