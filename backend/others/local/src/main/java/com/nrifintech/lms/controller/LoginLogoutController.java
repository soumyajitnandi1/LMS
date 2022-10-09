package com.nrifintech.lms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.nrifintech.lms.request.UserLoginRequest;
import com.nrifintech.lms.service.UserService;

/**
 * @author	Debopam
 * @email	debpal07@gmail.com
 * @created	Nov 9, 2021
 */
@Controller
public class LoginLogoutController {
	private final UserService userService;
	
	@Autowired
	public LoginLogoutController(UserService userService) {
		this.userService = userService;
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/doLogin")
	public String doLogin(@Valid UserLoginRequest loginRequest, HttpServletRequest request, Model model) {
		boolean isValidUser = userService.isValidUser(loginRequest);
		if (isValidUser) {
			HttpSession session = request.getSession(true);
			session.setAttribute("isValidUser", true);
			session.setAttribute("username", loginRequest.getUsername());
			return "forward:/user/welcome";
		} else {
			model.addAttribute("error", "Invalid Credentials!!!");
			return "forward:/login";
		}
	}
	
	@GetMapping("/logout")
	public String doLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/login";
	}
}
