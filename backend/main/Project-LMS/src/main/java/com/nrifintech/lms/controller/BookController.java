package com.nrifintech.lms.controller;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.PageContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nrifintech.lms.entity.Book;
import com.nrifintech.lms.entity.Publisher;
import com.nrifintech.lms.repository.BookRepository;
import com.nrifintech.lms.repository.PublisherRepository;
import com.nrifintech.lms.request.AddBook;
import com.nrifintech.lms.request.BookRequest;
import com.nrifintech.lms.service.BookService;
import com.nrifintech.lms.service.PublisherService;
import com.nrifintech.lms.service.impl.BookServiceImpl;

@Controller
public class BookController {
	
	@Autowired
	BookService bookService;
	@Autowired
	PublisherService publisherService;
	
	
	
	public BookController(BookService bookService, PublisherService publisherService) {
		super();
		this.bookService = bookService;
		this.publisherService = publisherService;
	}
	@PostMapping("/addBook")
	public ModelAndView addBook(@ModelAttribute("req") @Valid BookRequest req, BindingResult result, Model model ) {
		ModelAndView modelAndView = new ModelAndView();
		if(result.hasErrors()) {
			model.addAttribute("error", "error");
			modelAndView.setViewName("adminDB");
			return modelAndView;		
		}
		int count = Integer.parseInt(req.getCount());
		Book book = AddBook.makeBook(req);
		Publisher publisher = publisherService.findById(req.getPublisher().getPubId());
		book.setPublisher(publisher);
		book.setCount(count);
		Book currBook = bookService.findByTitle(book.getTitle());
		if(Objects.nonNull(currBook)) {
			System.out.println(book.getTitle());
			model.addAttribute("exists", currBook);
			modelAndView.setViewName("adminDB");
			return modelAndView;
		}
		else
			bookService.save(book);
		modelAndView.setViewName("adminDB");
		model.addAttribute("saved", "saved");
		model.addAttribute("book", new Book());
		return modelAndView;
	}
	@PostMapping("/updateBookCount/{id}")
	public String updateCount(@ModelAttribute("updateBook") Book updateBook, @PathVariable("id") int id, Model model ) {
		Book bookToUpdate = bookService.findById(id);
		System.out.println("Updated Count " + updateBook.getCount());
		int updatedCount = updateBook.getCount();
		if(updatedCount<1) {
			return "redirect:/invalidCount";
		}
		bookToUpdate.setCount(updateBook.getCount());
		bookService.save(bookToUpdate);
		return "redirect:/countUpdated";
	}
	@RequestMapping("/invalidCount")
	public ModelAndView invalidCount(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("catalogue");
		List<Book> books = bookService.findAll();
		System.out.println(books);
		modelAndView.addObject("books", books);
		Book updateBook = new Book();
		modelAndView.addObject("updateBook", updateBook);
		modelAndView.addObject("session", request.getSession().getAttribute("validUser"));
		modelAndView.addObject("invalidCount", "invalidCount");
		return modelAndView;
	}
	@RequestMapping("/enableDisable/{id}")
	public String enableDisable(@ModelAttribute("enableDisable") Book enableDisable, @PathVariable("id") int id, HttpServletRequest request ) {
		Book book = bookService.findById(id);
		if(book.getStatus().equals("E")) {
			book.setStatus("D");
		}
		else {
			book.setStatus("E");
		}
		bookService.save(book);
		return "redirect:/bookToggled";
	}
	@RequestMapping("/countUpdated")
	public ModelAndView countUpdated(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("catalogue");
		List<Book> books = bookService.findAll();
		System.out.println(books);
		modelAndView.addObject("books", books);
		Book updateBook = new Book();
		modelAndView.addObject("updateBook", updateBook);
		modelAndView.addObject("enableDisable", "enableDisable");
		modelAndView.addObject("session", request.getSession().getAttribute("validUser"));
		modelAndView.addObject("countUpdated", "countUpdated");
		return modelAndView;
	}
	@RequestMapping("/bookToggled")
	public ModelAndView bookToggled(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("catalogue");
		List<Book> books = bookService.findAll();
		System.out.println(books);
		modelAndView.addObject("books", books);
		Book updateBook = new Book();
		modelAndView.addObject("updateBook", updateBook);
		modelAndView.addObject("enableDisable", "enableDisable");
		modelAndView.addObject("session", request.getSession().getAttribute("validUser"));
		modelAndView.addObject("bookToggled", "bookToggled");
		return modelAndView;
	}
}
