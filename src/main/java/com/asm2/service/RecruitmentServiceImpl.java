package com.asm2.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asm2.DTO.RecruitmentDTO;
import com.asm2.DTO.SaveJobDTO;
import com.asm2.dao.RecruitmentDAO;
import com.asm2.entity.ApplyPost;
import com.asm2.entity.Category;
import com.asm2.entity.Company;
import com.asm2.entity.Recruitment;
import com.asm2.entity.SaveJob;

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
	@Transactional
	public Category getCategorybyId(int categoryId) {
		Category category = recruitmentDAO.getCategorybyId(categoryId);
		return category;
	}

	@Override
	@Transactional
	public Company getCompanyById(int compId) {
		Company company = recruitmentDAO.getCompanyById(compId);
		return company;
	}

	@Override
	@Transactional
	public void deleteRec(Recruitment recruitment) {
		recruitmentDAO.deleteApplyPost(recruitment.getId());
		System.out.println("id service" + recruitment.getId());
		
		recruitmentDAO.deleteRec(recruitment.getId());
		
	}

	@Override
	@Transactional
	public RecruitmentDTO getRecruitmentDTO(int id) {
		return recruitmentDAO.getRecruitmentDTO(id);
	}

	@Override
	@Transactional
	public Recruitment getRecruitment(int id) {
		return recruitmentDAO.getRecruitment(id);
	}

	@Override
	@Transactional
	public List<Recruitment> getRecruitmentbyCompId(int compId) {
		
		return recruitmentDAO.getRecruitmentbyCompId(compId);
	}

	@Override
	@Transactional
	public List<ApplyPost> getListCandidate(int recId) {
		return recruitmentDAO.getListCandidate(recId);
	}

	@Override
	@Transactional
	public ApplyPost approveCandidate(int id) {
		return recruitmentDAO.approveCandidate(id);
		
	}

	@Override
	@Transactional
	public SaveJob addSaveJob(SaveJobDTO saveJobDTO) {
		
		return recruitmentDAO.addSaveJob(saveJobDTO);
	}
	
	
	
	
	

	
}
