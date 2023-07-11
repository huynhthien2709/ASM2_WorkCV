package com.asm2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.asm2.entity.Category;
import com.asm2.entity.Company;
import com.asm2.entity.Recruitment;
import com.asm2.service.HomeService;


@Controller
//@RequestMapping("/index")
public class HomeController {
	@Autowired
	private HomeService homeService;
	
	
	/**
	 * @author admin
	 *display home page
	 */
	@GetMapping("/index")
	public String homePage(Model model) {
		List<Recruitment> recruitments = homeService.getRecruitments();
		model.addAttribute("recruitments", recruitments);
		List<Company> companies = homeService.getCompanies();
		model.addAttribute("companies", companies);
		List<Category> categories = homeService.getCategories();
		model.addAttribute("categories", categories);
		return "public/home";
	}
}
