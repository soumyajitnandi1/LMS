package com.nrifintech.lms.service;

import java.util.List;

import com.nrifintech.lms.entity.Book;

public interface BookService {
	Book findByTitle(String title);

	void save(Book book);

	Book findById(int bookId);

	List<Book> findAll();
}
