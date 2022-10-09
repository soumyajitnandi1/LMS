package com.nrifintech.lms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="book")
public class Book extends AbstractBaseEntity {
	private static final long serialVersionUID = 6715094082833854125L;
	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="book_id")
	@OneToMany
	private int bookId;
	@Column(name="title")
	private String title;
	@Column(name="category")
	private String category;
	@Column(name="print_year")
	private String printYear;
	@Column(name="author")
	private String author;
	@Column(name="status")
	private String status;
	@Column(name="count")
	private int count;
	
	@Column(name="pub_id")
	@ManyToOne
	private int pubId;
	
	
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Book(String title, String category, String printYear, String author, String status, int count, int pubId) {
		super();
		this.title = title;
		this.category = category;
		this.printYear = printYear;
		this.author = author;
		this.status = status;
		this.count = count;
		this.pubId = pubId;
	}


	public int getBookId() {
		return bookId;
	}


	public void setBookId(int bookId) {
		this.bookId = bookId;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getPrintYear() {
		return printYear;
	}


	public void setPrintYear(String printYear) {
		this.printYear = printYear;
	}


	public String getAuthor() {
		return author;
	}


	public void setAuthor(String author) {
		this.author = author;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public int getPubId() {
		return pubId;
	}


	public void setPubId(int pubId) {
		this.pubId = pubId;
	}


	@Override
	public String toString() {
		return "Book [bookId=" + bookId + ", title=" + title + ", category=" + category + ", printYear=" + printYear
				+ ", author=" + author + ", status=" + status + ", count=" + count + ", pubId=" + pubId + "]";
	}
	
	

}
