package com.asm2.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.asm2.DTO.CompanyDTO;
import com.asm2.DTO.RecruitmentDTO;
import com.asm2.DTO.UserDTO;
import com.asm2.entity.Category;
import com.asm2.entity.Company;
import com.asm2.entity.Recruitment;
import com.asm2.service.HomeService;
import com.asm2.service.RecruitmentService;
import com.asm2.service.UserService;

import net.bytebuddy.asm.Advice.Return;

@Controller
@RequestMapping(value = "/recruitment")
public class RecruitmentController {

	@Autowired
	private RecruitmentService recruitmentService;

	@Autowired
	private UserService userService;

	@Autowired
	private HomeService homeService;

	@GetMapping("/post")
	public String recruitmentPage(Model model, CompanyDTO companyDTO, HttpSession session) {
		List<Category> categories = recruitmentService.getCategories();
		model.addAttribute("categories", categories);
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		int userId = userDTO.getId();
		Company company = userService.getCompanyInfo(companyDTO, userId);
		return "public/post-job";
	}

	@PostMapping("/add")
	public String addPostJob(RecruitmentDTO recruitmentDTO, HttpSession session, Model model) {
		List<Category> categories = recruitmentService.getCategories();
		model.addAttribute("categories", categories);
		Recruitment recruitment = recruitmentService.addPostJob(recruitmentDTO);
		Company company = recruitmentService.getCompanyById(recruitmentDTO.getCompanyId());
		model.addAttribute("company", company);

		return "public/post-job";
	}

	@PostMapping("/deleteRec")
	public String deleteRec(RecruitmentDTO recruitmentDTO, Model model) {
		Recruitment recruitment = recruitmentService.getRecruitment(recruitmentDTO.getId());
		recruitmentService.deleteRec(recruitment);
		List<Recruitment> recruitments = homeService.getRecruitments();
		model.addAttribute("recruitments", recruitments);
		return "public/post-list";
	}

	@GetMapping("/detail/{id}")
	public String detailPost(@PathVariable("id") int id, Model model) {
		RecruitmentDTO recruitmentDTO = recruitmentService.getRecruitmentDTO(id);
		model.addAttribute("recruitmentDTO", recruitmentDTO);
		
		System.out.println("+++ " + recruitmentDTO.getCompany().getNameCompany() + " " + recruitmentDTO.getCompany().getLogo());
		return "public/detail-post";
	}

}
