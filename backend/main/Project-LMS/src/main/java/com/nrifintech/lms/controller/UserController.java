package com.nrifintech.lms.controller;

import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nrifintech.lms.entity.Book;
import com.nrifintech.lms.entity.Member;
import com.nrifintech.lms.entity.User;
import com.nrifintech.lms.request.AddUser;
import com.nrifintech.lms.request.HashPassword;
import com.nrifintech.lms.request.RegisterRequest;
import com.nrifintech.lms.service.MemberService;
import com.nrifintech.lms.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	MemberService memberService;
	

	public UserController(UserService userService, MemberService memberService) {
		super();
		this.userService = userService;
		this.memberService = memberService;
	}

	@RequestMapping("register")
	public ModelAndView register(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("register");
		RegisterRequest req = new RegisterRequest();
		modelAndView.addObject("session", request.getSession().getAttribute("validUser"));
		modelAndView.addObject("req", req);
		return modelAndView;
	}

	@RequestMapping("login")
	public ModelAndView login(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("login");
		RegisterRequest req = new RegisterRequest();
		modelAndView.addObject("session", request.getSession().getAttribute("validUser"));
		modelAndView.addObject("req", req);
		return modelAndView;
	}

	@PostMapping("/addUser")
	public ModelAndView addUser(@ModelAttribute("req") @Valid RegisterRequest req, BindingResult result) {
		ModelAndView modelAndView = new ModelAndView();
		String phone = req.getPhone();
		if (result.hasErrors()) {
			System.out.println("errors");
			modelAndView.setViewName("register");
			return modelAndView;
		}
		User newUser = userService.findByPhone(phone);
		if (Objects.isNull(newUser) == false) {
			modelAndView.setViewName("register");
			modelAndView.addObject("phone", phone);
			return modelAndView;
		}
		String password = req.getPassword();
		String confirmPassword = req.getConfirmPassword();
		if (password.equals(confirmPassword) == false) {
			modelAndView.setViewName("register");
			modelAndView.addObject("password", password);
			return modelAndView;
		}
		req.setPassword(HashPassword.hash(req.getPassword()));
		User user = AddUser.makeUser(req);
		
		Member member = new Member();
		
		User userObj = userService.save(user);
		member.setUser( userObj);
		user.setMember(member);
		memberService.save(member);
		modelAndView.setViewName("login");
		return modelAndView;
	}

	@PostMapping("/userLogin")
	public String loginUser(@ModelAttribute("req") @Valid RegisterRequest req, BindingResult result,
			HttpServletRequest request, Model model) {
		ModelAndView modelAndView = new ModelAndView();
		if (result.hasFieldErrors("phone") || result.hasFieldErrors("password")) {
			System.out.println("error");
			modelAndView.setViewName("login");
			return "login";
		}
		String phone = req.getPhone();
		String password = req.getPassword();
		password = HashPassword.hash(password);
		User currentUser = userService.findByPhone(phone);
		if (Objects.isNull(currentUser)) {
			model.addAttribute("notRegistered", "notRegistered");
			modelAndView.setViewName("login");
			return "login";
		}
		if (currentUser.getPassword().equals(password) == false) {
			modelAndView.addObject("password", password);
			modelAndView.setViewName("login");
			model.addAttribute("password", password);
			return "login";
		}
		if (currentUser.getIsAdmin().equals("N")) {
			HttpSession session = request.getSession(true);
			session.setAttribute("validUser", req);
			modelAndView.setViewName("userDB");
			return "forward:/userDB";
		} else {
			HttpSession session = request.getSession(true);
			Book book = new Book();
			Book updateBook = new Book();
			session.setAttribute("validUser", "admin");
			System.out.println(currentUser.getIsAdmin());
			model.addAttribute("book", book);
			modelAndView.setViewName("adminDB");
			return "forward:/adminDB";
		}
	}

}