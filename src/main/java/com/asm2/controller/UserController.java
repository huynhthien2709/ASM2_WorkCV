package com.asm2.controller;

import java.io.BufferedOutputStream;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.asm2.entity.Company;
import com.asm2.entity.Role;
import com.asm2.entity.User;
import com.asm2.DTO.CompanyDTO;
import com.asm2.DTO.UserDTO;
import com.asm2.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;

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
		boolean check = userService.checkUserLogin(userDTO);
//		request.getSession(true).setAttribute("userDTO", userDTO);
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
		return "public/profile";
	}

	@PostMapping("/updateProfile")
	public String updateProfile(UserDTO userDTO, CompanyDTO companyDTO) {
		int userId = userDTO.getId();
		User user = userService.updateUser(userDTO);
		Company company = userService.getCompanyInfo(companyDTO, userId);
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

		String filePath = request.getServletContext().getRealPath("/") + "resources" + File.separator + "images"
				+ File.separator + file.getOriginalFilename();

		try {

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
			
		} catch (Exception e) {
			e.printStackTrace();
			return "Error";
		}
	}

}
