package com.asm2.controller;


import java.io.File;
import java.io.FileOutputStream;
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

import com.asm2.entity.Company;
import com.asm2.entity.Cv;
import com.asm2.entity.Recruitment;
import com.asm2.entity.Role;
import com.asm2.entity.User;
import com.asm2.DTO.CompanyDTO;
import com.asm2.DTO.UserDTO;
import com.asm2.service.HomeService;
import com.asm2.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired HomeService homeService;

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
		boolean check = userService.checkUserLogin(userDTO);
		session = request.getSession(true);
		userDTO.setPassword(null);
		session.setAttribute("userDTO", userDTO);

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
		int cvid = Integer.parseInt(userDTO.getCv());
		Cv cv = userService.getCvById(cvid);
		model.addAttribute("cv", cv);
		System.out.println(cv.getFileName());
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
	public String updateUserCandidate(UserDTO userDTO) {		
		User user = userService.updateUser(userDTO);
		
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
			//C:\Users\admin\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\PRJ321x_ASM2_thienhtfx17332\resources\images
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
			//C:\Users\admin\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\PRJ321x_ASM2_thienhtfx17332\resources\UserImages
		} catch (Exception e) {
			e.printStackTrace();
			return "Error";
		}
	}
	@PostMapping("/upload-Candidate")
	public @ResponseBody String uploadUserCandidateImage(@RequestParam("file") CommonsMultipartFile file,
			HttpServletRequest request) {

		byte[] data = file.getBytes();

		String folderPath = request.getServletContext().getRealPath("/") + "resources" + File.separator + "CandidateImage";
		String filePath = folderPath + File.separator + file.getOriginalFilename();

		try {
			File folder = new File(folderPath);
			if (!folder.exists()) {
				folder.mkdirs();
			}
			FileOutputStream fileout = new FileOutputStream(filePath);
			fileout.write(data);

			fileout.close();
//			String path = request.getContextPath() + "/resources/CandidateImage/" + file.getOriginalFilename();
//			Cv cv = userService.updadateCvForCandidate(path);
			return request.getContextPath() + "/resources/CandidateImage/" + file.getOriginalFilename();
		} catch (Exception e) {
			e.printStackTrace();
			return "Error";
		}
	}
	@GetMapping("post-list")
	public String postListPage() {
		return "public/post-list";
	}

}
