package com.nrifintech.lms.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nrifintech.lms.entity.Book;
import com.nrifintech.lms.repository.BookRepository;
import com.nrifintech.lms.service.BookService;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	BookRepository bookRepository;

	@Override
	public Book findByTitle(String title) {
		return bookRepository.findByTitle(title);
	}

	@Override
	public void save(Book book) {
		bookRepository.save(book);	
	}

	@Override
	public Book findById(int bookId) {
		Optional<Book> optionalBook = bookRepository.findById(bookId);
		return optionalBook.get();
	}

	@Override
	public List<Book> findAll() {
		List<Book> books = bookRepository.findAll();
		return books;
	}
	
}
