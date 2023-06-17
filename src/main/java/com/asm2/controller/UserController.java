package com.asm2.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.asm2.entity.ApplyPost;
import com.asm2.entity.Company;
import com.asm2.entity.Cv;
import com.asm2.entity.Recruitment;
import com.asm2.entity.Role;
import com.asm2.entity.SaveJob;
import com.asm2.entity.User;
import com.asm2.DTO.ApplyPostDTO;
import com.asm2.DTO.CompanyDTO;
import com.asm2.DTO.UserDTO;
import com.asm2.service.HomeService;
import com.asm2.service.RecruitmentService;
import com.asm2.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private HomeService homeService;
	
	@Autowired
	private RecruitmentService recruitmentService;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@GetMapping("/login")
	public String loginPage(Model model) {
		List<Role> roles = userService.getRoles();
		model.addAttribute("roles", roles);
		return "public/login";
	}

	@PostMapping("/checkLogin")
	public String login(@ModelAttribute("userDTO") UserDTO userDTO, HttpServletRequest request, Model model,
			HttpSession session) {
		List<Role> roles = userService.getRoles();
		model.addAttribute("roles", roles);
		List<Recruitment> recruitments = homeService.getRecruitments();
		model.addAttribute("recruitments", recruitments);
		List<Company> companies = homeService.getCompanies();
		model.addAttribute("companies", companies);
		boolean check = userService.checkUserLogin(userDTO);
		session = request.getSession(true);
		userDTO.setPassword(null);
		session.setAttribute("userDTO", userDTO);
		int userId = userDTO.getId();
		User user = userService.getUserById(userId);
		if (user.getCv() != null) {
			int cvid = user.getCv().getId();
			Cv cv = userService.getCvById(cvid);
			model.addAttribute("cv", cv);
		} else {
			model.addAttribute("msg", "bạn chưa có CV");
		}

		model.addAttribute("user", user);

		if (check) {
			model.addAttribute("status", "Đăng nhập thành công");
			return "public/home";
		} else {
			model.addAttribute("status", "Đăng nhập thất bại");
		}

		return "public/login";
	}

	@PostMapping("/register")
	public String registerUser(@ModelAttribute("userDTO") UserDTO userDTO, Model model) {
		List<Role> roles = userService.getRoles();
		model.addAttribute("roles", roles);
		User user = userService.registerUser(userDTO);
		if (user == null) {
			model.addAttribute("msg2", "Email đã được sử dụng");
		}
		if (user != null) {
			if (userDTO.getPassword().equals(userDTO.getRePassword())) {
				userService.registerUser(userDTO);
			} else {
				model.addAttribute("msg", "Password không trùng khớp");
			}
		}

		return "public/login";
	}

	@PostMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userDTO");
		return "public/home";
	}

	@GetMapping("/profile")
	public String profile(HttpSession session, Model model, CompanyDTO companyDTO) {
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		int userId = userDTO.getId();
		Company company = userService.getCompanyInfo(companyDTO, userId);
		User user = userService.getUserById(userId);
		System.out.println(user.getCv());
		if (user.getCv() == null) {
			model.addAttribute("msg", "Bạn chưa có CV");

		} else {
			int cvid = user.getCv().getId();
			Cv cv = userService.getCvById(cvid);
			model.addAttribute("cv", cv);
		}

		return "public/profile";
	}

	@PostMapping("/updateProfile")
	public String updateProfile(UserDTO userDTO, CompanyDTO companyDTO) {
		int userId = userDTO.getId();
		User user = userService.updateUser(userDTO);
		Company company = userService.getCompanyInfo(companyDTO, userId);
		return "public/profile";
	}

	@PostMapping("/updateUserCandidate")
	public String updateUserCandidate(UserDTO userDTO, Model model) {
		User user = userService.updateUser(userDTO);
		int cvid = user.getCv().getId();
		Cv cv = userService.getCvById(cvid);
		model.addAttribute("cv", cv);
		int userId = userDTO.getId();
		User user1 = userService.getUserById(userId);
		model.addAttribute("user1", user1);
		System.out.println("user1 " + user1.getImage());

		return "public/profile";
	}

	@PostMapping("/updateCompanyInfo")
	public String updateCompanyInfo(CompanyDTO companyDTO, HttpSession session) {
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		int userId = userDTO.getId();
		Company company = userService.updateCompanyInfo(companyDTO, userId);
		return "public/profile";
	}

	@PostMapping("/upload-company")
	public @ResponseBody String uploadMultipleFileHandler(@RequestParam("file") CommonsMultipartFile file,
			HttpServletRequest request) {

		byte[] data = file.getBytes();

		String folderPath = request.getServletContext().getRealPath("/") + "resources" + File.separator + "images";
		String filePath = folderPath + File.separator + file.getOriginalFilename();

		try {
			File folder = new File(folderPath);
			if (!folder.exists()) {
				folder.mkdirs();
			}

			FileOutputStream fileout = new FileOutputStream(filePath);
			fileout.write(data);

			fileout.close();
			return request.getContextPath() + "/resources/images/" + file.getOriginalFilename();
			// C:\Users\admin\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\PRJ321x_ASM2_thienhtfx17332\resources\images
		} catch (Exception e) {
			e.printStackTrace();
			return "Error";
		}
	}

	@PostMapping("/upload-user")
	public @ResponseBody String uploadUserImage(@RequestParam("file") CommonsMultipartFile file,
			HttpServletRequest request) {

		byte[] data = file.getBytes();

		String folderPath = request.getServletContext().getRealPath("/") + "resources" + File.separator + "UserImages";
		String filePath = folderPath + File.separator + file.getOriginalFilename();

		try {
			File folder = new File(folderPath);
			if (!folder.exists()) {
				folder.mkdirs();
			}
			FileOutputStream fileout = new FileOutputStream(filePath);
			fileout.write(data);

			fileout.close();

			return request.getContextPath() + "/resources/UserImages/" + file.getOriginalFilename();
			// C:\Users\admin\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\PRJ321x_ASM2_thienhtfx17332\resources\UserImages
		} catch (Exception e) {
			e.printStackTrace();
			return "Error";
		}
	}

	@PostMapping("/upload-Candidate")
	public @ResponseBody String uploadUserCandidateImage(@RequestParam("file") CommonsMultipartFile file,
			HttpServletRequest request, Model model) {

		byte[] data = file.getBytes();

		String folderPath = request.getServletContext().getRealPath("/") + "resources" + File.separator
				+ "CandidateImage";
		String filePath = folderPath + File.separator + file.getOriginalFilename();

		try {
			File folder = new File(folderPath);
			if (!folder.exists()) {
				folder.mkdirs();
			}
			FileOutputStream fileout = new FileOutputStream(filePath);
			fileout.write(data);

			fileout.close();
//			String path = file.getOriginalFilename();
//			System.out.println(file.getOriginalFilename());
//			model.addAttribute("path", path);
			return request.getContextPath() + "/resources/CandidateImage/" + file.getOriginalFilename();
		} catch (Exception e) {
			e.printStackTrace();
			return "Error";
		}
	}

	@PostMapping("/deleteCv")
	public String deleteCv(HttpSession session, Model model) {
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		User user = userService.getUserById(userDTO.getId());
		if (user.getCv() != null) {
			userService.deleteCv(user);
		}
		model.addAttribute("msg", "Bạn chưa có CV");

		return "public/profile";
	}

	@PostMapping("/apply-job")
	public String applyJob(ApplyPostDTO applyPostDTO, Model model) {
		if (applyPostDTO.getNameCv().trim().equals("")) {
			model.addAttribute("msg", "Bạn chưa có CV");
		} else {
			ApplyPost applyPost = userService.applyJob(applyPostDTO);
		}

		return "public/home";
	}

	@GetMapping("post-list")
	public String postListPage(Model model) {
		List<Recruitment> recruitments = homeService.getRecruitments();
		model.addAttribute("recruitments", recruitments);
		System.out.println("///" + recruitments.size());
		return "public/post-list";
	}
	
	@GetMapping("/list-save-job")
	public String listSaveJob(Model model, HttpSession session) {
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		List<SaveJob> saveJobs = userService.getListSaveJob(userDTO.getId());
		model.addAttribute("saveJobs", saveJobs);
		User user = userService.getUserById(userDTO.getId());
		if (user.getCv() != null) {
			int cvid = user.getCv().getId();
			Cv cv = userService.getCvById(cvid);
			model.addAttribute("cv", cv);
		} else {
			model.addAttribute("msg", "bạn chưa có CV");
		}

		model.addAttribute("user", user);
		return "public/list-save-job";
	}
	
	@GetMapping("/list-user")
	public String listUser(Model model, HttpSession session) {
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		List<ApplyPost> applyPosts = userService.getUserbyApplyPosts();			
		Company company = userService.getCompanyByUserId(userDTO.getId());
		List<ApplyPost> applyPosts2 = new ArrayList<>();
		int i = 0;
		for (ApplyPost applyPost : applyPosts) {			
			if (applyPosts.get(i).getRecruitment().getCompany().getId() == company.getId()) {
				applyPosts2.add(applyPosts.get(i));
			}
			i++;
			
		}
		model.addAttribute("applyPosts2", applyPosts2);
		return "public/list-user";
	}

}
