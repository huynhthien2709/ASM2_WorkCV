package com.asm2.dao;

import java.util.List;

import com.asm2.DTO.CompanyDTO;
import com.asm2.DTO.RecruitmentDTO;
import com.asm2.entity.ApplyPost;
import com.asm2.entity.Category;
import com.asm2.entity.Company;
import com.asm2.entity.Recruitment;

public interface RecruitmentDAO {

	public List<Category> getCategories();
	
	public Recruitment addPostJob(RecruitmentDTO recruitmentDTO);
	
	public Category getCategorybyId(int categoryId);
	
	public RecruitmentDTO getRecruitmentDTO(int id);
	
	public Recruitment getRecruitment(int id);
	
	public Company getCompanyById(int compId);
	
	public void deleteRec(int id);
	
	public void updadetApplyPost(ApplyPost applyPost);
	
	public void  deleteApplyPost(int recId);
	
	public List<Recruitment> getRecruitmentbyCompId(int compId);
	
	public List<ApplyPost> getListCandidate(int recId);
	
	public ApplyPost approveCandidate(int id);
}
