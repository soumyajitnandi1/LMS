package com.nrifintech.lms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="book_request")
public class Book_Request extends AbstractBaseEntity {
	private static final long serialVersionUID = 6715094082833854125L;
	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="request_id")
	private int requestId;
	@Column(name="member_id")
	@ManyToOne
	private int memberId;
	@Column(name="book_title")
	private String bookTitle;
	@Column(name="book_desc")
	private String bookdesc;
	@Column(name="status")
	private String status;
	
	public Book_Request() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Book_Request(int memberId, String bookTitle, String bookdesc, String status) {
		super();
		this.memberId = memberId;
		this.bookTitle = bookTitle;
		this.bookdesc = bookdesc;
		this.status = status;
	}

	public int getRequestId() {
		return requestId;
	}

	public void setRequestId(int requestId) {
		this.requestId = requestId;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getBookdesc() {
		return bookdesc;
	}

	public void setBookdesc(String bookdesc) {
		this.bookdesc = bookdesc;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Book_Request [requestId=" + requestId + ", memberId=" + memberId + ", bookTitle=" + bookTitle
				+ ", bookdesc=" + bookdesc + ", status=" + status + "]";
	}
	
	
	
}