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
import org.springframework.web.bind.annotation.RequestParam;

import com.asm2.DTO.CompanyDTO;
import com.asm2.DTO.RecruitmentDTO;
import com.asm2.DTO.SaveJobDTO;
import com.asm2.DTO.UserDTO;
import com.asm2.entity.ApplyPost;
import com.asm2.entity.Category;
import com.asm2.entity.Company;
import com.asm2.entity.Cv;
import com.asm2.entity.Recruitment;
import com.asm2.entity.User;
import com.asm2.service.HomeService;
import com.asm2.service.RecruitmentService;
import com.asm2.service.UserService;





@Controller
@RequestMapping(value = "/recruitment")
public class RecruitmentController {

	@Autowired
	private RecruitmentService recruitmentService;

	@Autowired
	private UserService userService;

	@Autowired
	private HomeService homeService;
	
	
	/**
	 * diplay form add recruitment
	 *
	 */
	@GetMapping("/post")
	public String recruitmentPage(Model model, CompanyDTO companyDTO, HttpSession session) {
		List<Category> categories = recruitmentService.getCategories();
		model.addAttribute("categories", categories);
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		int userId = userDTO.getId();
		Company company = userService.getCompanyInfo(companyDTO, userId);
		model.addAttribute("company", company);
		return "public/post-job";
	}

	/**
	 * add new post job
	 *
	 */
	@PostMapping("/add")
	public String addPostJob(RecruitmentDTO recruitmentDTO, HttpSession session, Model model) {
		List<Category> categories = recruitmentService.getCategories();
		model.addAttribute("categories", categories);
		Recruitment recruitment = recruitmentService.addPostJob(recruitmentDTO);
		Company company = recruitmentService.getCompanyById(recruitmentDTO.getCompanyId());
		model.addAttribute("company", company);

		return "public/post-job";
	}

	/**
	 * delete a post job
	 *
	 */
	@PostMapping("/deleteRec")
	public String deleteRec(RecruitmentDTO recruitmentDTO, Model model) {
		Recruitment recruitment = recruitmentService.getRecruitment(recruitmentDTO.getId());
		recruitmentService.deleteRec(recruitment);
		List<Recruitment> recruitments = homeService.getRecruitments();
		model.addAttribute("recruitments", recruitments);
		return "public/post-list";
	}

	/**
	 * show detai of a post job
	 *
	 */
	@GetMapping("/detail/{id}")
	public String detailPost(@PathVariable("id") int id, Model model) {
		RecruitmentDTO recruitmentDTO = recruitmentService.getRecruitmentDTO(id);
		model.addAttribute("recruitmentDTO", recruitmentDTO);
		List<Recruitment> recruitments = recruitmentService.getRecruitmentbyCompId(recruitmentDTO.getCompanyId());
		model.addAttribute("recruitments", recruitments);

		List<ApplyPost> applyPosts = recruitmentService.getListCandidate(recruitmentDTO.getId());

		model.addAttribute("applyPosts", applyPosts);

		return "public/detail-post";
	}

	/**
	 * accept a candidate for a job         
	 *
	 */
	@GetMapping("/approveCandidate/{id}")
	public String approveCandidate(@PathVariable("id") int id) {
		ApplyPost applyPost = recruitmentService.approveCandidate(id);
		return "redirect:/recruitment/detail/" + applyPost.getRecruitment().getId();
	}

	/**
	 * update a post job when job requirements change
	 *
	 */
	@GetMapping("/updatePost/{id}")
	public String updatePost(@PathVariable("id") int id, Model model) {
		RecruitmentDTO recruitmentDTO = recruitmentService.getRecruitmentDTO(id);
		model.addAttribute("recruitmentDTO", recruitmentDTO);
		List<Category> categories = recruitmentService.getCategories();
		model.addAttribute("categories", categories);
		Company company = recruitmentService.getCompanyById(recruitmentDTO.getCompanyId());
		model.addAttribute("company", company);
		return "public/post-job";
	}
	

	/**
	 * candidate can save a job for themself
	 */
	@GetMapping("/saveJob/{id}")
	public String saveJob(@PathVariable("id") int id, HttpSession session) {
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		SaveJobDTO saveJobDTO = new SaveJobDTO();
		saveJobDTO.setRecruitmentId(id);
		saveJobDTO.setUserId(userDTO.getId());
		recruitmentService.addSaveJob(saveJobDTO);
		return "redirect:/recruitment/detail/" + id;
	}
	
	/**
	 * candidate can search job by job name
	 */
	@PostMapping("/searchByJobName")
	public String searchByJobName(@RequestParam("jobName") String jobName, Model model, HttpSession session) {
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		List<Recruitment> recruitments = recruitmentService.searchByJobName(jobName);
		model.addAttribute("recruitments", recruitments);
		model.addAttribute("jobName", jobName);
		if (userDTO != null) {
			User user = userService.getUserById(userDTO.getId());
			if (user.getCv() != null) {
				int cvid = user.getCv().getId();
				Cv cv = userService.getCvById(cvid);
				model.addAttribute("cv", cv);
			} else {
				model.addAttribute("msg", "bạn chưa có CV");
			}

			model.addAttribute("user", user);
		}

		return "public/result-search";
	}
	
	/**
	 * candidate can search job by company name
	 */
	@PostMapping("/searchByCompanyName")
	public String searchByCompanyName(@RequestParam("companyName") String companyName, Model model) {
		List<Company> companies = recruitmentService.searchByJobCompanyName(companyName);
		model.addAttribute("companies", companies);
		model.addAttribute("companyName", companyName);
		

		return "public/result-search-company";
	}
	
	/**
	 * candidate can search job by address
	 */
	@PostMapping("/searchByAddress")
	public String searchByAddress(@RequestParam("address") String address, Model model, HttpSession session) {
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		List<Recruitment> recruitments = recruitmentService.searchByAddress(address);
		model.addAttribute("recruitments", recruitments);
		model.addAttribute("address", address);		
		if (userDTO != null) {
			User user = userService.getUserById(userDTO.getId());
			if (user.getCv() != null) {
				int cvid = user.getCv().getId();
				Cv cv = userService.getCvById(cvid);
				model.addAttribute("cv", cv);
			} else {
				model.addAttribute("msg", "bạn chưa có CV");
			}

			model.addAttribute("user", user);
		}
		return "public/result-search-address";
	}

}
