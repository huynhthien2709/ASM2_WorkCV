package com.asm2.dao;

import java.util.List;

import com.asm2.DTO.CompanyDTO;
import com.asm2.DTO.RecruitmentDTO;
import com.asm2.entity.Category;
import com.asm2.entity.Recruitment;

public interface RecruitmentDAO {

	public List<Category> getCategories();
	
	public Recruitment addPostJob(RecruitmentDTO recruitmentDTO);
	
	public Category getCategorybyId(int categoryId);
	
	public Recruitment getRecruitment(int id);
}
