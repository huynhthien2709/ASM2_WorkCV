package com.asm2.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asm2.DTO.RecruitmentDTO;
import com.asm2.dao.RecruitmentDAO;
import com.asm2.entity.Category;
import com.asm2.entity.Recruitment;

@Service
public class RecruitmentServiceImpl implements RecruitmentService {
	@Autowired
	private RecruitmentDAO recruitmentDAO;
	
	@Override
	@Transactional
	public List<Category> getCategories() {
		
		return recruitmentDAO.getCategories();
	}

	@Override
	@Transactional
	public Recruitment addPostJob(RecruitmentDTO recruitmentDTO) {
		Recruitment recruitment = recruitmentDAO.addPostJob(recruitmentDTO);
		return recruitment;
	}

	@Override
	public Category getCategorybyId(int categoryId) {
		Category category = recruitmentDAO.getCategorybyId(categoryId);
		return category;
	}

}
