package com.nrifintech.lms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.beans.factory.annotation.Autowired;

import com.nrifintech.lms.entity.Book;
import com.nrifintech.lms.entity.IssueRequest;
import com.nrifintech.lms.repository.BookRepository;
import com.nrifintech.lms.repository.IssueRequestRepository;
import com.nrifintech.lms.request.BookRequest;
import com.nrifintech.lms.entity.Book;

@Controller
@RequestMapping("/")
public class MainController {

	@Autowired
	BookRepository bookRepository;
	
	@Autowired
	IssueRequestRepository issueReqRepository;
	@RequestMapping("")
	public String home() {
		return "index";
	}

	@RequestMapping("catalogue")
	public ModelAndView catalog(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("catalogue");
		List<Book> books = bookRepository.findAll();
		System.out.println(books);
		modelAndView.addObject("books", books);
		Book updateBook = new Book();
		modelAndView.addObject("updateBook", updateBook);
		modelAndView.addObject("enableDisable", new Book());
		modelAndView.addObject("session", request.getSession().getAttribute("validUser"));
		return modelAndView;
	}
	
	
	@RequestMapping("issueRequests")
	public String history( HttpServletRequest request, Model model) {
		List<IssueRequest> issueRequests = issueReqRepository.findAll();
		System.out.println(issueRequests);
		model.addAttribute("list",issueRequests);
		model.addAttribute("session", request.getSession().getAttribute("validUser"));
		System.out.println("In main Controller = " + request.getSession().getAttribute("validUser") );
		return "issueRequests";
	}
	@RequestMapping("/userDB")
	public String userDB() {
		return "userDB";
	}

	@RequestMapping("/adminDB")
	public String adminDB(Model model) {
		BookRequest req = new BookRequest();
		model.addAttribute("req", req);
		return "adminDB";
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/";
	}

}
