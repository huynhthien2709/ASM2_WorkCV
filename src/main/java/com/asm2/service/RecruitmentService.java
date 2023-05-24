package com.asm2.service;

import java.util.List;

import com.asm2.DTO.RecruitmentDTO;
import com.asm2.entity.Category;
import com.asm2.entity.Recruitment;

public interface RecruitmentService {
	
	public List<Category> getCategories();

	public Recruitment addPostJob(RecruitmentDTO recruitmentDTO);
}
