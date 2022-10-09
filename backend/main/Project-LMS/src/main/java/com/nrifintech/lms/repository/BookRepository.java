package com.nrifintech.lms.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nrifintech.lms.entity.Book;

import org.springframework.data.jpa.repository.Query;

@Repository
public interface BookRepository extends JpaRepository<Book, Integer> {
	@Query(value = "select * from book where title=?1", nativeQuery = true)
	Book findByTitle(String title);
}
