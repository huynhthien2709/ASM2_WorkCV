package com.asm2.service;

import java.util.List;

import com.asm2.DTO.RecruitmentDTO;
import com.asm2.entity.ApplyPost;
import com.asm2.entity.Category;
import com.asm2.entity.Company;
import com.asm2.entity.Recruitment;

public interface RecruitmentService {
	
	public List<Category> getCategories();

	public Recruitment addPostJob(RecruitmentDTO recruitmentDTO);
	
	public Category getCategorybyId(int categoryId);
	
	public Company getCompanyById(int compId);
	
	public RecruitmentDTO getRecruitmentDTO(int id);
	
	public Recruitment getRecruitment(int id);
	
	public void deleteRec(Recruitment recruitment);
	
	public List<Recruitment> getRecruitmentbyCompId(int compId);
}

