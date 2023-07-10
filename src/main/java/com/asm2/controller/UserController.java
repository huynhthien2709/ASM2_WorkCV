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
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.asm2.entity.ApplyPost;
import com.asm2.entity.Category;
import com.asm2.entity.Company;
import com.asm2.entity.Cv;
import com.asm2.entity.FollowCompany;
import com.asm2.entity.Recruitment;
import com.asm2.entity.Role;
import com.asm2.entity.SaveJob;
import com.asm2.entity.User;
import com.asm2.DTO.ApplyPostDTO;
import com.asm2.DTO.CompanyDTO;
import com.asm2.DTO.FollowCompanyDTO;
import com.asm2.DTO.SaveJobDTO;
import com.asm2.DTO.UserDTO;
import com.asm2.service.HomeService;
import com.asm2.service.RecruitmentService;
import com.asm2.service.UserService;


import javassist.Loader.Simple;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private HomeService homeService;

	@Autowired
	private RecruitmentService recruitmentService;
	
	@Autowired
	private MailSender mailSender;
	
	private int recordsPerPage = 5;

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
		List<Category> categories = homeService.getCategories();
		model.addAttribute("categories", categories);
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
	public String logout(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		session.removeAttribute("userDTO");
		List<Category> categories = homeService.getCategories();
		model.addAttribute("categories", categories);
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
		if (user.getStatus() != 0) {
			model.addAttribute("msg", "tài khoản đã xác thực");
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

	@GetMapping("/post-list")
	public String postListPage(Model model, @RequestParam(name =  "page", defaultValue = "1") int page) {
		List<Recruitment> recruitments = homeService.getRecruitments(page);
		model.addAttribute("recruitments", recruitments);
		int totalRecords = homeService.getRecruitments(page).size();
		int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", page);
		return "public/post-list";
	}

	@GetMapping("/list-save-job")
	public String listSaveJob(Model model, HttpSession session, @RequestParam(name =  "page", defaultValue = "1") int page) {
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		List<SaveJob> saveJobs = userService.getListSaveJob(userDTO.getId(), page);
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
		int totalRecords = userService.getListSaveJob(userDTO.getId(), page).size();
		int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", page);
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

	@GetMapping("/detail-company/{id}")
	public String detailCompany(@PathVariable("id") int id, Model model) {
		CompanyDTO companyDTO = userService.getCompanybyId(id);
		model.addAttribute("companyDTO", companyDTO);
		return "public/detail-company";
	}

	@PostMapping("/follow-company")
	public String followCompany(FollowCompanyDTO followCompanyDTO) {
		userService.addFollowCompany(followCompanyDTO);
		return "public/detail-company";
	}

	@GetMapping("/list-follow-company")
	public String listFollowCompany(Model model, HttpSession session, @RequestParam(name =  "page", defaultValue = "1") int page) {
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		int userId = userDTO.getId();
		List<FollowCompany> followCompanies = userService.getListFollowCompany(userId, page);
		model.addAttribute("followCompanies", followCompanies);
		int totalRecords = userService.getListFollowCompany(userId, page).size();
		int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", page);
		return "public/list-follow-company";
	}
	@GetMapping("/list-apply-job")
	public String listPostJompany(Model model, HttpSession session, @RequestParam(name =  "page", defaultValue = "1") int page) {		
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		List<ApplyPost> applyPosts = userService.getListApplyPosts(userDTO.getId(), page);
		model.addAttribute("applyPosts", applyPosts);
		int totalRecords = userService.getListApplyPosts(userDTO.getId(), page).size();
		int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", page);
		return "public/list-apply-job";
	}
	@GetMapping("/delete-save-job/{id}")
	public String deleteSaveJob(@PathVariable("id") int id, HttpSession session) {		
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		int userId = userDTO.getId();
		userService.deleteSaveJob(userId, id);
		return "redirect:/user/list-save-job";
	}
	
	public void sendMail(String from, String to, String subject, String content) {
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setFrom(from);
		mailMessage.setTo(to);
		mailMessage.setSubject(subject);
		mailMessage.setText(content);
		
		mailSender.send(mailMessage);

	}
	@PostMapping("/sendMail")
	public String verificationUserMail(HttpSession session, Model model) {
		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		System.out.println("////" + userDTO.getStatus());
		if (userDTO.getRole().equals("2") && userDTO.getStatus() == 0) {
			sendMail("huynhthien2709@gmail.com", "huynhthien2709@gmail.com",  "Xác thực tài khoản người dùng " + userDTO.getFullName(),
					   "Tài khoản của bạn đã được xác thực");
			userService.updateStatusUser(userDTO.getId());
		}else {
			model.addAttribute("msg", "tài khoản đã được xác thực");
		}
		
		userService.updateStatusUser(userDTO.getId());
		return "redirect:/user/profile";
	}

}
